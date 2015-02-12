using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Filemng_DeleteFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) {
        Response.Write(RemoveUploadFile());
    }

    private string RemoveUploadFile() {
        string fileid = Request["fileid"];
        DataTable dt = null;

        try {
            dt = SqlDataAccess.SqlHelp.ExecuteDataTable("select [filename],fileintr,filevpath from Base_FileList where rowid='" + fileid + "'");
            string filepath = Server.MapPath("../../uploadfile/") + dt.Rows[0][2].ToString() + "\\" + fileid + dt.Rows[0][1].ToString();

            //1. 删除硬盘上的文件
            File.Delete(filepath);

            //2. 删除文件记录
            SqlDataAccess.SqlHelp.ExecuteNonQuery("delete from Base_FileList where rowid='" + fileid + "'");

            return "";
        } catch (Exception ex) {
            return ex.Message;
        } finally {
            dt = null;
        }
    }
}
