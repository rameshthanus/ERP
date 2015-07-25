using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using StepOne_Object;
using BEL_LAYER;
using System.Web.SessionState;
using System.Web;


namespace DAL_LAYER
{
    public class dal_Config
    {
        public DataSet dal_Configdetail(bel_Config obj_bel_Config)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_Config");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Config._iMode);
                sqlcmd.Parameters.AddWithValue("@ConfigID", obj_bel_Config._ConfigID);
                sqlcmd.Parameters.AddWithValue("@SMTPhost", obj_bel_Config._SMTPhost);
                sqlcmd.Parameters.AddWithValue("@SMTPport", obj_bel_Config._SMTPport);
                sqlcmd.Parameters.AddWithValue("@Subject", obj_bel_Config._Subject);
                sqlcmd.Parameters.AddWithValue("@EmailID", obj_bel_Config._EmailID);
                sqlcmd.Parameters.AddWithValue("@Password", obj_bel_Config._Password);
                sqlcmd.Parameters.AddWithValue("@Description", obj_bel_Config._Description);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", obj_bel_Config._CreatedBy);
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Config._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", obj_bel_Config._ModifiedBy);
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Config._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Config._ScreenName);
                sqlcmd.Parameters.AddWithValue("@Tolerance", obj_bel_Config._Tolerance);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception es)
            {

            }
            return ds;
        }
    }
}
