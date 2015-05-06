using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using ICSharpCode.SharpZipLib.Checksums;
using ICSharpCode.SharpZipLib.Zip;
using ICSharpCode.SharpZipLib.GZip;
using Hanstrong.Decrypts;
using System.Configuration;

namespace Hanstrong.DrawingPrns
{
    public partial class frmHBuilderZip : Form
    {
        WebServiceWrapper webProxy = new WebServiceWrapper();
        frmDecryptsTipMsg transferTip = null;
        private string uploadfilepath = ConfigurationManager.AppSettings["webAddress"];
        private string arhType = "42-";
        private string temppath = Path.GetTempPath();
        private string dwgIds = "";
        private string pubId = "";

        public frmHBuilderZip()
        {
            InitializeComponent();
        }

        public frmHBuilderZip(string dwgids, string pubid)
        {
            InitializeComponent();
            dwgIds = dwgids;
            pubId = pubid;
        }

        private void frmBuilderZip_Load(object sender, EventArgs e)
        {
            //if (string.IsNullOrEmpty(pubId))
            //{
            //    lstResult.Items.Add("出版单ID为空，不能生成压缩包。请关闭后重新执行程序！");
            //    return;
            //}
            

        }

        private void BuilderZip()
        {
            //获得分组后的卷册编号
            string strsql = string.Format("SELECT DISTINCT d.isoid,c.prjID,e.volid,c.prjName,e.volname,e.voluser,f.majCode,e.volrowid FROM prj_fdwgpub a INNER JOIN prj_dwg_pub d ON a.pubid = d.rowid LEFT JOIN DNG_Vol_Drawings b ON a.dwgrowid = b.dwgRowid LEFT JOIN PRJ_BaseInfo c ON b.prjid = c.ROWID LEFT JOIN vPRJ_VolBaseInfo e ON a.volid = e.volrowid LEFT JOIN dict_prjmaj f ON d.majname = f.majName WHERE /*d.closekey = 2 AND AND CHARINDEX(a.dwgid, '') > 0*/ a.pubid = '{0}' ORDER BY e.volid", pubId);
            DataTable dtvol = webProxy.GetDataTableBySql(strsql);
            if (dtvol == null || dtvol.Rows.Count <= 0)
            {
                lstResult.Items.Add("没有要下载的图纸文件。");
                return;
            }
            //循环卷册
            foreach (DataRow drvol in dtvol.Rows)
            {
                //Hanstrong.FtpProxy.FtpControl ftphs = new Hanstrong.FtpProxy.FtpControl();
                //ftphs.ResetFtpConn(htftp.Split(',')[0], htftp.Split(',')[2], htftp.Split(',')[3], Convert.ToInt32(htftp.Split(',')[1]));
                //Hanstrong.FtpProxy.FtpControl ftp = new Hanstrong.FtpProxy.FtpControl();
                //ftp.ResetFtpConn(arhftp.Split(',')[0], arhftp.Split(',')[2], arhftp.Split(',')[3], Convert.ToInt32(arhftp.Split(',')[1]));

                string isoid = drvol["isoid"].ToString();  //出版编号
                string prjid = drvol["prjID"].ToString();  //工程编号
                string volid = drvol["volid"].ToString();  //卷册编号
                string volrowid = drvol["volrowid"].ToString();//卷册ID
                string prjname = drvol["prjName"].ToString();  //工程名称
                string volname = drvol["volname"].ToString();  //卷册名称
                string voluser = drvol["voluser"].ToString();  //卷册负责人
                string majcode = drvol["majcode"].ToString();  //专业代字

                List<string> sqllist = new List<string>();

                strsql = string.Format("SELECT * FROM Arh_Audting_Auto WHERE isoid = '{0}' and volid = '{1}'", isoid, volid);
                DataTable dtAudting = webProxy.GetDataTableBySql(strsql);
                string volguid = Guid.NewGuid().ToString("N");

                if (dtAudting != null && dtAudting.Rows.Count > 0)
                {
                    volguid = dtAudting.Rows[0]["rowid"].ToString();
                    sqllist.Add(string.Format("delete from Arh_Audting_Auto_Detail where autoID = '{0}'", volguid));
                }

                //获得所勾选的图纸
                strsql = string.Format("SELECT d.isoid,c.prjID,e.volid,a.dwgid,b.dwgRowid,f.dwgname,dbo.Clip(f.Operator, ':', 1) Operator,b.memo,b.filePath,b.dwgname pubdwgname,b.dwgid pubdwgid FROM prj_fdwgpub a,DNG_Vol_Drawings b,PRJ_BaseInfo c,prj_dwg_pub d,vPRJ_VolBaseInfo e,DNG_VOLSHEET f WHERE a.dwgrowid = b.dwgRowid AND b.prjid = c.ROWID AND a.pubid = d.rowid AND a.volid = e.volrowid AND b.dwgRowid = f.ID /*AND d.closekey = 2*/ AND a.pubid = '{0}' /*AND CHARINDEX(a.dwgid, '') > 0*/ AND e.volid = '{1}'", pubId, volid);
                DataTable dtdwg = webProxy.GetDataTableBySql(strsql);
                if (dtdwg == null || dtdwg.Rows.Count <= 0)
                {
                    lstResult.Items.Add(volid + "没有要下载的图纸文件。");
                    continue;
                }

                #region 1.下载文件并创建文本文件
                FtpInfo ftpInfo = GetUploadFilesFtpInfo();
                if (ftpInfo == null)
                {
                    lstResult.Items.Add("未能获得FTP的连接信息。");
                    return;
                }
                lstResult.Items.Add(string.Format("下载{0}下的图纸文件。", volid));

                string strXml = "<items><item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";

                //写入工程信息和卷册信息
                StringBuilder sb = new StringBuilder();
                sb.Append(string.Format("{0},{1}\r\n", prjid, prjname));
                sb.Append(string.Format("{0},{1},{2}\r\n", volid, volname, voluser));

                string arhtype = ConvertString(prjid).Substring(0, 3) == arhType ? "prj" : "kby";

                //创建临时文件夹
                string tempfolder = temppath + volid;
                if (!Directory.Exists(tempfolder))
                {
                    Directory.CreateDirectory(tempfolder);
                }

                //下载目录结构
                string structlocalpath = string.Format(@"{0}\{1}\{2}.xml", temppath, volid, volid);
                string structremotepath = string.Format(@"{0}\{1}\{2}.xml", arhtype, volid, volid);
                strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + structlocalpath + "\" remoteFile=\"" + structremotepath + "\"/>";
                strXml += "</items>";

                string strResult = TrasferFile(strXml);

                //循环图纸
                foreach (DataRow drdwg in dtdwg.Rows)
                {
                    string dwgid = ConvertString(drdwg["dwgid"].ToString());         //图纸编号
                    string dwgrowid = drdwg["dwgRowid"].ToString();                  //图纸ID
                    string dwgname = ConvertString(drdwg["dwgname"].ToString());     //图纸名称
                    string dwguser = drdwg["Operator"].ToString();                   //设计人员
                    string extname = drdwg["memo"].ToString();                       //图纸后缀名
                    string filepath = drdwg["filePath"].ToString();                  //协同平台出版文件路径
                    string pubdwgname = drdwg["pubdwgname"].ToString();              //协同平台出版文件名称
                    string pubdwgid = drdwg["pubdwgid"].ToString();                  //协同平台出版文件图号
                    string dwgabout = "";

                    string tempdwgremotepath = "";
                    string tempsigndwgremotepath = "";
                    string temppltremotepath = "";
                    string temppdfremotepath = "";

                    string tempdwglocalpath = "";
                    string tempsigndwglocalpath = "";
                    string temppltlocalpath = "";
                    string temppdflocalpath = "";

                    if (extname == "plt")
                    {
                        tempdwgremotepath = string.Format(@"{0}\{1}\{2}.dwg", arhtype, volid, dwgid);
                        tempsigndwgremotepath = string.Format(@"{0}\{1}\{2}.sign.dwg", arhtype, volid, dwgid);
                        temppltremotepath = string.Format(@"{0}\{1}\{2}.sign.plt", arhtype, volid, dwgid);
                        temppdfremotepath = string.Format(@"{0}\{1}\{2}.pdf", arhtype, volid, dwgid);

                        tempdwglocalpath = string.Format(@"{0}\{1}.dwg", tempfolder, dwgid);
                        tempsigndwglocalpath = string.Format(@"{0}\{1}.sign.dwg", tempfolder, dwgid);
                        temppltlocalpath = string.Format(@"{0}\{1}.sign.plt", tempfolder, dwgid);
                        temppdflocalpath = string.Format(@"{0}\{1}.pdf", tempfolder, dwgid);

                        //下载图纸
                        strXml = "<items><item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + tempdwglocalpath + "\" remoteFile=\"" + tempdwgremotepath + "\"/>";
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + tempsigndwglocalpath + "\" remoteFile=\"" + tempsigndwgremotepath + "\"/>";
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + temppltlocalpath + "\" remoteFile=\"" + temppltremotepath + "\"/>";
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + temppdflocalpath + "\" remoteFile=\"" + temppdfremotepath + "\"/>";
                        strXml += "</items>";

                        strResult = TrasferFile(strXml);

                        //写入SQL
                        if (File.Exists(tempdwglocalpath))
                        {
                            sqllist.Add(string.Format("INSERT INTO dbo.Arh_Audting_Auto_Detail(autoID,dwgid,dwgname,codeid,isabout,filename,volid,dwguser,filesize)VALUES ('{0}','{1}','{2}','{3}',0,'{4}','{5}','{6}','{7}')", volguid, dwgid, dwgname, dwgid, string.Format(@"{0}.dwg", dwgid), volid, dwguser, ByteFormatter.ToString(tempdwglocalpath)));
                        }
                        if (File.Exists(tempsigndwglocalpath))
                        {
                            sqllist.Add(string.Format("INSERT INTO dbo.Arh_Audting_Auto_Detail(autoID,dwgid,dwgname,codeid,isabout,filename,volid,dwguser,filesize)VALUES ('{0}','{1}','{2}','{3}',0,'{4}','{5}','{6}','{7}')", volguid, dwgid, dwgname, dwgid, string.Format(@"{0}.sign.dwg", dwgid), volid, dwguser, ByteFormatter.ToString(tempsigndwglocalpath)));
                        }
                        if (File.Exists(temppltlocalpath))
                        {
                            sqllist.Add(string.Format("INSERT INTO dbo.Arh_Audting_Auto_Detail(autoID,dwgid,dwgname,codeid,isabout,filename,volid,dwguser,filesize)VALUES ('{0}','{1}','{2}','{3}',0,'{4}','{5}','{6}','{7}')", volguid, dwgid, dwgname, dwgid, string.Format(@"{0}.sign.plt", dwgid), volid, dwguser, ByteFormatter.ToString(temppltlocalpath)));
                        }
                        if (File.Exists(temppdflocalpath))
                        {
                            sqllist.Add(string.Format("INSERT INTO dbo.Arh_Audting_Auto_Detail(autoID,dwgid,dwgname,codeid,isabout,filename,volid,dwguser,filesize)VALUES ('{0}','{1}','{2}','{3}',0,'{4}','{5}','{6}','{7}')", volguid, dwgid, dwgname, dwgid, string.Format(@"{0}.pdf", dwgid), volid, dwguser, ByteFormatter.ToString(temppdflocalpath)));
                        }
                    }
                    else
                    {
                        //string strtempname = pubdwgname == "" ? pubdwgid : pubdwgname;
                        tempdwgremotepath = string.Format(@"{0}\PUB\{1}.{2}", filepath.Replace("/", "\\"), pubdwgid, extname);
                        tempdwglocalpath = string.Format(@"{0}\{1}.{2}", tempfolder, pubdwgid, extname);
                        //下载图纸
                        strXml = "<items><item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
                        strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + tempdwglocalpath + "\" remoteFile=\"" + tempdwgremotepath + "\"/>";
                        strXml += "</items>";

                        strResult = TrasferFile(strXml);

                        //写入SQL
                        if (dtAudting == null || dtAudting.Rows.Count <= 0)
                        {
                            sqllist.Add(string.Format("INSERT INTO dbo.Arh_Audting_Auto_Detail(autoID,dwgid,dwgname,codeid,isabout,filename,volid,dwguser,filesize)VALUES ('{0}','{1}','{2}','{3}',0,'{4}','{5}','{6}','{7}')", volguid, dwgid, dwgname, dwgid, string.Format(@"{0}.{1}", dwgid, extname), volid, dwguser, ByteFormatter.ToString(tempdwglocalpath)));
                        }
                    }


                    //查找每个图纸下的附件信息
                    DataTable dtAbout = webProxy.GetDataTableBySql(string.Format("SELECT * FROM dbo.DNG_AboutFile WHERE SrcFileID = '{0}'", dwgrowid));
                    if (dtAbout != null && dtAbout.Rows.Count > 0)
                    {
                        string aboutlocalpath = tempdwglocalpath.Substring(0, tempdwglocalpath.LastIndexOf('\\') + 1);
                        foreach (DataRow drabout in dtAbout.Rows)
                        {
                            strXml = "<items><item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";

                            string tempaboutlocalpath = "";
                            string tempaboutremotepath = "";
                            if (extname == "plt")
                            {
                                tempaboutlocalpath = string.Format(@"{0}\{1}\{2}-F_{3}", temppath, volid, dwgid, drabout["AbtFileTitle"]);
                                tempaboutremotepath = string.Format(@"{0}\{1}\{2}-F_{3}", arhtype, volid, dwgid, drabout["AbtFileTitle"]);
                                dwgabout += "^" + string.Format(@"{0}-F_{1}", dwgid, drabout["AbtFileTitle"]);
                                strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + tempaboutlocalpath + "\" remoteFile=\"" + tempaboutremotepath + "\"/>";
                                strXml += "</items>";

                                strResult = TrasferFile(strXml);
                            }
                            else
                            {
                                tempaboutlocalpath = string.Format(@"{0}\{1}\{2}-F_{3}", temppath, volid, dwgid, drabout["AbtFileTitle"]);
                                tempaboutremotepath = drabout["AbtFilePath"].ToString();
                                dwgabout += "^" + string.Format(@"{0}-F_{1}", dwgid, drabout["AbtFileTitle"]);
                                strXml += "<item class=\"FILE\" transfertype=\"download\" localFile=\"" + tempaboutlocalpath + "\" remoteFile=\"" + tempaboutremotepath + "\"/>";
                                strXml += "</items>";

                                strResult = TrasferFile(strXml);
                            }

                            //写入SQL
                            if (dtAudting == null || dtAudting.Rows.Count <= 0)
                            {
                                sqllist.Add(string.Format("INSERT INTO dbo.Arh_Audting_Auto_Detail(autoID,dwgid,dwgname,codeid,isabout,filename,volid,filesize)VALUES ('{0}','{1}','{2}','{3}',1,'{4}','{5}','{6}')", volguid, dwgid, drabout["AbtFileTitle"], dwgid, string.Format(@"{0}-F_{1}", dwgid, drabout["AbtFileTitle"]), volid, ByteFormatter.ToString(tempaboutlocalpath)));
                            }
                        }
                    }

                    //获得页面上传的附件
                    DataTable dtPageAbout = webProxy.GetDataTableBySql(string.Format("SELECT * FROM Base_FileList WHERE objid= '{0}'", pubId));
                    if (dtPageAbout != null && dtPageAbout.Rows.Count > 0)
                    {
                        string aboutlocalpath = tempdwglocalpath.Substring(0, tempdwglocalpath.LastIndexOf('\\') + 1);
                        foreach (DataRow drpageabout in dtPageAbout.Rows)
                        {
                            string tempaboutlocalpath = string.Format(@"{0}\{1}\{2}", temppath, volid, drpageabout["filename"]);
                            string tempaboutremotepath = uploadfilepath + @"\" + drpageabout["filevpath"].ToString().Replace("/", "\\");
                            DownloadAttFile(tempaboutremotepath, tempaboutlocalpath, pbFile);
                        }
                    }
                    sb.Append(string.Format("{0},{1},{2},{3}\r\n", ConvertString(dwgid), dwgname, dwguser, dwgabout != "" ? dwgabout.Substring(1) : dwgabout));
                }
                //增加说明
                sb.Append(string.Format("\r\n\r\n{0}", @"//说明：
文本文件名称为卷册编号
第一行: 工程编号,工程名称
第二行: 卷册编号,卷册名称,立卷人
从第三行开始为卷册内的图纸信息
图号,图名,设计人员,相关附件（每个附件用^隔开，每个附件名称前面加上：图号-F以区分）"));
                //生成本地文本文件
                File.WriteAllText(string.Format(@"{0}\{1}.txt", tempfolder, volid), sb.ToString(), Encoding.Default);
                #endregion

                #region 2.压缩文件
                lstResult.Items.Add(volid + "正在压缩。");
                lbFileName.Text = volid + "正在压缩。";
                MemoryStream ms = new MemoryStream();
                ZipOutputStream zps = new ZipOutputStream(ms);
                int total = Directory.GetFiles(tempfolder).Length;
                pbFile.Maximum = total;
                pbFile.Value = 0;
                foreach (string filename in Directory.GetFiles(tempfolder))
                {
                    Application.DoEvents();
                    FileInfo fi = new FileInfo(filename);
                    FileStream fs = File.OpenRead(filename);
                    byte[] buffer = new byte[fs.Length];
                    fs.Read(buffer, 0, buffer.Length);
                    ZipEntry ozip = new ZipEntry(Path.GetFileName(filename));
                    zps.PutNextEntry(ozip);
                    zps.Write(buffer, 0, buffer.Length);
                    fs.Dispose();
                    fs = null;

                    if (pbFile != null)
                    {
                        pbFile.Value += 1;
                    }
                }
                zps.Finish();
                zps.Close();
                zps = null;
                //保存为本地压缩文件
                string zippath = string.Format(@"{0}\{1}_{2}.zip", tempfolder, isoid, volid);
                File.WriteAllBytes(zippath, ms.ToArray());
                lbFileName.Text = volid + "压缩完成。";
                #endregion

                #region 3.上传归档压缩包及删除临时文件夹
                string zipremotepath = string.Format(@"{0}\{1}_{2}.zip", arhtype, isoid, volid);
                strXml = "<items><item class=\"HOST\" hostip=\"" + ftpInfo.IpAddress + "\" hostport=\"" + ftpInfo.Port.ToString() + "\" loginname=\"" + ftpInfo.LoginName + "\" loginpass=\"" + ftpInfo.Password + "\"/>";
                strXml += "<item class=\"FILE\" transfertype=\"upload\" localFile=\"" + zippath + "\" remoteFile=\"" + zipremotepath + "\"/>";
                strXml += "</items>";

                strResult = TrasferFile(strXml);
                Directory.Delete(tempfolder, true);
                #endregion

                #region 4.插入归档信息
                if (strResult == "")
                {
                    lstResult.Items.Add("生成归档压缩包完成，请及时归档。");
                    if (dtAudting == null || dtAudting.Rows.Count <= 0)
                    {
                        sqllist.Add(string.Format("INSERT INTO dbo.Arh_Audting_Auto(isoid,arhtype,zipname,ftppath,volid,volname,arhstate,rowid,voluser,prjid,prjname,majcode,volrowid)VALUES ('{0}','{1}','{2}','{3}','{4}','{5}',0,'{6}','{7}','{8}','{9}','{10}','{11}')", isoid, arhtype, string.Format(@"{0}_{1}.zip", isoid, volid), zipremotepath.Replace("\\", "/"), volid, volname, volguid, voluser, prjid, prjname, majcode, volrowid));
                    }
                    if (sqllist.Count > 0)
                    {
                        webProxy.ExecuteSqlTrans(sqllist.ToArray());
                    }
                }
                else
                {
                   lstResult.Items.Add("生成归档压缩包失败。");
                }
                #endregion
            }

        }

        private void DownloadAttFile(string URL, string filename, System.Windows.Forms.ProgressBar prog)
        {
            try
            {
                System.Net.HttpWebRequest Myrq = (System.Net.HttpWebRequest)System.Net.HttpWebRequest.Create(URL);
                System.Net.HttpWebResponse myrp = (System.Net.HttpWebResponse)Myrq.GetResponse();
                long totalBytes = myrp.ContentLength;

                if (prog != null)
                {
                    prog.Maximum = (int)totalBytes;
                }

                System.IO.Stream st = myrp.GetResponseStream();
                System.IO.Stream so = new System.IO.FileStream(filename, System.IO.FileMode.Create);
                long totalDownloadedByte = 0;
                byte[] by = new byte[1024];
                int osize = st.Read(by, 0, (int)by.Length);
                while (osize > 0)
                {
                    totalDownloadedByte = osize + totalDownloadedByte;
                    System.Windows.Forms.Application.DoEvents();
                    so.Write(by, 0, osize);

                    if (prog != null)
                    {
                        prog.Value = (int)totalDownloadedByte;
                    }
                    osize = st.Read(by, 0, (int)by.Length);
                }
                so.Close();
                st.Close();
            }
            catch (System.Exception)
            {
                throw;
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

        private void button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtIsoId.Text.Trim()))
            {
                MessageBox.Show("请输入ISO编号");
                return;
            }
            string sql = string.Format("SELECT * FROM prj_dwg_pub WHERE CHARINDEX(isoid, '{0}')>0", txtIsoId.Text.Trim());
            DataTable dtpub = webProxy.GetDataTableBySql(sql);
            if (dtpub == null || dtpub.Rows.Count == 0)
            {
                MessageBox.Show("没有要压缩的出版单");
                return;
            }
            foreach (DataRow dr in dtpub.Rows)
            {
                pubId = dr["rowid"].ToString();
                BuilderZip();
            }
            
        }
    }
}
