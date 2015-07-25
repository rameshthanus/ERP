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
  public  class dal_GPN
    {
      int val = 0;
        public DataSet dal_GPNDetail(bel_GPN obj_bel_GPN)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_GPNSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@GPNID", obj_bel_GPN._GPNID);
                sqlcmd.Parameters.AddWithValue("@GPNDetailID", obj_bel_GPN._GPNDetailID);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@GPNNo", obj_bel_GPN._GPNNo);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_GPN._ProductID);
                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_GPN._JOBID);               
                sqlcmd.Parameters.AddWithValue("@BillFromDate", obj_bel_GPN._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@BillToDate", obj_bel_GPN._BillToDate);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_GPN._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_GPN._ScreenName);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_GPN._ProductCode);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@TotalQty", Convert.ToInt32(obj_bel_GPN._TotalQty));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_GPN._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_GPN._BillToDate);
                sqlcmd.Parameters.AddWithValue("@FromWarehouseID", obj_bel_GPN._FromWareHouseID);

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public DataSet dal_AutoGen(bel_GPN obj_bel_GPN)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenTransaction");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_GPN._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@FromDate", obj_bel_GPN._BillFromDate);
                sqlcmd.Parameters.AddWithValue("@ToDate", obj_bel_GPN._BillToDate);
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public int dal_GPNInsert(bel_GPN obj_bel_GPN, DataTable dt)
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

                SqlCommand sqlcmd = new SqlCommand("spu_GPNHeader", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if (obj_bel_GPN._GPNID != 0)
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@GPNID", obj_bel_GPN._GPNID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@GPNID", 0);

                }
                sqlcmd.Parameters.AddWithValue("@GPNNo", obj_bel_GPN._GPNNo);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@Year", Convert.ToInt32(HttpContext.Current.Session["FinancialYear"]));
                sqlcmd.Parameters.AddWithValue("@GPNDate", obj_bel_GPN._GPNDate);

                sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_GPN._JOBID);                
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_GPN._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_GPN._ModifiedOn);

                sqlcmd.Parameters.AddWithValue("@Status", obj_bel_GPN._Status);


                sqlcmd.Parameters.AddWithValue("@Remarks", obj_bel_GPN._Remarks);

                sqlcmd.Parameters.AddWithValue("@ToWareHouseID", obj_bel_GPN._ToWareHouseID);
                sqlcmd.Parameters.AddWithValue("@FromWareHouseID", obj_bel_GPN._FromWareHouseID);

                sqlcmd.Parameters.AddWithValue("@TotalQty", obj_bel_GPN._TotalQty);

                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));


                sqlcmd.Parameters["@GPNID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@GPNID"].Value;
                HttpContext.Current.Session["HeaderID"] = Convert.ToString(val);

                SqlCommand sqlcmd2 = new SqlCommand("spu_GPNDetail", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["GPNDetailID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        sqlcmd2.Parameters.AddWithValue("@GPNID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@GPNDetailID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "Update");
                        sqlcmd2.Parameters.AddWithValue("@GPNID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@GPNDetailID", dt.Rows[i]["GPNDetailID"]);

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




                    if (Convert.ToString(dt.Rows[i]["CartonPcs"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonPcs", Convert.ToDecimal(dt.Rows[i]["CartonPcs"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonPcs", 0);
                    }

                    if (Convert.ToString(dt.Rows[i]["Carton"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Carton", Convert.ToDecimal(dt.Rows[i]["Carton"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@Carton", 0);
                    }


                    if (Convert.ToString(dt.Rows[i]["Pcs"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Pcs", Convert.ToDecimal(dt.Rows[i]["Pcs"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@Pcs", 0);
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

                    if (Convert.ToString(dt.Rows[i]["CartonFrom"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonFrom", Convert.ToInt32(dt.Rows[i]["CartonFrom"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonFrom", 0);
                    }

                    if (Convert.ToString(dt.Rows[i]["CartonTo"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonTo", Convert.ToInt32(dt.Rows[i]["CartonTo"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@CartonTo", 0);
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

        public int dal_GPNPrintInsert(bel_GPN obj_bel_GPN, DataTable dt)
        {

          

            int Result = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConn"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlTransaction trn;
            connection.Open();
            trn = connection.BeginTransaction();


            try
            {



                SqlCommand sqlcmd2 = new SqlCommand("spu_GPNPrintHeader", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();




                      sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");


                     if (Convert.ToString(dt.Rows[i]["GPNDetailID"]) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@GPNDetailID", Convert.ToInt32(dt.Rows[i]["GPNDetailID"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@GPNDetailID", 0);
                    }

                      if (Convert.ToString(dt.Rows[i]["GPNID"]) != string.Empty)
                      {
                          sqlcmd2.Parameters.AddWithValue("@GPNID", Convert.ToInt32(dt.Rows[i]["GPNID"].ToString()));
                      }
                      else
                      {
                          sqlcmd2.Parameters.AddWithValue("@GPNID", 0);
                      }


                      if (Convert.ToString(dt.Rows[i]["BoxNo"]) != string.Empty)
                      {
                          sqlcmd2.Parameters.AddWithValue("@BoxNo", Convert.ToDecimal(dt.Rows[i]["BoxNo"].ToString()));
                      }
                      else
                      {
                          sqlcmd2.Parameters.AddWithValue("@BoxNo", 0);
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
