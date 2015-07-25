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
   public class dal_PurchaseReturn
    {
        int val = 0;
        public DataSet dal_PurchaseReturnDetail(bel_PurchaseReturn obj_bel_PurchaseReturn)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_POReturnSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@POReturnID", obj_bel_PurchaseReturn._PurchaseReturnID);
                sqlcmd.Parameters.AddWithValue("@POReturnDetailID", obj_bel_PurchaseReturn._PurchaseReturnDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@POReturnNo", obj_bel_PurchaseReturn._PurchaseReturnNo);
              //  sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_PurchaseReturn._ProductID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_PurchaseReturn._ProductCode);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_PurchaseReturn._PartyID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_PurchaseReturn._JOBID);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_PurchaseReturn._ScreenName);

                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));  
               // sqlcmd.Parameters.AddWithValue("@IndentID", obj_bel_PurchaseReturn._IndentID);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_PurchaseReturn._iMode);
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_PurchaseReturn._CategotyID);
                         
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
        public DataSet dal_AutoGen(bel_PurchaseReturn obj_bel_PurchaseReturn)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_PurchaseReturn._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_PurchaseReturn._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_PurchaseReturn._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

    }
}
