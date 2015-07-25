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
    public class dal_Category
    {
        public DataSet dal_CategoryDetail(bel_Category obj_bel_Category)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_Category");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_Category._CategoryID);
                sqlcmd.Parameters.AddWithValue("@CategoryCode", obj_bel_Category._CategoryCode);
                sqlcmd.Parameters.AddWithValue("@CategoryName", obj_bel_Category._CategoryName);
                sqlcmd.Parameters.AddWithValue("@CategoryStatus", obj_bel_Category._CategoryStatus);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Category._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Category._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Category._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Category._screenName);
             
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;
        }

        public DataSet dal_AutoGenCategory(bel_Category obj_bel_Category)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenMaster");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@screenName", obj_bel_Category._screenName);


                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
