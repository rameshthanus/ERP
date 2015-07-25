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
   public class dal_GDN
    {
        int val = 0;
        public DataSet dal_GDNDetail(bel_GDN obj_bel_GDN)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_GDNSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@GDNID", obj_bel_GDN._GDNID);
                sqlcmd.Parameters.AddWithValue("@GDNDetailID", obj_bel_GDN._GDNDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@GDNNo", obj_bel_GDN._GDNNo);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_GDN._ProductID);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_GDN._PartyID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_GDN._JOBID);
                sqlcmd.Parameters.AddWithValue("@BillFromDate", obj_bel_GDN._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@BillToDate", obj_bel_GDN._BillToDate);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_GDN._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_GDN._ScreenName);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_GDN._ProductCode);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@OrderID", obj_bel_GDN._OrderID);
                sqlcmd.Parameters.AddWithValue("@Type", obj_bel_GDN._Type);
                sqlcmd.Parameters.AddWithValue("@ToWarehouseID", obj_bel_GDN._WareHouseID);
                sqlcmd.Parameters.AddWithValue("@FromWarehouseID", obj_bel_GDN._FromWareHouseID);
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public DataSet dal_AutoGen(bel_GDN obj_bel_GDN)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_GDN._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_GDN._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_GDN._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));


                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public int dal_GDNInsert(bel_GDN obj_bel_GDN, DataTable dt)
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

                SqlCommand sqlcmd = new SqlCommand("spu_GDNHeader", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if (obj_bel_GDN._GDNID != 0)
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@GDNID", obj_bel_GDN._GDNID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@GDNID", 0);

                }
                sqlcmd.Parameters.AddWithValue("@GDNNo", obj_bel_GDN._GDNNo);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@GDNDate", obj_bel_GDN._GDNDate);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_GDN._PartyID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_GDN._JOBID);
                
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_GDN._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_GDN._ModifiedOn);
                
                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_GDN._Status);

                sqlcmd.Parameters.AddWithValue("@Through", obj_bel_GDN._Through);
                sqlcmd.Parameters.AddWithValue("@Remarks", obj_bel_GDN._Remarks);
                sqlcmd.Parameters.AddWithValue("@OrderID", obj_bel_GDN._OrderID);
                sqlcmd.Parameters.AddWithValue("@WareHouseID", obj_bel_GDN._WareHouseID);
                sqlcmd.Parameters.AddWithValue("@FromWareHouseID", obj_bel_GDN._FromWareHouseID);
                sqlcmd.Parameters.AddWithValue("@Type", obj_bel_GDN._Type);
                sqlcmd.Parameters.AddWithValue("@TotalQty", obj_bel_GDN._TotalQty);
                sqlcmd.Parameters.AddWithValue("@TotalAmount", obj_bel_GDN._TotalAmount);
                sqlcmd.Parameters.AddWithValue("@ToBranchID", obj_bel_GDN._ToBranchID);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));

                sqlcmd.Parameters["@GDNID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@GDNID"].Value;
                HttpContext.Current.Session["HeaderID"] = Convert.ToString(val);

                SqlCommand sqlcmd2 = new SqlCommand("spu_GDNDetail", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["GDNDetailID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        sqlcmd2.Parameters.AddWithValue("@GDNID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@GDNDetailID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");
                        sqlcmd2.Parameters.AddWithValue("@GDNID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@GDNDetailID", dt.Rows[i]["GDNDetailID"]);

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

                    sqlcmd2.Parameters.AddWithValue("@Weight", Convert.ToDecimal(dt.Rows[i]["Weight"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@Description", Convert.ToString(dt.Rows[i]["Description"]));
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
