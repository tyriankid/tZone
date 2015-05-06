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
        #region ȫ���ֶεĶ���

        //ȫ���ֶεĶ���
        string _fileName = string.Empty;//�ļ���
        private Ftp _ftp = null;
        public string ErrorMsg = string.Empty;//���������Ϣ
        private string _logUserCount = "";
        private string _remoteHost = "";

        public event EventHandler<FtpProgressEventArgs> FtpProgressChanged;
        #endregion ȫ���ֶεĶ���

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
        /// �ļ��ϴ�
        /// </summary>
        /// <param name="fileinfo">�ļ�����</param>
        /// <returns>������Ϣ</returns>
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
        /// ����һ���ļ�
        /// </summary>
        /// <param name="strRemoteFileName">Ҫ���ص��ļ���</param>
        /// <param name="strLocalFileName">�����ڱ���ʱ���ļ���</param>
        /// <returns>ִ�гɹ�����TRUE�����򷵻�FALSE</returns>
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
                    return "û���ҵ�Ҫ���ص��ļ�";
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
       

        #region Ŀ¼����
        /// <summary>
        /// ����Ŀ¼
        /// </summary>
        /// <param name="strFolderPath">Ŀ¼·��</param>
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
        ///ɾ��Ŀ¼
        ///</summary>
        ///<param name="strDirName">Ŀ¼·��</param>
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


        #region �ļ�����

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
        /// �ƶ��ļ�
        /// </summary>
        /// <param name="strFileName">���ƶ��ļ�</param>
        /// <param name="strFromPath">ԭ�ļ���</param>
        /// <param name="strToPath">���ļ���</param>
        /// <returns>ִ�гɹ�����TRUE�� ����FALSE</returns>
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
        /// ɾ��
        /// </summary>
        /// <param name="strFileName">��ɾ���ļ���</param>
        /// <returns>ִ�гɹ�����TRUE�� ����FALSE</returns>
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
        /// ������(������ļ����������ļ�����,�����������ļ�)
        /// </summary>
        /// <param name="strOldFileName">���ļ���</param>
        /// <param name="strNewFileName">���ļ���</param>
        /// <returns>ִ�гɹ�����TRUE�� ����FALSE</returns>
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
        /// ��������Ftp������
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
        /// �Ͽ�FTP����
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
