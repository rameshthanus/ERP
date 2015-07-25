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
   public class dal_Tax
    {
       public DataSet dal_TAXDetail(bel_Tax obj_bel_TAX)
       {
           DataSet ds = new DataSet();
           try
           {

               SqlCommand sqlcmd = new SqlCommand("spu_TAX");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@TAXID", obj_bel_TAX._TAXID);
               sqlcmd.Parameters.AddWithValue("@TaxName", obj_bel_TAX._TaxName);
               sqlcmd.Parameters.AddWithValue("@TAXCode", obj_bel_TAX._TAXCode);
               sqlcmd.Parameters.AddWithValue("@TaxValue", obj_bel_TAX._TaxValue);
               sqlcmd.Parameters.AddWithValue("@TaxStatus", obj_bel_TAX._TaxStatus);
               sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_TAX._CreatedOn);
               sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
               sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_TAX._ModifiedOn);
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_TAX._iMode);
               sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_TAX._screenName);
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
