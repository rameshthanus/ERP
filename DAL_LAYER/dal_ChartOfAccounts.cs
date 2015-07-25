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
    public class dal_ChartOfAccounts
    {
        public DataSet dal_ChartOfAccountsDetail(bel_ChartOfAccounts obj_bel_ChartOfAccounts)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_ChartOfAccounts");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@CHARTID", obj_bel_ChartOfAccounts._CHARTID);
                sqlcmd.Parameters.AddWithValue("@AC_CODE", obj_bel_ChartOfAccounts._AC_CODE);
                sqlcmd.Parameters.AddWithValue("@AC_DESC", obj_bel_ChartOfAccounts._AC_DESC);
                sqlcmd.Parameters.AddWithValue("@AC_TYPE", obj_bel_ChartOfAccounts._AC_TYPE);
                sqlcmd.Parameters.AddWithValue("@AC_DORC", obj_bel_ChartOfAccounts._AC_DORC);                
                sqlcmd.Parameters.AddWithValue("@AC_BANK", obj_bel_ChartOfAccounts._AC_BANK);
                sqlcmd.Parameters.AddWithValue("@AC_CURR", obj_bel_ChartOfAccounts._AC_CURR);
                sqlcmd.Parameters.AddWithValue("@AC_SUBTYPE", obj_bel_ChartOfAccounts._AC_SUBTYPE);
                sqlcmd.Parameters.AddWithValue("@AC_SUB_PL", obj_bel_ChartOfAccounts._AC_SUB_PL);
                sqlcmd.Parameters.AddWithValue("@AC_SUB_BS", obj_bel_ChartOfAccounts._AC_SUB_BS);
                sqlcmd.Parameters.AddWithValue("@G_NOS", obj_bel_ChartOfAccounts._G_NOS);
                sqlcmd.Parameters.AddWithValue("@AC_SUB_BS1", obj_bel_ChartOfAccounts._AC_SUB_BS1);                          
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_ChartOfAccounts._iMode);
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
