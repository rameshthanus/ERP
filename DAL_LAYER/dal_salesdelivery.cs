using System.Data.SqlClient;
using System.Configuration;
using StepOne_Object;
using BEL_LAYER;
using System.Web.SessionState;
using System.Web;
using System.Data;
using System;

namespace DAL_LAYER
{
    public class dal_salesdelivery
    {
        public DataSet dal_SalesDeliveryDetail(bel_salesdelivery obj_bel_DC)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_SalesDeliverySearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@SalesdeliveryID", obj_bel_DC._SalesdeliveryID);
                sqlcmd.Parameters.AddWithValue("@SalesdeliveryDetailID", obj_bel_DC._SalesdeliveryDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_DC._ProductID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_DC._ProductCode);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_DC._JOBID);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_DC._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@WarehouseID", Convert.ToInt32(obj_bel_DC._WarehouseID));
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_DC._iMode);
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_DC._CategoryID);
                sqlcmd.Parameters.AddWithValue("@QuotationID", obj_bel_DC._QuotationID);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_DC._PartyID);
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
