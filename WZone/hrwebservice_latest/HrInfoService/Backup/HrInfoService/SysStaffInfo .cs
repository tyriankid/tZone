using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace HrInfoService
{
    
    public class SysStaffInfo


    {
        private string userid;

        public string Userid
        {
            get { return userid; }
            set { userid = value; }
        }
        private string username;

        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        private string depid;

        public string Depid
        {
            get { return depid; }
            set { depid = value; }
        }
        private string depname;

        public string Depname
        {
            get { return depname; }
            set { depname = value; }
        }
        private string loginName;

        public string LoginName
        {
            get { return loginName; }
            set { loginName = value; }
        }

        private string loginPass;

        public string LoginPass
        {
            get { return loginPass; }
            set { loginPass = value; }
        }

        public SysStaffInfo() { }
    }

}
