using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.IO;

public partial class swfupload_upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(SaveUploadFile());
        Response.End();
    }

    private string SaveUploadFile() {
        DataTable dt = null;
        HttpPostedFile oFile = Request.Files[0];
        string Sqlcmd = "";
        try {
            #region 先保存文件到硬盘  
            string fpath = Server.MapPath("../../uploadfile/");
            string ympath = DateTime.Now.ToString("s").Substring(0,7);
            fpath += ympath;
            string fileid = RiaApp.GenericGUID();
            string filext = Path.GetExtension(oFile.FileName);
            if (!Directory.Exists(fpath)) Directory.CreateDirectory(fpath);
            fpath += "\\" + fileid + filext;
            oFile.SaveAs(fpath);
            #endregion

            #region 设置文件相关的属性信息：硬盘相对路径、真实文件名、版本号等，保存到数据库表中
            try {
                string uploadUser = "";
                try {
                    uploadUser = Session["uname"].ToString();
                } catch {
                    uploadUser = "";
                }
                Sqlcmd = "INSERT INTO Base_FileList(rowid,uploadUser,[filename],filesize,objid,filevpath,fileintr)";
                Sqlcmd += " values('" + fileid + "','" + uploadUser + "','" + oFile.FileName + "',";
                Sqlcmd += "'" + FormatBytes(oFile.ContentLength) + "','" + Request["objid"] + "','" + ympath + "','" + filext + "')";
                SqlDataAccess.SqlHelp.ExecuteNonQuery(Sqlcmd);
            } catch(Exception ex) {
                File.Delete(fpath);
                Response.StatusCode = 500;
                File.WriteAllText(Server.MapPath("../../uploadfile/") + "err.txt", Sqlcmd + ex.Message, System.Text.Encoding.UTF8);
                return "写文件信息时发生错误：" + ex.Message;
            }
            #endregion
            return "OK";
        } catch(Exception ex) {
            Response.StatusCode = 500;
            File.WriteAllText(Server.MapPath("../../uploadfile/") + "err.txt", ex.Message, System.Text.Encoding.UTF8);
            return ex.Message;
        }
    }

    private string FormatBytes(long size) {
        string[] units = new string[] { "B", "K", "M", "G" };
        double val = size;
        int count = 0;

        while (val > 1024 && count < units.Length) {
            val /= 1024;
            count++;
        }
        return string.Format("{0}{1}", Math.Round(val, 2), units[count]);
    }
}
