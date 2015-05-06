using System;
using System.Data;
using System.Timers;
using System.Threading;
using System.Collections.Generic;
using Hanstrong.DrawingPrns.HsWebservice;

namespace Hanstrong.Decrypts
{

	public class WebServiceWrapper : Hanstrong.DrawingPrns.HsWebservice.Service
	{
		private int _timeout = 8000;
		private int _reyTry = 3;
		private int _interval = 1000;
		private List<ServiceMark> _serviceList = new List<ServiceMark>();
		private System.Timers.Timer _timer;

		private RegisteredWaitHandle _waitHandle = null;

		public event EventHandler<ConnectionEventArgs> Requesting;
		public event EventHandler<ConnectionEventArgs> Requested;

		#region 构造函数

        public WebServiceWrapper() : base() 
        {
            string strConfigPath = AppDomain.CurrentDomain.BaseDirectory + "Config.ini";

            if (System.IO.File.Exists(strConfigPath))
            {
                string strUrl = CommonLibary.GetIniKeyValue(strConfigPath, "WebService", "url");
                if (!string.IsNullOrEmpty(strUrl))
                {
                    base.Url = strUrl;
                }
            }
            
            this.ExecutePrdCompleted += new Hanstrong.DrawingPrns.HsWebservice.ExecutePrdCompletedEventHandler(ExecutePrdAsyncCompleted);
            this.ExecuteSqlCompleted += new Hanstrong.DrawingPrns.HsWebservice.ExecuteSqlCompletedEventHandler(ExecuteSqlAsyncCompleted);
            this.ExecuteSqlTransCompleted += new Hanstrong.DrawingPrns.HsWebservice.ExecuteSqlTransCompletedEventHandler(ExecuteSqlTransAsyncCompleted);
            this.GetDataSetByPrdCompleted += new Hanstrong.DrawingPrns.HsWebservice.GetDataSetByPrdCompletedEventHandler(GetDataSetByPrdAsyncCompleted);
            this.GetDataSetBySqlCompleted += new Hanstrong.DrawingPrns.HsWebservice.GetDataSetBySqlCompletedEventHandler(GetDataSetBySqlAsyncCompleted);

            _timer = new System.Timers.Timer(600);
            _timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
        }

		public WebServiceWrapper(string url)
			: base()
		{
            base.Url = url;
		}

		public WebServiceWrapper(string url, int timeout, int reyTry)
			: this(url)
		{

			_timeout = timeout;
			_reyTry = reyTry;
		}

		#endregion

		#region  内部方法，用来处理异步执行的超时问题

		void timer_Elapsed(object sender, ElapsedEventArgs e)
		{
			_interval = 2000;
			for ( int i = 0; i < _serviceList.Count; i++ )
			{
				if ( _serviceList[i].StartTime.AddMilliseconds(_timeout) <= e.SignalTime )
				{
					_serviceList[i].TimeOut = true;
					base.CancelAsync(_serviceList[i]);
				}
			}
			_interval = 600;
		}

		private void ExecutePrdAsyncCompleted(object sender, ExecutePrdCompletedEventArgs e)
		{
			lock ( _serviceList )
			{
				_serviceList.Remove((ServiceMark)e.UserState);
			}
		}

		private void ExecuteSqlAsyncCompleted(object sender, ExecuteSqlCompletedEventArgs e)
		{
			lock ( _serviceList )
			{
				_serviceList.Remove((ServiceMark)e.UserState);
			}
		}

		private void ExecuteSqlTransAsyncCompleted(object sender, ExecuteSqlTransCompletedEventArgs e)
		{
			lock ( _serviceList )
			{
				_serviceList.Remove((ServiceMark)e.UserState);
			}
		}

		private void GetDataSetByPrdAsyncCompleted(object sender, GetDataSetByPrdCompletedEventArgs e)
		{
			lock ( _serviceList )
			{
				_serviceList.Remove((ServiceMark)e.UserState);
			}
		}

		private void GetDataSetBySqlAsyncCompleted(object sender, GetDataSetBySqlCompletedEventArgs e)
		{
			lock ( _serviceList )
			{
				for ( int i = 0; i < _serviceList.Count; i++ )
					if ( _serviceList[i].Equals(e.UserState) )
					{
						_serviceList.RemoveAt(i);
					}
			}
		}

