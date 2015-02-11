using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aspose.Words;
using Aspose.Words.Saving;
using Aspose.Words.Tables;
using Aspose.Words.BuildingBlocks;
using System.Data;
using Hanstrong.BaseLibrary;


namespace Debug
{
    public partial class PrintReport : System.Web.UI.Page
    {
        private DataBaseProxy DBHelper;
        private string uploadfilepath = AppDomain.CurrentDomain.BaseDirectory + "uploadfile";

        protected void Page_Load(object sender, EventArgs e)
        {
            DBHelper = new DataBaseProxy();
            DataBaseProxy.BindDataBaseConfig();
            

            switch (Request["cmd"])
            {
                case "apply":
                    
                    break;
                case "Type3Apply":
                    Response.Write(Type3Apply() + "<-->");
                    break;
                case "Type3End":
                    Response.Write(Type3End() + "<-->");
                    break;
                case "Type3Acceptance":
                    Response.Write(Type3Acceptance() + "<-->");
                    break;
                default:
                    break;
            }
        }

        private string Type3Apply()
        {
            string result = "";
            string templatepath = uploadfilepath + "/TP_Template/PrjType3Apply.doc";
            Document doc = new Document(templatepath.Replace("/", "\\"));
            DocumentBuilder builder = new DocumentBuilder(doc);

            DataTable dt = DBHelper.GetDataTableBySql(string.Format("SELECT *,dbo.Clip(PrjUser,':',1) PrjUsers,dbo.Clip(AppDep,':',1) AppDeps,dbo.Clip(Participants,':',1) Participant,dbo.Clip(workplace,':',1) workplaces FROM dbo.TP_Prj_BaseInfo WHERE rowid = '{0}'", Request["rowid"]));
            if (dt == null || dt.Rows.Count <= 0) return "请选择一行记录。";
            try
            {
                string AppDep = dt.Rows[0]["AppDeps"].ToString(); //申报部门
                string PrjMajor = dt.Rows[0]["PrjMajor"].ToString(); //专业
                string PrjCode = dt.Rows[0]["PrjCode"].ToString(); //项目编号
                string PrjName = dt.Rows[0]["PrjName"].ToString(); //项目名称
                string PrjUser = dt.Rows[0]["PrjUsers"].ToString(); //项目负责人
                string Participants = dt.Rows[0]["Participant"].ToString(); //参加人员
                string SEDate = dt.Rows[0]["PrjStartDate"].ToString() + "至" + dt.Rows[0]["PrjEndDate"].ToString(); //起止日期
                string PrjContent = dt.Rows[0]["PrjContent"].ToString(); //项目内容
                string MajGroupIdea = dt.Rows[0]["MajGroupIdea"].ToString(); //专业组意见
                string BranchIdea = dt.Rows[0]["BranchIdea"].ToString(); //分公司意见
                string ChargeIdea = dt.Rows[0]["ChargeIdea"].ToString(); //分管总工意见

                builder.MoveToBookmark("AppDep");
                builder.Write(AppDep);
                builder.MoveToBookmark("PrjMajor");
                builder.Write(PrjMajor);
                builder.MoveToBookmark("PrjCode");
                builder.Write(PrjCode);
                builder.MoveToBookmark("PrjName");
                builder.Write(PrjName);
                builder.MoveToBookmark("PrjUser");
                builder.Write(PrjUser);
                builder.MoveToBookmark("Participants");
                builder.Write(Participants);
                builder.MoveToBookmark("SEDate");
                builder.Write(SEDate);
                builder.MoveToBookmark("PrjContent");
                builder.Write(PrjContent);
                builder.MoveToBookmark("MajGroupIdea");
                builder.Write(MajGroupIdea);
                builder.MoveToBookmark("BranchIdea");
                builder.Write(BranchIdea);
                builder.MoveToBookmark("ChargeIdea");
                builder.Write(ChargeIdea);

                //保存
                string systembuilderpath = "TP" + "/" + Request["rowid"];
                string systemfilename = "TP_" + Request["rowid"] + ".doc";
                Directory.CreateDirectory((uploadfilepath + "/" + systembuilderpath).Replace("/", "\\"));
                string reportfilepath = uploadfilepath + "/" + systembuilderpath + "/" + systemfilename;
                doc.Save(reportfilepath.Replace("/", "\\"));
                result = DBHelper.ExecuteSql(string.Format("UPDATE dbo.TP_Prj_BaseInfo SET ReportFilePath = '{1}' WHERE rowid = '{0}'", Request["rowid"], systembuilderpath + "/" + systemfilename));
            }
            catch (Exception ex)
            {
                return "读取报表文件失败，原因：" + ex.Message;
            }

            return result;

        }

