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
   public class dal_Errorlog
    {
       public DataSet dal_ErrorLogDetail(bel_ErrorLog obj_bel_Error)
       {

           DataSet ds = new DataSet();
           try
           {
               SqlCommand sqlcmd = new SqlCommand("spu_ErrorLog");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@ErrorlogDate", obj_bel_Error._ErrorlogDate);
               sqlcmd.Parameters.AddWithValue("@ErrorMessage", obj_bel_Error._ErrorMessage);
               sqlcmd.Parameters.AddWithValue("@FunctionName", obj_bel_Error._FunctionName);
               sqlcmd.Parameters.AddWithValue("@ErrorLIne", obj_bel_Error._ErrorLIne);
               sqlcmd.Parameters.AddWithValue("@PageName", obj_bel_Error._PageName);
               sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_Error._FromDate);
               sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_Error._ToDate);
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Error._iMode);
               sqlcmd.Parameters.AddWithValue("@BranchID",  Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
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
