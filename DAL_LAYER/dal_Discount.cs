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
   public class dal_Discount
    {
       public DataSet dal_DiscountDetail(bel_Discount obj_bel_Discount)
       {
           DataSet ds = new DataSet();
           try
           {

               SqlCommand sqlcmd = new SqlCommand("spu_Discount");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@DiscountID", obj_bel_Discount._DiscountID);
               sqlcmd.Parameters.AddWithValue("@DiscountCode", obj_bel_Discount._DiscountCode);
               sqlcmd.Parameters.AddWithValue("@DiscountName", obj_bel_Discount._DiscountName);
               sqlcmd.Parameters.AddWithValue("@DiscountValue", obj_bel_Discount._DiscountValue);
               sqlcmd.Parameters.AddWithValue("@DiscountStatus", obj_bel_Discount._DiscountStatus);
               sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Discount._CreatedOn);
               sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Discount._ModifiedOn);
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Discount._iMode);
               sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Discount._screenName);
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