        private string Type3End()
        {
            string result = "";
            string templatepath = uploadfilepath + "/TP_Template/PrjType3End.doc";
            Document doc = new Document(templatepath.Replace("/", "\\"));
            DocumentBuilder builder = new DocumentBuilder(doc);

            DataTable dt = DBHelper.GetDataTableBySql(string.Format("SELECT * FROM dbo.TP_Prj_Termination WHERE rowid = '{0}'", Request["rowid"]));

            if (dt == null || dt.Rows.Count <= 0) return "请选择一行记录。";

            try
            {
                string PrjName = dt.Rows[0]["PrjName"].ToString();
                string PrjCode = dt.Rows[0]["PrjCode"].ToString();
                string ResearchResults = dt.Rows[0]["ResearchResults"].ToString();
                string Reason = dt.Rows[0]["Reason"].ToString();
                string BranchIdea = dt.Rows[0]["BranchIdea"].ToString();
                string ComLeaderIdea = dt.Rows[0]["ComLeaderIdea"].ToString();
                string QSHELeaderIdea = dt.Rows[0]["QSHELeaderIdea"].ToString();
                string ChargeIdea = dt.Rows[0]["ChargeIdea"].ToString();

                builder.MoveToBookmark("PrjName");
                builder.Write(PrjName);
                builder.MoveToBookmark("PrjCode");
                builder.Write(PrjCode);
                builder.MoveToBookmark("ResearchResults");
                builder.Write(ResearchResults);
                builder.MoveToBookmark("Reason");
                builder.Write(Reason);
                builder.MoveToBookmark("BranchIdea");
                builder.Write(BranchIdea);
                builder.MoveToBookmark("ComLeaderIdea");
                builder.Write(ComLeaderIdea);
                builder.MoveToBookmark("QSHELeaderIdea");
                builder.Write(QSHELeaderIdea);
                builder.MoveToBookmark("ChargeIdea");
                builder.Write(ChargeIdea);

                //保存
                string systembuilderpath = "TP" + "/" + Request["rowid"];
                string systemfilename = "TP_" + Request["rowid"] + ".doc";
                Directory.CreateDirectory((uploadfilepath + "/" + systembuilderpath).Replace("/", "\\"));
                string reportfilepath = uploadfilepath + "/" + systembuilderpath + "/" + systemfilename;
                doc.Save(reportfilepath.Replace("/", "\\"));
                result = DBHelper.ExecuteSql(string.Format("UPDATE dbo.TP_Prj_Termination SET ReportFilePath = '{1}' WHERE rowid = '{0}'", Request["rowid"], systembuilderpath + "/" + systemfilename));
            }
            catch (Exception ex)
            {
                return "读取报表文件失败，原因：" + ex.Message;
            }
            return result;
        }

        private string Type3Acceptance()
        {
            string result = "";
            string templatepath = uploadfilepath + "/TP_Template/PrjType3Acceptance.doc";
            Document doc = new Document(templatepath.Replace("/", "\\"));
            DocumentBuilder builder = new DocumentBuilder(doc);

            DataTable dt = DBHelper.GetDataTableBySql(string.Format("SELECT * FROM dbo.TP_Prj_results_acceptance WHERE rowid = '{0}'", Request["rowid"]));

            if (dt == null || dt.Rows.Count <= 0) return "请选择一行记录。";

            try
            {
                string AppDep = dt.Rows[0]["AppDep"].ToString();
                string PrjName = dt.Rows[0]["PrjName"].ToString();
                string PrjCode = dt.Rows[0]["PrjCode"].ToString();
                string PrjUser = dt.Rows[0]["PrjUser"].ToString();
                string Participants = dt.Rows[0]["Participants"].ToString();
                string SEDate = dt.Rows[0]["PrjStartDate"].ToString() + "至" + dt.Rows[0]["PrjEndDate"].ToString();
                string Content = dt.Rows[0]["Content"].ToString();
                string MajGroupIdea = dt.Rows[0]["MajGroupIdea"].ToString();
                string ChargeIdea = dt.Rows[0]["ChargeIdea"].ToString();

                builder.MoveToBookmark("AppDep");
                builder.Write(AppDep);
                builder.MoveToBookmark("PrjName");
                builder.Write(PrjName);
                builder.MoveToBookmark("PrjCode");
                builder.Write(PrjCode);
                builder.MoveToBookmark("PrjUser");
                builder.Write(PrjUser);
                builder.MoveToBookmark("Participants");
                builder.Write(Participants);
                builder.MoveToBookmark("SEDate");
                builder.Write(SEDate);
                builder.MoveToBookmark("Content");
                builder.Write(Content);
                builder.MoveToBookmark("MajGroupIdea");
                builder.Write(MajGroupIdea);
                builder.MoveToBookmark("ChargeIdea");
                builder.Write(ChargeIdea);

                //保存
                string systembuilderpath = "TP" + "/" + Request["rowid"];
                string systemfilename = "TP_" + Request["rowid"] + ".doc";
                Directory.CreateDirectory((uploadfilepath + "/" + systembuilderpath).Replace("/", "\\"));
                string reportfilepath = uploadfilepath + "/" + systembuilderpath + "/" + systemfilename;
                doc.Save(reportfilepath.Replace("/", "\\"));
                result = DBHelper.ExecuteSql(string.Format("UPDATE dbo.TP_Prj_results_acceptance SET ReportFilePath = '{1}' WHERE rowid = '{0}'", Request["rowid"], systembuilderpath + "/" + systemfilename));
            }
            catch (Exception ex)
            {
                return "读取报表文件失败，原因：" + ex.Message;
            }
            return result;

        }

    }
}
