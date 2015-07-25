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
   public class dal_Authorization
    {
       public DataSet dal_Authorizationdetail(bel_Authorization obj_bel_Autho)
       {

           DataSet ds = new DataSet();
           try
           {
               SqlCommand sqlcmd = new SqlCommand("spu_Authorization");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Autho._iMode);
               sqlcmd.Parameters.AddWithValue("@UserGroupID", Convert.ToInt32(HttpContext.Current.Session["UserGroupID"]));
               sqlcmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
               sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Autho._ScreenName);



               ds = DataFunctions.GetDataSet(sqlcmd);
           }
           catch (Exception ex)
           {


           }
           return ds;

       }
    }
}
