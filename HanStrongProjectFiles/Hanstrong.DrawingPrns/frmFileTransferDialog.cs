using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Dart.PowerTCP.Ftp;
using System.Threading;

using System.Windows.Forms.ComponentModel;
using System.Windows.Forms.Design;
using System.IO;
using System.Xml;
using System.Diagnostics;

namespace Hanstrong.Decrypts
{

    public enum TransferType
    { 
        Download = 0,
        Upload = 1
    }

    public delegate void FileTransferResultHandle(string remoteFile, string localFile, string result, string transferType);

    public partial class FileTransferDialog : Form
    {

        private FtpControl ftpProxy;
        private bool transferStoped = false;
        public FileTransferResultHandle OnTransferResult = null;
        public FileTransferDialog()
        {
            InitializeComponent();

            sysNotify.MouseMove += new MouseEventHandler(delegate
            {
                sysNotify.ShowBalloonTip(1000, "文件传输", "已完成 "+this.Text, ToolTipIcon.Info);
            });
            sysNotify.MouseDoubleClick += new MouseEventHandler(delegate
            {
                this.Visible = true;
                sysNotify.Visible = false;
            });
            ftpProxy = new FtpControl();
        }

        #region 内部成员

        private string _taskXmlFile;
        private string _fileName = string.Empty;
        private int _transPercent;
        private string _transLength;
        private string _totalLength;
        private int _fileCount;
        private int _currentTransIndex = 0;
        private int _totalPercent;
        private XmlDocument _doc;

        private string _host;

        public string Host
        {
            get { return _host; }
            set { _host = value; }
        }
        private string _port;

        public string Port
        {
            get { return _port; }
            set { _port = value; }
        }
        private string _name;

        public string LoginName
        {
            get { return _name; }
            set { _name = value; }
        }
        private string _pass;

        public string LoginPass
        {
            get { return _pass; }
            set { _pass = value; }
        }

        #endregion

        #region 内部方法
        /// <summary>
        /// 将大小从字符串转化为long
        /// </summary>
        /// <param name="strSize">SIZE字符串</param>
        public static long GetSizeFromString(string strSize)
        {
            strSize = strSize.Trim();
            if (strSize == null || strSize == string.Empty)
            {
                return 0;
            }
            string strUnit = string.Empty;
            int iPos = strSize.LastIndexOf(' ');
            if (iPos > 0)
            {
                strUnit = strSize.Substring(iPos + 1);
                strSize = strSize.Substring(0, iPos);
            }
            iPos = strSize.IndexOf('.');
            if (iPos > 0)
            {
                strSize = strSize.Substring(0, iPos);
            }
            long size = 0;
            if (!long.TryParse(strSize, out size))
            {
                return 0;
            }
            switch (strUnit)
            {
                case "KB":
                    {
                        size = size * 1024;
                        break;
                    }
                case "MB":
                    {
                        size = size * 1048576;
                        break;
                    }
                case "GB":
                    {
                        size = size * 1073741824;
                        break;
                    }
                default:
                    {
                        break;
                    }
            }

            return size;
        }

        /// <summary>
        /// 将long类型的字节数转为字符串
        /// </summary>
        /// <param name="bytes">字节数</param>
        public static string GetSizeString(long bytes)
        {
            if (bytes < 1024)
                return string.Format("{0} bytes", bytes);
            else if (bytes < 1048576)
                return string.Format("{0} KB", Math.Round((double)bytes / 1024, 1, MidpointRounding.ToEven));
            else if (bytes < 1073741824)
                return string.Format("{0} MB", Math.Round((double)bytes / 1048576, 1, MidpointRounding.ToEven));
            else
                return string.Format("{0} GB", Math.Round((double)bytes / 1073741824, 1, MidpointRounding.ToEven));
        }

        //获取文件大小
        public static string GetSizeString(string localPath)
        {
            if (File.Exists(localPath))
            {
                FileInfo fileInfo = new FileInfo(localPath);
                if (fileInfo.Exists)
                {
                    return GetSizeString(fileInfo.Length);
                }
            }
            return "0KB";
        }
        #endregion

