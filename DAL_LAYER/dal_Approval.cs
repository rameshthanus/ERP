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
   public class dal_Approval
    {
       public DataSet dal_ApprovalDetail(bel_Approval obj_bel_Approval)
       {
           DataSet ds = new DataSet();
           try
           {
               SqlCommand sqlcmd = new SqlCommand("spu_Approval");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@NO", obj_bel_Approval._NO);
               sqlcmd.Parameters.AddWithValue("@ID", obj_bel_Approval._ID);
               sqlcmd.Parameters.AddWithValue("@ApprovedStatus", obj_bel_Approval._ApprovedStatus);
               sqlcmd.Parameters.AddWithValue("@Remarks", obj_bel_Approval._Remarks);
               sqlcmd.Parameters.AddWithValue("@ApprovedUserID", Convert.ToInt32(HttpContext.Current.Session["UserID"]));               
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Approval._iMode);
               sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
               sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
               sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_Approval._FromDate);
               sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_Approval._ToDate);
               sqlcmd.Parameters.AddWithValue("@Closing", obj_bel_Approval._Closing);
               ds = DataFunctions.GetDataSet(sqlcmd);
           }
           catch (Exception ex)
           {


           }
           return ds;

       }
    }
}
