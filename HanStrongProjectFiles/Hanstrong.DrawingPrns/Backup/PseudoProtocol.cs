using System;
using System.Collections.Generic;
using System.Text;
using System.Collections.Specialized;
using System.Text.RegularExpressions;
using System.IO;
using System.Windows.Forms;
using System.Data;
using System.Diagnostics;

namespace Hanstrong.Decrypts
{
    class PseudoProtocol
    {
        WebServiceWrapper webProxy = new WebServiceWrapper();
        frmDecryptsTipMsg transferTip = null;

        /// <summary>
        /// CTT命令标识
        /// </summary>
        public enum CttFlag
        { 
            uploadfiles,
            downloadfiles
        }

        private NameValueCollection Params = new NameValueCollection();
        public CttFlag Flag;
        private string srcFix;

        public PseudoProtocol(string argsfix)
        {
            srcFix = argsfix;
            setCttFlag(argsfix);
            setCttParams(argsfix);
        }

        public void Execute()
        {
            switch (this.Flag)
            {
                case CttFlag.downloadfiles: { DownloadFiles(); break; }
                case CttFlag.uploadfiles: { UploadFiles(); break; }
                default:break;
            }
        }


        #region CTT调用

        private void DownloadFiles()
        {
            try
            {
                FolderBrowserDialog dlgFolder = new FolderBrowserDialog();
                dlgFolder.Description = "将下载的文件保存到：";
                if (dlgFolder.ShowDialog() != DialogResult.OK)
                {
                    return;
                }
                string strLocalPath = dlgFolder.SelectedPath;
                string strXml = "";
                strXml = GetDownloadFiles(Params["objid"], strLocalPath);
                if (strXml == "")
                {
                    MessageBox.Show("没有找到可下载的文件。"); return;
                }
                FileTransferDialog fdlg = new FileTransferDialog();
                fdlg.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                fdlg.LoadTransferTaskXml(strXml);
                if (fdlg.ShowDialog() == DialogResult.Cancel)
                {
                    Environment.Exit(Environment.ExitCode);
                    return;
                }
                while (transferTip.Visible) { Application.DoEvents(); }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void UploadFiles()
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.Multiselect = true;
            dlg.ShowDialog();
            if (dlg.FileNames.Length == 0) return;
            string strXml = "";
            strXml = GetUploadFiles(dlg.FileNames);
            if (strXml == "")
            {
                MessageBox.Show("没有找到可上传的文件。"); return;
            }
            FileTransferDialog fdlg = new FileTransferDialog();
            fdlg.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
            fdlg.LoadTransferTaskXml(strXml);
            if (fdlg.ShowDialog() == DialogResult.Cancel)
            {
                Environment.Exit(Environment.ExitCode);
                return;
            }
            while (transferTip.Visible) { Application.DoEvents(); }
        }

        #endregion


        #region 内部方法

        private string GetUploadFiles(string[] fileNames)
        {
            FtpInfo ftpInfo = GetUploadFilesFtpInfo();
            string strRemoteFile;
            string strLocalFile;
            string strXml = "<items>";
            strXml += "<item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";

            for (int i = 0; i < fileNames.Length; i++)
            {
                strRemoteFile = ftpInfo.Attribs["basedir"] + "/" + Params["uname"] +"/"+ftpInfo.Attribs["crttime"] + "/" + Path.GetFileName(fileNames[i]);
                strLocalFile = fileNames[i];
                strXml += "<item class=\"FILE\" transfertype=\"upload\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
            }
            strXml += "</items>";
            return strXml;
        }

        private string GetDownloadFiles(string objid, string strLocalFilePath)
        {
            string sqlCmd;
            string strXml = "<items>";
            string strLocalFile;
            string strRemoteFile;
            DataSet ds;

            sqlCmd = "SELECT filepath as _filepath,dbo.clip(volfzr,':',1) AS volfzr,filepath+ '/PUB/'+ dwgid +'.'+ memo AS filepath,dwgid+'.'+ memo AS filename FROM DNG_Vol_Drawings WHERE dwgRowid IN (SELECT dwgrowid FROM prj_fdwgpub WHERE pubid = '" + objid + "')";
            //sqlCmd = string.Format("select * from dng_uploadfiles where objid = '{0}'", objid);
            ds = webProxy.GetDataSetBySql(sqlCmd);
            if (ds == null || ds.Tables.Count == 0) return "";

            FtpInfo ftpInfo = GetUploadFilesFtpInfo();
            if (ftpInfo == null)
            {
                throw new Exception("未能获得FTP的连接信息。");
            }
            strXml += "<item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                strRemoteFile = dr["filepath"].ToString();
                strLocalFile = strLocalFilePath + "\\" +dr["_filepath"].ToString().Replace("/","\\") + "("+ dr["volfzr"].ToString() +")\\" + dr["fileName"].ToString();
                strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
            }
            
            
            strXml += "</items>";
            return strXml;
        }

