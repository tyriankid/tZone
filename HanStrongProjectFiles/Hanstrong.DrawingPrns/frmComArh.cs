using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Text;
using System.Windows.Forms;
using Hanstrong.Decrypts;
using ICSharpCode.SharpZipLib.Zip;

namespace Hanstrong.DrawingPrns
{
    public partial class frmComArh : Form
    {
        WebServiceWrapper webProxy = new WebServiceWrapper();
        frmDecryptsTipMsg transferTip = null;
        private string temppath = Path.GetTempPath();
        private string rowIds = "";
        private string userName = "";
        private string vTpid = "";

        public frmComArh()
        {
            InitializeComponent();
        }

        public frmComArh(string rowids, string username, string vtpid)
        {
            InitializeComponent();
            rowIds = rowids;
            userName = username;
            vTpid = vtpid;
        }

        private void frmComArh_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(rowIds))
            {
                lstResult.Items.Add("传入的参数不正确，请关闭程序重新归档。");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            button1.Enabled = false;
            BuildersVol();
        }

        private void BuildersVol()
        {
            string[] rowidlist = rowIds.Split(';');
            for (int i = 0; i < rowidlist.Length; i++)
            {
                string rowid = rowidlist[i].Split(',')[0];
                string isoid = rowidlist[i].Split(',')[1];
                string volid = rowidlist[i].Split(',')[2];
                string str = BuilderVolInfo(rowid);

                if (str == "")
                {
                    lstResult.Items.Add(volid + "[" + isoid + "]归档成功。");
                    string[] sqllist = new string[2];
                    sqllist[0] = string.Format("update Arh_Audting_Auto SET arhstate = 3 WHERE rowid = '{0}'", rowid);
                    sqllist[1] = string.Format("update DNG_VOLFILE_HISTORY set isarch=5 WHERE DwgID IN (SELECT dwgid FROM Arh_Audting_Auto_Detail WHERE isabout = 0 AND autoID ='{0}')", rowid);
                    webProxy.ExecuteSqlTrans(sqllist);
                }
                else
                {
                    lstResult.Items.Add(volid + "[" + isoid + "]归档失败，原因：" + str);
                }
            }
        }

