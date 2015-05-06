using System;
using System.Collections.Generic;
using System.Text;
using System.Collections.Specialized;
using System.Text.RegularExpressions;
using System.IO;
using System.Windows.Forms;
using System.Data;
using System.Diagnostics;
using System.Configuration;
using Hanstrong.DrawingPrns;

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
            downloadfiles,
            getdsfiles,
            downloadzip,
            downloadarh,
            buildzip,
            comarhgd,
            downloadpltfiles,
            downpuballfile,
            uploadpubfiles
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
                case CttFlag.getdsfiles: { GetDsFiles(); break; }
                case CttFlag.downloadzip: { DownloadZip(); break; }
                case CttFlag.downloadarh: { DownloadArh(); break; }
                case CttFlag.buildzip: { BuildZip(); break; }
                case CttFlag.comarhgd: { ComArhGD(); break; }
                case CttFlag.downloadpltfiles: { DownloadPltFiles(); break; }
                case CttFlag.downpuballfile: { DownloadPubAllFile(); break; }
                case CttFlag.uploadpubfiles: { UploadPubFiles(); break; }
                default:break;
            }
        }

        #region CTT调用
        /// <summary>
        /// 出版任务单全部文件下载
        /// </summary>
        private void DownloadPubAllFile()
        {
            try
            {
                frmPubAllFilesDownLoad fpafd = new frmPubAllFilesDownLoad(Params["objid"], Params["type"]);
                fpafd.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        //PDF申请单文件下载
        private void DownloadPltFiles()
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
                string strTyXml = "";
                strXml = GetDownLoadPltFile(Params["objid"], strLocalPath, out strTyXml);
                if (strXml == "")
                {
                    MessageBox.Show("没有找到可下载PLT文件。"); return;
                }
                FileTransferDialog fdlg = new FileTransferDialog();
                fdlg.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                fdlg.LoadTransferTaskXml(strXml);
                if (fdlg.ShowDialog() == DialogResult.Cancel)
                {
                    if (strTyXml != "")
                    {
                        FileTransferDialog fdlg1 = new FileTransferDialog();
                        fdlg1.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                        fdlg1.LoadTransferTaskXml(strTyXml);
                        if (fdlg1.ShowDialog() == DialogResult.Cancel)
                        {
                            Environment.Exit(Environment.ExitCode);
                            return;
                        }
                    }
                    Environment.Exit(Environment.ExitCode);
                    return;
                }

                while (transferTip.Visible) { Application.DoEvents(); }//*/
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void ComArhGD()
        {
            frmComArh fca = new frmComArh(Params["rowids"], Params["username"], Params["vtpid"]);
            fca.ShowDialog();
        }

        private void BuildZip()
        {
            frmBuilderZip fbz = new frmBuilderZip(Params["dwgids"], Params["pubid"]);
            fbz.ShowDialog();
        }

        private void DownloadArh()
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
                string strTyXml = "";
                strXml = GetDownloadArh(Params["tpid"], Params["vtpid"], Params["where"], Params["value"], strLocalPath, out strTyXml);
                if (strXml == "")
                {
                    MessageBox.Show("没有找到可下载出版的文件。"); return;
                }
                FileTransferDialog fdlg = new FileTransferDialog();
                fdlg.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                fdlg.LoadTransferTaskXml(strXml);
                if (fdlg.ShowDialog() == DialogResult.Cancel)
                {
                    if (strTyXml != "")
                    {
                        FileTransferDialog fdlg1 = new FileTransferDialog();
                        fdlg1.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                        fdlg1.LoadTransferTaskXml(strTyXml);
                        if (fdlg1.ShowDialog() == DialogResult.Cancel)
                        {
                            Environment.Exit(Environment.ExitCode);
                            return;
                        }
                    }
                    Environment.Exit(Environment.ExitCode);
                    return;
                }

                while (transferTip.Visible) { Application.DoEvents(); }//*/
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void DownloadZip()
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
                string strTyXml = "";
                //strXml = GetDownloadFiles(Params["objid"], strLocalPath);
                strXml = GetDownloadZip(Params["objid"], strLocalPath, out strTyXml);
                if (strXml == "")
                {
                    MessageBox.Show("没有找到可下载出版的文件。"); return;
                }
                FileTransferDialog fdlg = new FileTransferDialog();
                fdlg.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                fdlg.LoadTransferTaskXml(strXml);
                if (fdlg.ShowDialog() == DialogResult.Cancel)
                {
                    if (strTyXml != "")
                    {
                        FileTransferDialog fdlg1 = new FileTransferDialog();
                        fdlg1.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                        fdlg1.LoadTransferTaskXml(strTyXml);
                        if (fdlg1.ShowDialog() == DialogResult.Cancel)
                        {
                            Environment.Exit(Environment.ExitCode);
                            return;
                        }
                    }
                    Environment.Exit(Environment.ExitCode);
                    return;
                }

                while (transferTip.Visible) { Application.DoEvents(); }//*/
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        //调晒文件下载
        private void GetDsFiles()
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
                string strTyXml = "";
                strXml = GetDsFilesInfo(Params["objid"], strLocalPath, out strTyXml);
                if (strXml == "")
                {
                    MessageBox.Show("没有找到可下载出版的文件。"); return;
                }
                FileTransferDialog fdlg = new FileTransferDialog();
                fdlg.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                fdlg.LoadTransferTaskXml(strXml);
                if (fdlg.ShowDialog() == DialogResult.Cancel)
                {
                    if (strTyXml != "")
                    {
                        FileTransferDialog fdlg1 = new FileTransferDialog();
                        fdlg1.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                        fdlg1.LoadTransferTaskXml(strTyXml);
                        if (fdlg1.ShowDialog() == DialogResult.Cancel)
                        {
                            Environment.Exit(Environment.ExitCode);
                            return;
                        }
                    }
                    Environment.Exit(Environment.ExitCode);
                    return;
                }

                while (transferTip.Visible) { Application.DoEvents(); }//*/
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        //获取调晒文件信息
        private string GetDsFilesInfo(string objid, string strLocalFilePath, out string strTyXml)
        {
            strTyXml = "";
            string sqlCmd = "";
            string strXml = "<items>";
            string strLocalFile = "";
            string strRemoteFile = "";
            string flag ="";
            List<string> localFileList = new List<string>();
            DataSet ds;

            //判断是获取协同平台服务器文件还是档案服务器文件
            string sqlflag = "SELECT filecome FROM DNF_VOL_DS WHERE rowid = '" + objid + "'";
            DataSet flagds  = webProxy.GetDataSetBySql(sqlflag);
            if (flagds == null) throw new NullReferenceException("获取数据集失败");
            foreach (DataTable flagdt in flagds.Tables)
            {
                foreach (DataRow flagrow in flagdt.Rows)
                {
                    flag = flagrow["filecome"].ToString();
                }
            }


            if (flag == "2")
            {
                //获取平台库调晒文件
                sqlCmd = "SELECT filepath +'/' + xdwgid+'.'+ memo as localPath,filepath+ '/PUB/'+ xdwgid +'.'+ memo AS remotePath FROM dng_ds_files WHERE pubid in(select rowid from DNF_VOL_DS where rowid= '" + objid + "' and filecome=2 )";

                ds = webProxy.GetDataSetBySql(sqlCmd);

                if (ds == null) throw new NullReferenceException("获取数据集失败");
                FtpInfo ftpInfo = GetUploadFilesFtpInfo();
                if (ftpInfo == null) throw new NullReferenceException("未能获得FTP的连接信息。");

                strXml += "<item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
                foreach (DataTable dt in ds.Tables)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        strRemoteFile = dr["remotePath"].ToString();
                        strLocalFile = strLocalFilePath + "\\" + dr["localPath"].ToString().Replace("/", "\\");
                        localFileList.Add(strLocalFile);
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
                    }
                }

            }
            else {

                #region 获取档案库掉晒文件
                sqlCmd = "SELECT filepath +'/' + xdwgid+'.'+ memo as localPath,filepath+ '/'+ xdwgid  AS remotePath FROM dng_ds_files WHERE pubid IN (SELECT rowid FROM DNF_VOL_DS WHERE rowid = '" + objid + "' and (filecome=1 or filecome=3) ) ";
                DataSet dsty = webProxy.GetDataSetBySql(sqlCmd);

                if (dsty == null) throw new NullReferenceException("获取数据集失败");
                FtpInfo arhftpInfo = GetUploadFilesArhFtpInfo();
                if (arhftpInfo == null) throw new NullReferenceException("未能获得FTP的连接信息。");

                strXml += "<item class=\"HOST\" hostip=\"" + arhftpInfo.IpAddress + "\" hostport=\"" + arhftpInfo.Port.ToString() + "\" loginname=\"" + arhftpInfo.LoginName + "\" loginpass=\"" + arhftpInfo.Password + "\"/>";
                foreach (DataTable arhdt in dsty.Tables)
                {
                    foreach (DataRow arhdr in arhdt.Rows)
                    {
                        strRemoteFile = arhdr["remotePath"].ToString();
                        strLocalFile = strLocalFilePath + "\\" + arhdr["localPath"].ToString().Replace("/", "\\");
                        localFileList.Add(strLocalFile);
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
                    }
                }
                #endregion
            }
            strXml += "</items>";

            return strXml;
        }
        //出版文件下载
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
                string strTyXml = "";
                //strXml = GetDownloadFiles(Params["objid"], strLocalPath);
                strXml = GetDownloadFiles(Params["objid"], strLocalPath, out strTyXml);
                if (strXml == "")
                {
                    MessageBox.Show("没有找到可下载出版的文件。"); return;
                }
                FileTransferDialog fdlg = new FileTransferDialog();
                fdlg.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                try
                {
                    fdlg.LoadTransferTaskXml(strXml);
                    if (fdlg.ShowDialog() == DialogResult.Cancel)
                    {
                        if (strTyXml != "")
                        {
                            FileTransferDialog fdlg1 = new FileTransferDialog();
                            fdlg1.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                            fdlg1.LoadTransferTaskXml(strTyXml);
                            if (fdlg1.ShowDialog() == DialogResult.Cancel)
                            {
                                Environment.Exit(Environment.ExitCode);
                                return;
                            }
                        }
                        Environment.Exit(Environment.ExitCode);
                        return;
                    }

                    while (transferTip.Visible) { Application.DoEvents(); }//*/
                }
                catch (Exception ex1)
                {
                    MessageBox.Show(ex1.Message);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        //文件上传
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
        #region 印制室上传
        private void UploadPubFiles()
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.Multiselect = true;
            dlg.ShowDialog();
            if (dlg.FileNames.Length == 0) return;
            string strXml = "";
            strXml = GetUploadPubFiles(dlg.FileNames);
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
        //获取PDF申请单PLT文件信息
        private string GetDownLoadPltFile(string objid, string strLocalFilePath, out string strTyXml)
        {
            strTyXml = "";
            string sqlCmd = "";
            string strXml = "<items>";
            string strLocalFile = "";
            string strRemoteFile = "";
            List<string> localFileList = new List<string>();
            DataSet ds;

            //获取平台库PLT文件
            //sqlCmd = "SELECT filepath +'('+ dbo.clip(volfzr,':',1)+ ')/' + dwgid+'.'+ memo as localPath,filepath+ '/PUB/'+ dwgid +'.'+ memo AS remotePath FROM DNG_Vol_Drawings WHERE volid IN (select volrowid from pdfjf_info_detail WHERE pdf_info_rowid='" + objid + "')";
            //2015-4-29
            sqlCmd = "SELECT CASE WHEN memo = 'plt' THEN dbo.clip(filepath,'/',0)+'/'+dwgid+'.'+ memo  ELSE dbo.clip(filepath,'/',0)+'/'+dbo.clip(filepath,'/',0)+'-'+dbo.clip(filepath,'/',1)+'/'+dwgid+'.'+ memo END localPath ,filepath+ '/PUB/'+ dwgid +'.'+ memo AS remotePath FROM DNG_Vol_Drawings WHERE volid IN (select volrowid from pdfjf_info_detail  WHERE pdf_info_rowid='" + objid + "')";
            ds = webProxy.GetDataSetBySql(sqlCmd);

            if (ds == null) throw new NullReferenceException("获取数据集失败");
            FtpInfo ftpInfo = GetUploadFilesFtpInfo();
            if (ftpInfo == null) throw new NullReferenceException("未能获得FTP的连接信息。");

            strXml += "<item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
            foreach (DataTable dt in ds.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    strRemoteFile = dr["remotePath"].ToString();
                    strLocalFile = strLocalFilePath + "\\" + dr["localPath"].ToString().Replace("/", "\\");
                    localFileList.Add(strLocalFile);
                    strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
                }
            }

            #region  //获取档案库PLT文件　2014-01-20
            //sqlCmd = @"SELECT filetitle,storepath+'/'+filetitle filepath FROM Arh_Fileobj_prj WHERE fileid IN (SELECT rowid FROM Arh_File_prj WHERE volcode IN (SELECT volrowid FROM pdfjf_info_detail WHERE pdf_info_rowid='" + objid + "')) AND extname='pdf' UNION all SELECT filetitle,storepath+'/'+filetitle filepath FROM Arh_Fileobj_prj WHERE fileid IN (SELECT rowid FROM Arh_File_prj WHERE volcode IN (SELECT volrowid FROM pdfjf_info_detail WHERE pdf_info_rowid='" + objid + "')) AND extname='plt' AND fileid NOT IN (SELECT fileid FROM Arh_Fileobj_prj WHERE fileid IN (SELECT rowid FROM Arh_File_prj WHERE volcode IN (SELECT volrowid FROM pdfjf_info_detail WHERE pdf_info_rowid='" + objid + "')) AND extname='pdf')";
            //2015-4-29
            sqlCmd = @"SELECT filetitle,storepath+'/'+filetitle filepath, b.volid FROM Arh_Fileobj_prj a LEFT JOIN (SELECT k.volid,j.rowid FROM dbo.Arh_Vol_prj_Y1 k, arh_file_prj j WHERE k.rowid = j.volcode) b ON a.fileid = b.rowid WHERE a.fileid IN (SELECT rowid FROM Arh_File_prj WHERE volcode IN (SELECT volrowid FROM pdfjf_info_detail WHERE pdf_info_rowid='" + objid + "')) AND extname='pdf' UNION all SELECT filetitle,storepath+'/'+filetitle filepath, b.volid FROM Arh_Fileobj_prj a LEFT JOIN (SELECT k.volid,j.rowid FROM dbo.Arh_Vol_prj_Y1 k, arh_file_prj j WHERE k.rowid = j.volcode) b ON a.fileid = b.rowid WHERE a.fileid IN (SELECT rowid FROM Arh_File_prj WHERE volcode IN (SELECT volrowid FROM pdfjf_info_detail WHERE pdf_info_rowid='" + objid + "')) AND extname='plt' AND a.fileid NOT IN (SELECT fileid FROM Arh_Fileobj_prj WHERE fileid IN (SELECT rowid FROM Arh_File_prj WHERE volcode IN (SELECT volrowid FROM pdfjf_info_detail WHERE pdf_info_rowid='" + objid + "')) AND extname='pdf')";
            DataTable drArh = webProxy.GetDataTableBySql(sqlCmd);
            if (drArh != null && drArh.Rows.Count > 0)
            {
                strTyXml = "<items>";
                FtpInfo arhftpInfo = GetUploadFilesArhFtpInfo();
                if (arhftpInfo != null)
                {

                    strTyXml += "<item class=\"HOST\" hostip=\"" + arhftpInfo.IpAddress + "\" hostport=\"" + arhftpInfo.Port.ToString() + "\" loginname=\"" + arhftpInfo.LoginName + "\" loginpass=\"" + arhftpInfo.Password + "\"/>";
                    foreach (DataRow dritem in drArh.Rows)
                    {
                        strLocalFile = strLocalFilePath + "\\" + dritem["volid"] + "\\" + dritem["filetitle"].ToString();
                        strTyXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + dritem["filepath"].ToString() + "\"/>";
                    }
                }
                strTyXml += "</items>";
            }
            #endregion

            strXml += "</items>";

            return strXml;
        }

        //获取上传文件信息
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
        //获取上传的pub文件信息
        public string _rid;
        private string GetUploadPubFiles(string[] fileNames)
        {
            FtpInfo ftpInfo = GetUploadPubFilesFtpInfo();
            string strRemoteFile;
            string strLocalFile;
           
            _rid = Guid.NewGuid().ToString("N").ToUpper();
            string strXml = "<items>";
            strXml += "<item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";

            for (int i = 0; i < fileNames.Length; i++)
            {
                strRemoteFile = DateTime.Now.Year + "-" + DateTime.Now.Month + "/" + _rid + "/" + Path.GetFileName(fileNames[i]);
                strLocalFile = fileNames[i];
                strXml += "<item class=\"FILE\" transfertype=\"pubupload\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
            }
            strXml += "</items>";
            return strXml;
        }
        private string GetDownloadArh(string tpid, string vtpid, string strwhere, string value, string strLocalFilePath, out string strTyXml)
        {
            strTyXml = "";
            string sqlCmd = "";
            string strXml = "<items>";
            string strLocalFile = "";
            string strRemoteFile = "";
            List<string> localFileList = new List<string>();
            DataSet ds;

            //获取出版文件
            sqlCmd = string.Format("SELECT storepath+'/'+filetitle as filepath, filetitle FROM Arh_Fileobj_{0} where fileid in (select rowid from arh_file_{0} where volcode in (select rowid from arh_vol_{0}_{1}  where {2} = '{3}') )", tpid, vtpid, strwhere, value);

            ds = webProxy.GetDataSetBySql(sqlCmd);

            if (ds == null) throw new NullReferenceException("获取数据集失败");
            FtpInfo ftpInfo = GetUploadFilesArhFtpInfo();
            if (ftpInfo == null) throw new NullReferenceException("未能获得FTP的连接信息。");

            strXml += "<item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
            foreach (DataTable dt in ds.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    strRemoteFile = dr["filepath"].ToString();
                    strLocalFile = strLocalFilePath + "\\" + dr["filetitle"].ToString();
                    localFileList.Add(strLocalFile);
                    strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
                }
            }

            strXml += "</items>";

            return strXml;
        }

        private string GetDownloadZip(string objid, string strLocalFilePath, out string strTyXml)
        {
            strTyXml = "";
            string sqlCmd = "";
            string strXml = "<items>";
            string strLocalFile = "";
            string strRemoteFile = "";
            List<string> localFileList = new List<string>();
            DataSet ds;

            //获取出版文件
            sqlCmd = "SELECT * FROM dbo.Arh_Audting_Auto WHERE rowid = '" + objid + "' ";

            /*//获取相关附件
            sqlCmd += "union SELECT b.filePath+'('+ dbo.clip(b.volfzr,':',1) +')/'+ b.dwgid +'.'+ b.memo +'_相关附件/'+a.AbtFileName  AS localPath, " +
            "a.AbtFilePath AS remotePath " +
            "from dng_aboutfile AS a INNER JOIN DNG_Vol_Drawings AS b ON a.srcFileid = b.dwgRowid " +
            "WHERE srcfileid in (SELECT dwgRowid FROM DNG_Vol_Drawings WHERE dwgRowid IN (SELECT dwgrowid FROM prj_fdwgpub WHERE pubid = '" + objid + "')) ";*/
            ds = webProxy.GetDataSetBySql(sqlCmd);

            if (ds == null) throw new NullReferenceException("获取数据集失败");
            FtpInfo ftpInfo = GetUploadFilesFtpInfo();
            if (ftpInfo == null) throw new NullReferenceException("未能获得FTP的连接信息。");

            strXml += "<item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
            foreach (DataTable dt in ds.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    strRemoteFile = dr["ftppath"].ToString();
                    //判断是否有压缩包
                    if (strRemoteFile.ToLower().Contains(".zip"))
                    {
                        strLocalFile = strLocalFilePath + "\\" + dr["zipname"].ToString();
                        localFileList.Add(strLocalFile);
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
                    }
                    else //无压缩包下载
                    {
                        string strsql = string.Format("SELECT * FROM Arh_Audting_Auto_Detail WHERE autoID = '{0}'", objid);
                        DataTable dtfile = webProxy.GetDataTableBySql(strsql);
                        if (dtfile == null) throw new NullReferenceException("获取数据集失败");
                        //创建目录
                        string strLocalFolder = string.Format(@"{0}\{1}", strLocalFilePath, dr["volid"]);
                        if (!Directory.Exists(strLocalFolder))
                        {
                            Directory.CreateDirectory(strLocalFolder);
                        }
                        foreach (DataRow drfile in dtfile.Rows)
                        {
                            strLocalFile = string.Format(@"{0}\{1}", strLocalFolder, drfile["filename"]);
                            string strNewRemoteFile = string.Format("{0}/{1}", strRemoteFile, drfile["filename"]);
                            localFileList.Add(strLocalFile);
                            strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strNewRemoteFile + "\"/>";
                        }
                    }
                }
            }

            strXml += "</items>";

            return strXml;
        }

        //获取下载文件信息（以前历史方法目前未使用）
        private string GetDownloadFiles(string objid, string strLocalFilePath)
        {
            string sqlCmd = "";
            string strXml = "<items>";
            string strLocalFile = "";
            string strRemoteFile = "";
            DataSet ds;

            //获取出版文件
            sqlCmd = "SELECT filepath +'('+ dbo.clip(volfzr,':',1)+ ')/' + dwgid+'.'+ memo as localPath,filepath+ '/PUB/'+ dwgid +'.'+ memo AS remotePath FROM DNG_Vol_Drawings WHERE dwgRowid IN (SELECT dwgrowid FROM prj_fdwgpub WHERE pubid = '" + objid + "') ";
            
            //获取相关附件
            sqlCmd += "union SELECT b.filePath+'('+ dbo.clip(b.volfzr,':',1) +')/'+ b.dwgid +'.'+ b.memo +'_相关附件/'+a.AbtFileName  AS localPath, " +
            "a.AbtFilePath AS remotePath " +
            "from dng_aboutfile AS a INNER JOIN DNG_Vol_Drawings AS b ON a.srcFileid = b.dwgRowid " +
            "WHERE srcfileid in (SELECT dwgRowid FROM DNG_Vol_Drawings WHERE dwgRowid IN (SELECT dwgrowid FROM prj_fdwgpub WHERE pubid = '" + objid + "')) ";
            ds = webProxy.GetDataSetBySql(sqlCmd);

            if (ds == null) throw new NullReferenceException("获取数据集失败");
            FtpInfo ftpInfo = GetUploadFilesFtpInfo();
            if (ftpInfo == null) throw new NullReferenceException("未能获得FTP的连接信息。");

            strXml += "<item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
            foreach (DataTable dt in ds.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    strRemoteFile = dr["remotePath"].ToString();
                    strLocalFile = strLocalFilePath + "\\" + dr["localPath"].ToString().Replace("/", "\\");
                    strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
                }
            }
            
            #region 增加下载套用图功能　2012-12-18 zhaoxin
            sqlCmd = "SELECT dwgid,[FileName],remark,FilePath FROM DNG_VOLSHEET WHERE IsCopy = 1 AND VolID IN (SELECT volid FROM prj_fdwgpub WHERE pubid='" + objid + "' GROUP BY volid)";
            DataSet dsty = webProxy.GetDataSetBySql(sqlCmd);
            if (dsty != null)
            {
                string baselocal = strLocalFile.Substring(0, strLocalFile.LastIndexOf("\\"));
                //找出平台库套用图
                DataRow[] drDefault = dsty.Tables[0].Select("remark='平台库'");
                if (drDefault != null && drDefault.Length > 0)
                {
                    foreach (DataRow dritem in drDefault)
                    {
                        strLocalFile = baselocal + "\\" + dritem["FileName"].ToString();
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + dritem["FilePath"].ToString() + "\"/>";
                    }
                }
                //找出档案库套用图
                DataRow[] drArh = dsty.Tables[0].Select("remark='档案库'");
                if (drArh != null && drArh.Length > 0)
                {
                    FtpInfo arhftpInfo = GetUploadFilesArhFtpInfo();
                    if (arhftpInfo != null)
                    {
                        strXml += "<item class=\"HOST\" hostip=\"" + arhftpInfo.IpAddress + "\" hostport=\"" + arhftpInfo.Port.ToString() + "\" loginname=\"" + arhftpInfo.LoginName + "\" loginpass=\"" + arhftpInfo.Password + "\"/>";
                        foreach (DataRow dritem in drArh)
                        {
                            strLocalFile = baselocal + "\\" + dritem["FileName"].ToString();
                            strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + dritem["FilePath"].ToString() + "\"/>";
                        }
                    }
                }
            }
            #endregion

            strXml += "</items>";

            return strXml;
        }
        //获取下载文件信息方法重载
        private string GetDownloadFiles(string objid, string strLocalFilePath, out string strTyXml)
        {
            strTyXml = "";
            string sqlCmd = "";
            string strXml = "<items>";
            string strLocalFile = "";
            string strRemoteFile = "";
            List<string> localFileList = new List<string>();
            DataSet ds;

            //获取出版文件
            sqlCmd = "SELECT filepath +'('+ dbo.clip(volfzr,':',1)+ ')/' + dwgid+'.'+ memo as localPath,filepath+ '/PUB/'+ dwgid +'.'+ memo AS remotePath FROM DNG_Vol_Drawings WHERE dwgRowid IN (SELECT dwgrowid FROM prj_fdwgpub WHERE pubid = '" + objid + "') ";

            //获取相关附件
            sqlCmd += "union SELECT b.filePath+'('+ dbo.clip(b.volfzr,':',1) +')/'+ b.dwgid +'.'+ b.memo +'_相关附件/'+a.AbtFileName  AS localPath, " +
            "a.AbtFilePath AS remotePath " +
            "from dng_aboutfile AS a INNER JOIN DNG_Vol_Drawings AS b ON a.srcFileid = b.dwgRowid " +
            "WHERE srcfileid in (SELECT dwgRowid FROM DNG_Vol_Drawings WHERE dwgRowid IN (SELECT dwgrowid FROM prj_fdwgpub WHERE pubid = '" + objid + "')) ";
            ds = webProxy.GetDataSetBySql(sqlCmd);

            if (ds == null) throw new NullReferenceException("获取数据集失败");
            FtpInfo ftpInfo = GetUploadFilesFtpInfo();
            if (ftpInfo == null) throw new NullReferenceException("未能获得FTP的连接信息。");

            strXml += "<item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
            foreach (DataTable dt in ds.Tables)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    strRemoteFile = dr["remotePath"].ToString();
                    strLocalFile = strLocalFilePath + "\\" + dr["localPath"].ToString().Replace("/", "\\");
                    localFileList.Add(strLocalFile);
                    strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + strRemoteFile + "\"/>";
                }
            }

            #region 增加下载套用图功能　2012-12-18 zhaoxin
            sqlCmd = @"SELECT dwgid,[FileName],a.remark,FilePath,b.prjID,c.EntityID FROM DNG_VOLSHEET a
