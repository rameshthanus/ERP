using System;
using System.Collections.Generic;
using System.Linq;
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
    public class dal_Customer
    {
        public DataSet dal_Customerdetail(bel_Customer obj_bel_Customer)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_Party");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Customer._iMode);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_Customer._PartyID);
                sqlcmd.Parameters.AddWithValue("@PartyCode", obj_bel_Customer._PartyCode);
                sqlcmd.Parameters.AddWithValue("@PartyName", obj_bel_Customer._PartyName);
                sqlcmd.Parameters.AddWithValue("@Type", obj_bel_Customer._Type);
                sqlcmd.Parameters.AddWithValue("@Address1", obj_bel_Customer._Address1);
                sqlcmd.Parameters.AddWithValue("@Address2", obj_bel_Customer._Address2);
                sqlcmd.Parameters.AddWithValue("@Address3", obj_bel_Customer._Address3);
                sqlcmd.Parameters.AddWithValue("@City", obj_bel_Customer._City);
                sqlcmd.Parameters.AddWithValue("@State", obj_bel_Customer._State);
                sqlcmd.Parameters.AddWithValue("@CountryID", obj_bel_Customer._CountryID);
                sqlcmd.Parameters.AddWithValue("@PostalCode", obj_bel_Customer._PostalCode);
                sqlcmd.Parameters.AddWithValue("@PhoneNumber", obj_bel_Customer._PhoneNumber);
                sqlcmd.Parameters.AddWithValue("@Email", obj_bel_Customer._Email);
                sqlcmd.Parameters.AddWithValue("@PAN", obj_bel_Customer._PAN);
                sqlcmd.Parameters.AddWithValue("@CST", obj_bel_Customer._CST);
               // sqlcmd.Parameters.AddWithValue("@TIN", obj_bel_Customer._TIN);
                sqlcmd.Parameters.AddWithValue("@ContactPerson", obj_bel_Customer._ContactPerson);
                sqlcmd.Parameters.AddWithValue("@CustomerStatus", obj_bel_Customer._CustomerStatus);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", obj_bel_Customer._CreatedBy);
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Customer._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", obj_bel_Customer._ModifiedBy);
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Customer._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Customer._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception es)
            {

            }
            return ds;
        }

        public DataSet dal_AutoGenCustomer(bel_Customer obj_bel_Customer)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenMaster");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@screenName", obj_bel_Customer._ScreenName);


                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