		#endregion

		#region 异步执行方法
      

		public new ServiceMark ExecutePrdAsync(string prdName, string[] parms, object[] values)
		{
            ServiceMark mark = new ServiceMark();
			lock ( _serviceList )
			{
				_serviceList.Add(mark);
			}
			base.ExecutePrdAsync(prdName, parms, values, mark);
            return mark;
		}

		public new ServiceMark ExecuteSqlAsync(string sqlcmd)
		{
            ServiceMark mark = new ServiceMark();
			lock ( _serviceList )
			{
				_serviceList.Add(mark);
			}
			base.ExecuteSqlAsync(sqlcmd, mark);
            return mark;
		}

		public new ServiceMark ExecuteSqlTransAsync(string[] sqlcmd)
		{
            ServiceMark mark = new ServiceMark();
			lock ( _serviceList )
			{
				_serviceList.Add(mark);
			}
			base.ExecuteSqlTransAsync(sqlcmd, mark);
            return mark;
		}

		public new ServiceMark GetDataSetByPrdAsync(string prdName, string[] parms, object[] values)
		{
            ServiceMark mark = new ServiceMark();
			lock ( _serviceList )
			{
				_serviceList.Add(mark);
			}
			base.GetDataSetByPrdAsync(prdName, parms, values, mark);
            return mark;
		}

		public new ServiceMark  GetDataSetBySqlAsync(string sqlcmd)
		{
            ServiceMark  mark = new ServiceMark();
			lock ( _serviceList )
			{
				_serviceList.Add(mark);
			}
			base.GetDataSetBySqlAsync(sqlcmd, mark);
            return mark;
		}

        public new ServiceMark CheckCadPlusValidAsync(string clientinfo)
        {
            ServiceMark state = new ServiceMark();
            lock (_serviceList)
            {
                _serviceList.Add(state);
            }
            //base.CheckCadPlusValidAsync(clientinfo, mark);
            return state;
        }

		public void CancelAsync()
		{
			for ( int i = 0; i < this._serviceList.Count; i++ )
			{
				base.CancelAsync(_serviceList[i]);
			}
		}



		#endregion

		#region 同步执行方法


		public void WaitProc(object state, bool timeOut)
		{
			if ( timeOut )
			{
				_waitHandle.Unregister(null);
				this.Abort();
			}
		}

		public new string ExecutePrd(string prdName, string[] parms, object[] values)
		{
			string strResult = string.Empty;
			int i = 0;
			string strError = string.Empty;
			try
			{
				while ( i < _reyTry )
				{
					if ( this.Requesting != null )
					{
						this.Requesting(this, new ConnectionEventArgs(i, string.Empty));
					}
					strError = string.Empty;
					try
					{
						strResult = base.ExecutePrd(prdName, parms, values);
					}
					catch ( Exception ex )
					{
						strError = ex.Message;
					}

					if ( strError.Length > 0 )
					{
						System.Threading.Thread.Sleep(_interval);
					}

					if ( this.Requested != null )
					{
						this.Requested(this, new ConnectionEventArgs(i, strError));
					}

					if ( string.IsNullOrEmpty(strError) )
					{
						return strResult;
					}

					i++;

				}
			}
			catch ( Exception ex )
			{
				strResult = ex.Message;
			}
			return strResult;
		}

		public string ExecutePrdAsyn(string prdName, string[] parms, object[] values)
		{
			object[] args = new object[3];
			args[0] = prdName;
			args[1] = parms;
			args[2] = values;
			AutoResetEvent ev = new AutoResetEvent(false);
			_waitHandle = ThreadPool.RegisterWaitForSingleObject(ev, new WaitOrTimerCallback(WaitProc), null, _timeout, true);
			IAsyncResult result = base.BeginInvoke("ExecutePrd", args, null, null);
			result.AsyncWaitHandle.WaitOne();
			object[] rel = base.EndInvoke(result);
			_waitHandle.Unregister(null);

			return rel[0] as string;
		}

