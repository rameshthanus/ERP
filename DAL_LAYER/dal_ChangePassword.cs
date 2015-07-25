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
   public class dal_ChangePassword
    {
       public DataSet dal_ChangePasswordDetail(bel_ChangePassword obj_bel_Password)
       {

           DataSet ds = new DataSet();
           try
           {

               SqlCommand sqlcmd = new SqlCommand("spu_ChangePassword");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@UserGroupID", Convert.ToInt32(HttpContext.Current.Session["UserGroupID"]));
               sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Password._iMode);
               sqlcmd.Parameters.AddWithValue("@LoginPassword", obj_bel_Password._LoginPassword);
               sqlcmd.Parameters.AddWithValue("@NewPassword", obj_bel_Password._NewPassword);
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
