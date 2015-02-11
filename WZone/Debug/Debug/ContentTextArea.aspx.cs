using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Debug
{
    public partial class ContentTextArea : System.Web.UI.Page
    {
        bool isSingle = false;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAccess.SqlDataAccessGlobalManager.UseXmlConfigFile(AppDomain.CurrentDomain.BaseDirectory + "DB.Config");
            }
            
            init();
            //RomText.Text = "一、立项依据/n1.1、 研究意义和立项背景";
        }
        private void init()
        {
            
            if (!IsPostBack)
            {
                if (Request["type"] == "Single") isSingle = true; else isSingle = false;
                tbl.Text = Request["tbl"].ToString();
                col.Text = Request["col"].ToString();
                

                if (tbl.Text == "" || col.Text == "")
                {
                    Response.Write("缺少参数，无法查询数据");
                    Response.End();
                }

                if (isSingle)
                {
                    if (IsExsitS() != "no")
                    {
                        RomText.Text = "一、立项依据\r\n1.1、 研究意义和立项背景\r\n1.2、成果价值及应用前景\r\n1.3、?,.国内外相关概况、水平和发展趋势\r\n";
                        RomText.Text += IsExsitS();
                    }
                }
                else
                {
                    if (IsExsit() != "no")
                    {
                        RomText.Text = "一、立项依据\r\n1.1、 研究意义和立项背景\r\n1.2、成果价值及应用前景\r\n1.3、?,.国内外相关概况、水平和发展趋势\r\n";
                        RomText.Text += IsExsit();
                    }
                }
                /* if(Request["type"].ToString()=="view")
                  {
                      RomText.Enabled = false;
                  }
                  else
                  {
                      RomText.Enabled = true;
                  }*/
            }
        }
        #region wjq
        private string IsExsit()
        {
            string sql = "";
            DataTable dt = null;
            sql = "select " + col.Text + " from " + tbl.Text + " where objid='" + Request["rowid"].ToString() + "'";
            try
            {
                dt = SqlDataAccess.SqlHelp.ExecuteDataTable(sql);
            }
            catch
            {
                dt = null;
            }
            if (dt == null || dt.Rows.Count == 0)
            {
                return "no";
            }
            else
            {
                return dt.Rows[0][0].ToString();
            }
        }

        private void GetData()
        {

            string sql = "";
            int rtn;
            DataTable dt = null;
            if (IsExsit() == "no")
            {
                //插入新数据
                sql = "insert into " + tbl.Text + " (" + col.Text + ",objid)values('" + RomText.Text + "','" + Request["rowid"].ToString() + "')";
            }
            else
            {
                //更新数据行
                sql = "update " + tbl.Text + " set " + col.Text + "='" + RomText.Text + "' where objid='" + Request["rowid"].ToString() + "'";
            }
            try
            {
                rtn = SqlDataAccess.SqlHelp.ExecuteNonQuery(sql);
                //Response.Write(sql);
            }
            catch (Exception ex)
            {
                Response.Write("失败" + sql);
                Response.End();
            }


        }
        #endregion

        #region 单表hj
        private string IsExsitS()
        {
            string sql = "";
            DataTable dt = null;
            sql = "select " + col.Text + " from " + tbl.Text + " where rowid='" + Request["rowid"].ToString() + "'";
            Response.Write(sql);
            try
            {
                dt = SqlDataAccess.SqlHelp.ExecuteDataTable(sql);
            }
            catch
            {
                dt = null;
            }
            if (dt == null || dt.Rows.Count == 0)
            {
                return "no";

            }
            else
            {
                return dt.Rows[0][0].ToString();
            }
        }

        private void GetDataS()
        {

            string sql = "";
            int rtn;
            DataTable dt = null;
            //更新数据行
            sql = "update " + tbl.Text + " set " + col.Text + "='" + RomText.Text + "' where rowid='" + Request["rowid"].ToString() + "'";
            
            try
            {
                rtn = SqlDataAccess.SqlHelp.ExecuteNonQuery(sql);
                //Response.Write(sql);
            }
            catch (Exception ex)
            {
                Response.Write("失败" + sql);
                Response.End();
            }


        }
        #endregion


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (isSingle)
            {
                GetDataS();
            }
            else
            {
                GetData();
            }
        }
    }
}
