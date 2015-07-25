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
   public class dal_JobCreation
    {
       public DataSet dal_JobCreationDetail(bel_JobCreation obj_bel_Job)
       {

           DataSet ds = new DataSet();
           try
           {

               SqlCommand sqlcmd = new SqlCommand("spu_JOBCreation");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Job._JOBID);
               sqlcmd.Parameters.AddWithValue("@JOBCode", obj_bel_Job._JOBCode);
               sqlcmd.Parameters.AddWithValue("@CustomerID", obj_bel_Job._CustomerID);
               sqlcmd.Parameters.AddWithValue("@Remarks", obj_bel_Job._Remarks);
               sqlcmd.Parameters.AddWithValue("@CancelReason", obj_bel_Job._CancelReason);
               sqlcmd.Parameters.AddWithValue("@JOBStatus", obj_bel_Job._JOBStatus);
               sqlcmd.Parameters.AddWithValue("@GeneralOrderStatus", obj_bel_Job._GeneralOrderStatus);
               sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Job._CreatedOn);
               sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Job._ModifiedOn);
               sqlcmd.Parameters.AddWithValue("@BillFromDate", obj_bel_Job._BillFromDate);
               sqlcmd.Parameters.AddWithValue("@BillToDate", obj_bel_Job._BillToDate);
               sqlcmd.Parameters.AddWithValue("@BillNumber", obj_bel_Job._BillNumber);
               sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Job._iMode);
               sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
               sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
               
               ds = DataFunctions.GetDataSet(sqlcmd);
           }
           catch (Exception ex)
           {


           }
           return ds;

       }
    }
}