        private void SetTransferResult(string remoteFile, string localFile, string result, string transferType)
        {
            if (result != "")
            {
                if (transferTip == null) transferTip = new frmDecryptsTipMsg();
                transferTip.AddItem(Path.GetFileName(localFile) + " 传输失败，原因：" + result);
                if (!transferTip.Visible) transferTip.Show();
                return;
            }
            if (transferType == "upload")
            {
                string strSql = "insert into dng_uploadfiles(filename,filesize,uploaduser,filepath,objid)";
                strSql += string.Format(" values ('{0}','{1}','{2}','{3}','{4}')",
                    Path.GetFileName(localFile), ByteFormatter.ToString(new FileInfo(localFile).Length), this.Params["uid"], remoteFile, this.Params["objid"]);
                string strRtn = webProxy.ExecuteSql(strSql);
            }
        }

        public FtpInfo GetUploadFilesFtpInfo()
        {
            string sqlCmd;
            string host, loginName, loginPass;
            string[] arrFtp;
            int port = 21;
            DataSet ds;
            FtpInfo ftp;

            try
            {
                sqlCmd = "SELECT dbo.getTime(2) as crttime,dbo.getparams(varvalue,'host') as host,dbo.getparams(varvalue,'basedir') as basedir from DNG_SysVar WHERE VarName = 'dngpltuploadfileshost'";
                ds = webProxy.GetDataSetBySql(sqlCmd);
                if (ds == null || ds.Tables.Count == 0) return null;
                //10.229.137.21,21,htkj,htkj
                arrFtp = ds.Tables[0].Rows[0]["host"].ToString().Split(',');
                host = arrFtp[0];
                int.TryParse(arrFtp[1], out port);
                loginName = arrFtp[2];
                loginPass = arrFtp[3];

                ftp = new FtpInfo(host, host, loginName, loginPass, port);
                ftp.Attribs.Add("basedir", ds.Tables[0].Rows[0]["basedir"].ToString());
                ftp.Attribs.Add("crttime", ds.Tables[0].Rows[0]["crttime"].ToString().Replace(":", "_"));
                return ftp;
            }
            catch
            {
                return null;
            }
        }
        
        private void setCttParams(string argsfix)
        {
            string[] data;
            argsfix = argsfix.Substring(argsfix.IndexOf("?") + 1, argsfix.Length - (argsfix.IndexOf("?") + 1));
            data = argsfix.Split('&');
            for (int i = 0; i < data.Length; i++)
            {
                Params.Add(data[i].Split('=')[0], data[i].Split('=')[1]);
            }
        }

        private void setCttFlag(string argsfix)
        {
            argsfix = argsfix.Replace("drawingprns://", "");
            if (argsfix.IndexOf("?") > 0) argsfix = argsfix.Substring(0, argsfix.IndexOf("?"));
            if (argsfix.IndexOf("/") > 0) argsfix = argsfix.Substring(0, argsfix.IndexOf("/"));
            try
            {
                this.Flag = (CttFlag)Enum.Parse(typeof(CttFlag), argsfix);
            }
            catch
            {
                throw new Exception(argsfix+" 无效的命令。");
            }
        }

        #endregion
    }
}
