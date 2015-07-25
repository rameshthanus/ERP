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
   public class dal_LoginHistory
    {
       public DataSet dal_LoginHistoryDetail(bel_LoginHistory obj_bel_Login)
       {

           DataSet ds = new DataSet();
           try
           {
               SqlCommand sqlcmd = new SqlCommand("spu_LoginHistory");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@LoginistoryID", obj_bel_Login._LoginistoryID);               
               sqlcmd.Parameters.AddWithValue("@LoginHistoryDate", obj_bel_Login._LoginHistoryDate);
               sqlcmd.Parameters.AddWithValue("@UserGroupID", Convert.ToInt32(HttpContext.Current.Session["UserGroupID"]));               
               sqlcmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@Status", obj_bel_Login._Status);
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Login._iMode);
               sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
               sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
               ds = DataFunctions.GetDataSet(sqlcmd);
           }
           catch (Exception ex)
           {


           }
           return ds;

       }
    }
}
