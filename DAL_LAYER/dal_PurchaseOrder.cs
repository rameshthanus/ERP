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
    public  class dal_PurchaseOrder
    {
        int val = 0;
        public DataSet dal_PurchaseOrderDetail(bel_PurchaseOrder obj_bel_PurchaseOrder)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_PurchaseOrderSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@PurchaseOrderID", obj_bel_PurchaseOrder._PurchaseOrderID);
                sqlcmd.Parameters.AddWithValue("@PurchaseOrderDetailID", obj_bel_PurchaseOrder._PurchaseOrderDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@PurchaseOrderNo", obj_bel_PurchaseOrder._PurchaseOrderNo);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_PurchaseOrder._ProductID);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_PurchaseOrder._PartyID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_PurchaseOrder._JOBID);
                sqlcmd.Parameters.AddWithValue("@IndentID", obj_bel_PurchaseOrder._IndentID);              
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_PurchaseOrder._iMode);
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_PurchaseOrder._CategotyID);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_PurchaseOrder._ScreenName);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_PurchaseOrder._ProductCode);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
        public DataSet dal_AutoGen(bel_PurchaseOrder obj_bel_PurchaseOrder)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_PurchaseOrder._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_PurchaseOrder._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_PurchaseOrder._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public int dal_PurchaseOrderInsert(bel_PurchaseOrder obj_bel_PurchaseOrder, DataTable dt)
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

                SqlCommand sqlcmd = new SqlCommand("spu_PurchaseOrderHeader", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if(obj_bel_PurchaseOrder._PurchaseOrderID!=0)
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@PurchaseOrderID", obj_bel_PurchaseOrder._PurchaseOrderID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@PurchaseOrderID", 0);

                }
                sqlcmd.Parameters.AddWithValue("@PurchaseOrderNo", obj_bel_PurchaseOrder._PurchaseOrderNo);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@PurchaseOrderDate", obj_bel_PurchaseOrder._PurchaseOrderDate);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_PurchaseOrder._JOBID);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_PurchaseOrder._PartyID);
                sqlcmd.Parameters.AddWithValue("@IndentID", obj_bel_PurchaseOrder._IndentID);
                sqlcmd.Parameters.AddWithValue("@DeliveryDate", obj_bel_PurchaseOrder._DeliveryDate);
                sqlcmd.Parameters.AddWithValue("@Description", obj_bel_PurchaseOrder._Description);
                sqlcmd.Parameters.AddWithValue("@Remarks", obj_bel_PurchaseOrder._Remarks);
                sqlcmd.Parameters.AddWithValue("@CurrencyID", obj_bel_PurchaseOrder._CurrencyID);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_PurchaseOrder._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_PurchaseOrder._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@DeliveryAt", obj_bel_PurchaseOrder._DeliveryAt);
                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_PurchaseOrder._Status);
                sqlcmd.Parameters.AddWithValue("@ApprovedUserID", obj_bel_PurchaseOrder._ApprovedUserID);
                sqlcmd.Parameters.AddWithValue("@ApprovedStatus", obj_bel_PurchaseOrder._ApprovedStatus);

                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@TotalQty", obj_bel_PurchaseOrder._TotalQty);
                sqlcmd.Parameters.AddWithValue("@TotalAmount", obj_bel_PurchaseOrder._TotalAmount);


                sqlcmd.Parameters["@PurchaseOrderID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@PurchaseOrderID"].Value;
                HttpContext.Current.Session["HeaderID"] = Convert.ToString(val);

                SqlCommand sqlcmd2 = new SqlCommand("spu_PurchaseOrderDetail", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["PurchaseOrderDetailID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        sqlcmd2.Parameters.AddWithValue("@PurchaseOrderID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@PurchaseOrderDetailID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");
                        sqlcmd2.Parameters.AddWithValue("@PurchaseOrderID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@PurchaseOrderDetailID", dt.Rows[i]["PurchaseOrderDetailID"]);

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
