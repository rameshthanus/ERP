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
   public class dal_Quotation
    {
       int val = 0;
        public DataSet dal_ProformaDetail(bel_Quotation  obj_bel_Proforma)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_QuotationSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@QuotationID", obj_bel_Proforma._ProformaID);
                sqlcmd.Parameters.AddWithValue("@QuotationDetailID", obj_bel_Proforma._ProformaDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));              
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_Proforma._ProductID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_Proforma._ProductCode); 
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Proforma._JOBID);                          
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Proforma._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Proforma._ScreenName);               
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_Proforma._CategoryID);
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public DataSet dal_AutoGen(bel_Quotation obj_bel_Proforma)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Proforma._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_Proforma._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_Proforma._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public int dal_ProformaInsert(bel_Quotation obj_bel_Proforma, DataTable dt)
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

                SqlCommand sqlcmd = new SqlCommand("spu_ProformaHeader", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if (obj_bel_Proforma._ProformaID != 0)
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@ProformaID", obj_bel_Proforma._ProformaID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@ProformaID", 0);

                }
                sqlcmd.Parameters.AddWithValue("@ProformaNo", obj_bel_Proforma._ProformaNo);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@ProformaDate", obj_bel_Proforma._ProformaDate);
                sqlcmd.Parameters.AddWithValue("@CustomerID", obj_bel_Proforma._CustomerID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Proforma._JOBID);
                sqlcmd.Parameters.AddWithValue("@PONo", obj_bel_Proforma._PONo);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Proforma._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Proforma._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@PoDate", obj_bel_Proforma._PoDate);
                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_Proforma._Status);
                sqlcmd.Parameters.AddWithValue("@CurrencyID", obj_bel_Proforma._CurrencyID);
                sqlcmd.Parameters.AddWithValue("@DeliveryDate", obj_bel_Proforma._DeliveryDate);
                sqlcmd.Parameters.AddWithValue("@CountryID", obj_bel_Proforma._CountryID);
                sqlcmd.Parameters.AddWithValue("@DeliveryTermID", obj_bel_Proforma._DeliveryTermID);
                sqlcmd.Parameters.AddWithValue("@PaymentTermID", obj_bel_Proforma._PaymentTermID);
                sqlcmd.Parameters.AddWithValue("@PriceTermID", obj_bel_Proforma._PriceTermID);
                sqlcmd.Parameters.AddWithValue("@PortofDestinationID", obj_bel_Proforma._PortofDestinationID);
                sqlcmd.Parameters.AddWithValue("@DescriptionofGoods", obj_bel_Proforma._DescriptionofGoods);
                sqlcmd.Parameters.AddWithValue("@TotalQty", obj_bel_Proforma._TotalQty);
                sqlcmd.Parameters.AddWithValue("@TotalAmount", obj_bel_Proforma._TotalAmount);
                sqlcmd.Parameters.AddWithValue("@BankID", obj_bel_Proforma._BankID);
                sqlcmd.Parameters.AddWithValue("@PortofLoadingID", obj_bel_Proforma._PortofLoadingID);
                sqlcmd.Parameters.AddWithValue("@Discount", obj_bel_Proforma._Discount);
                sqlcmd.Parameters.AddWithValue("@Commission", obj_bel_Proforma._Commission);
                sqlcmd.Parameters.AddWithValue("@Certificate", obj_bel_Proforma._Certificate);
                sqlcmd.Parameters.AddWithValue("@Packing", obj_bel_Proforma._Packing);
                sqlcmd.Parameters.AddWithValue("@QtywithUOM", obj_bel_Proforma._QTYWithUOM);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                
                sqlcmd.Parameters["@ProformaID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@ProformaID"].Value;
                HttpContext.Current.Session["HeaderID"] = Convert.ToString(val);

                SqlCommand sqlcmd2 = new SqlCommand("spu_ProformaDetail", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["ProformaDetailID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        sqlcmd2.Parameters.AddWithValue("@ProformaID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@ProformaDetailID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");
                        sqlcmd2.Parameters.AddWithValue("@ProformaID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@ProformaDetailID", dt.Rows[i]["ProformaDetailID"]);

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


                    if (Convert.ToString(dt.Rows[i]["QtyPcs"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@QtyPcs", Convert.ToDecimal(dt.Rows[i]["QtyPcs"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@QtyPcs", 0);
                    }


                    if (Convert.ToString(dt.Rows[i]["TotalQty"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@TotalQty", Convert.ToDecimal(dt.Rows[i]["TotalQty"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@TotalQty", 0);
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

                    if (Convert.ToString(dt.Rows[i]["BuyerRef"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@BuyerRef", Convert.ToString(dt.Rows[i]["BuyerRef"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@BuyerRef", string.Empty);
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
            catch (DBConcurrencyException ex)
            {
                throw (ex);

                // Add business logic code to resolve the concurrency violation...
            }

            catch (SqlException ex)
            {
                trn.Rollback();
                throw (ex);

            }


            connection.Close();
            return Result;

        }

      
    }
}
