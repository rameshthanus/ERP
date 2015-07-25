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
   public class dal_Comsumption
    {
        int val = 0;
        public DataSet dal_ConsumptionDetail(bel_Consumption obj_bel_Consumption)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_ConsumptionSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ComsumptionID", obj_bel_Consumption._ComsumptionID);
                sqlcmd.Parameters.AddWithValue("@ConsumptionDetailID", obj_bel_Consumption._ConsumptionDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));               
                sqlcmd.Parameters.AddWithValue("@ConsumptionNo", obj_bel_Consumption._ConsumptionNo);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_Consumption._ProductID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_Consumption._ProductCode);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_Consumption._PartyID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Consumption._JOBID);
                sqlcmd.Parameters.AddWithValue("@BillFromDate", obj_bel_Consumption._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@BillToDate", obj_bel_Consumption._BillToDate);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Consumption._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Consumption._ScreenName);
                sqlcmd.Parameters.AddWithValue("@ProformaID", obj_bel_Consumption._ProformaID);  
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public DataSet dal_AutoGen(bel_Consumption obj_bel_Consumption)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Consumption._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_Consumption._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_Consumption._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public int dal_ConsumptionInsert(bel_Consumption obj_bel_Consumption, DataTable dt)
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

                SqlCommand sqlcmd = new SqlCommand("spu_ConsumptionHeader", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if (obj_bel_Consumption._ComsumptionID != 0)
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@ComsumptionID", obj_bel_Consumption._ComsumptionID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@ComsumptionID", 0);

                }
                sqlcmd.Parameters.AddWithValue("@ConsumptionNo", obj_bel_Consumption._ConsumptionNo);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@ConsumptionDate", obj_bel_Consumption._ConsumptionDate);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_Consumption._PartyID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Consumption._JOBID);
                
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Consumption._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Consumption._ModifiedOn);
               
                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_Consumption._Status);

                sqlcmd.Parameters.AddWithValue("@TotalQty", obj_bel_Consumption._TotalQty);
                sqlcmd.Parameters.AddWithValue("@TotalReqmtr", obj_bel_Consumption._TotalReqmtr);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters["@ComsumptionID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@ComsumptionID"].Value;
                HttpContext.Current.Session["HeaderID"] = Convert.ToString(val);

                SqlCommand sqlcmd2 = new SqlCommand("spu_ConsumptionDetail", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["ConsumptionDetailID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        sqlcmd2.Parameters.AddWithValue("@ComsumptionID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@ConsumptionDetailID", 0);
                        

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");
                        sqlcmd2.Parameters.AddWithValue("@ComsumptionID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@ConsumptionDetailID", dt.Rows[i]["ConsumptionDetailID"]);
                       

                    }


                    sqlcmd2.Parameters.AddWithValue("@ReceivableProductGroupID", Convert.ToInt32(dt.Rows[i]["ReceivableProductGroupID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@ReceivableProductID", Convert.ToInt32(dt.Rows[i]["ReceivableProductID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@ReceivableDesignID", Convert.ToInt32(dt.Rows[i]["ReceivableDesignID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@ReceivableSizeID", Convert.ToInt32(dt.Rows[i]["ReceivableSizeID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@ReceivableColorID", Convert.ToInt32(dt.Rows[i]["ReceivableColorID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@ReceivableCategoryID", Convert.ToInt32(dt.Rows[i]["ReceivableCategoryID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@ReceivableQualityID", Convert.ToInt32(dt.Rows[i]["ReceivableQualityID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@ReceivableUOMID", Convert.ToInt32(dt.Rows[i]["ReceivableUOMID"].ToString()));
                   

                    if (Convert.ToString(dt.Rows[i]["ReceivableOrderQty"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@ReceivableOrderQty", Convert.ToDecimal(dt.Rows[i]["ReceivableOrderQty"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@ReceivableOrderQty", 0);
                    }

                    sqlcmd2.Parameters.AddWithValue("@DeliverableProductGroupID", Convert.ToInt32(dt.Rows[i]["DeliverableProductGroupID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@DeliverableProductID", Convert.ToInt32(dt.Rows[i]["DeliverableProductID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@DeliverableDesignID", Convert.ToInt32(dt.Rows[i]["DeliverableDesignID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@DeliverableSizeID", Convert.ToInt32(dt.Rows[i]["DeliverableSizeID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@DeliverableColorID", Convert.ToInt32(dt.Rows[i]["DeliverableColorID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@DeliverableCategoryID", Convert.ToInt32(dt.Rows[i]["DeliverableCategoryID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@DeliverableQualityID", Convert.ToInt32(dt.Rows[i]["DeliverableQualityID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@DeliverableUOMID", Convert.ToInt32(dt.Rows[i]["DeliverableUOMID"].ToString()));


                    if (Convert.ToString(dt.Rows[i]["Consumption"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Consumption", Convert.ToDecimal(dt.Rows[i]["Consumption"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@Consumption", 0);
                    }


                    if (Convert.ToString(dt.Rows[i]["Excess"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Excess", Convert.ToDecimal(dt.Rows[i]["Excess"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@ExecssValue", 0);
                    }
                    if (Convert.ToString(dt.Rows[i]["ExecssValue"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@ExecssValue", Convert.ToDecimal(dt.Rows[i]["ExecssValue"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@ExecssValue", 0);
                    }

                    if (Convert.ToString(dt.Rows[i]["DeliverableOrderQty"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@DeliverableOrderQty", Convert.ToDecimal(dt.Rows[i]["DeliverableOrderQty"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@DeliverableOrderQty", 0);
                    }


                    if (Convert.ToString(dt.Rows[i]["ReqPcs"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@ReqPcs", Convert.ToDecimal(dt.Rows[i]["ReqPcs"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@ReqPcs", 0);
                    }

                   

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