LEFT JOIN PRJ_BaseInfo b ON a.PrjID = b.ROWID
LEFT JOIN PRJ_BaseEntity c ON a.VolID = c.ROWID AND c.EntityType = 'vol'
 WHERE a.IsCopy = 1 AND a.VolID IN (SELECT volid FROM prj_fdwgpub WHERE pubid='" + objid + "' GROUP BY volid)";
            DataSet dsty = webProxy.GetDataSetBySql(sqlCmd);
            if (dsty != null)
            {
                string baselocal = "";
                //找出平台库套用图
                DataRow[] drDefault = dsty.Tables[0].Select("remark='平台库'");
                if (drDefault != null && drDefault.Length > 0)
                {
                    foreach (DataRow dritem in drDefault)
                    {
                        baselocal = GetVolDirectory(dritem["EntityID"].ToString(), dritem["prjID"].ToString(), localFileList);
                        strLocalFile = baselocal + "\\" + dritem["FileName"].ToString();
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + dritem["FilePath"].ToString() + "\"/>";
                    }
                }
                //找出档案库套用图
                DataRow[] drArh = dsty.Tables[0].Select("remark='档案库'");
                if (drArh != null && drArh.Length > 0)
                {
                    strTyXml = "<items>";
                    FtpInfo arhftpInfo = GetUploadFilesArhFtpInfo();
                    if (arhftpInfo != null)
                    {
                        strTyXml += "<item class=\"HOST\" hostip=\"" + arhftpInfo.IpAddress + "\" hostport=\"" + arhftpInfo.Port.ToString() + "\" loginname=\"" + arhftpInfo.LoginName + "\" loginpass=\"" + arhftpInfo.Password + "\"/>";
                        foreach (DataRow dritem in drArh)
                        {
                            baselocal = GetVolDirectory(dritem["EntityID"].ToString(), dritem["prjID"].ToString(), localFileList);
                            strLocalFile = baselocal + "\\" + dritem["FileName"].ToString();
                            strTyXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + strLocalFile + "\" remoteFile=\"" + dritem["FilePath"].ToString() + "\"/>";
                        }
                    }
                    strTyXml += "</items>";
                }
            }
            #endregion

            strXml += "</items>";

            return strXml;
        }

        private string GetVolDirectory(string volid, string prjid, List<string> localFileList)
        {
            string baselocal = "";
            string[] volidarr = volid.Split('-');
            string volname = volidarr.Length > 1 ? volidarr[volidarr.Length - 1] : volidarr[0];
            //查找对应文件目录
            foreach (string list in localFileList)
            {
                if (list.Contains(prjid) && list.Contains(volname))
                {
                    baselocal = list.Substring(0, list.LastIndexOf("\\"));
                    break;
                }
            }
            return baselocal;
        }



        private FtpInfo GetUploadFilesArhFtpInfo()
        {
            try
            {
                FtpInfo ftp;
                string host, port, loginName, loginPass;
                string arhFtp = ConfigurationManager.AppSettings["arhFtp"];
                host = arhFtp.Split(',')[0];
                port = arhFtp.Split(',')[1];
                loginName = arhFtp.Split(',')[2];
                loginPass = arhFtp.Split(',')[3];
                ftp = new FtpInfo(host, host, loginName, loginPass, int.Parse(port));
                return ftp;
            }
            catch { return null; }

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
            if (transferType == "pubupload")
            {
                string strSql = "insert into Base_FileList(objid,filename,filesize,filevpath,uploaduser,uploadtime,fileintr)";
                strSql += string.Format(" values ('{0}','{1}','{2}','{3}','{4}', dbo.GetTime(2),'arh')", this.Params["objid"],
                    Path.GetFileName(localFile), ByteFormatter.ToString(new FileInfo(localFile).Length), remoteFile, this.Params["uid"]);
                string strRtn = webProxy.ExecuteSql(strSql);
            }
        }
        public FtpInfo GetUploadPubFilesFtpInfo() 
        {
           // string sqlCmd;
            string host, loginName, loginPass;
            string[] arrFtp;
            int port = 21;
            FtpInfo ftp;
            arrFtp =ConfigurationManager.AppSettings["webPubAddress"].ToString().Split(',');
            host = arrFtp[0];
           // int.TryParse(arrFtp[0], out port);
            loginName = arrFtp[1];
            loginPass = arrFtp[2];

            ftp = new FtpInfo(host, host, loginName, loginPass, port);
            ftp.Attribs.Add("basedir","PUB");
            ftp.Attribs.Add("crttime", DateTime.Now.ToShortTimeString());
            return ftp;
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
