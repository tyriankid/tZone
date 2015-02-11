using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;

namespace CarWebService
{
    /// <summary>
    /// Service1 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
    // [System.Web.Script.Services.ScriptService]
    public class CarWebService : System.Web.Services.WebService
    {
        //TODO:
        //1.增加是否微信调车的的字段，用来区分哪些是移动端或PC端插入的数据
        //2.增加错误日志，记录报错信息
        
        

        SqlHelper db = new SqlHelper();

        [WebMethod(Description = "写入日志信息，参数optuser:执行用户 optname:执行的方法名 optcontent:执行的内容")]
        public void WriteLogInfo(string optuser,string optname,string optcontent)
        {

            string sql = string.Format(@"INSERT INTO dbo.Base_System_Log(systemname , systemcode ,optuser , optname , optcontent  )
                                        VALUES  ('微信调车系统','UsingCarsByPhone','{0}','{1}','{2}')", optuser, optname, optcontent.Replace("'", "“"));
            
            db.ExecuteBySQL(sql);
        
        }



        [WebMethod(Description = "写入调车单信息，0：成功　1：失败")]
        public int WriteUseCarInfo(string appuser,string appdep,string othdep,string outdate,string indate,int usercount,string reason,
            string chargeuser,string chargeusertel,string cartype,string memo,string prjid,string goalcity,int state,int isbd,string appuserpy,string chkuser)
            
        {
            try
            {
                string sql = "";
                sql = string.Format(@"insert into CAR_UseCall(AppUser,AppDep,OthDep,OutDate,InDate,UserCount,Reason,
                                ChargeUser,ChargeUserTel,CarType,Memo,prjid,GoalCity,state,isbd,appuserpy,chkuser,isAPI) 
                                values('{0}','{1}','{2}','{3}','{4}',{5},'{6}','{7}','{8}','{9}','{10}','{11}','{12}',{13},{14},'{15}','{16}',{17})",
                    appuser, appdep, othdep, outdate, indate, usercount, reason, chargeuser, chargeusertel, cartype, memo, prjid, goalcity, state, isbd, appuserpy, chkuser, 1);

                int rtn = db.ExecuteBySQL(sql);
                if (rtn <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "写入调车单信息", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "更新调车单的状态。    参数rowid：调车单id 参数state：调车单状态   0：成功，1：失败"  )]
        public int UpdateUseCarState(string rowid,int state)
        {
            string sql = string.Format(@"update car_usecall set state={0} where rowid='{1}'",state,rowid);
            try
            {
                int rtn = db.ExecuteBySQL(sql);
                if (rtn <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "更新调车单状态", "异常："+ex.Message);
                throw ex;
            }
        }


        [WebMethod(Description = "获得调车单信息。 state：调车单的状态  appuser：申请人   rowid：调车单id"  )]
        public DataSet GetUseCarInfo(int state,string appuser,string rowid)
        {
            DataSet ds = null;
            string sql = "";
            try
            {
                sql = string.Format(@"select a.rowid,appuser,appdep,chargeuser,a.goalcity,reason,b.carid,outdate,indate,usercount,
                    case a.state when 1 then '待派车'  when 2 then '已派车' when 0 then '待审核' when 3 then '已结算' when 4 then '作废'
                                 when 5 then '已考评' when 6 then '被合并' when 7 then '部门审批' when 8 then '打回修改' end state
                    from CAR_UseCall a  left join car_usecall_car b on a.rowid=b.callid
                    where 1 = 1 ");
                if (state != -1)
                {
                    sql += string.Format(@" and a.state = {0}", state);
                }
                if (!string.IsNullOrEmpty(appuser))
                {
                    sql += string.Format(@" and appuser like '%{0}%'", appuser);
                }
                if (!string.IsNullOrEmpty(rowid))
                {
                    sql += string.Format(@" and a.rowid ='{0}'", rowid);
                }
                
                ds = db.GetDataSetBySQL(sql);
                return ds;
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "获得调车单信息", "异常：" + ex.Message);
                throw ex;
            }
        }


        [WebMethod(Description = "获取车辆信息。 参数state：车辆的状态 carid：车牌号 ")]
        public DataSet GetCars(int state,string carid)
        {
            DataSet ds = null;
            try
            {
                string sql = string.Format
                    (@"select carid,typeid,rideusers,driver,drivertel = (select phonetel from car_driverinfo b where b.username=a.driver),
                          case a.state when 0 then '空闲' when 4 then '检修中' else '已派车' end state
                   from car_baseinfo a
                   where 1 = 1 ");
                if (state != -1)
                {
                    sql += string.Format(@" and state = {0}", state);
                }
                if (!string.IsNullOrEmpty(carid))
                {
                    sql += string.Format(@" and carid = '{0}'", carid);
                }
                ds = db.GetDataSetBySQL(sql);

                return ds;
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "获取所有车辆信息", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "更新车辆出行状态。 参数CarId：车牌号  参数state：车辆状态 0：成功，1：失败")]
        public int UpdateCarsState(string CarId,int state)
        {
            try
            {
                string sql = string.Format(@"update car_baseinfo set state={0} where CarId='{1}'", state, CarId);
                int rtn = db.ExecuteBySQL(sql);
                if (rtn <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "更新车辆的状态", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "写入派车单信息 0：成功，1：失败")]
        public int WriteSendCarInfo(string callid,string cartype,string goaltype,string drivername,string goalcity,string drivertel,
            string carid, int state, string outtime, string intime, int hhs, string usedep)
                
        {

            try
            {
                string sql = string.Format(@"insert into 
                                       car_usecall_car(callid,cartype,goaltype,drivername,goalcity,
                                       drivertel,carid,state,outtime,intime,hhs,usedep,usetype)
                                       values('{0}','{1}','{2}','{3}','{4}','{5}','{6}',{7},'{8}','{9}',{10},'{11}',{12})"
                                            , callid, cartype, goaltype, drivername, goalcity, drivertel, carid, state, outtime, intime, hhs, usedep,0);
                int rtn = db.ExecuteBySQL(sql);
                if (rtn <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "写入派车单信息", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "根据调车单ID获取所有派车单信息")]
        public DataSet GetSendCarInfo(string rowid)
        {
            DataSet ds = null;
            try
            {
                string sql = string.Format(@"SELECT * FROM car_usecall_car WHERE callid = '{0}'",rowid);
                ds = db.GetDataSetBySQL(sql);
                return ds;
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "根据调车单ID获取所有派车单信息", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "删除派车单信息 0：成功，1：失败")]
        public int DeleteSendCarInfo(string callid)
        {
            try
            {
                string sql = string.Format(@"DELETE FROM car_usecall_car WHERE callid= '{0}'",callid);
                int rtn = db.ExecuteBySQL(sql);
                if (rtn <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "删除派车单信息", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "获取司机信息。")]
        public DataSet GetDrivers(int state,int id,string username)
        {
            DataSet ds = null;
            try
            {
                string sql = string.Format(@"SELECT id,username,jinydate,drivelictype,phonetel,othertel,state,goalcity FROM car_driverinfo
                                         WHERE 1=1    ");
                if (state != -1)
                {
                    sql += string.Format(@" and state ={0}", state);
                }
                if (!string.IsNullOrEmpty(username))
                {
                    sql += string.Format(@" and username = '{0}'", username);
                }
                if (id != -1)
                {
                    sql += string.Format(@" AND id = {0}", id);
                }
                ds = db.GetDataSetBySQL(sql);

                return ds;
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "获取司机信息", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description="更新司机出行状态")]
        public int UpdateDriverState(int id, string username, int state, string goalcity)
        {
            try
            {
                string sql = string.Format(@"UPDATE  car_driverinfo SET state ={0} ,goalcity='{1}'
                                             where 1=1 ",state,goalcity);
                if (id != -1)
                {
                    sql += string.Format(@" and id ={0}", id);
                }
                if (!string.IsNullOrEmpty(username))
                {
                    sql += string.Format(@" and username ='{0}'", username);
                }
                int rtn = db.ExecuteBySQL(sql);
                if (rtn <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "更新司机出行状态", "异常：" + ex.Message);
                throw ex;
            }
        }

        //[WebMethod(Description="更新调车单的审核人与审核日期")]
        //public int UpdateChkuser(string rowid,string chkuser,string chkdate)
        //{
        //    try
        //    {
        //        string sql = string.Format(@"UPDATE dbo.CAR_UseCall SET chkuser = '{1}' ,chkdate='{2}' WHERE rowid ='{0}'", rowid, chkuser, chkdate);
        //        int rtn = db.ExecuteBySQL(sql);
        //        if (rtn <= 0)
        //        {
        //            return 1;
        //        }
        //        else
        //        {
        //            return 0;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        WriteLogInfo("后台调用", "更新调车单的审核人与审核日期", "异常：" + ex.Message);
        //        throw ex;
        //    }
        //}

        //[WebMethod(Description = "更新调车单的派车人与派车日期")]
        //public int UpdateCarSender(string rowid,string sender,string sendtime)
        //{
        //    try
        //    {
        //        string sql = string.Format(@"UPDATE dbo.CAR_UseCall SET paicheuser = '{1}' ,paichetime='{2}' WHERE rowid ='{0}' ", rowid, sender, sendtime);
        //        int rtn = db.ExecuteBySQL(sql);
        //        if (rtn <= 0)
        //        {
        //            return 1;
        //        }
        //        else
        //        {
        //            return 0;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        WriteLogInfo("后台调用", "更新调车单的派车人与派车日期", "异常：" + ex.Message);
        //        throw ex;
        //    }

        //}

        [WebMethod(Description = "获取派车人")]
        public DataSet GetCarSender()
        {
            DataSet ds = null;
            string sql = string.Format(@"select carsender from car_carsender");

            ds = db.GetDataSetBySQL(sql);

            return ds;
        }

        [WebMethod(Description = "根据登录账号获得角色类型")]
        public int GetUserType(string LoginName)
        {
            DataTable dt = null;
            try
            {
                
                string username = "";
                //int isOrNot = 0; //0不是 1是的
                string sqlisLeader = string.Format(@"SELECT joblevel,username FROM dbo.vBaseDepList WHERE LoginName='{0}'", LoginName);
                dt = db.GetDataTableBySQL(sqlisLeader);

                username = dt.Rows[0]["username"].ToString();
                if (Convert.ToInt32(dt.Rows[0]["joblevel"]) < 4)
                {
                    return 1; //领导
                }
                

                string sqlisCarSender = string.Format(@"SELECT CarSender FROM dbo.Car_CarSender where carsender = '{0}'", username);
                dt = db.GetDataTableBySQL(sqlisCarSender);
                if (dt.Rows.Count > 0)
                {
                    return 2; //派车人
                }

                string sqlisDriver = string.Format(@"SELECT * FROM dbo.CAR_DriverInfo WHERE UserName = '{0}'", username);
                dt = db.GetDataTableBySQL(sqlisDriver);
                if (dt.Rows.Count > 0)
                {
                    return 3; //司机
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "根据登录账号获得角色类型", "异常：" + ex.Message);
                throw ex;
            }
            
        }

        [WebMethod(Description = "根据审核人登录账号获得对应调车单信息")]
        public DataSet GetUseCarInfoByChkUser(string LoginName ,int state)
        {
            DataSet ds = null;
            string sql = string.Format(@"select * FROM car_usecall 
                                        WHERE chkuser = (SELECT username FROM dbo.vBaseDepList WHERE  loginname='{0}')",LoginName);
            if (state != -1)
            {
                sql += string.Format(@" and state ={0}",state);
            }
            try
            {
                ds = db.GetDataSetBySQL(sql);
                return ds;
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "根据审核人登录账号获得对应调车单信息", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "根据派车人登录账号获得对应调车单信息")]
        public DataSet GetUseCarInfoByCarSender(string LoginName, int state)
        {
            DataSet ds = null;
            string sql = string.Format(@"select * FROM car_usecall 
                                        WHERE paicheuser = (SELECT username FROM dbo.vBaseDepList WHERE  loginname='{0}')", LoginName);
            if (state != -1)
            {
                sql += string.Format(@" and state ={0}", state);
            }
            try
            {
                ds = db.GetDataSetBySQL(sql);
                return ds;
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "根据派车人登录账号获得对应调车单信息", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "根据司机登录账号获得派车单信息")]
        public DataSet GetSendCarInfoByDriver(string LoginName,int state)
        {
            DataSet ds = null;
            string sql = string.Format(@"SELECT * FROM car_usecall_car a
                                        WHERE drivername = (SELECT username FROM dbo.vBaseDepList WHERE  loginname='{0}') 
                                        AND (SELECT State FROM car_usecall b WHERE b.rowid=a.CallID)={1}",LoginName,state);
            try
            {
                ds = db.GetDataSetBySQL(sql);
                return ds;
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "根据司机登录账号获得派车单信息", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "根据调车ID更新审核日期,审核人及调车单状态")]
        public int UpdateUseCarStateAndChkDate(string rowid, int state,string chkuser)
        {
            string sql = string.Format(@"update car_usecall set state={0} ,chkdate=CONVERT(varchar(100), GETDATE(), 20) 
                                         where rowid='{1}'
                                         ", state, rowid);
            if (!string.IsNullOrEmpty(chkuser))
            {
                sql = string.Format(@"update car_usecall set state={0} ,chkuser = '{2}' ,chkdate=CONVERT(varchar(100), GETDATE(), 20) 
                                         where rowid='{1}'
                                         ", state, rowid,chkuser);
            }
            try
            {
                int rtn = db.ExecuteBySQL(sql);
                if (rtn <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "根据调车ID更新审核日期及调车单状态", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "根据调车ID更新派车日期,派车人及调车单状态")]
        public int UpdateSendCarStateAndSendDate(string rowid, int state,string sender)
        {
            string sql = string.Format(@"update car_usecall set state={0} ,paichetime=CONVERT(varchar(100), GETDATE(), 20) 
                                         where rowid='{1}'
                                         ", state, rowid);
            if (!string.IsNullOrEmpty(sender))
            {
                sql = string.Format(@"update car_usecall set state={0} ,paicheuser = '{2}', chkdate=CONVERT(varchar(100), GETDATE(), 20) 
                                         where rowid='{1}'
                                         ", state, rowid, sender);
            }
            try
            {
                int rtn = db.ExecuteBySQL(sql);
                if (rtn <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "根据调车ID更新派车日期及调车单状态", "异常：" + ex.Message);
                throw ex;
            }
        }

        [WebMethod(Description = "根据调车单ID更新调车单信息")]
        public int UpdateUseCarInfo(string rowid,string appuser, string appdep, string othdep, string outdate, string indate, int usercount, string reason,
            string chargeuser, string chargeusertel, string cartype, string memo, string prjid, string goalcity, int state, int isbd, string appuserpy, string chkuser)
        {
            string sql = "";
            sql = string.Format(@"update CAR_UseCall set AppUser='{0}',AppDep='{1}',OthDep='{2}',OutDate='{3}',InDate='{4}',UserCount={5},Reason='{6}',
                                ChargeUser='{7}',ChargeUserTel='{8}',CarType='{9}',Memo='{10}',prjid='{11}',GoalCity='{12}',state={13},isbd={14},appuserpy='{15}',chkuser='{16}'
                                where rowid = '{17}'",
                appuser, appdep, othdep, outdate, indate, usercount, reason, chargeuser, chargeusertel, cartype, memo, prjid, goalcity, state, isbd, appuserpy, chkuser,rowid);
            try
            {
                int rtn = db.ExecuteBySQL(sql);
                if (rtn <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                WriteLogInfo("后台调用", "根据调车单ID更新调车单信息", "异常：" + ex.Message);
                throw ex;
            }

        }

        //[WebMethod(Description = "获得申请人的调车信息")]
        //public DataSet GetApplyUserCarInfo(string uid)
        //{
        //    DataSet ds = null;
        //    return ds;
        //}

    }
}
