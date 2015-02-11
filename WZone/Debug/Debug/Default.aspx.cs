using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Debug
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Button buttonTest = new Button();
            //Controls.Add(buttonTest);
        }

        
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Redirect("WebForm1.aspx?rowid=0ABC92B40EDA33C954498E63CF587345&cmd=Type3Apply");
            //Response.Redirect("WebForm1.aspx?rowid=EE5BB44468B19A09F11B910708210A3C&cmd=Type3End");
            string id = txtId.Text.Trim();
            Response.Redirect("PrintReport.aspx?rowid=" + id + "&cmd=Type3Acceptance");
        }

        protected void btnContent_Click(object sender, EventArgs e)
        {
            string id = txtId.Text.Trim();
            //Response.Redirect("ContentTextArea.aspx?rowid=" + id + "&tbl=Tp_Prj_baseinfo&col=PrjContent");
            Response.Redirect("ContentTextArea.aspx?rowid=" + id + "&tbl=TP_Prj_Content&col=PrjMethod");
            
        }

        protected void btnPricesReport_Click(object sender, EventArgs e)
        {
            string id = txtId.Text.Trim();
            Response.Redirect("/PricesPrint/PrintPricesReport.aspx?prjid=" + id);
        }

        protected void btnDivShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("DivHideShow.aspx");
        }
    }
}
