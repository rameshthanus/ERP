using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using StepOne_Object;
using BEL_LAYER;

namespace DAL_LAYER
{
   public class dal_login
    {
       public DataSet dal_Logindetail(bel_login obj_bel_Login)
       {

           DataSet ds = new DataSet();
           try
           {
               SqlCommand sqlcmd = new SqlCommand("spu_Login");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Login._iMode);
               sqlcmd.Parameters.AddWithValue("@LoginID", obj_bel_Login._LoginID);
               sqlcmd.Parameters.AddWithValue("@LoginPassword", obj_bel_Login._LoginPassword);
               sqlcmd.Parameters.AddWithValue("@UserID", obj_bel_Login._UserID);
               sqlcmd.Parameters.AddWithValue("@UserGroupID", obj_bel_Login._UserGroupID);
               //sqlcmd.Parameters.AddWithValue("@YearName", obj_bel_Login._YearName);
              // sqlcmd.Parameters.AddWithValue("@YearStatus", obj_bel_Login._YearStatus);
               sqlcmd.Parameters.AddWithValue("@BranchID", obj_bel_Login._BranchID);
               sqlcmd.Parameters.AddWithValue("@CompanyID", obj_bel_Login._CompanyID);
               sqlcmd.Parameters.AddWithValue("@PassordCompanyID", obj_bel_Login._PassordCompanyID);
               sqlcmd.Parameters.AddWithValue("@EmailID", obj_bel_Login._EmailID);
               sqlcmd.Parameters.AddWithValue("@BillFromDate", obj_bel_Login._BillFromDate);
               sqlcmd.Parameters.AddWithValue("@BillToDate", obj_bel_Login._BillToDate);

               ds = DataFunctions.GetDataSet(sqlcmd);
           }
           catch (Exception ex)
           {


           }
           return ds;

       }
    }
}
