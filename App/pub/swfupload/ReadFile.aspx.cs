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
		    //档案附件表不一样select filetitle,filesize,extname,storepath,rowid from Arh_Fileobj_prj
            //dt = SqlDataAccess.SqlHelp.ExecuteDataTable("select [filename],fileintr,filevpath from Base_FileList where rowid='" + Request["fileid"] + "'");
            dt = SqlDataAccess.SqlHelp.ExecuteDataTable("select filetitle ,filesize,storepath  from Arh_Fileobj_" + Request["tpid"] + " where rowid='" + Request["fileid"] + "'");
            filepath ="\\\\10.165.3.101\\htkj\\"+dt.Rows[0][2].ToString() + "\\" + dt.Rows[0][0].ToString();
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
