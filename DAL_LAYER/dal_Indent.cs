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
    public class dal_Indent
    {
        int val = 0;
        public DataSet dal_IndentDetail(bel_Indent obj_bel_Indent)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_IndentSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@IndentID", obj_bel_Indent._IndentID);
                sqlcmd.Parameters.AddWithValue("@IndentDetailID", obj_bel_Indent._IndentDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));                               
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_Indent._ProductID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_Indent._ProductCode);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Indent._JobID);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Indent._screenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Indent._iMode);               
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_Indent._CategoryID);
                sqlcmd.Parameters.AddWithValue("@QuotationID", obj_bel_Indent._QuotationID);

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
        public DataSet dal_AutoGen(bel_Indent obj_bel_Indent)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Indent._screenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_Indent._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_Indent._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
        public int dal_IndentInsert(bel_Indent obj_bel_Indent, DataTable dt)
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

                SqlCommand sqlcmd = new SqlCommand("spu_IndentHeader", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if (obj_bel_Indent._IndentID != 0)
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@IndentID", obj_bel_Indent._IndentID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@IndentID", 0);

                }
                sqlcmd.Parameters.AddWithValue("@IndentNo", obj_bel_Indent._IndentNo);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@IndentDate", obj_bel_Indent._IndentDate);

                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Indent._JobID);
               
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Indent._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Indent._ModifiedOn);

                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_Indent._Status);

                sqlcmd.Parameters.AddWithValue("@Remarks", obj_bel_Indent._Remarks);

                sqlcmd.Parameters.AddWithValue("@TotalRQty", obj_bel_Indent._TotalRQty);
                sqlcmd.Parameters.AddWithValue("@TotalOQty", obj_bel_Indent._TotalOQty);
                sqlcmd.Parameters.AddWithValue("@ApprovedStatus", obj_bel_Indent._ApprovedStatus);
                sqlcmd.Parameters.AddWithValue("@ApprovedUserID", obj_bel_Indent._ApprovedUserID);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                
                sqlcmd.Parameters["@IndentID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@IndentID"].Value;
                HttpContext.Current.Session["HeaderID"] = Convert.ToString(val);

                SqlCommand sqlcmd2 = new SqlCommand("spu_IndentDetail", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["IndentDetailID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        sqlcmd2.Parameters.AddWithValue("@IndentID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@IndentDetailID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");
                        sqlcmd2.Parameters.AddWithValue("@IndentID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@IndentDetailID", dt.Rows[i]["IndentDetailID"]);

                    }


                    sqlcmd2.Parameters.AddWithValue("@ProductGroupID", Convert.ToInt32(dt.Rows[i]["ProductGroupID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@ProductID", Convert.ToInt32(dt.Rows[i]["ProductID"].ToString()));




                    if (Convert.ToString(dt.Rows[i]["RequiredQty"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@RequiredQty", Convert.ToDecimal(dt.Rows[i]["RequiredQty"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@RequiredQty", 0);
                    }
                    if (Convert.ToString(dt.Rows[i]["OrderedQty"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@OrderedQty", Convert.ToDecimal(dt.Rows[i]["OrderedQty"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@OrderedQty", 0);
                    }

                    //if (Convert.ToString(dt.Rows[i]["Rate"].ToString()) != string.Empty)
                    //{
                    //    sqlcmd2.Parameters.AddWithValue("@Rate", Convert.ToDecimal(dt.Rows[i]["Rate"].ToString()));
                    //}
                    //else
                    //{
                        sqlcmd2.Parameters.AddWithValue("@Rate", 0);
                    //}

                    //if (Convert.ToString(dt.Rows[i]["Amount"].ToString()) != string.Empty)
                    //{
                    //    sqlcmd2.Parameters.AddWithValue("@Amount", Convert.ToDecimal(dt.Rows[i]["Amount"].ToString()));
                    //}
                    //else
                    //{
                        sqlcmd2.Parameters.AddWithValue("@Amount", 0);
                    //}


                    sqlcmd2.Parameters.AddWithValue("@DesignID", Convert.ToInt32(dt.Rows[i]["DesignID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@SizeID", Convert.ToInt32(dt.Rows[i]["SizeID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@ColorID", Convert.ToInt32(dt.Rows[i]["ColorID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@CategoryID", Convert.ToDecimal(dt.Rows[i]["CategoryID"].ToString()));

                    sqlcmd2.Parameters.AddWithValue("@QualityID", Convert.ToInt32(dt.Rows[i]["QualityID"].ToString()));
                    sqlcmd2.Parameters.AddWithValue("@UOMID", Convert.ToInt32(dt.Rows[i]["UOMID"].ToString()));
                    if (Convert.ToString(dt.Rows[i]["Remarks"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Remarks", Convert.ToString(dt.Rows[i]["Remarks"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@Remarks", string.Empty);
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