        /// <summary>
        /// 协同平台卷册归档
        /// </summary>
        /// <returns></returns>
        private string BuilderVolInfo(string pubrowid)
        {
            string result = "";

            //Hanstrong.FtpProxy.FtpControl ftp = new Hanstrong.FtpProxy.FtpControl();
            //ftp.ResetFtpConn(arhftp.Split(',')[0], arhftp.Split(',')[2], arhftp.Split(',')[3], Convert.ToInt32(arhftp.Split(',')[1]));

            //获得对应卷册信息
            string strsql = string.Format("SELECT * FROM Arh_Audting_Auto WHERE rowid = '{0}'", pubrowid);
            DataTable dtvol = webProxy.GetDataTableBySql(strsql);
            if (dtvol == null || dtvol.Rows.Count <= 0)
            {
                return "没有要归档的卷册。";
            }

            string volid = dtvol.Rows[0]["volid"].ToString();             //卷册编号
            string volname = dtvol.Rows[0]["volname"].ToString();         //卷册名称
            string voluser = dtvol.Rows[0]["voluser"].ToString();         //卷册负责人
            string prjid = dtvol.Rows[0]["prjid"].ToString();             //工程编号
            string prjname = dtvol.Rows[0]["prjname"].ToString();         //工程名称
            string majcode = dtvol.Rows[0]["majcode"].ToString();         //专业代字
            string ftpzippath = dtvol.Rows[0]["ftppath"].ToString().Replace("/", "\\");      //压缩包路径
            string zipname = dtvol.Rows[0]["zipname"].ToString();         //压缩包文件名称
            string ziplocalpath = temppath + zipname;
            string arhtype = dtvol.Rows[0]["arhtype"].ToString();         //档案类别

            //下载压缩包
            FtpInfo ftpInfo = GetUploadFilesFtpInfo();
            string strXml = "<items><item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
            strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + ziplocalpath + "\" remoteFile=\"" + ftpzippath + "\"/>";
            strXml += "</items>";

            string strresult = TrasferFile(strXml);
            //string strresult = ftp.DownloadFile(ftpzippath, ziplocalpath);
            if (strresult != "")
            {
                lstResult.Items.Add(zipname + "下载失败，原因：" + strresult);
                return "下载失败，原因：" + strresult;
            }

            if (arhtype == "kby")
            {
                if (volid.Substring(0, 1).ToUpper() == "Y" || volid.Substring(0, 1).ToUpper() == "K")
                {
                    volid = "42-" + volid;
                }
            }

            strsql = string.Format("SELECT * FROM dbo.Arh_Vol_{1}_{2} WHERE volid = '{0}'", volid, arhtype, vTpid);
            DataTable dtarhvol = webProxy.GetDataTableBySql(strsql);
            if (dtarhvol == null || dtarhvol.Rows.Count <= 0)
            {
                
                string mlcsr = "";
                string volrowid = webProxy.GetDataTableBySql("EXEC __$$GenerateNo '案卷编号'").Rows[0][0].ToString();

                #region 对应卷册信息不存在
                if (arhtype == "prj") //工程档案
                {
                    strsql = string.Format("SELECT d.rowid+'/'+c.rowid+'/'+a.rowid+'/'+b.rowid mlcsr,d.mltitle,a.prjbh,a.prjtitle,a.mltitle sjjd,b.mltitle zy FROM dbo.Arh_MLXQ_prj_sjjd a,dbo.Arh_MLXQ_prj_maj b,dbo.Arh_MLXQ_prj_xmxx c, dbo.Arh_MLXQ_prj_xmlb d WHERE a.rowid = b.pmlbh AND a.pmlbh = c.rowid AND c.pmlbh = d.rowid AND a.prjbh = '{0}' AND b.mlbh = '{1}'", prjid, majcode);
                    DataTable dtarhxmxx = webProxy.GetDataTableBySql(strsql);
                    if (dtarhxmxx == null || dtarhxmxx.Rows.Count <= 0)
                    {
                        lstResult.Items.Add(volid + "目录结构不存在，无法归档。");
                        return "目录结构不存在，无法归档。";
                    }
                    mlcsr = dtarhxmxx.Rows[0]["mlcsr"].ToString();
                    string xmlb = dtarhxmxx.Rows[0]["mltitle"].ToString();
                    string xmbh = dtarhxmxx.Rows[0]["prjbh"].ToString();
                    string xmmc = dtarhxmxx.Rows[0]["prjtitle"].ToString();
                    string sjjd = dtarhxmxx.Rows[0]["sjjd"].ToString();
                    string zy = dtarhxmxx.Rows[0]["zy"].ToString();

                    string sql = string.Format(@"INSERT INTO Arh_Vol_{11}_{12}(rowid,volid,voltitle,crtuser,holdlife,dense,mlcsr,unit,dnguser,mltitle,prjbh,prjtitle,sjjd,zhuany)VALUES('{0}','{1}','{2}','{3}',10,4,'{4}','湖北省电力勘测设计院','{5}','{6}','{7}','{8}','{9}','{10}')", volrowid, volid, volname, userName, mlcsr, voluser, xmlb, xmbh, xmmc, sjjd, zy, arhtype, vTpid);
                    strresult = webProxy.ExecuteSql(sql);
                }
                else //科标业档案
                {
                    strsql = string.Format("SELECT a.*,b.mltitle xmlb FROM dbo.Arh_MLXQ_{1}_xmxx a,dbo.Arh_MLXQ_{1}_xmlb b WHERE a.pmlbh = b.rowid AND a.mlbh = '{0}'", prjid, arhtype);
                    DataTable dtarhxmxx = webProxy.GetDataTableBySql(strsql);
                    if (dtarhxmxx == null || dtarhxmxx.Rows.Count <= 0)
                    {
                        lstResult.Items.Add(volid + "目录结构不存在，无法归档。");
                        return "目录结构不存在，无法归档。";
                    }
                    mlcsr = dtarhxmxx.Rows[0]["pmlbh"].ToString() + "/" + dtarhxmxx.Rows[0]["rowid"].ToString();
                    string xmlb = dtarhxmxx.Rows[0]["xmlb"].ToString();
                    string xmbh = dtarhxmxx.Rows[0]["mlbh"].ToString();
                    string xmmc = dtarhxmxx.Rows[0]["mltitle"].ToString();
                    string zy = dtarhxmxx.Rows[0]["zy"].ToString();

                    string sql = string.Format(@"INSERT INTO Arh_Vol_{9}_{10}(rowid,volid, voltitle,holdlife,dense,mlcsr,bzunit,sjry,xmlb,xmbh,xmmc,zy)VALUES('{0}','{1}','{2}',10,4,'{3}','湖北省电力勘测设计院','{4}','{5}','{6}','{7}','{8}')", volrowid, volid, volname, mlcsr, voluser, xmlb, xmbh, xmmc, zy, arhtype, vTpid);
                    strresult = webProxy.ExecuteSql(sql);
                }

                //获得平台归档文件信息
                strsql = string.Format("SELECT * FROM dbo.Arh_Audting_Auto_Detail WHERE autoID = '{0}' ORDER BY isabout", pubrowid);
                DataTable dtfile = webProxy.GetDataTableBySql(strsql);
                if (dtfile == null || dtfile.Rows.Count <= 0)
                {
                    lstResult.Items.Add(volid + "下的归档文件不存在，无法归档。");
                    return "归档文件不存在，无法归档。";
                }
                foreach (DataRow dr in dtfile.Rows)
                {
                    string dwgid = dr["dwgid"].ToString();          //图号
                    string filename = dr["filename"].ToString();    //压缩文件名称
                    string dwguser = dr["dwguser"].ToString();      //设计人员
                    string isabout = dr["isabout"].ToString();      //是否附件
                    string dwgname = dr["dwgname"].ToString();      //图名
                    string filesize = dr["filesize"].ToString();    //文件大小

                    string localfilepath = "";    //解压后本地文件路径
                    string remotefilepath = "";   //档案ftp文件路径

                    List<string> sbsql = new List<string>();  //存储SQL语句

                    if (isabout == "0")//是图纸或报告
                    {
                        #region 图纸
                        //获得档案库文件信息
                        strsql = string.Format("SELECT * FROM dbo.Arh_File_{1} WHERE fileid = '{0}'", dwgid, arhtype);
                        DataTable dtarhfile = webProxy.GetDataTableBySql(strsql);
                        if (dtarhfile == null || dtarhfile.Rows.Count <= 0) //对应文件表中的信息不存在
                        {
                            //创建文件信息及其附件信息
                            string filerowid = DateTime.Now.Ticks.ToString();
                            remotefilepath += mlcsr + "/" + volrowid + "/" + filerowid;
                            //文件信息
                            string sql = string.Format(@"INSERT INTO Arh_File_{0}(rowid,fileid,filetitle,dutyuser,pagecount,chkdate,chkuser,arhdate,arhuser,quotfid,state,arhunit,volcode) VALUES ('{1}','{2}','{3}','{4}',1,dbo.GetTime(1),'{5}',dbo.GetTime(1),'{5}','',1,'湖北省电力勘测设计院','{6}')", arhtype, filerowid, dwgid, dwgname, dwguser, userName, volrowid);
                            if (!SqlIsExist(sbsql, sql)) sbsql.Add(sql);
                            //附件信息
                            sql = string.Format(@"INSERT INTO Arh_Fileobj_{0}(filetitle,filesize,extname,storepath,fileid) VALUES ('{1}','{2}','{3}','{4}','{5}')", arhtype, filename, filesize, Path.GetExtension(filename).Substring(1), remotefilepath, filerowid);
                            if (!SqlIsExist(sbsql, sql)) sbsql.Add(sql);

                            remotefilepath += "/" + filename;
                        }
                        else //对应文件表中的信息存在
                        {
                            string filerowid = dtarhfile.Rows[0]["rowid"].ToString();
                            remotefilepath += mlcsr + "/" + volrowid + "/" + filerowid;

                            sbsql.Add(string.Format(@"update Arh_File_{0} set state = 1 where rowid = '{1}'", arhtype, filerowid));
                            if (filename.Contains(".sign.") && Path.GetExtension(filename).ToLower() == ".plt")
                            {
                                strsql = string.Format("SELECT * FROM dbo.Arh_Fileobj_{1} WHERE fileid = '{0}' AND filetitle = '{2}' UNION ALL SELECT * FROM dbo.Arh_Fileobj_{1} WHERE fileid = '{0}' AND filetitle = '{3}'", filerowid, arhtype, filename, filename.Replace(".sign", ""));
                            }
                            else
                            {
                                strsql = string.Format("SELECT * FROM dbo.Arh_Fileobj_{1} WHERE fileid = '{0}' AND filetitle = '{2}'", filerowid, arhtype, filename);
                            }
                            DataTable dtarhfileobj = webProxy.GetDataTableBySql(strsql);
                            if (dtarhfileobj == null || dtarhfileobj.Rows.Count <= 0) //对应附件表中的信息不存在
                            {
                                //附件信息
                                string sql = string.Format(@"INSERT INTO Arh_Fileobj_{0}(filetitle,filesize,extname,storepath,fileid) VALUES ('{1}','{2}','{3}','{4}','{5}')", arhtype, filename, filesize, Path.GetExtension(filename).Substring(1), remotefilepath, filerowid);
                                if (!SqlIsExist(sbsql, sql)) sbsql.Add(sql);

                                remotefilepath += "/" + filename;
                            }
                            else
                            {
                                remotefilepath = dtarhfileobj.Rows[0]["storepath"].ToString() + "/" + dtarhfileobj.Rows[0]["filetitle"].ToString();
                            }
                        }
                        #endregion
                    }
                    else //是图纸或报告的附件
                    {
                        #region 附件
                        //获得档案库文件信息
                        strsql = string.Format("SELECT * FROM dbo.Arh_File_{1} WHERE fileid = '{0}'", dwgid, arhtype);
                        DataTable dtarhfile = webProxy.GetDataTableBySql(strsql);
                        if (dtarhfile == null || dtarhfile.Rows.Count <= 0) //对应文件表中的信息不存在
                        {
                            /*//创建文件信息及其附件信息
                            string filerowid = DateTime.Now.ToString("u");
                            remotefilepath += mlcsr + "/" + filerowid;
                            //文件信息
                            sbsql.Append(string.Format(@"INSERT INTO Arh_File_{0}(rowid,fileid,filetitle,dutyuser,pagecount,chkdate,chkuser,arhdate,arhuser,quotfid,state,arhunit,volcode) VALUES ('{1}','{2}','{3}','{4}',1,dbo.GetTime(1),'{5}',dbo.GetTime(1),{5},'',1,'湖北省电力勘测设计院','{6}')", arhtype, filerowid, dwgid, dwgname, dwguser, Request["uname"], volrowid));
                            //附件信息
                            sbsql.Append(string.Format(@"INSERT INTO Arh_Fileobj_{0}(filetitle,filesize,extname,storepath,fileid) VALUES ('{1}','{2}','{3}','{4}','{5}')", arhtype, filename, filesize, Path.GetExtension(filename), remotefilepath, filerowid));

                            remotefilepath += "/" + filename;*/
                        }
                        else //对应文件表中的信息存在
                        {
                            string filerowid = dtarhfile.Rows[0]["rowid"].ToString();
                            remotefilepath += mlcsr + "/" + volrowid + "/" + filerowid;
                            strsql = string.Format("SELECT * FROM dbo.Arh_Fileobj_{1} WHERE fileid = '{0}' AND filetitle = '{2}'", filerowid, arhtype, dwgname);
                            DataTable dtarhfileobj = webProxy.GetDataTableBySql(strsql);
                            if (dtarhfileobj == null || dtarhfileobj.Rows.Count <= 0) //对应附件表中的信息不存在
                            {
                                //附件信息
                                string sql = string.Format(@"INSERT INTO Arh_Fileobj_{0}(filetitle,filesize,extname,storepath,fileid) VALUES ('{1}','{2}','{3}','{4}','{5}')", arhtype, dwgname, filesize, Path.GetExtension(dwgname).Substring(1), remotefilepath, filerowid);
                                if (!SqlIsExist(sbsql, sql)) sbsql.Add(sql);

                                remotefilepath += "/" + dwgname;
                            }
                            else
                            {
                                remotefilepath = dtarhfileobj.Rows[0]["storepath"].ToString() + "/" + dtarhfileobj.Rows[0]["filetitle"].ToString();
                            }
                        }
                        #endregion
                    }

                    localfilepath = UpZipFile(ziplocalpath, filename);

                    FtpInfo ftpInfo1 = GetUploadFilesArhFtpInfo();
                    strXml = "<items><item class=\"HOST\" hostip=\"" + ftpInfo1.IpAddress + "\" hostport=\"" + ftpInfo1.Port.ToString() + "\" loginname=\"" + ftpInfo1.LoginName + "\" loginpass=\"" + ftpInfo1.Password + "\"/>";
                    strXml += "<item class=\"FILE\" transfertype=\"upload\" localFile=\"" + localfilepath + "\" remoteFile=\"" + remotefilepath.Replace('/', '\\') + "\"/>";
                    strXml += "</items>";

                    strresult = TrasferFile(strXml);
                    //strresult = ftp.UpLoadFile(remotefilepath.Replace('/', '\\'), localfilepath);
                    if (strresult != "")
                    {
                        return "归档时上传文件失败，原因：" + strresult;
                    }
                    File.Delete(localfilepath);
                    if (sbsql.Count > 0)
                    {
                        strresult = webProxy.ExecuteSqlTrans(sbsql.ToArray());
                    }

                    result = strresult;
                }
                
                #endregion
            }
            else
            {
                #region 卷册信息已经存在
                string mlcsr = dtarhvol.Rows[0]["mlcsr"].ToString();  //目录结构路径
                string volrowid = dtarhvol.Rows[0]["rowid"].ToString();//卷册ID
                //获得平台归档文件信息
                strsql = string.Format("SELECT * FROM dbo.Arh_Audting_Auto_Detail WHERE autoID = '{0}' ORDER BY isabout", pubrowid);
                DataTable dtfile = webProxy.GetDataTableBySql(strsql);
                if (dtfile == null || dtfile.Rows.Count <= 0)
                {
                    return "归档文件不存在，无法归档。";
                }
                
                foreach (DataRow dr in dtfile.Rows)
                {
                    string dwgid = dr["dwgid"].ToString();          //图号
                    string filename = dr["filename"].ToString();    //压缩文件名称
                    string dwguser = dr["dwguser"].ToString();      //设计人员
                    string isabout = dr["isabout"].ToString();      //是否附件
                    string dwgname = dr["dwgname"].ToString();      //图名
                    string filesize = dr["filesize"].ToString();    //文件大小

                    string localfilepath = "";    //解压后本地文件路径
                    string remotefilepath = "";   //档案ftp文件路径

                    List<string> sbsql = new List<string>();  //存储SQL语句

                    if (isabout == "0")//是图纸或报告
                    {
                        #region 图纸
                        //获得档案库文件信息
                        strsql = string.Format("SELECT * FROM dbo.Arh_File_{1} WHERE fileid = '{0}'", dwgid, arhtype);
                        DataTable dtarhfile = webProxy.GetDataTableBySql(strsql);
                        if (dtarhfile == null || dtarhfile.Rows.Count <= 0) //对应文件表中的信息不存在
                        {
                            //创建文件信息及其附件信息
                            string filerowid = DateTime.Now.Ticks.ToString();
                            remotefilepath += mlcsr + "/" + volrowid + "/" + filerowid;
                            //文件信息
                            string sql = string.Format(@"INSERT INTO Arh_File_{0}(rowid,fileid,filetitle,dutyuser,pagecount,chkdate,chkuser,arhdate,arhuser,quotfid,state,arhunit,volcode) VALUES ('{1}','{2}','{3}','{4}',1,dbo.GetTime(1),'{5}',dbo.GetTime(1),'{5}','',1,'湖北省电力勘测设计院','{6}')", arhtype, filerowid, dwgid, dwgname, dwguser, userName, volrowid);
                            if (!SqlIsExist(sbsql, sql)) sbsql.Add(sql);
                            //附件信息
                            sql = string.Format(@"INSERT INTO Arh_Fileobj_{0}(filetitle,filesize,extname,storepath,fileid) VALUES ('{1}','{2}','{3}','{4}','{5}')", arhtype, filename, filesize, Path.GetExtension(filename).Substring(1), remotefilepath, filerowid);
                            if (!SqlIsExist(sbsql, sql)) sbsql.Add(sql);

                            remotefilepath += "/" + filename;
                        }
                        else //对应文件表中的信息存在
                        {
                            string filerowid = dtarhfile.Rows[0]["rowid"].ToString();
                            remotefilepath += mlcsr + "/" + volrowid + "/" + filerowid;

                            sbsql.Add(string.Format(@"update Arh_File_{0} set state = 1 where rowid = '{1}'", arhtype, filerowid));
                            if (filename.Contains(".sign.") && Path.GetExtension(filename).ToLower() == ".plt")
                            {
                                strsql = string.Format("SELECT * FROM dbo.Arh_Fileobj_{1} WHERE fileid = '{0}' AND filetitle = '{2}' UNION ALL SELECT * FROM dbo.Arh_Fileobj_{1} WHERE fileid = '{0}' AND filetitle = '{3}'", filerowid, arhtype, filename, filename.Replace(".sign", ""));
                            }
                            else
                            {
                                strsql = string.Format("SELECT * FROM dbo.Arh_Fileobj_{1} WHERE fileid = '{0}' AND filetitle = '{2}'", filerowid, arhtype, filename);
                            }
                            DataTable dtarhfileobj = webProxy.GetDataTableBySql(strsql);
                            if (dtarhfileobj == null || dtarhfileobj.Rows.Count <= 0) //对应附件表中的信息不存在
                            {
                                //附件信息
                                string sql = string.Format(@"INSERT INTO Arh_Fileobj_{0}(filetitle,filesize,extname,storepath,fileid) VALUES ('{1}','{2}','{3}','{4}','{5}')", arhtype, filename, filesize, Path.GetExtension(filename).Substring(1), remotefilepath, filerowid);
                                if (!SqlIsExist(sbsql, sql)) sbsql.Add(sql);

                                remotefilepath += "/" + filename;
                            }
                            else
                            {
                                remotefilepath = dtarhfileobj.Rows[0]["storepath"].ToString() + "/" + dtarhfileobj.Rows[0]["filetitle"].ToString();
                            }
                        }
                        #endregion
                    }
                    else //是图纸或报告的附件
                    {
                        #region 附件
                        //获得档案库文件信息
                        strsql = string.Format("SELECT * FROM dbo.Arh_File_{1} WHERE fileid = '{0}'", dwgid, arhtype);
                        DataTable dtarhfile = webProxy.GetDataTableBySql(strsql);
                        if (dtarhfile == null || dtarhfile.Rows.Count <= 0) //对应文件表中的信息不存在
                        {
                            /*//创建文件信息及其附件信息
                            string filerowid = DateTime.Now.ToString("u");
                            remotefilepath += mlcsr + "/" + filerowid;
                            //文件信息
                            sbsql.Append(string.Format(@"INSERT INTO Arh_File_{0}(rowid,fileid,filetitle,dutyuser,pagecount,chkdate,chkuser,arhdate,arhuser,quotfid,state,arhunit,volcode) VALUES ('{1}','{2}','{3}','{4}',1,dbo.GetTime(1),'{5}',dbo.GetTime(1),{5},'',1,'湖北省电力勘测设计院','{6}')", arhtype, filerowid, dwgid, dwgname, dwguser, Request["uname"], volrowid));
                            //附件信息
                            sbsql.Append(string.Format(@"INSERT INTO Arh_Fileobj_{0}(filetitle,filesize,extname,storepath,fileid) VALUES ('{1}','{2}','{3}','{4}','{5}')", arhtype, filename, filesize, Path.GetExtension(filename), remotefilepath, filerowid));

                            remotefilepath += "/" + filename;*/
                        }
                        else //对应文件表中的信息存在
                        {
                            string filerowid = dtarhfile.Rows[0]["rowid"].ToString();
                            remotefilepath += mlcsr + "/" + volrowid + "/" + filerowid;
                            strsql = string.Format("SELECT * FROM dbo.Arh_Fileobj_{1} WHERE fileid = '{0}' AND filetitle = '{2}'", filerowid, arhtype, dwgname);
                            DataTable dtarhfileobj = webProxy.GetDataTableBySql(strsql);
                            if (dtarhfileobj == null || dtarhfileobj.Rows.Count <= 0) //对应附件表中的信息不存在
                            {
                                //附件信息
                                string sql = string.Format(@"INSERT INTO Arh_Fileobj_{0}(filetitle,filesize,extname,storepath,fileid) VALUES ('{1}','{2}','{3}','{4}','{5}')", arhtype, dwgname, filesize, Path.GetExtension(filename).Substring(1), remotefilepath, filerowid);
                                if (!SqlIsExist(sbsql, sql)) sbsql.Add(sql);

                                remotefilepath += "/" + dwgname;
                            }
                            else
                            {
                                remotefilepath = dtarhfileobj.Rows[0]["storepath"].ToString() + "/" + dtarhfileobj.Rows[0]["filetitle"].ToString();
                            }
                        }
                        #endregion
                    }

                    localfilepath = UpZipFile(ziplocalpath, filename);

                    FtpInfo ftpInfo2 = GetUploadFilesArhFtpInfo();
                    strXml = "<items><item class=\"HOST\" hostip=\"" + ftpInfo2.IpAddress + "\" hostport=\"" + ftpInfo2.Port.ToString() + "\" loginname=\"" + ftpInfo2.LoginName + "\" loginpass=\"" + ftpInfo2.Password + "\"/>";
                    strXml += "<item class=\"FILE\" transfertype=\"upload\" localFile=\"" + localfilepath + "\" remoteFile=\"" + remotefilepath.Replace('/', '\\') + "\"/>";
                    strXml += "</items>";

                    strresult = TrasferFile(strXml);
                    //strresult = ftp.UpLoadFile(remotefilepath.Replace('/', '\\'), localfilepath);
                    if (strresult != "")
                    {
                        return "归档时上传文件失败，原因：" + strresult;
                    }
                    File.Delete(localfilepath);
                    if (sbsql.Count > 0)
                    {
                        strresult = webProxy.ExecuteSqlTrans(sbsql.ToArray());
                    }

                    result = strresult;
                }
                
                #endregion
            }

            //删除下载压缩包
            File.Delete(ziplocalpath);

            return result;
        }

