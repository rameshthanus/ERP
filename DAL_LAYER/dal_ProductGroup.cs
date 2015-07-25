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
    public class dal_ProductGroup
    {
        public DataSet dal_ProductGroupDetail(bel_ProductGroup obj_bel_ProductGroup)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_ProductGroup");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ProductGroupID", obj_bel_ProductGroup._ProductGroupID);
                sqlcmd.Parameters.AddWithValue("@ProductGroupCode", obj_bel_ProductGroup._ProductGroupCode);
                sqlcmd.Parameters.AddWithValue("@ProductGroupName", obj_bel_ProductGroup._ProductGroupName);
                sqlcmd.Parameters.AddWithValue("@ProductGroupStatus", obj_bel_ProductGroup._ProductGroupStatus);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_ProductGroup._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_ProductGroup._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_ProductGroup._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_ProductGroup._screenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
        public DataSet dal_AutoGenProductGroup(bel_ProductGroup obj_bel_ProductGroup)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenMaster");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@screenName", obj_bel_ProductGroup._screenName);


                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
