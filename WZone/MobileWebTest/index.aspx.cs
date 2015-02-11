using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class index : System.Web.UI.Page
{
    SqlHelper db = new SqlHelper();
    DataSet ds = null;
    DataTable dt = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string sql = string.Format(@"select * from admins where password = '{0}' and username = '{1}'",txtPwd.Text,txtUnm.Value);

        dt = db.GetDataTableBySQL(sql);

        if (dt.Rows.Count > 0)
        {
            //Response.Write("<script>alert('登陆成功! "+dt.Rows[0]["password"].ToString()+"');</script>");
            Response.Redirect("mainpage.aspx");
        }
        else
        {
            rtn.InnerText = "用户名或密码错误";
        }

    }
}