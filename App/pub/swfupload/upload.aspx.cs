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
        HttpPostedFile objFile = null;
        string rtn = "", yymm = "", objid = "", savepath = "", filesize = "";
        decimal d;

        try {
            objid = Request.QueryString["objid"];
            yymm = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString();
            savepath = Server.MapPath("../../../uploadfile/") +"\\pub\\"+ yymm + "\\" + objid;
            if (!Directory.Exists(savepath)) Directory.CreateDirectory(savepath);
            for (int i = 0; i < Request.Files.Count; i++) {
                objFile = Request.Files[i];
                if (objFile == null || objFile.ContentLength == 0 || string.IsNullOrEmpty(objFile.FileName)) continue;
                objFile.SaveAs(savepath + "\\" + Path.GetFileName(objFile.FileName));
                d = (decimal)objFile.ContentLength / 1024;
                d = Math.Round(d, 2);
                filesize = d.ToString() + "K";
                if (d > 1024) {
                    d = (decimal)d / 1024;
                    d = Math.Round(d, 2);
                    filesize = d.ToString() + "M";
                }
            }
            rtn = yymm + "/" + objid + "/" + objFile.FileName + "/" + filesize;
          //rtn=savepath;
            Response.Write(rtn);
        } catch (Exception ex) {
            Response.StatusCode = 500;
            Response.Write(ex.Message);
            Response.End();
        } finally {
            objFile = null;
            Response.End();
        }
    }

    private static string CombGUID() {
        byte[] guidArray = System.Guid.NewGuid().ToByteArray();
        DateTime baseDate = new DateTime(1900, 1, 1);
        DateTime now = DateTime.Now;
        string GUID;

        TimeSpan days = new TimeSpan(now.Ticks - baseDate.Ticks);
        TimeSpan msecs = new TimeSpan(now.Ticks - (new DateTime(now.Year, now.Month, now.Day).Ticks));

        byte[] daysArray = BitConverter.GetBytes(days.Days);
        byte[] msecsArray = BitConverter.GetBytes((long)(msecs.TotalMilliseconds / 3.333333));

        Array.Reverse(daysArray);
        Array.Reverse(msecsArray);

        Array.Copy(daysArray, daysArray.Length - 2, guidArray, guidArray.Length - 6, 2);
        Array.Copy(msecsArray, msecsArray.Length - 4, guidArray, guidArray.Length - 4, 4);
        GUID = new System.Guid(guidArray).ToString();
        GUID = GUID.ToUpper();
        GUID = GUID.Replace("-", "");
        return GUID;
    }
}
