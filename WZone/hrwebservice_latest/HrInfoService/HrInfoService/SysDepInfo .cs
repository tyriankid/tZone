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
    public class SysDepInfo
    {
        private string depid;

        public string Depid
        {
            get { return depid; }
            set { depid = value; }
        }
        private string prowid;

        public string Prowid
        {
            get { return prowid; }
            set { prowid = value; }
        }
        private string depidCsr;

        public string DepidCsr
        {
            get { return depidCsr; }
            set { depidCsr = value; }
        }
        private string depname;

        public string Depname
        {
            get { return depname; }
            set { depname = value; }
        }
        private string depnameCsr;

        public string DepnameCsr
        {
            get { return depnameCsr; }
            set { depnameCsr = value; }
        }
        public SysDepInfo(){ }
    }
}
