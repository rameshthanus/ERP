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
    public class dal_Branch
    {
        public DataSet dal_Branchdetail(bel_Branch obj_bel_Branch)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_Branch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Branch._iMode);
                sqlcmd.Parameters.AddWithValue("@BranchID", obj_bel_Branch._BranchID);
                sqlcmd.Parameters.AddWithValue("@BranchCode", obj_bel_Branch._BranchCode);
                sqlcmd.Parameters.AddWithValue("@BranchName", obj_bel_Branch._BranchName);
                sqlcmd.Parameters.AddWithValue("@Address1", obj_bel_Branch._Address1);
                sqlcmd.Parameters.AddWithValue("@Address2", obj_bel_Branch._Address2);
                sqlcmd.Parameters.AddWithValue("@Address3", obj_bel_Branch._Address3);
                sqlcmd.Parameters.AddWithValue("@City", obj_bel_Branch._City);
                sqlcmd.Parameters.AddWithValue("@State", obj_bel_Branch._State);
                sqlcmd.Parameters.AddWithValue("@Country", obj_bel_Branch._Country);
                sqlcmd.Parameters.AddWithValue("@PostalCode", obj_bel_Branch._PostalCode);
                sqlcmd.Parameters.AddWithValue("@PhoneNumber", obj_bel_Branch._PhoneNumber);
                sqlcmd.Parameters.AddWithValue("@Email", obj_bel_Branch._Email);
                sqlcmd.Parameters.AddWithValue("@ContactPerson", obj_bel_Branch._ContactPerson);
                sqlcmd.Parameters.AddWithValue("@BranchStatus", obj_bel_Branch._BranchStatus);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", obj_bel_Branch._CreatedBy);
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Branch._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", obj_bel_Branch._ModifiedBy);
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Branch._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Branch._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception es)
            {

            }
            return ds;
        }
        public DataSet dal_AutoGenBranch(bel_Branch obj_bel_Branch)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenMaster");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@screenName", obj_bel_Branch._ScreenName);


                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