		public new string ExecuteSql(string sqlcmd)
		{
			string strResult = string.Empty;
			int i = 0;
			string strError = string.Empty;
			while ( i < _reyTry )
			{
				if ( this.Requesting != null )
				{
					this.Requesting(this, new ConnectionEventArgs(i, string.Empty));
				}
				strError = string.Empty;
				try
				{
					strResult = base.ExecuteSql(sqlcmd);
				}
				catch ( Exception ex )
				{
					strError = ex.Message;
				}

				if ( strError.Length > 0 )
				{
					System.Threading.Thread.Sleep(_interval);
				}

				if ( this.Requested != null )
				{
					this.Requested(this, new ConnectionEventArgs(i, strError));
				}
				if ( strError == string.Empty )
				{
					return strResult;
				}

				i++;
			}

			return strResult;
		}

		public new string ExecuteSqlTrans(string[] sqlcmd)
		{
			string strResult = string.Empty;
			int i = 0;
			string strError = string.Empty;
			while ( i < _reyTry )
			{
				if ( this.Requesting != null )
				{
					this.Requesting(this, new ConnectionEventArgs(i, string.Empty));
				}
				strError = string.Empty;
				try
				{
					strResult = base.ExecuteSqlTrans(sqlcmd);
				}
				catch ( Exception ex )
				{
					strError = ex.Message;
				}

				if ( strError.Length > 0 )
				{
					System.Threading.Thread.Sleep(_interval);
				}

				if ( this.Requested != null )
				{
					this.Requested(this, new ConnectionEventArgs(i, strError));
				}
				if ( strError == string.Empty )
				{
					return strResult;
				}

				i++;
			}


			return strResult;
		}

		//public new DataSet GetDataSetByPrd(string prdName, string[] parms, object[] values) {
		//    object[] args = new object[3];
		//    args[0] = prdName;
		//    args[1] = parms;
		//    args[2] = values;

		//    AutoResetEvent ev = new AutoResetEvent(false);
		//    _waitHandle = ThreadPool.RegisterWaitForSingleObject(ev, new WaitOrTimerCallback(WaitProc), null, _timeout, true);
		//    IAsyncResult result = base.BeginInvoke("GetDataSetByPrd", args, null, null);
		//    result.AsyncWaitHandle.WaitOne();
		//    object[] rel = base.EndInvoke(result);
		//    _waitHandle.Unregister(null);

		//    return rel[0] as DataSet;
		//}

		//public new DataSet GetDataSetBySql(string sqlcmd) {
		//    object[] args = new object[1];
		//    args[0] = sqlcmd;
		//    AutoResetEvent ev = new AutoResetEvent(false);
		//    _waitHandle = ThreadPool.RegisterWaitForSingleObject(ev, new WaitOrTimerCallback(WaitProc), null, _timeout, true);
		//    IAsyncResult result = base.BeginInvoke("GetDataSetBySql", args, null, null);
		//    result.AsyncWaitHandle.WaitOne();
		//    object[] rel = base.EndInvoke(result);
		//    _waitHandle.Unregister(null);

		//    return rel[0] as DataSet;
		//}

		public new DataSet GetDataSetByPrd(string prdName, string[] parms, object[] values)
		{
			DataSet ds = null;
			int i = 0;
			string strError = string.Empty;
			while ( i < _reyTry )
			{
				if ( this.Requesting != null )
				{
					this.Requesting(this, new ConnectionEventArgs(i, string.Empty));
				}
				strError = string.Empty;
				try
				{
					ds = base.GetDataSetByPrd(prdName, parms, values);
				}
				catch ( Exception ex )
				{
					strError = ex.Message;
				}

				if ( strError.Length > 0 )
				{
					System.Threading.Thread.Sleep(_interval);
				}

				if ( this.Requested != null )
				{
					this.Requested(this, new ConnectionEventArgs(i, strError));
				}
				if ( strError == string.Empty )
				{
					return ds;
				}

				i++;
			}


			return ds;
		}

        public  DataSet GetDataSetByPrd(string prdName, string[] parms, object[] values, out string error)
        {
            DataSet ds = null;
            int i = 0;
            error = string.Empty;
            while (i < _reyTry)
            {
                if (this.Requesting != null)
                {
                    this.Requesting(this, new ConnectionEventArgs(i, string.Empty));
                }
                error = string.Empty;
                try
                {
                    ds = base.GetDataSetByPrd(prdName, parms, values);
                }
                catch (Exception ex)
                {
                    error = ex.Message;
                }

                if (error.Length > 0)
                {
                    System.Threading.Thread.Sleep(_interval);
                }

                if (this.Requested != null)
                {
                    this.Requested(this, new ConnectionEventArgs(i, error));
                }
                if (error == string.Empty)
                {
                    return ds;
                }

                i++;
            }


            return ds;
        }


