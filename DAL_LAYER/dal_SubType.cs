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
    public class dal_SubType
    {
        public DataSet dal_SubTypeDetail(bel_SubType obj_bel_SubType)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_SubType");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@SubTypeID", obj_bel_SubType._SubTypeID);
                sqlcmd.Parameters.AddWithValue("@SubType", obj_bel_SubType._SubType);
                sqlcmd.Parameters.AddWithValue("@Description", obj_bel_SubType._Description);
                sqlcmd.Parameters.AddWithValue("@SubTypeStatus", obj_bel_SubType._SubTypeStatus);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_SubType._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_SubType._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_SubType._iMode);                
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
