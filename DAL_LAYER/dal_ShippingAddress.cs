using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using StepOne_Object;
using BEL_LAYER;
using System.Web.SessionState;
using System.Web;

namespace DAL_LAYER
{
   public class dal_ShippingAddress
    {
        public DataSet dal_ShippingDetail(bel_ShippingAddress obj_bel_Shipping)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_ShippingAddress");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ShippingAddressID", obj_bel_Shipping._ShippingAddressID);
                sqlcmd.Parameters.AddWithValue("@Code", obj_bel_Shipping._Code);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_Shipping._PartyID);
                sqlcmd.Parameters.AddWithValue("@Address1", obj_bel_Shipping._Address1);
                sqlcmd.Parameters.AddWithValue("@Address2", obj_bel_Shipping._Address2);
                sqlcmd.Parameters.AddWithValue("@City", obj_bel_Shipping._City);
                sqlcmd.Parameters.AddWithValue("@State", obj_bel_Shipping._State);
                sqlcmd.Parameters.AddWithValue("@Country", obj_bel_Shipping._Country);
                sqlcmd.Parameters.AddWithValue("@Zipcode", obj_bel_Shipping._Zipcode);
                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_Shipping._State);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Shipping._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Shipping._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Shipping._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Shipping._screenName);
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
