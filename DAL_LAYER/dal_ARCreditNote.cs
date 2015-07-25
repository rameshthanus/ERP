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
   public class dal_ARCreditNote
    {
        int val = 0;
        public DataSet dal_ARCreditNoteDetail(bel_ARCreditNote obj_bel_CreditNote)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_ARCreditNoteSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@CreditNoteID", obj_bel_CreditNote._CreditNoteID);
                sqlcmd.Parameters.AddWithValue("@CreditNote_DetailID", obj_bel_CreditNote._CreditNote_DetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_CreditNote._ProductID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_CreditNote._ProductCode);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_CreditNote._JOBID);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_CreditNote._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_CreditNote._iMode);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_CreditNote._PartyID);
                sqlcmd.Parameters.AddWithValue("@Period", obj_bel_CreditNote._BillFromDate);
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {
            }
            return ds;
        }

        public DataSet dal_AutoGen(bel_ARCreditNote obj_bel_CreditNote)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_CreditNote._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_CreditNote._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_CreditNote._BillToDate);
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
