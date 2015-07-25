using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
//using Trident.Common;


namespace StepOne_Object
{
    public class BaseClass
    {
        
        protected static SqlConnection GetConnection()
        {
           // EnCryptionAndDecription Obj_ComEncript = new EnCryptionAndDecription();   
            //string connectionString = ConfigurationSettings.AppSettings["SQLConn"].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConn"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            return connection;
        }

        protected static SqlConnection GetConnection(string dbName)
        {
            //string connectionString = ConfigurationSettings.AppSettings[dbName].ToString(); //ConfigurationManager.ConnectionStrings[dbName].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings[dbName].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            return connection;
        }

        public static string GetConnetionString()
        {
            return ConfigurationManager.ConnectionStrings["SQLConn"].ConnectionString;
            //return ConfigurationSettings.AppSettings["SQLConn"].ToString();
            //return ConfigurationSettings.AppSettings["SQLConn"].ToString();
        }

        public static string GetConnetionString(string dbName)
        {
            //return ConfigurationManager.ConnectionStrings["dbName"].ToString();
            //return ConfigurationSettings.AppSettings[dbName].ToString();
            return ConfigurationManager.ConnectionStrings[dbName].ConnectionString;
        }
    }
}
