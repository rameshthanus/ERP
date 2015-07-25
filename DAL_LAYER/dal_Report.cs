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
   public class dal_Report
    {
       public DataSet dal_ReportDetail(bel_Report obj_bel_Report)
       {

           DataSet ds = new DataSet();
           try
           {

               SqlCommand sqlcmd = new SqlCommand("spu_Report");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@ReportName", obj_bel_Report._ReportName);
               if (Convert.ToString(obj_bel_Report._FromDate) != string.Empty)
               {
                   sqlcmd.Parameters.AddWithValue("@FromDate", Convert.ToDateTime(obj_bel_Report._FromDate));
                   sqlcmd.Parameters.AddWithValue("@BeforeFromDate", Convert.ToDateTime(obj_bel_Report._BeforeFromDate));
               }
               else
               {
                   string Year = string.Empty;
                   string FromYear = string.Empty;
                   string ToYear = string.Empty;
                   string FromDate = string.Empty;
                   string BeforeFromDate = string.Empty;
                   string Todate = string.Empty;
                   Year = Year = Convert.ToString(HttpContext.Current.Session["Year"]);
                   string[] financialyear = Year.Split('-');
                   FromYear = financialyear[0].Trim();
                   ToYear = financialyear[1].Trim();

                   FromDate = "04/01/" + FromYear;
                   BeforeFromDate = "03/31/" + FromYear;
                   Todate = "03/31/" + ToYear;

                  
                   obj_bel_Report._FromDate = FromDate;
                   obj_bel_Report._BeforeFromDate = BeforeFromDate;
                   sqlcmd.Parameters.AddWithValue("@FromDate", Convert.ToDateTime(obj_bel_Report._FromDate));
                   sqlcmd.Parameters.AddWithValue("@BeforeFromDate", Convert.ToDateTime(obj_bel_Report._BeforeFromDate));
               }
               if (Convert.ToString(obj_bel_Report._ToDate) != string.Empty)
               {
                   sqlcmd.Parameters.AddWithValue("@ToDate", Convert.ToDateTime(obj_bel_Report._ToDate));
               }
               else
               {
                   string Year = string.Empty;
                   string FromYear = string.Empty;
                   string ToYear = string.Empty;
                   string FromDate = string.Empty;
                   string Todate = string.Empty;
                   Year = Year = Convert.ToString(HttpContext.Current.Session["Year"]);
                   string[] financialyear = Year.Split('-');
                   FromYear = financialyear[0].Trim();
                   ToYear = financialyear[1].Trim();
                   FromDate = "04/01/" + FromYear;
                   Todate = "03/31/" + ToYear;
                   obj_bel_Report._ToDate = Todate;
                   sqlcmd.Parameters.AddWithValue("@ToDate", Convert.ToDateTime(obj_bel_Report._ToDate));
               }
               sqlcmd.Parameters.AddWithValue("@Organaization", obj_bel_Report._Organaization);
               sqlcmd.Parameters.AddWithValue("@DesignID", obj_bel_Report._DesignID);
               sqlcmd.Parameters.AddWithValue("@CategoryID", obj_bel_Report._CategoryID);
               sqlcmd.Parameters.AddWithValue("@ProductID", obj_bel_Report._ProductID);              
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Report._iMode);
               sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
               sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
               sqlcmd.Parameters.AddWithValue("@PartyID", obj_bel_Report._PartyID);
               sqlcmd.Parameters.AddWithValue("@OrderID", obj_bel_Report._OrderID);
               sqlcmd.Parameters.AddWithValue("@JOBID", obj_bel_Report._JOBID);
               sqlcmd.Parameters.AddWithValue("@WareHouseID", obj_bel_Report._WarehouseID);
               sqlcmd.Parameters.AddWithValue("@UserID", obj_bel_Report._UserID);
               sqlcmd.Parameters.AddWithValue("@ProductGroupID", obj_bel_Report._ProductGroupID);
               sqlcmd.Parameters.AddWithValue("@WareHouseName", obj_bel_Report._WareHouseName);
               sqlcmd.Parameters.AddWithValue("@StockBranchID", obj_bel_Report._StockBranchID);
               
               sqlcmd.Parameters.AddWithValue("@SizeID ", obj_bel_Report._SizeID);
               sqlcmd.Parameters.AddWithValue("@UOMID ", obj_bel_Report._UOMID);
               sqlcmd.Parameters.AddWithValue("@ColorID ", obj_bel_Report._ColorID);
               sqlcmd.Parameters.AddWithValue("@QualityID ", obj_bel_Report._QualityID);
              

               ds = DataFunctions.GetDataSet(sqlcmd);
           }
           catch (Exception ex)
           {


           }
           return ds;

       }
    }
}
