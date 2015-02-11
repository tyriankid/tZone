using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


    public class SqlHelper : IDisposable
    {
        private SqlConnection _conn;

        private SqlTransaction _trsn;
        private IDbConnection conn;


        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (_conn != null)
                {
                    _conn.Dispose();
                    _conn = null;
                }
                if (_trsn != null)
                {
                    _trsn.Dispose();
                    _trsn = null;
                }
                if (conn != null)
                {
                    conn.Dispose();
                    conn = null;
                }
            }
        }
        ~SqlHelper()
        {
            Dispose(false);
        }
        /// <summary>
        /// 无参构造，提供从应用程序配置文件中读取连接字符串登录数据库
        /// </summary>
        public SqlHelper() : this(1) { }
        public SqlHelper(int connStrIndex)
        {
            _conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connStrIndex].ConnectionString);
        }
        /// <summary>
        /// 提供以传入字符值串作为连接字符串登录数据库
        /// </summary>
        /// <example>new SQLHelp("server=.;database=master;uid=sa;pwd=sa")</example>
        /// <param name="connectionString"></param>
        public SqlHelper(string connectionString)
        {
            _conn = new SqlConnection(connectionString);

        }

        public SqlHelper(SqlConnection conn)
        {
            _conn = conn;
        }

        public DataTable GetDataTableBySQL(string strSqlQuery)
        {
            SqlDataAdapter sda = null;
            SqlCommand sqlCmd = null;

            try
            {
                if (_conn.State == ConnectionState.Closed) _conn.Open();
                sqlCmd = new SqlCommand(strSqlQuery, _conn, _trsn);
                sda = new SqlDataAdapter(sqlCmd);

                DataTable dt = new DataTable();
                sda.Fill(dt);

                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (sda != null) sda.Dispose();
                if (_trsn == null) _conn.Close();
            }
        }
        public DataSet GetDataSetBySQL(string strSqlQuery)
        {
            SqlDataAdapter sda = null;
            SqlCommand sqlCmd = null;

            try
            {
                if (_conn.State == ConnectionState.Closed) _conn.Open();
                sqlCmd = new SqlCommand(strSqlQuery, _conn, _trsn);
                sda = new SqlDataAdapter(sqlCmd);

                DataSet ds = new DataSet();
                sda.Fill(ds);

                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (sda != null) sda.Dispose();
                if (_trsn == null) _conn.Close();
            }
        }
        public int ExecuteBySQL(string strSql)
        {
            try
            {
                if (_conn.State == ConnectionState.Closed) _conn.Open();
                SqlCommand cmd = new SqlCommand(strSql, _conn, _trsn);
                string[] arrSql = strSql.Split(new string[] { "GO\r\n", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);
                int i = 0;
                foreach (string sql in arrSql)
                {
                    if (string.IsNullOrEmpty(sql)) continue;
                    cmd.CommandText = sql;
                    i += cmd.ExecuteNonQuery();
                }

                return i;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (_trsn == null) _conn.Close();
            }
        }

        public int ExecuteBySQL(string strSql, params SqlParameter[] pars)
        {
            try
            {
                if (_conn.State == ConnectionState.Closed) _conn.Open();
                using (SqlCommand cmd = new SqlCommand(strSql, _conn, _trsn) { CommandTimeout = 300 })
                {
                    cmd.Parameters.AddRange(pars);
                    return cmd.ExecuteNonQuery();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (_trsn == null) _conn.Close();
            }
        }

        public void BeginTransaction()
        {
            if (_trsn == null)
            {
                if (_conn.State == ConnectionState.Closed) _conn.Open();
                _trsn = _conn.BeginTransaction();
            }
        }

        public void CommitTransaction()
        {
            try
            {
                if (_trsn != null) _trsn.Commit();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (_trsn != null) _trsn.Dispose();
                if (_conn != null) _conn.Close();
                _trsn = null;
            }
        }

        public void RollbackTransaction()
        {
            try
            {
                if (_trsn != null) _trsn.Rollback();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (_trsn != null) _trsn.Dispose();
                if (_conn != null) _conn.Close();
                _trsn = null;
            }
        }

    }

