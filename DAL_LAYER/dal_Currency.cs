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
    public class dal_Currency
    {
        public DataSet dal_CurrencyDetail(bel_Currency obj_bel_Currency)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_Currency");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@CurrencyID", obj_bel_Currency._CurrencyID);
                sqlcmd.Parameters.AddWithValue("@CurrencyCode", obj_bel_Currency._CurrencyCode);
                sqlcmd.Parameters.AddWithValue("@CurrencyName", obj_bel_Currency._CurrencyName);
                sqlcmd.Parameters.AddWithValue("@CurrencyStatus", obj_bel_Currency._CurrencyStatus);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Currency._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Currency._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Currency._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Currency._screenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@Currency", obj_bel_Currency._Currency);
                sqlcmd.Parameters.AddWithValue("@CentsName", obj_bel_Currency._CentsName);
                sqlcmd.Parameters.AddWithValue("@ExRate", obj_bel_Currency._ExRate);

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
        public DataSet dal_AutoGenCurrency(bel_Currency obj_bel_Currency)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenMaster");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@screenName", obj_bel_Currency._screenName);


                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

    }
}
