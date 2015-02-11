using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using NPOI;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
//using System.Drawing;
using NPOI.SS.Util;

namespace Debug
{
    public partial class PrintPricesReportWord : System.Web.UI.Page
    {
        public string prjid = "";
        //SqlHelper db = new SqlHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAccess.SqlDataAccessGlobalManager.UseXmlConfigFile(AppDomain.CurrentDomain.BaseDirectory + "DB.Config");
            }
            if (!string.IsNullOrEmpty(Request["prjid"].ToString()))
            {
                prjid = Request["prjid"].ToString();
            }

            GetXls();
        }

        public string Cash(string nums)
        {
            return string.Format("{0:N2}", nums);
        }

        public void GetXls()
        {
            //得到模板文件，初始化HSSFWorkbook
            string xlspath = AppDomain.CurrentDomain.BaseDirectory.ToString();
            FileStream filemode = new FileStream(xlspath + @"/PricesPrint/xlt/kyfy.xls",FileMode.Open,FileAccess.Read);
            HSSFWorkbook hssfworkbook = new HSSFWorkbook(filemode);
            HSSFSheet sheet1 = (HSSFSheet)hssfworkbook.GetSheet("Sheet1");
            HSSFSheet sheet2 = (HSSFSheet)hssfworkbook.CreateSheet("Sheet2");
            HSSFRow row = null;
            HSSFCell cell;
            HSSFFont oFont;
            HSSFFont oFontB;

            //正文样式
            HSSFCellStyle style = (HSSFCellStyle)hssfworkbook.CreateCellStyle();
            style.BorderBottom = CellBorderType.THIN;
            style.BorderLeft = CellBorderType.THIN;
            style.BorderRight = CellBorderType.THIN;
            style.BorderTop = CellBorderType.THIN;
            style.Alignment = HorizontalAlignment.LEFT;
            style.VerticalAlignment = VerticalAlignment.BOTTOM;
            oFont = (HSSFFont)hssfworkbook.CreateFont();
            oFont.FontName = "宋体";
            oFont.FontHeightInPoints = 10;
            style.WrapText = true;  //自动换行
            //oFont.Boldweight = (short)FontBoldWeight.BOLD;
            style.SetFont(oFont);

            //加粗样式
            HSSFCellStyle styleB = (HSSFCellStyle)hssfworkbook.CreateCellStyle();
            styleB.BorderBottom = CellBorderType.THIN;
            styleB.BorderLeft = CellBorderType.THIN;
            styleB.BorderRight = CellBorderType.THIN;
            styleB.BorderTop = CellBorderType.THIN;
            styleB.Alignment = HorizontalAlignment.CENTER;
            styleB.VerticalAlignment = VerticalAlignment.CENTER;
            styleB.WrapText=true;  //自动换行
            oFontB = (HSSFFont)hssfworkbook.CreateFont();
            oFontB.FontName = "宋体";
            oFontB.FontHeightInPoints = 10;
            oFontB.Boldweight = (short)FontBoldWeight.BOLD;
            styleB.SetFont(oFontB);


            //sheet1
            #region 项目基本信息
            string sqlbase = string.Format(@"SELECT prjcode,prjname,selfmoney*10000 as selfmoney,subsidizemoney*10000 as subsidizemoney
                                             FROM TP_Prj_BaseInfo
                                             WHERE rowid = '{0}'",prjid);
            DataTable dtbase = new DataTable();
            dtbase = SqlDataAccess.SqlHelp.ExecuteDataTable(sqlbase);
            sheet1.GetRow(0).GetCell(1).SetCellValue(dtbase.Rows[0]["prjcode"].ToString());
            sheet1.GetRow(0).GetCell(3).SetCellValue(dtbase.Rows[0]["prjname"].ToString());
            sheet1.GetRow(0).GetCell(6).SetCellValue(ToCash(Convert.ToDouble(dtbase.Rows[0]["selfmoney"].ToString())));
            sheet1.GetRow(0).GetCell(8).SetCellValue(ToCash(Convert.ToDouble(dtbase.Rows[0]["subsidizemoney"].ToString())));
            #endregion

            #region 项目经费详情
            string sql = string.Format(@"SELECT appdate,purpose,CurMoney,memo,balance
                                         FROM TP_Prj_Registration_Prices a 
                                         WHERE prjid = '{0}'  ",prjid);
            
            DataTable dt = new DataTable();
            dt = SqlDataAccess.SqlHelp.ExecuteDataTable(sql);
            int rowindex = 0;
           
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == 0)
                {
                    rowindex = 2;
                }
                else
                {
                    rowindex = 2 + i;
                }
                row = (HSSFRow)sheet1.CreateRow(rowindex);
                row.HeightInPoints = 19;
                for (int j = 0; j <= dt.Columns.Count; j++)
                {
                    cell = (HSSFCell)row.CreateCell(j);
                    if (j == 0)
                    {
                        cell.SetCellValue(i + 1);
                    }
                    else
                    {
                        if (!(dt.Columns[j - 1].ColumnName == "balance"))
                        {
                            cell.SetCellValue(dt.Rows[i][j - 1].ToString());
                        }
                        else
                        {
                            cell.SetCellValue(ToCash(Convert.ToDouble( dt.Rows[i][j - 1])));
                        }

                    }
                    cell.CellStyle = style;
                }
            }
            #endregion

            #region 合同经费情况
            

            string sqlContract = string.Format(@"SELECT contractname,entrustingparty,contractmeony,ContractID
                                                 FROM TP_Prj_Contract_Info
                                                 WHERE prjid = '{0}'",prjid);
            DataTable dtContract = new DataTable();
            dtContract = SqlDataAccess.SqlHelp.ExecuteDataTable(sqlContract);



            int rowindex2 = 2; //标题行数
            int spacerow = 2;//空白行数
            int maxrow = 0;//最大的行数
            int cellx = 6;//合并单元格的x坐标
            int contractcount = 0;
            //根据找到的合同数量创建table
            
                for (int t = 0; t < dtContract.Rows.Count; t++)
                {
                    string sqlContractPrices = string.Format(@"SELECT title,curmoney,datetxt=('日期'),appdate
                                                           FROM TP_Prj_Contract_Prices
                                                           WHERE ContractID = '{0}'", dtContract.Rows[t][3].ToString());
                    DataTable dtContractPrices = new DataTable();
                    dtContractPrices = SqlDataAccess.SqlHelp.ExecuteDataTable(sqlContractPrices);

                    //根据当前合同下的 (付款次数+标题栏占用行数+每个合同之间的间隔行数)*合同数 生成行
                    for (int o = 0; o < dtContractPrices.Rows.Count + rowindex2; o++)
                    {

                        if (maxrow < dtContractPrices.Rows.Count + rowindex2)
                        {
                            row = (HSSFRow)sheet2.CreateRow(maxrow);
                            maxrow++;
                            if (o < rowindex2)
                                row.HeightInPoints = 27;
                            else
                                row.HeightInPoints = 19;

                        }
                        //根据每个合同下的经费登记信息次数生成列(cell)
                        for (int k = 0; k < dtContractPrices.Columns.Count; k++)
                        {
                            cell = (HSSFCell)sheet2.GetRow(o).CreateCell(t * 6 + k);
                            if (o < 2)    //contract查询需要填一二行
                            {
                                if (o == 0)   //第一行
                                {
                                    if (k == 0)
                                    {
                                        cell.SetCellValue("合同" + (t + 1) + "：" + dtContract.Rows[t][0].ToString());
                                    }
                                    //k = dtContractPrices.Columns.Count;
                                    
                                }
                                if (o == 1) //第二行
                                {
                                    switch (k)
                                    {
                                        case 0:
                                            cell.SetCellValue("受托方  (乙方)");
                                            break;
                                        case 1:
                                            cell.SetCellValue(dtContract.Rows[t][1].ToString());
                                            break;
                                        case 2:
                                            cell.SetCellValue("合同金额(万元)");
                                            break;
                                        case 3:
                                            cell.SetCellValue(dtContract.Rows[t][2].ToString());
                                            break;
                                    }

                                }
                                cell.CellStyle = styleB;
                            }
                            else if (o < dtContractPrices.Rows.Count + rowindex2)//contractprices查询需要填第二行之后
                            {

                                cell.SetCellValue(dtContractPrices.Rows[o - 2][k].ToString());
                                cell.CellStyle = style;
                            }
                            else
                            {
                                //空白行不作处理
                            }
                        }

                    }
                    contractcount ++;
                    
                }


                
                
                for (int l = 0; l < contractcount; l++)
                {
                    cellx = l * 6;
                    //合并单元格
                    CellRangeAddress cellrangeaddress = new CellRangeAddress(0, 0, cellx, cellx + 3);
                    sheet2.AddMergedRegion(cellrangeaddress);
                    //设置列宽
                    sheet2.SetColumnWidth(cellx+1, 20 * 256);
                    sheet2.SetColumnWidth(cellx+3, 20 * 256);
                    ////设置合并单元格之后的样式
                    //cell = (HSSFCell)sheet2.GetRow(0).GetCell(l*4 + l);
                    //cell.CellStyle = styleB;
                }
           
            
            //sheet2.GetRow(0).GetCell(0).SetCellValue("外委合同1情况");
            //sheet2.GetRow(1).GetCell(0).SetCellValue("受托方(乙方)");
            //sheet2.GetRow(1).GetCell(2).SetCellValue("合同金额(万元)");



            #endregion


            sheet2.ForceFormulaRecalculation = true;
            sheet1.ForceFormulaRecalculation = true;
            string filename = "科研费用登记表(" + DateTime.Now + ").xls";
            //开始下载xls文件
            MemoryStream ms = new MemoryStream();
            hssfworkbook.Write(ms);
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
            Response.BinaryWrite(ms.ToArray());
            ms.Dispose();
            ms = null;
            Response.End();
        }


        public static string ToCash(double nums)
        {
            return string.Format("{0:C}", nums);
        }
    }
}
