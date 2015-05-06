using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using Dart.PowerTCP.Ftp;
using System.Windows.Forms;

namespace Hanstrong.Decrypts
{
    public class FtpControl
    {
        #region 全局字段的定义

        //全局字段的定义
        string _fileName = string.Empty;//文件名
        private Ftp _ftp = null;
        public string ErrorMsg = string.Empty;//保存错误信息
        private string _logUserCount = "";
        private string _remoteHost = "";

        public event EventHandler<FtpProgressEventArgs> FtpProgressChanged;
        #endregion 全局字段的定义

        public FtpControl()
        {
            _ftp = new Ftp();
            _ftp.Progress += new FtpProgressEventHandler(OnProgressChanged);
        }

        protected virtual void OnProgressChanged(object sender, FtpProgressEventArgs e)
        {

            if (this.FtpProgressChanged != null && e.Status.ToString().IndexOf("Delete") < 0)
            {
                this.FtpProgressChanged(this, e);
            }
        }


        /// <summary>
        /// 文件上传
        /// </summary>
        /// <param name="fileinfo">文件对象</param>
        /// <returns>返回信息</returns>
        public string UpLoadFile(string remoteFileName,string localFileName)
        {
            _fileName = localFileName;
            try
            {
                FtpFile file = _ftp.Put(localFileName, remoteFileName);
                if (file.Exception != null)
                {
                    return file.Exception.Message;
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return string.Empty;

        }

        /// <summary>
        /// 下载一个文件
        /// </summary>
        /// <param name="strRemoteFileName">要下载的文件名</param>
        /// <param name="strLocalFileName">保存在本地时的文件名</param>
        /// <returns>执行成功返回TRUE，否则返回FALSE</returns>
        public string DownloadFile(string strRemoteFileName, string strLocalFileName)
        {
            _fileName = Path.GetFileName(strLocalFileName);
            try
            {
                FtpFile file = _ftp.Get(strRemoteFileName, strLocalFileName);
                if (file.Exception != null)
                {
                    return file.Exception.Message;
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.IndexOf("550") > -1)
                {
                    return "没有找到要下载的文件";
                }
                return ex.Message;
            }
            return string.Empty;
        }

        public string DownloadFiles(string remotePath, string localPath)
        {
            try
            {
                FtpFile[] files = _ftp.Get(remotePath, "*.*", localPath, true);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return string.Empty;
            
        }

        public string UploadFiles(string remotePath, string localPath)
        {
            try
            {
                FtpFile[] files = _ftp.Put(localPath, "*.*", remotePath, true);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return string.Empty;
        }
       

        #region 目录操作
        /// <summary>
        /// 创建目录
        /// </summary>
        /// <param name="strFolderPath">目录路径</param>
        public virtual string MkDir(string strFolderPath)
        {
            try
            {
                _ftp.Invoke(FtpCommand.MakeDir, strFolderPath);
            }
            catch (Exception ex)
            {
                string strError = ex.Message;
                if (strError.IndexOf("550") > -1)
                {
                    return string.Empty;
                }
                return strError;
            }
            return string.Empty;
        }

        ///<summary>
        ///删除目录
        ///</summary>
        ///<param name="strDirName">目录路径</param>
        public virtual string RmDir(string strFolderPath)
        {
            string strError = string.Empty;
            try
            {
                if (strFolderPath[strFolderPath.Length - 1] != '/')
                {
                    strFolderPath += "/";
                }
                strFolderPath += "*";
                FtpFile[] files = _ftp.Delete(strFolderPath, true, true);

                if (files.Length > 0)
                {
                    foreach (FtpFile file in files)
                    {
                        if (file.Exception != null)
                        {
                            strError += file.Exception.Message + ", ";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return strError;
        }

        #endregion


        #region 文件操作

        public bool ExistFile(string remoteFileName)
        {
            try
            {
                _ftp.GetSize(remoteFileName);
            }
            catch
            {
                return false;
            }

            return true;
        }

        /// <summary>
        /// 移动文件
        /// </summary>
        /// <param name="strFileName">待移动文件</param>
        /// <param name="strFromPath">原文件夹</param>
        /// <param name="strToPath">新文件夹</param>
        /// <returns>执行成功返回TRUE， 否则FALSE</returns>
        public string MoveFile(string strFromFilePath, string strToFilePath)
        {
            try
            {
                _ftp.Rename(strFromFilePath, strToFilePath);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return string.Empty;
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="strFileName">待删除文件名</param>
        /// <returns>执行成功返回TRUE， 否则FALSE</returns>
        public string Delete(string strFileName)
        {
            string strError = string.Empty;
            try
            {
                _ftp.Invoke(FtpCommand.Delete, strFileName);
            }
            catch (Exception ex)
            {
                if (ex.Message.IndexOf("550") > -1)
                {
                    return GetErrorTitle(ex.Message);
                }
                strError = GetErrorTitle(ex.Message);
            }
            return strError;
        }

        private string GetErrorTitle(string strError)
        {
            if (strError.LastIndexOf("Response:") == -1) return strError;
            if (strError.LastIndexOf("\r\n") == -1) return strError;
            int iresponse, itab;
            string strTitle = string.Empty;
            iresponse = strError.LastIndexOf("Response:");
            itab = strError.LastIndexOf("\r\n");
            strTitle = strError.Remove(itab);
            strTitle = strError.Remove(0, iresponse);
            return strTitle;
        }


        /// <summary>
        /// 重命名(如果新文件名与已有文件重名,将覆盖已有文件)
        /// </summary>
        /// <param name="strOldFileName">旧文件名</param>
        /// <param name="strNewFileName">新文件名</param>
        /// <returns>执行成功返回TRUE， 否则FALSE</returns>
        public virtual string Rename(string strOldFileName, string strNewFileName)
        {
            try
            {
                _ftp.Invoke(FtpCommand.RenameFrom, strOldFileName);
                _ftp.Invoke(FtpCommand.RenameTo, strNewFileName);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return string.Empty;
        }

        #endregion

        /// <summary>
        /// 重新连接Ftp服务器
        /// </summary>
        public string ResetFtpConn(string remoteHost, string logUserCount, string logPassword, int remotePort)
        {
            ErrorMsg = string.Empty;
            if (remoteHost == _remoteHost && logUserCount == _logUserCount) return ErrorMsg;
            _ftp.Close();
            _ftp.Server = remoteHost;
            _ftp.ServerPort = remotePort;
            _ftp.Username = logUserCount;
            _ftp.Password = logPassword;

            _remoteHost = remoteHost;
            _logUserCount = logUserCount;
            try
            {
                Response res = _ftp.RawConnect(remoteHost, remotePort);
                if (res.Code != 220)
                {
                    ErrorMsg = res.Text;
                }
            }
            catch (Exception ex)
            {
                ErrorMsg = ex.Message;
            }
            return ErrorMsg;

        }


        /// <summary>
        /// 断开FTP连接
        ///</summary>
        public void Close()
        {
            if (_ftp.Busy)
            {
                try
                {
                    _ftp.Abort();
                }
                catch
                {
                    
                }
            }
            if (_ftp.Connected)
            {
                try
                {
                    _ftp.Close();
                }
                catch { }
            }
        }

    }
}
