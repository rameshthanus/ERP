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
   public class dal_AccPeriod
    {
       public DataSet dal_AccPeriodDetail(bel_AccPeriod obj_bel_AccPeriod)
       {
           DataSet ds = new DataSet();
           try
           {
               SqlCommand sqlcmd = new SqlCommand("spu_AccountsPeriod");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@AccountsPeriodID", obj_bel_AccPeriod._AccountsPeriodID);
               sqlcmd.Parameters.AddWithValue("@Year", obj_bel_AccPeriod._Year);
               sqlcmd.Parameters.AddWithValue("@Period", obj_bel_AccPeriod._Period);
               sqlcmd.Parameters.AddWithValue("@StartDate", obj_bel_AccPeriod._StartDate);
               sqlcmd.Parameters.AddWithValue("@EndDate", obj_bel_AccPeriod._EndDate);
               sqlcmd.Parameters.AddWithValue("@CloseStatus", obj_bel_AccPeriod._CloseStatus);
               sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_AccPeriod._CreatedOn);
               sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_AccPeriod._ModifiedOn);
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_AccPeriod._iMode);              
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