        private bool SqlIsExist(List<string> sqllist, string comparestr)
        {
            bool result = false;
            if (sqllist.Count > 0)
            {
                foreach (string item in sqllist)
                {
                    if (item == comparestr)
                    {
                        result = true;
                        break;
                    }
                }
            }
            return result;
        }

        private string UpZipFile(string ziplocalpath, string filename)
        {
            string result = "";
            if (!File.Exists(ziplocalpath))
            {
                return result;
            }

            try
            {
                using (ZipInputStream s = new ZipInputStream(File.OpenRead(ziplocalpath)))
                {
                    ZipEntry theEntry;
                    while ((theEntry = s.GetNextEntry()) != null)
                    {
                        string localfilename = temppath + theEntry.Name;
                        string fileName = Path.GetFileName(theEntry.Name);
                        if (fileName == filename)
                        {
                            //解压文件到本地
                            using (FileStream streamWriter = File.Create(localfilename))
                            {
                                lbFileName.Text = filename + "文件正在解压";
                                pbFile.Maximum = (int)theEntry.Size;
                                long totalDownloadedByte = 0;
                                byte[] data = new byte[2048];
                                int size = s.Read(data, 0, data.Length);

                                while (size > 0)
                                {
                                    totalDownloadedByte = size + totalDownloadedByte;
                                    Application.DoEvents();
                                    streamWriter.Write(data, 0, size);

                                    pbFile.Value = (int)totalDownloadedByte;
                                    size = s.Read(data, 0, data.Length);
                                }
                                lbFileName.Text = filename + "文件解压完成";
                            }
                            result = localfilename;
                            break;
                        }
                    }
                }
                return result;
            }
            catch (Exception ex)
            {
                lbFileName.Text = filename + "文件解压失败，原因：" + ex.Message;
                return "";
            }
        }

