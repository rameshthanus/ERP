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
   public class dal_Salesreturn
    {
       public DataSet dal_SalesReturnDetail(bel_Salesreturn obj_bel_Sales)
       {

           DataSet ds = new DataSet();
           try
           {

               SqlCommand sqlcmd = new SqlCommand("spu_SalesReturnSearch");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@SalesReturnID", obj_bel_Sales._SalesReturnID);
               sqlcmd.Parameters.AddWithValue("@SalesReturnDetailID", obj_bel_Sales._SalesReturnDetailID);
               sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
               sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_Sales._ProductID);
               sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_Sales._ProductCode);
               sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Sales._JOBID);
               sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Sales._ScreenName);
               sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
               sqlcmd.Parameters.AddWithValue("@WarehouseID", Convert.ToInt32(obj_bel_Sales._WarehouseID));
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Sales._iMode);
               sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_Sales._CategoryID);
              
               sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_Sales._PartyID);
               ds = DataFunctions.GetDataSet(sqlcmd);
           }
           catch (Exception ex)
           {


           }
           return ds;

       }
    }
}
