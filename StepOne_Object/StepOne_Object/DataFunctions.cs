using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace StepOne_Object
{
    public class DataFunctions : BaseClass
    {
        #region Execute
        public static int Execute(string SQL)
        {
            int success;

            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    SqlCommand cmd = new SqlCommand(SQL, conn);
                    cmd.Connection = conn;
                    success = cmd.ExecuteNonQuery();
                }
                return success;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int Execute(string dbName, string SQL)
        {
            int success;
            try
            {
                using (SqlConnection conn = GetConnection(dbName))
                {
                    SqlCommand cmd = new SqlCommand(SQL, conn);
                    cmd.Connection = conn;
                    success = cmd.ExecuteNonQuery();
                }
                return success;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int Execute(SqlCommand cmd)
        {
            int success;
            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    cmd.Connection = conn;
                    success = cmd.ExecuteNonQuery();
                }
                return success;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int Execute(string dbName, SqlCommand cmd)
        {
            int success;
            try
            {
                using (SqlConnection conn = GetConnection(dbName))
                {
                    cmd.Connection = conn;
                    success = cmd.ExecuteNonQuery();
                }
                return success;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region Execute Scalar

        public static object ExecuteScalar(string SQL)
        {
            object obj;
            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    SqlCommand cmd = new SqlCommand(SQL, conn);
                    cmd.CommandTimeout = 6000;
                    obj = cmd.ExecuteScalar();
                }
                return obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static object ExecuteScalar(string dbName, string SQL)
        {
            object obj;
            try
            {
                using (SqlConnection conn = GetConnection(dbName))
                {
                    SqlCommand cmd = new SqlCommand(SQL, conn);
                    cmd.CommandTimeout = 6000;
                    obj = cmd.ExecuteScalar();
                }
                return obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static object ExecuteScalar(SqlCommand cmd)
        {
            object obj;
            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    cmd.Connection = conn;
                    cmd.CommandTimeout = 6000;
                    obj = cmd.ExecuteScalar();
                }
                return obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static object ExecuteScalar(string dbName, SqlCommand cmd)
        {
            object obj;
            try
            {
                using (SqlConnection conn = GetConnection(dbName))
                {
                    cmd.Connection = conn;
                    cmd.CommandTimeout = 6000;
                    obj = cmd.ExecuteScalar();
                }
                return obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region DataSet

        public static DataSet GetDataSet(string SQL)
        {
            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
                    da.Fill(ds, "DataTable");
                    da.SelectCommand.Connection.Close();
                }
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataSet GetDataSet(string dbName, string SQL)
        {
            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection conn = GetConnection(dbName))
                {
                    SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
                    da.Fill(ds, "DataTable");
                    da.SelectCommand.Connection.Close();
                }
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataSet GetDataSet(SqlCommand cmd)
        {
            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    cmd.CommandTimeout = 0;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.Connection = conn;
                    da.Fill(ds);
                }
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataSet GetDataTable(string dbName, SqlCommand cmd)
        {
            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection conn = GetConnection(dbName))
                {
                    cmd.CommandTimeout = 0;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.Connection = conn;
                    da.Fill(ds);
                }
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetDataSet(DataTable dtDestination, string SQL)
        {
            DataTable dt = new DataTable("Table");
            SqlCommand cmd = new SqlCommand();

            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = SQL;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    SqlCommandBuilder sqlBuilder = new SqlCommandBuilder(da);
                    da.Fill(dt);
                    da.Update(dtDestination);
                    da.SelectCommand.Connection.Close();
                }
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }
}