        private string TrasferFile(string strXml)
        {
            try
            {
                FileTransferDialog fdlg = new FileTransferDialog();
                fdlg.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                fdlg.LoadTransferTaskXml(strXml);
                fdlg.ShowDialog();
                //if (fdlg.ShowDialog() == DialogResult.Cancel)
                //{
                //    if (strXml != "")
                //    {
                //        FileTransferDialog fdlg1 = new FileTransferDialog();
                //        fdlg1.OnTransferResult = new FileTransferResultHandle(SetTransferResult);
                //        fdlg1.LoadTransferTaskXml(strXml);
                //        if (fdlg1.ShowDialog() == DialogResult.Cancel)
                //        {
                //            //Environment.Exit(Environment.ExitCode);
                //            return "传输取消！";
                //        }
                //    }
                //    //Environment.Exit(Environment.ExitCode);
                //    return "传输取消！";
                //}
                if (transferTip == null) transferTip = new frmDecryptsTipMsg();
                while (transferTip.Visible) { Application.DoEvents(); }//*/
                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        private void SetTransferResult(string remoteFile, string localFile, string result, string transferType)
        {
            if (result != "")
            {
                if (transferTip == null) transferTip = new frmDecryptsTipMsg();
                transferTip.AddItem(Path.GetFileName(localFile) + " 传输失败，原因：" + result);
                if (!transferTip.Visible) transferTip.Show();
                return;
            }
            //if (transferType == "upload")
            //{
            //    string strSql = "insert into dng_uploadfiles(filename,filesize,uploaduser,filepath,objid)";
            //    strSql += string.Format(" values ('{0}','{1}','{2}','{3}','{4}')",
            //        Path.GetFileName(localFile), ByteFormatter.ToString(new FileInfo(localFile).Length), this.Params["uid"], remoteFile, this.Params["objid"]);
            //    string strRtn = webProxy.ExecuteSql(strSql);
            //}
        }

        private string ConvertString(string str)
        {
            return str.Replace("/", "／").Replace("－", "-").Replace("'", "′");
        }

        private FtpInfo GetUploadFilesArhFtpInfo()
        {
            try
            {
                FtpInfo ftp;
                string host, port, loginName, loginPass;
                string arhFtp = ConfigurationManager.AppSettings["arhFtp"];
                host = arhFtp.Split(',')[0];
                port = arhFtp.Split(',')[1];
                loginName = arhFtp.Split(',')[2];
                loginPass = arhFtp.Split(',')[3];
                ftp = new FtpInfo(host, host, loginName, loginPass, int.Parse(port));
                return ftp;
            }
            catch { return null; }

        }

        private FtpInfo GetUploadFilesFtpInfo()
        {
            string sqlCmd;
            string host, loginName, loginPass;
            string[] arrFtp;
            int port = 21;
            DataSet ds;
            FtpInfo ftp;

            try
            {
                sqlCmd = "SELECT dbo.getTime(2) as crttime,dbo.getparams(varvalue,'host') as host,dbo.getparams(varvalue,'basedir') as basedir from DNG_SysVar WHERE VarName = 'dngpltuploadfileshost'";
                ds = webProxy.GetDataSetBySql(sqlCmd);
                if (ds == null || ds.Tables.Count == 0) return null;
                //10.229.137.21,21,htkj,htkj
                arrFtp = ds.Tables[0].Rows[0]["host"].ToString().Split(',');
                host = arrFtp[0];
                int.TryParse(arrFtp[1], out port);
                loginName = arrFtp[2];
                loginPass = arrFtp[3];

                ftp = new FtpInfo(host, host, loginName, loginPass, port);
                ftp.Attribs.Add("basedir", ds.Tables[0].Rows[0]["basedir"].ToString());
                ftp.Attribs.Add("crttime", ds.Tables[0].Rows[0]["crttime"].ToString().Replace(":", "_"));
                return ftp;
            }
            catch
            {
                return null;
            }
        }

        

        
    }
}
