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
   public class dal_GTN
    {
        int val = 0;
        public DataSet dal_GTNDetail(bel_GTN obj_bel_GTN)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_GTNSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@GTNID", obj_bel_GTN._GTNID);
                sqlcmd.Parameters.AddWithValue("@GTNDetailID", obj_bel_GTN._GTNDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));       
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_GTN._ProductID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_GTN._ProductCode);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_GTN._JOBID);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_GTN._ScreenName);                
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_GTN._iMode);
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_GTN._CategoryID);
               
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public DataSet dal_AutoGen(bel_GTN obj_bel_GTN)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_GTN._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_GTN._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_GTN._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public int dal_GTNInsert(bel_GTN obj_bel_GTN, DataTable dt)
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

                SqlCommand sqlcmd = new SqlCommand("spu_GTNHeader", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if (obj_bel_GTN._GTNID != 0)
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@GTNID", obj_bel_GTN._GTNID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@GTNID", 0);

                }
                sqlcmd.Parameters.AddWithValue("@GTNNo", obj_bel_GTN._GTNNo);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@GTNDate", obj_bel_GTN._GTNDate);

             //   sqlcmd.Parameters.AddWithValue("@FromJOBID", obj_bel_GTN._FromJOBID);
                sqlcmd.Parameters.AddWithValue("@ToJOBID", obj_bel_GTN._ToJOBID);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_GTN._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_GTN._ModifiedOn);

                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_GTN._Status);

              
                sqlcmd.Parameters.AddWithValue("@Remarks", obj_bel_GTN._Remarks);

                sqlcmd.Parameters.AddWithValue("@ToWareHouseID", obj_bel_GTN._ToWareHouseID);
                sqlcmd.Parameters.AddWithValue("@FromWareHouseID", obj_bel_GTN._FromWareHouseID);
               
                sqlcmd.Parameters.AddWithValue("@TotalQty", obj_bel_GTN._TotalQty);
                sqlcmd.Parameters.AddWithValue("@TotalAmount", obj_bel_GTN._TotalAmount);

                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));

                sqlcmd.Parameters["@GTNID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@GTNID"].Value;
                HttpContext.Current.Session["HeaderID"] = Convert.ToString(val);

                SqlCommand sqlcmd2 = new SqlCommand("spu_GTNDetail", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["GTNDetailID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        sqlcmd2.Parameters.AddWithValue("@GTNID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@GTNDetailID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");
                        sqlcmd2.Parameters.AddWithValue("@GTNID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@GTNDetailID", dt.Rows[i]["GTNDetailID"]);

                    }


                    sqlcmd2.Parameters.AddWithValue("@ProductGroupID", Convert.ToInt32(dt.Rows[i]["ProductGroupID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@ProductID", Convert.ToInt32(dt.Rows[i]["ProductID"].ToString()));




                    if (Convert.ToString(dt.Rows[i]["Qty"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Qty", Convert.ToDecimal(dt.Rows[i]["Qty"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@Qty", 0);
                    }




                    if (Convert.ToString(dt.Rows[i]["Rate"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Rate", Convert.ToDecimal(dt.Rows[i]["Rate"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@Rate", 0);
                    }

                    if (Convert.ToString(dt.Rows[i]["Amount"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Amount", Convert.ToDecimal(dt.Rows[i]["Amount"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@Amount", 0);
                    }


                    sqlcmd2.Parameters.AddWithValue("@DesignID", Convert.ToInt32(dt.Rows[i]["DesignID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@SizeID", Convert.ToInt32(dt.Rows[i]["SizeID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@ColorID", Convert.ToInt32(dt.Rows[i]["ColorID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@CategoryID", Convert.ToInt32(dt.Rows[i]["CategoryID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@QualityID", Convert.ToInt32(dt.Rows[i]["QualityID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@UOMID", Convert.ToInt32(dt.Rows[i]["UOMID"].ToString()));

                   


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