        #region  内部事件
        void OnFtpProgressChanged(object sender, FtpProgressEventArgs e)
        {
            try
            {
                this._fileName = e.FileName;
                this._transLength = FileTransferDialog.GetSizeString(e.Position);
                this._totalLength = FileTransferDialog.GetSizeString(e.Length);
                int intPercent = (int)(((double)e.Position / e.Length) * 100);
                if (e.Status == FtpFileStatus.TransferCompleted && e.Position == e.Length && intPercent == 100)
                {
                    if (_currentTransIndex < _fileCount) _currentTransIndex++;
                    else _currentTransIndex = _fileCount;
                }
                this._transPercent = intPercent;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "文件传输", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        DateTime offsetTime;
        void readySpeedTimer_Tick(object sender, EventArgs e)
        {
            TimeSpan offset = DateTime.Now.Subtract(offsetTime);
            string hours, minutes, seconds;
            hours = offset.Hours < 10 ? "0" + offset.Hours : offset.Hours.ToString();
            minutes = offset.Minutes < 10 ? "0" + offset.Minutes : offset.Minutes.ToString();
            seconds = offset.Seconds < 10 ? "0" + offset.Seconds : offset.Seconds.ToString();
            labRunTime.Text = string.Format("{0}:{1}:{2}", hours, minutes, seconds);
        }

        void readyDataTimer_Tick(object sender, EventArgs e)
        {
            try
            {
                labState.Text = "读取中...";
                labFileName.Text = ZipText(this._fileName,30);
                transProgressBar.Value = this._transPercent >= 0 ? this._transPercent : 0;
                labSinglePercent.Text = string.Format("{0}%", this._transPercent >= 0 ? this._transPercent : 0);
                labSingleSize.Text = string.Format("{0}/{1}", _transLength, _totalLength);
                labSumSize.Text = string.Format("{0}/{1}(个)", _currentTransIndex, _fileCount);

                //总进度
                this._totalPercent = (int)(((double)_currentTransIndex / _fileCount) * 100);
                //if (this.TotalPercent > 100) this.TotalPercent = 100;
                this.toltalProgressBar.Value = this._totalPercent;
                labTotalPercent.Text = string.Format("{0}%", this._totalPercent);
                this.Text = labTotalPercent.Text;

                if (sysNotify.Visible == true) sysNotify.ShowBalloonTip(1000, "文件传输", "已完成 " + this.Text, ToolTipIcon.Info);

                if (this._currentTransIndex == _fileCount)
                {
                    this.readyDataTimer.Stop();
                    this.labState.Text = "完毕";
                    //this.minIco.Visible = false;
                    //this.Hide();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private string ZipText(string text, int allowMaxLength)
        {
            string str = text;
            try
            {
                if (text.Length >= allowMaxLength)
                {
                    str = "..." + Path.GetFileName(text);
                }
            }
            catch
            { 
            
            }
            return str;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("确定要取消吗？", "文件传输", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.No) return;

            this.transferStoped = true;
            this.CloseTransferPanel();
            this.DialogResult = DialogResult.Cancel;
            this.readyDataTimer.Stop();
            this.readySpeedTimer.Stop();
            this.Visible = false;
            this.Close();
        }

        private void btnBackground_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            this.sysNotify.Visible = true;

        }

        private void frmTransferDialog_Load(object sender, EventArgs e)
        {
            string rlt;
            try
            {
                SetFtpHostInfo(this._doc, "HOST");

                rlt = ftpProxy.ResetFtpConn(_host, _name, _pass, int.Parse(_port));
                ftpProxy.FtpProgressChanged += new EventHandler<FtpProgressEventArgs>(OnFtpProgressChanged);
                if (string.IsNullOrEmpty(rlt))
                {
                    InitTransferPanel();
                    DoWork();
                    CloseTransferPanel();
                }
                else
                {
                    MessageBox.Show(rlt);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                CloseTransferPanel();
            }
        }

        
        private void SetFtpHostInfo(XmlDocument doc, string section)
        {
            XmlNode node = doc.SelectSingleNode("//item[@class='" + section + "']");
            try
            {
                _host = node.Attributes["hostip"].Value;
                _port = node.Attributes["hostport"].Value;
                _name = node.Attributes["loginname"].Value;
                _pass = node.Attributes["loginpass"].Value;  
            }
            catch
            {
                throw new Exception("未能获得Ftp连接信息。");
            }
        }
        #endregion

        public void LoadTransferTaskXmlFile(string taskXmlFile)
        {
            this._taskXmlFile = taskXmlFile;
            _doc = new XmlDocument();
            _doc.Load(taskXmlFile);
        }

        public void LoadTransferTaskXml(string xmlStrings)
        {
            _doc = new XmlDocument();
            _doc.LoadXml(xmlStrings);
        }

        public XmlDocument Results { get { return _doc; } }

        private void InitTransferPanel()
        {   
            this._fileName = "";
            this._currentTransIndex = 0;
            this._totalPercent = 0;
            this._transPercent = 0;

            transProgressBar.Value = 0;
            toltalProgressBar.Value = 0;
            this.Show();

            offsetTime = DateTime.Now;
            labRunTime.Text = "";
        }

        private void CloseTransferPanel()
        {
            if (ftpProxy != null) ftpProxy.Close();
            this.readyDataTimer.Stop();
            this.readySpeedTimer.Stop();
            this.sysNotify.Visible = false;
            this.Close();

        }

        private void DoWork()
        {
            string strRemoteFile, strLocalFile;
            string transfer = "";
            string result = "";
            
            XmlElement element = null;

            try
            {
                XmlNodeList taskNodes = _doc.SelectNodes("//item[@class='FILE']");
                this._fileCount = taskNodes.Count;

                this.readyDataTimer.Start();
                this.readySpeedTimer.Start();
                foreach (XmlNode node in taskNodes)
                {
                    if (transferStoped) break;
                    strRemoteFile = node.Attributes["remoteFile"].Value;
                    strLocalFile = node.Attributes["localFile"].Value;
                    element = node as XmlElement;
                    if (node.Attributes["transfertype"] == null) transfer = TransferType.Download.ToString().ToLower();
                    else transfer = node.Attributes["transfertype"].Value.ToLower();
                    if (transfer == TransferType.Download.ToString().ToLower())
                    {
                        if (ftpProxy.ExistFile(strRemoteFile))
                            result = ftpProxy.DownloadFile(strRemoteFile, strLocalFile);
                    }
                    else
                    {
                        result = ftpProxy.UpLoadFile(strRemoteFile, strLocalFile);
                    }

                    if (OnTransferResult != null) OnTransferResult(strRemoteFile, strLocalFile, result, node.Attributes["transfertype"].Value.ToLower());
                    element.SetAttribute("result", result);

                    if (result != "")
                    {
                        MessageBox.Show("传输失败，请重新执行本次操作。");
                        Application.Exit();
                        //EventLog.WriteEntry("印制室图纸下载日志", strRemoteFile, EventLogEntryType.Error);
                    }
                }
                //doc.Save(_taskXmlFile);
            }
            catch (Exception ex)
            {
                //EventLog.WriteEntry("印制室图纸下载日志", ex.ToString(), EventLogEntryType.Error);
            }
        }
    }
}