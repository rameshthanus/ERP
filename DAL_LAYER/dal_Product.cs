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
   public class dal_Product
    {
       int val = 0;
        public DataSet dal_ProductDetail(bel_Product obj_bel_Product)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_Product");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_Product._ProductID);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_Product._CategoryID);
                sqlcmd.Parameters.AddWithValue("@Description", obj_bel_Product._Description);
                sqlcmd.Parameters.AddWithValue("@UOMID", obj_bel_Product._UOMID);
                sqlcmd.Parameters.AddWithValue("@BuyPrice", obj_bel_Product._BuyPrice);
                sqlcmd.Parameters.AddWithValue("@SalePrice", obj_bel_Product._SalePrice);
               // sqlcmd.Parameters.AddWithValue("@QualityID", obj_bel_Product._QualityID);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_Product._ProductCode);
                sqlcmd.Parameters.AddWithValue("@ProductStatus", obj_bel_Product._ProductStatus);               
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Product._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Product._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Product._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Product._ScreenName);
                sqlcmd.Parameters.AddWithValue("@ProductGroupID", obj_bel_Product._ProductGroupID);
                sqlcmd.Parameters.AddWithValue("@InventoryType", obj_bel_Product._InventoryType);
                sqlcmd.Parameters.AddWithValue("@arno", obj_bel_Product._ARNO);
                sqlcmd.Parameters.AddWithValue("@apno", obj_bel_Product._APNO);
                

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }

        public int dal_ProductInsert(bel_Product obj_bel_Product, DataTable dt)
        {

            int value;
            int i = 0;
            int Result = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["SQLConn"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlTransaction trn;
            connection.Open();
            trn = connection.BeginTransaction();


            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_Product", connection, trn);
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();

                if (Convert.ToBoolean(Convert.ToInt32(obj_bel_Product._ProductID) != Convert.ToInt32(0)))
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                    sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_Product._ProductID);
                }
                else
                {

                    sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                    sqlcmd.Parameters.AddWithValue("@ProductID", 0);

                }

                
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@ProductGroupID", obj_bel_Product._ProductGroupID);
                sqlcmd.Parameters.AddWithValue("@DesignID", obj_bel_Product._DesignID);
                sqlcmd.Parameters.AddWithValue("@ColorID", obj_bel_Product._ColorID);
                sqlcmd.Parameters.AddWithValue("@SizeID", obj_bel_Product._SizeID);
                sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_Product._CategoryID);
                sqlcmd.Parameters.AddWithValue("@QualityID", obj_bel_Product._QualityID);
                sqlcmd.Parameters.AddWithValue("@Description", obj_bel_Product._Description);
                sqlcmd.Parameters.AddWithValue("@UOMID", obj_bel_Product._UOMID);
                sqlcmd.Parameters.AddWithValue("@BuyPrice", obj_bel_Product._BuyPrice);
                sqlcmd.Parameters.AddWithValue("@SalePrice", obj_bel_Product._SalePrice);
                sqlcmd.Parameters.AddWithValue("@SKU", obj_bel_Product._SKU);
                sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_Product._ProductCode);
                sqlcmd.Parameters.AddWithValue("@ProductStatus", obj_bel_Product._ProductStatus);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Product._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Product._ModifiedOn);               
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Product._ScreenName);
                sqlcmd.Parameters.AddWithValue("@CombinedProductID", obj_bel_Product._CombinedProductID);
                sqlcmd.Parameters.AddWithValue("@Quantity", obj_bel_Product._Quantity);
                sqlcmd.Parameters.AddWithValue("@CombinedProduct", obj_bel_Product._CombinedProduct);
                sqlcmd.Parameters.AddWithValue("@ProductDetailID", obj_bel_Product._ProductDetailID);
                sqlcmd.Parameters.AddWithValue("@CurrencyID", obj_bel_Product._CurrencyID);
                sqlcmd.Parameters.AddWithValue("@WarpWeft", obj_bel_Product._WarpWeft);
                sqlcmd.Parameters.AddWithValue("@ReedPick", obj_bel_Product._ReedPick);

                sqlcmd.Parameters["@ProductID"].Direction = ParameterDirection.InputOutput;
                value = sqlcmd.ExecuteNonQuery();
                val = (int)sqlcmd.Parameters["@ProductID"].Value;


                SqlCommand sqlcmd2 = new SqlCommand("spu_Product", connection, trn);
                sqlcmd2.CommandTimeout = 0;
                sqlcmd2.CommandType = CommandType.StoredProcedure;

                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    sqlcmd2.Parameters.Clear();



                    if (Convert.ToString(dt.Rows[i]["CombinedProductID"]) == "0")
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "CombinedInsert");
                        sqlcmd2.Parameters.AddWithValue("@ProductID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@CombinedProductID", 0);

                    }

                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@iMode", "CombinedUpdate");
                        sqlcmd2.Parameters.AddWithValue("@ProductID", Convert.ToInt32(val));
                        sqlcmd2.Parameters.AddWithValue("@CombinedProductID", dt.Rows[i]["CombinedProductID"]);

                    }


                    if (Convert.ToString(dt.Rows[i]["ProductDetailID"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@ProductDetailID", Convert.ToInt32(dt.Rows[i]["ProductDetailID"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@ProductDetailID", 0);
                    }

                    if (Convert.ToString(dt.Rows[i]["Quantity"].ToString()) != string.Empty)
                    {
                        sqlcmd2.Parameters.AddWithValue("@Quantity", Convert.ToInt32(dt.Rows[i]["Quantity"].ToString()));
                    }
                    else
                    {
                        sqlcmd2.Parameters.AddWithValue("@Quantity", 0);
                    }

                    sqlcmd2.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                    sqlcmd2.Parameters.AddWithValue("@ProductGroupID", obj_bel_Product._ProductGroupID);
                    sqlcmd2.Parameters.AddWithValue("@DesignID", obj_bel_Product._DesignID);
                    sqlcmd2.Parameters.AddWithValue("@ColorID", obj_bel_Product._ColorID);
                    sqlcmd2.Parameters.AddWithValue("@SizeID", obj_bel_Product._SizeID);
                    sqlcmd2.Parameters.AddWithValue("@CategoryID", obj_bel_Product._CategoryID);
                    sqlcmd2.Parameters.AddWithValue("@QualityID", obj_bel_Product._QualityID);
                    sqlcmd2.Parameters.AddWithValue("@Description", obj_bel_Product._Description);
                    sqlcmd2.Parameters.AddWithValue("@UOMID", obj_bel_Product._UOMID);
                    sqlcmd2.Parameters.AddWithValue("@BuyPrice", obj_bel_Product._BuyPrice);
                    sqlcmd2.Parameters.AddWithValue("@SalePrice", obj_bel_Product._SalePrice);
                    sqlcmd2.Parameters.AddWithValue("@SKU", obj_bel_Product._SKU);
                    sqlcmd2.Parameters.AddWithValue("@ProductCode", obj_bel_Product._ProductCode);
                    sqlcmd2.Parameters.AddWithValue("@ProductStatus", obj_bel_Product._ProductStatus);
                    sqlcmd2.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                    sqlcmd2.Parameters.AddWithValue("@CreatedOn", obj_bel_Product._CreatedOn);
                    sqlcmd2.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                    sqlcmd2.Parameters.AddWithValue("@ModifiedOn", obj_bel_Product._ModifiedOn);
                    sqlcmd2.Parameters.AddWithValue("@ScreenName", obj_bel_Product._ScreenName);                   
                    sqlcmd2.Parameters.AddWithValue("@CombinedProduct", obj_bel_Product._CombinedProduct);
                    sqlcmd2.Parameters.AddWithValue("@CurrencyID", obj_bel_Product._CurrencyID);
                    sqlcmd2.Parameters.AddWithValue("@WarpWeft", obj_bel_Product._WarpWeft);
                    sqlcmd2.Parameters.AddWithValue("@ReedPick", obj_bel_Product._ReedPick);

                    Result = sqlcmd2.ExecuteNonQuery();



                }




                trn.Commit();
                Result = 1;

            }
            catch (SqlException ex)
            {
                trn.Rollback();

            }


            connection.Close();
            return Result;

        }

        public DataSet dal_AutoGenDesign(bel_Product obj_bel_Product)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenMaster");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@screenName", obj_bel_Product._ScreenName);


                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
