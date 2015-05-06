using System;
using System.Collections.Generic;
using System.Text;
using System.Collections.Specialized;

namespace Hanstrong.Decrypts
{
    /// <summary>
    /// FTP服务器参数
    /// </summary>
    public class FtpInfo
    {
        private string _serverName;        //服务器名
        private string _ipAddress;           //服务器地址
        private string _loginName;          //登陆名
        private string _loginPass;            //登陆密码
        private int _port;                        //端口号
        private NameValueCollection attribs;
        public NameValueCollection Attribs
        {
            get
            {
                if (attribs == null) attribs = new NameValueCollection();
                return attribs;
            }
            set { attribs = value; }
        }

        #region Properties
        public string ServerName {
            get {
                return this._serverName;
            }
        }

        public string IpAddress {
            get {
                return this._ipAddress;
            }
        }

        public string LoginName {
            get {
                return this._loginName;
            }
        }

        public string Password {
            get {
                return this._loginPass;
            }
        }

        public int Port {
            get {
                return this._port;
            }
        }
        #endregion

        #region Constructors
        public FtpInfo(string strServerName, string strIpAddress, string strLoginName, string strPass, int iPort) {
            this._serverName = strServerName;
            this._ipAddress = strIpAddress;
            this._loginName = strLoginName;
            this._loginPass = strPass;
            this._port = iPort;
        }

        public FtpInfo(string strServerName, string strIpAddress, string strLoginName, string strPassword)
        {
            this._serverName = strServerName;
            this._ipAddress = strIpAddress;
            this._loginName = strLoginName;
            this._loginPass = strPassword;
            this._port = 21;
        }
        #endregion

        public override bool Equals(object obj)
        {
            if (obj is FtpInfo)
            {
                FtpInfo ftpObj = obj as FtpInfo;
                return ftpObj.IpAddress == this.IpAddress && ftpObj.LoginName == this.LoginName && ftpObj.Port == this.Port;
            }
            else
            {
                return base.Equals(obj);
            }
        }
    }
}
