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
    public class dal_ARinvoice
    {
        int val = 0;
        public DataSet dal_ARInvoiceDetail(bel_ARInvoice obj_bel_Invoice)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_ARInvoiceSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@InvoiceID", obj_bel_Invoice._InvoiceID);
                sqlcmd.Parameters.AddWithValue("@Invoice_DetailID", obj_bel_Invoice._Invoice_DetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_Invoice._ProductID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_Invoice._ProductCode);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Invoice._JOBID);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Invoice._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
             //   sqlcmd.Parameters.AddWithValue("@WarehouseID", Convert.ToInt32(obj_bel_Invoice._WarehouseID));
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Invoice._iMode);
              //  sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_Invoice._CategoryID);
              //  sqlcmd.Parameters.AddWithValue("@QuotationID", obj_bel_Invoice._QuotationID);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_Invoice._PartyID);
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public DataSet dal_AutoGen(bel_ARInvoice obj_bel_Invoice)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Invoice._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_Invoice._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_Invoice._BillToDate);
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