		public new DataSet GetDataSetBySql(string sqlcmd)
		{
			DataSet ds = null;
			int i = 0;
			string strError = string.Empty;
			while ( i < _reyTry )
			{
				if ( this.Requesting != null )
				{
					this.Requesting(this, new ConnectionEventArgs(i, string.Empty));
				}
				strError = string.Empty;
				try
				{
					ds = base.GetDataSetBySql(sqlcmd);
				}
				catch ( Exception ex )
				{
					strError = ex.Message;
				}

				if ( strError.Length > 0 )
				{
					System.Threading.Thread.Sleep(_interval);
				}

				if ( this.Requested != null )
				{
					this.Requested(this, new ConnectionEventArgs(i, strError));
				}
				if ( strError == string.Empty )
				{
					return ds;
				}

				i++;
			}

			return ds;
		}


        /// <summary>
        /// 执行SQL语句，返回数据表
        /// </summary>
        /// <param name="sqlcmd">SQL语句</param>
        /// <param name="dt">返回结果集</param>
        /// <returns>错误信息</returns>
        public string GetDataBySql(string sqlcmd, out DataTable dt)
        {
            dt = null;
            DataSet ds = null;
            string strError = string.Empty;

            try
            {
                ds = base.GetDataSetBySql(sqlcmd);
            }
            catch (Exception ex)
            {
                strError = ex.Message;
            }

            if (strError.Length > 0)
            {
                return strError;
            }

            if (ds == null || ds.Tables.Count < 1 || ds.Tables[0] == null)
            {
                return "数据库访问失败！";
            }

            dt = ds.Tables[0];
            return string.Empty;
        }

        /// <summary>
        /// 执行存储过程，返回数据表
        /// </summary>
        public string GetDataByPrd(string prdName, string[] parms, object[] values, out DataTable dt)
        {
             dt = null;
            DataSet ds = null;
            string strError = string.Empty;

            try
            {
                ds = base.GetDataSetByPrd(prdName, parms, values);
            }
            catch (Exception ex)
            {
                strError = ex.Message;
            }

            if (strError.Length > 0)
            {
                return strError;
            }

            if (ds == null || ds.Tables.Count < 1 || ds.Tables[0] == null)
            {
                return "数据库访问失败！";
            }

            dt = ds.Tables[0];
            return string.Empty;
        }

		public new string CheckCadPlusValid(string clientinfo)
		{
			string strResult = string.Empty;
			int i = 0;
			string strError = string.Empty;
			while ( i < _reyTry )
			{
				if ( this.Requesting != null )
				{
					this.Requesting(this, new ConnectionEventArgs(i, string.Empty));
				}
				strError = string.Empty;
				try
				{
					//strResult = base.CheckCadPlusValid(clientinfo);
				}
				catch ( Exception ex )
				{
					strError = ex.Message;
				}

				if ( strError.Length > 0 )
				{
					System.Threading.Thread.Sleep(_interval);
				}

				if ( this.Requested != null )
				{
					this.Requested(this, new ConnectionEventArgs(i, strError));
				}
				if ( strError == string.Empty )
				{
					return strResult;
				}

				i++;
			}

			return strResult;
		}
		#endregion
	}

	public class ServiceMark:Object
	{
		public DateTime StartTime;
		public bool TimeOut;

		public ServiceMark()
		{
			StartTime = DateTime.Now;
			TimeOut = false;
		}

		public override bool Equals(object obj)
		{
			if ( obj is ServiceMark )
			{
				return this.StartTime.Equals(( (ServiceMark)obj ).StartTime);
			}
			return false;
		}
		public override int GetHashCode()
		{
			return base.GetHashCode();
		}
	}

	public class ConnectionEventArgs : EventArgs
	{
		private int _tryCount;
		private string _errorMsg;

		public int TryCount
		{
			get
			{
				return this._tryCount;
			}
		}

		public string ErrorMsg
		{
			get
			{
				return this._errorMsg;
			}
		}

		public ConnectionEventArgs(int count, string msg)
		{
			_tryCount = count;
			_errorMsg = msg;
		}

	}
}
