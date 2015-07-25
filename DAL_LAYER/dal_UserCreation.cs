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
    public class dal_UserCreation
    {
        public DataSet dal_UserCreationdetail(bel_UserCreation obj_bel_UserCreation)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_UserCreation");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_UserCreation._iMode);
                sqlcmd.Parameters.AddWithValue("@UserID", obj_bel_UserCreation._UserID);
                sqlcmd.Parameters.AddWithValue("@UserName", obj_bel_UserCreation._UserName);
                sqlcmd.Parameters.AddWithValue("@Password", obj_bel_UserCreation._Password);
               
                sqlcmd.Parameters.AddWithValue("@UserGroupID", obj_bel_UserCreation._UserGroupID);
             
                sqlcmd.Parameters.AddWithValue("@Email", obj_bel_UserCreation._Email);
               
                sqlcmd.Parameters.AddWithValue("@UserStatus", obj_bel_UserCreation._UserStatus);
                sqlcmd.Parameters.AddWithValue("@AdminStatus", obj_bel_UserCreation._AdminStatus);
                sqlcmd.Parameters.AddWithValue("@SuperAdminStatus", obj_bel_UserCreation._SuperAdminStatus);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_UserCreation._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_UserCreation._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_UserCreation._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception es)
            {

            }
            return ds;
        }
    }
}
