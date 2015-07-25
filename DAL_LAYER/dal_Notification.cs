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
    public class dal_Notification
    {
        public DataSet dal_NotificationHeader(bel_Notification obj_bel_Notification)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_NotificationHeader");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@Notrification_ID", obj_bel_Notification._NotificationID);
                sqlcmd.Parameters.AddWithValue("@Type", obj_bel_Notification._Type);
                sqlcmd.Parameters.AddWithValue("@Date", obj_bel_Notification._NotificationDate);
                sqlcmd.Parameters.AddWithValue("@ShortDescription", obj_bel_Notification._shrtdescription);
                sqlcmd.Parameters.AddWithValue("@Description", obj_bel_Notification._description);
                sqlcmd.Parameters.AddWithValue("@UserGroupID", obj_bel_Notification._UsergroupID);
                sqlcmd.Parameters.AddWithValue("@UserID", obj_bel_Notification._UserID);
                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_Notification._Status);
                sqlcmd.Parameters.AddWithValue("@BranchID", obj_bel_Notification._BranchID);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Notification._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Notification._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Notification._iMode);                
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }        
    }
}
