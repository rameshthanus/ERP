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
    public class dal_UserManagement
    {
        int i = 0;
        public DataSet dal_UserManagementdetail(bel_UserManagement obj_bel_User)
        {

            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_UserManagement");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@PriviledgeID", obj_bel_User._PriviledgeID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@UserGroupID", obj_bel_User._UserGroupID);
                sqlcmd.Parameters.AddWithValue("@UserID", obj_bel_User._UserID);
                sqlcmd.Parameters.AddWithValue("@ModulesGroupID", obj_bel_User._ModulesGroupID);
                sqlcmd.Parameters.AddWithValue("@ModulesID", obj_bel_User._ModulesID);
                sqlcmd.Parameters.AddWithValue("@SaveRights", obj_bel_User._SaveRights);
                sqlcmd.Parameters.AddWithValue("@EditRights", obj_bel_User._EditRights);
                sqlcmd.Parameters.AddWithValue("@DeleteRights", obj_bel_User._DeleteRights);
                sqlcmd.Parameters.AddWithValue("@ViewRights", obj_bel_User._ViewRights);
                sqlcmd.Parameters.AddWithValue("@ViewonlyRights", obj_bel_User._ViewOnlyRights);
                sqlcmd.Parameters.AddWithValue("@ReportRights", obj_bel_User._ReportRights);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_User._iMode);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", obj_bel_User._CreatedBy);
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_User._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", obj_bel_User._ModifiedBy);
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_User._ModifiedOn);

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }


        public int dal_UserManagementInsert(bel_UserManagement obj_bel_User, DataTable dt)
        {

            int value;

            int Result = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConn"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlTransaction trn;
            connection.Open();
            trn = connection.BeginTransaction();


            try
            {



                SqlCommand sqlcmd2 = new SqlCommand("spu_UserManagement", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["PriviledgeID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");

                        sqlcmd2.Parameters.AddWithValue("@PriviledgeID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");

                        sqlcmd2.Parameters.AddWithValue("@PriviledgeID", dt.Rows[i]["PriviledgeID"]);

                    }

                    sqlcmd2.Parameters.AddWithValue("@ModulesGroupID", Convert.ToInt32(dt.Rows[i]["ModulesGroupID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@ModulesID", Convert.ToInt32(dt.Rows[i]["ModulesID"].ToString()));

                    if (Convert.ToString(dt.Rows[i]["SaveRights"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@SaveRights", Convert.ToString(dt.Rows[i]["SaveRights"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@SaveRights", "N");
                    }

                    if (Convert.ToString(dt.Rows[i]["EditRights"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@EditRights", Convert.ToString(dt.Rows[i]["EditRights"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@EditRights", "N");
                    }
                    if (Convert.ToString(dt.Rows[i]["DeleteRights"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@DeleteRights", Convert.ToString(dt.Rows[i]["DeleteRights"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@DeleteRights", "N");
                    }

                    if (Convert.ToString(dt.Rows[i]["ViewRights"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@ViewRights", Convert.ToString(dt.Rows[i]["ViewRights"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@ViewRights", "N");
                    }
                    if (Convert.ToString(dt.Rows[i]["ViewonlyRights"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@ViewonlyRights", Convert.ToString(dt.Rows[i]["ViewonlyRights"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@ViewonlyRights", "N");
                    }
                    if (Convert.ToString(dt.Rows[i]["ReportRights"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@ReportRights", Convert.ToString(dt.Rows[i]["ReportRights"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@ReportRights", "N");
                    }



                    sqlcmd2.Parameters.AddWithValue("@UserGroupID", Convert.ToInt32(obj_bel_User._UserGroupID));
                    sqlcmd2.Parameters.AddWithValue("@UserID", Convert.ToInt32(obj_bel_User._UserID));
                    sqlcmd2.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                    sqlcmd2.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                    sqlcmd2.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                    sqlcmd2.Parameters.AddWithValue("@CreatedOn", obj_bel_User._CreatedOn);
                    sqlcmd2.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                    sqlcmd2.Parameters.AddWithValue("@ModifiedOn", obj_bel_User._ModifiedOn);

                    Result = sqlcmd2.ExecuteNonQuery();


                }


                trn.Commit();
                //Dsstockin = DataFunctions.GetDataSet(sqlcmd);

            }
            catch (SqlException ex)
            {
                trn.Rollback();

            }


            connection.Close();
            return Result;

        }
    }
}
