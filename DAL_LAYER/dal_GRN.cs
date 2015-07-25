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
   public class dal_GRN
    {
        int val = 0;
        public DataSet dal_GRNDetail(bel_GRN obj_bel_GRN)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_GRNSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@GRNID", obj_bel_GRN._GRNID);
                sqlcmd.Parameters.AddWithValue("@GRNDetailID", obj_bel_GRN._GRNDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@GRNNo", obj_bel_GRN._GRNNo);
                //sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_GRN._ProductID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_GRN._ProductCode);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_GRN._PartyID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_GRN._JOBID);
              //  sqlcmd.Parameters.AddWithValue("@BillFromDate", obj_bel_GRN._BillFromDate);
              //  sqlcmd.Parameters.AddWithValue("@BillToDate", obj_bel_GRN._BillToDate);
                
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_GRN._ScreenName);
               
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@OrderID", obj_bel_GRN._OrderID);
             //   sqlcmd.Parameters.AddWithValue("@Type", obj_bel_GRN._Type);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_GRN._iMode);
                //sqlcmd.Parameters.AddWithValue("@ToWarehouseID", obj_bel_GRN._ToWareHouseID);
                //sqlcmd.Parameters.AddWithValue("@FromWarehouseID", obj_bel_GRN._FromWareHouseID);
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_GRN._CategoryID);
              //  sqlcmd.Parameters.AddWithValue("@InvoiceNo", obj_bel_GRN._InvoiceNo);
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public DataSet dal_AutoGen(bel_GRN obj_bel_GRN)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_GRN._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_GRN._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_GRN._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public int dal_GRNInsert(bel_GRN obj_bel_GRN, DataTable dt)
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

                SqlCommand sqlcmd = new SqlCommand("spu_GRNHeader", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if (obj_bel_GRN._GRNID != 0)
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@GRNID", obj_bel_GRN._GRNID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@GRNID", 0);

                }
                sqlcmd.Parameters.AddWithValue("@GRNNo", obj_bel_GRN._GRNNo);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@GRNDate", obj_bel_GRN._GRNDate);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_GRN._PartyID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_GRN._JOBID);

                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_GRN._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_GRN._ModifiedOn);

                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_GRN._Status);

                sqlcmd.Parameters.AddWithValue("@Through", obj_bel_GRN._Through);
                sqlcmd.Parameters.AddWithValue("@Remarks", obj_bel_GRN._Remarks);
                sqlcmd.Parameters.AddWithValue("@OrderID", obj_bel_GRN._OrderID);
                sqlcmd.Parameters.AddWithValue("@ToWareHouseID", obj_bel_GRN._ToWareHouseID);
                sqlcmd.Parameters.AddWithValue("@FromWareHouseID", obj_bel_GRN._FromWareHouseID);
                sqlcmd.Parameters.AddWithValue("@Type", obj_bel_GRN._Type);
                sqlcmd.Parameters.AddWithValue("@TotalQty", obj_bel_GRN._TotalQty);
                sqlcmd.Parameters.AddWithValue("@TotalAmount", obj_bel_GRN._TotalAmount);
                sqlcmd.Parameters.AddWithValue("@InvoiceNo", obj_bel_GRN._InvoiceNo);
                sqlcmd.Parameters.AddWithValue("@InvoiceDate", obj_bel_GRN._InvoiceDate);
                sqlcmd.Parameters.AddWithValue("@FromBranchID", obj_bel_GRN._FromBranchID);
                sqlcmd.Parameters.AddWithValue("@DCNo", obj_bel_GRN._DCNo);

                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters["@GRNID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@GRNID"].Value;
                HttpContext.Current.Session["HeaderID"] = Convert.ToString(val);

                SqlCommand sqlcmd2 = new SqlCommand("spu_GRNDetail", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["GRNDetailID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        sqlcmd2.Parameters.AddWithValue("@GRNID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@GRNDetailID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");
                        sqlcmd2.Parameters.AddWithValue("@GRNID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@GRNDetailID", dt.Rows[i]["GRNDetailID"]);

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
