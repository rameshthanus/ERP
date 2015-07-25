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
   public class dal_PackingList
    {
        int val = 0;
        public DataSet dal_PackingListDetail(bel_PackingList obj_bel_Packing)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_PackingListSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@PackingListID", obj_bel_Packing._PackingListID);
                sqlcmd.Parameters.AddWithValue("@PackingDetailID", obj_bel_Packing._PackingDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@InvoiceNo", obj_bel_Packing._InvoiceNo);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_Packing._ProductID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Packing._JOBID);
                sqlcmd.Parameters.AddWithValue("@BillFromDate", obj_bel_Packing._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@BillToDate", obj_bel_Packing._BillToDate);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Packing._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Packing._ScreenName);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_Packing._ProductCode);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@PartyID", Convert.ToInt32(obj_bel_Packing._PartyID));
                

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public DataSet dal_AutoGen(bel_PackingList obj_bel_Packing)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Packing._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_Packing._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_Packing._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public int dal_PackingListInsert(bel_PackingList obj_bel_Packing, DataTable dt)
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

                SqlCommand sqlcmd = new SqlCommand("spu_PackingListHeader", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if (obj_bel_Packing._PackingListID != 0)
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@PackingListID", obj_bel_Packing._PackingListID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@PackingListID", 0);

                }
                sqlcmd.Parameters.AddWithValue("@InvoiceNo", obj_bel_Packing._InvoiceNo);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@InvoiceDate", obj_bel_Packing._InvoiceDate);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Packing._JOBID);
                sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_Packing._PartyID);
                sqlcmd.Parameters.AddWithValue("@BuyerOrderNo", obj_bel_Packing._BuyerOrderNo);
                sqlcmd.Parameters.AddWithValue("@BuyerOrderDate", obj_bel_Packing._BuyerOrderDate);
                sqlcmd.Parameters.AddWithValue("@OtherRef", obj_bel_Packing._OtherRef);
                sqlcmd.Parameters.AddWithValue("@OrginCountryID", obj_bel_Packing._OrginCountryID);
                sqlcmd.Parameters.AddWithValue("@FinalCountryID", obj_bel_Packing._FinalCountryID);
                sqlcmd.Parameters.AddWithValue("@VesselFlightNo", obj_bel_Packing._VesselFlightNo);
                sqlcmd.Parameters.AddWithValue("@PlaceofReceipt", obj_bel_Packing._PlaceofReceipt);
                sqlcmd.Parameters.AddWithValue("@vessalFiligtNo1", obj_bel_Packing._vessalFiligtNo1);
                sqlcmd.Parameters.AddWithValue("@PortofLoadingID", obj_bel_Packing._PortofLoadingID);
                sqlcmd.Parameters.AddWithValue("@PortofDestinationID", obj_bel_Packing._PortofDestinationID);
                sqlcmd.Parameters.AddWithValue("@FinalDestination", obj_bel_Packing._FinalDestination);
                sqlcmd.Parameters.AddWithValue("@DeliveryTermID", obj_bel_Packing._DeliveryTermID);
                sqlcmd.Parameters.AddWithValue("@PaymentTermID", obj_bel_Packing._PaymentTermID);
                sqlcmd.Parameters.AddWithValue("@MarkNoContainerNo", obj_bel_Packing._MarkNoContainerNo);
                sqlcmd.Parameters.AddWithValue("@TotalCarton", obj_bel_Packing._TotalCarton);
                sqlcmd.Parameters.AddWithValue("@TotalQty", obj_bel_Packing._TotalQty);
                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_Packing._Status);
                sqlcmd.Parameters.AddWithValue("@NoKindPkgs", obj_bel_Packing._NoKindPkgs);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Packing._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Packing._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters["@PackingListID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@PackingListID"].Value;
                HttpContext.Current.Session["HeaderID"] = Convert.ToString(val);

                SqlCommand sqlcmd2 = new SqlCommand("spu_PackingListDetail", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["PackingDetailID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        sqlcmd2.Parameters.AddWithValue("@PackingListID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@PackingDetailID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");
                        sqlcmd2.Parameters.AddWithValue("@PackingListID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@PackingDetailID", dt.Rows[i]["PackingDetailID"]);

                    }





                    if (Convert.ToString(dt.Rows[i]["CartonNo"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonNo", Convert.ToString(dt.Rows[i]["CartonNo"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonNo", string.Empty);
                    }

                    if (Convert.ToString(dt.Rows[i]["NewCartonNo"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@NewCartonNo", Convert.ToString(dt.Rows[i]["NewCartonNo"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@NewCartonNo", string.Empty);
                    }

                    if (Convert.ToString(dt.Rows[i]["BuyerReferences"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@BuyerReferences", Convert.ToString(dt.Rows[i]["BuyerReferences"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@BuyerReferences", string.Empty);
                    }

                    if (Convert.ToString(dt.Rows[i]["Qty"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Qty", Convert.ToDecimal(dt.Rows[i]["Qty"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@Qty", 0);
                    }




                    if (Convert.ToString(dt.Rows[i]["PcsCarton"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@PcsCarton", Convert.ToDecimal(dt.Rows[i]["PcsCarton"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@PcsCarton", 0);
                    }




                    if (Convert.ToString(dt.Rows[i]["TotalPcs"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@TotalPcs", Convert.ToDecimal(dt.Rows[i]["TotalPcs"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@TotalPcs", 0);
                    }

                    if (Convert.ToString(dt.Rows[i]["NetWt"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@NetWt", Convert.ToDecimal(dt.Rows[i]["NetWt"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@NetWt", 0);
                    }

                    if (Convert.ToString(dt.Rows[i]["GrsWt"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@GrsWt", Convert.ToDecimal(dt.Rows[i]["GrsWt"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@GrsWt", 0);
                    }


                    if (Convert.ToString(dt.Rows[i]["CartonSize"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonSize", Convert.ToString(dt.Rows[i]["CartonSize"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonSize", 0);
                    }

                    

                     sqlcmd2.Parameters.AddWithValue("@ProductGroupID", Convert.ToInt32(dt.Rows[i]["ProductGroupID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@ProductID", Convert.ToInt32(dt.Rows[i]["ProductID"].ToString()));

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
