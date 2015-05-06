using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using Hanstrong.Decrypts;

namespace Hanstrong.DrawingPrns
{
    public partial class frmPubAllFilesDownLoad : Form
    {
        WebServiceWrapper webProxy = new WebServiceWrapper();
        private string uploadfilepath = ConfigurationManager.AppSettings["webPubAddress"];
        private string strObjID;
        private string strLocalPath;
        private string strType;

        public frmPubAllFilesDownLoad()
        {
            InitializeComponent();
        }

        public frmPubAllFilesDownLoad(string objid, string type)
        {
            InitializeComponent();

            this.strObjID = objid;
            this.strType = type;
        }

        private void frmPubAllFilesDownLoad_Load(object sender, EventArgs e)
        {
            //Application.DoEvents();
            lbNum.Text = "0/0";
            lbFileName.Text = "";
            if (string.IsNullOrEmpty(strObjID))
            {
                MessageBox.Show("下载文件不存在");
                Application.Exit();
                return;
            }
            //DownloadFiles();
        }

        private void DownloadFiles()
        {
            //获得下载的所有文件信息
            string strsql = string.Format("SELECT * FROM dbo.Base_FileList WHERE objid = '{0}' AND fileintr = '{1}'", strObjID, strType);
            DataTable dt = webProxy.GetDataTableBySql(strsql);
            if (dt == null || dt.Rows.Count <= 0)
            {
                MessageBox.Show("下载文件不存在");
                Application.Exit();
                return;
            }
            
            lbNum.Text = "0/" + dt.Rows.Count; //显示所有文件个数

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string URL = uploadfilepath + "/" + dt.Rows[i]["filevpath"].ToString();
                string filename = dt.Rows[i]["filename"].ToString();
                lbNum.Text = (i + 1) + "/" + dt.Rows.Count;
                lbFileName.Text = filename;
                float percent = 0;
                pbCurrent.Value = 0;

                try
                {
                    System.Net.HttpWebRequest Myrq = (System.Net.HttpWebRequest)System.Net.HttpWebRequest.Create(URL);
                    System.Net.HttpWebResponse myrp = (System.Net.HttpWebResponse)Myrq.GetResponse();
                    long totalBytes = myrp.ContentLength;
                    if (pbCurrent != null)
                    {
                        pbCurrent.Maximum = (int)totalBytes;
                    }
                    System.IO.Stream st = myrp.GetResponseStream();
                    System.IO.Stream so = new System.IO.FileStream(Path.Combine(strLocalPath, filename), System.IO.FileMode.Create);
                    long totalDownloadedByte = 0;
                    byte[] by = new byte[1024];
                    int osize = st.Read(by, 0, (int)by.Length);
                    while (osize > 0)
                    {
                        totalDownloadedByte = osize + totalDownloadedByte;
                        System.Windows.Forms.Application.DoEvents();
                        so.Write(by, 0, osize);
                        if (pbCurrent != null)
                        {
                            pbCurrent.Value = (int)totalDownloadedByte;
                        }
                        osize = st.Read(by, 0, (int)by.Length);

                        //percent = (float)totalDownloadedByte / (float)totalBytes * 100;
                        //label1.Text = "当前补丁下载进度" + percent.ToString() + "%";
                        Application.DoEvents(); //必须加注这句代码，否则label1将因为循环执行太快而来不及显示信息
                    }
                    so.Close();
                    st.Close();
                }
                catch (System.Exception)
                {
                    throw;
                }
            }
            MessageBox.Show("下载完成！");
            this.Close();
        }

        private void btnDownload_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog dlgFolder = new FolderBrowserDialog();
            dlgFolder.Description = "将下载的文件保存到：";
            if (dlgFolder.ShowDialog() != DialogResult.OK)
            {
                return;
            }
            this.strLocalPath = dlgFolder.SelectedPath;
            DownloadFiles();
        }
    }
}
