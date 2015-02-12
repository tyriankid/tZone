using System;
using System.Web;
using System.IO;
using System.Data;
using System.Configuration;

public partial class Filemng_ReadFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = null;
        string filepath = "";
        try {
            dt = SqlDataAccess.SqlHelp.ExecuteDataTable("select [filename],fileintr,filevpath from Base_FileList where rowid='" + Request["fileid"] + "'");
            filepath = Server.MapPath("../../uploadfile/") + dt.Rows[0][2].ToString() + "\\" + Request["fileid"] + dt.Rows[0][1].ToString();
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(dt.Rows[0][0].ToString()));
            Response.BinaryWrite(File.ReadAllBytes(filepath));
            Response.End();  
        } catch {
            
        } finally {
            dt = null;
        }
    }
}
