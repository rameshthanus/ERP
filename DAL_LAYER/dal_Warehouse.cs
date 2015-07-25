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
    public class dal_Warehouse
    {
        public DataSet dal_WarehouseDetail(bel_Warehouse obj_bel_Warehouse)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_Warehouse");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@WarehouseID", obj_bel_Warehouse._WarehouseID);
                sqlcmd.Parameters.AddWithValue("@WarehouseCode", obj_bel_Warehouse._WarehouseCode);
                sqlcmd.Parameters.AddWithValue("@WarehouseName", obj_bel_Warehouse._WarehouseName);
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@StoreBranchID", obj_bel_Warehouse._WarehouseBranch);
                sqlcmd.Parameters.AddWithValue("@WarehouseStatus", obj_bel_Warehouse._WarehouseStatus);
                sqlcmd.Parameters.AddWithValue("@CreatedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Warehouse._CreatedOn);
                sqlcmd.Parameters.AddWithValue("@ModifiedBy", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Warehouse._ModifiedOn);
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Warehouse._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Warehouse._screenName);
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
               

                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;
        }

        public DataSet dal_AutoGenWarehouse(bel_Warehouse obj_bel_Warehouse)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_AutoGenMaster");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@screenName", obj_bel_Warehouse._screenName);


                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
