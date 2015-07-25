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
   public class dal_Company
    {
       int val = 0;
       public DataSet dal_Companydetail(bel_Company obj_bel_Company)
       {
           DataSet ds = new DataSet();
           try
           {
               SqlCommand sqlcmd = new SqlCommand("spu_Company");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Company._iMode);
               sqlcmd.Parameters.AddWithValue("@CompanyID", obj_bel_Company._CompanyID);
               sqlcmd.Parameters.AddWithValue("@CompanyCode", obj_bel_Company._CompanyCode);
               sqlcmd.Parameters.AddWithValue("@CompanyName", obj_bel_Company._CompanyName);
               sqlcmd.Parameters.AddWithValue("@Address1", obj_bel_Company._Address1);
               sqlcmd.Parameters.AddWithValue("@Address2", obj_bel_Company._Address2);
               sqlcmd.Parameters.AddWithValue("@Address3", obj_bel_Company._Address3);
               sqlcmd.Parameters.AddWithValue("@City", obj_bel_Company._City);
               sqlcmd.Parameters.AddWithValue("@State", obj_bel_Company._State);
               sqlcmd.Parameters.AddWithValue("@Country", obj_bel_Company._Country);
               sqlcmd.Parameters.AddWithValue("@PostalCode", obj_bel_Company._PostalCode);
               sqlcmd.Parameters.AddWithValue("@PhoneNumber", obj_bel_Company._PhoneNumber);
               sqlcmd.Parameters.AddWithValue("@Fax", obj_bel_Company._Fax);
               sqlcmd.Parameters.AddWithValue("@Email", obj_bel_Company._Email);
               sqlcmd.Parameters.AddWithValue("@PAN", obj_bel_Company._PAN);
               sqlcmd.Parameters.AddWithValue("@CST", obj_bel_Company._CST);
               sqlcmd.Parameters.AddWithValue("@TIN", obj_bel_Company._TIN);
               sqlcmd.Parameters.AddWithValue("@ContactPerson", obj_bel_Company._ContactPerson);             
               sqlcmd.Parameters.AddWithValue("@CompanyStatus", obj_bel_Company._CompanyStatus);
               sqlcmd.Parameters.AddWithValue("@CreatedBy", obj_bel_Company._CreatedBy);
               sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Company._CreatedOn);
               sqlcmd.Parameters.AddWithValue("@ModifiedBy", obj_bel_Company._ModifiedBy);
               sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Company._ModifiedOn);
               sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Company._ScreenName);
               sqlcmd.Parameters.AddWithValue("@Prefix", obj_bel_Company._Prefix);

               
               ds = DataFunctions.GetDataSet(sqlcmd);
           }



           catch (Exception ex)
           {


           }
           return ds;
       }

       public int dal_CompanyInsert(bel_Company obj_bel_Company, DataTable dt)
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

               SqlCommand sqlcmd = new SqlCommand("spu_Company", connection, trn);
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();

               if (Convert.ToBoolean(Convert.ToInt32(obj_bel_Company._CompanyID) != Convert.ToInt32(0)))
               {

                   sqlcmd.Parameters.AddWithValue("@iMode", "Update");
                   sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
               }
               else
               {

                   sqlcmd.Parameters.AddWithValue("@iMode", "Insert");
                   sqlcmd.Parameters.AddWithValue("@CompanyID", 0);

               }

              
               sqlcmd.Parameters.AddWithValue("@CompanyCode", obj_bel_Company._CompanyCode);
               sqlcmd.Parameters.AddWithValue("@CompanyName", obj_bel_Company._CompanyName);
               sqlcmd.Parameters.AddWithValue("@Address1", obj_bel_Company._Address1);
               sqlcmd.Parameters.AddWithValue("@Address2", obj_bel_Company._Address2);
               sqlcmd.Parameters.AddWithValue("@Address3", obj_bel_Company._Address3);
               sqlcmd.Parameters.AddWithValue("@City", obj_bel_Company._City);
               sqlcmd.Parameters.AddWithValue("@State", obj_bel_Company._State);
               sqlcmd.Parameters.AddWithValue("@Country", obj_bel_Company._Country);
               sqlcmd.Parameters.AddWithValue("@PostalCode", obj_bel_Company._PostalCode);
               sqlcmd.Parameters.AddWithValue("@PhoneNumber", obj_bel_Company._PhoneNumber);
               sqlcmd.Parameters.AddWithValue("@Fax", obj_bel_Company._Fax);
               sqlcmd.Parameters.AddWithValue("@Email", obj_bel_Company._Email);
               sqlcmd.Parameters.AddWithValue("@PAN", obj_bel_Company._PAN);
               sqlcmd.Parameters.AddWithValue("@CST", obj_bel_Company._CST);
               sqlcmd.Parameters.AddWithValue("@TIN", obj_bel_Company._TIN);
               sqlcmd.Parameters.AddWithValue("@ContactPerson", obj_bel_Company._ContactPerson);
               sqlcmd.Parameters.AddWithValue("@IECode", obj_bel_Company._IECode);
               sqlcmd.Parameters.AddWithValue("@StartFY", obj_bel_Company._StartFY);
               sqlcmd.Parameters.AddWithValue("@CurrentFY", obj_bel_Company._CurrentFY);
               sqlcmd.Parameters.AddWithValue("@LastFY", obj_bel_Company._LastFY);
               sqlcmd.Parameters.AddWithValue("@BankID", obj_bel_Company._BankID);
               sqlcmd.Parameters.AddWithValue("@BankName", obj_bel_Company._BankName);
               sqlcmd.Parameters.AddWithValue("@BankStatus", obj_bel_Company._BankStatus);
               sqlcmd.Parameters.AddWithValue("@AccountNo", obj_bel_Company._AccountNo);
               sqlcmd.Parameters.AddWithValue("@SwiftCode", obj_bel_Company._SwiftCode);
               sqlcmd.Parameters.AddWithValue("@BranchName", obj_bel_Company._BranchName);
               sqlcmd.Parameters.AddWithValue("@CompanyStatus", obj_bel_Company._CompanyStatus);
               sqlcmd.Parameters.AddWithValue("@CreatedBy", obj_bel_Company._CreatedBy);
               sqlcmd.Parameters.AddWithValue("@CreatedOn", obj_bel_Company._CreatedOn);
               sqlcmd.Parameters.AddWithValue("@ModifiedBy", obj_bel_Company._ModifiedBy);
               sqlcmd.Parameters.AddWithValue("@ModifiedOn", obj_bel_Company._ModifiedOn);
               sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Company._ScreenName);
               sqlcmd.Parameters.AddWithValue("@Prefix", obj_bel_Company._Prefix);

               sqlcmd.Parameters["@CompanyID"].Direction = ParameterDirection.InputOutput;
               value = sqlcmd.ExecuteNonQuery();
               val = (int)sqlcmd.Parameters["@CompanyID"].Value;


               SqlCommand sqlcmd2 = new SqlCommand("spu_Company", connection, trn);
               sqlcmd2.CommandTimeout = 0;
               sqlcmd2.CommandType = CommandType.StoredProcedure;

               for (i = 0; i <= dt.Rows.Count - 1; i++)
               {
                   sqlcmd2.Parameters.Clear();



                   if (Convert.ToString(dt.Rows[i]["BankID"]) == "0")
                   {
                       sqlcmd2.Parameters.AddWithValue("@iMode", "BankInsert");
                       sqlcmd2.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(val));
                       sqlcmd2.Parameters.AddWithValue("@BankID", 0);

                   }

                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@iMode", "BankUpdate");
                       sqlcmd2.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(val));
                       sqlcmd2.Parameters.AddWithValue("@BankID", dt.Rows[i]["BankID"]);

                   }


                   if (Convert.ToString(dt.Rows[i]["BankName"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@BankName", Convert.ToString(dt.Rows[i]["BankName"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@BankName", string.Empty);
                   }

                   if (Convert.ToString(dt.Rows[i]["BranchName"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@BranchName", Convert.ToString(dt.Rows[i]["BranchName"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@BranchName", string.Empty);
                   }

                   if (Convert.ToString(dt.Rows[i]["AccountNo"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@AccountNo", Convert.ToString(dt.Rows[i]["SwiftCode"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@SwiftCode", string.Empty);
                   }

                   if (Convert.ToString(dt.Rows[i]["SwiftCode"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@SwiftCode", Convert.ToString(dt.Rows[i]["SwiftCode"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@SwiftCode", string.Empty);
                   }

                   if (Convert.ToString(dt.Rows[i]["BankStatus"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@BankStatus", Convert.ToString(dt.Rows[i]["BankStatus"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@Status", "A");
                   }

                   sqlcmd2.Parameters.AddWithValue("@CompanyCode", obj_bel_Company._CompanyCode);
                   sqlcmd2.Parameters.AddWithValue("@CompanyName", obj_bel_Company._CompanyName);
                   sqlcmd2.Parameters.AddWithValue("@Address1", obj_bel_Company._Address1);
                   sqlcmd2.Parameters.AddWithValue("@Address2", obj_bel_Company._Address2);
                   sqlcmd2.Parameters.AddWithValue("@Address3", obj_bel_Company._Address3);
                   sqlcmd2.Parameters.AddWithValue("@City", obj_bel_Company._City);
                   sqlcmd2.Parameters.AddWithValue("@State", obj_bel_Company._State);
                   sqlcmd2.Parameters.AddWithValue("@Country", obj_bel_Company._Country);
                   sqlcmd2.Parameters.AddWithValue("@PostalCode", obj_bel_Company._PostalCode);
                   sqlcmd2.Parameters.AddWithValue("@PhoneNumber", obj_bel_Company._PhoneNumber);
                   sqlcmd2.Parameters.AddWithValue("@Fax", obj_bel_Company._Fax);
                   sqlcmd2.Parameters.AddWithValue("@Email", obj_bel_Company._Email);
                   sqlcmd2.Parameters.AddWithValue("@PAN", obj_bel_Company._PAN);
                   sqlcmd2.Parameters.AddWithValue("@CST", obj_bel_Company._CST);
                   sqlcmd2.Parameters.AddWithValue("@TIN", obj_bel_Company._TIN);
                   sqlcmd2.Parameters.AddWithValue("@ContactPerson", obj_bel_Company._ContactPerson);
                   sqlcmd2.Parameters.AddWithValue("@IECode", obj_bel_Company._IECode);
                   sqlcmd2.Parameters.AddWithValue("@StartFY", obj_bel_Company._StartFY);
                   sqlcmd2.Parameters.AddWithValue("@CurrentFY", obj_bel_Company._CurrentFY);
                   sqlcmd2.Parameters.AddWithValue("@LastFY", obj_bel_Company._LastFY);                 
                   sqlcmd2.Parameters.AddWithValue("@CompanyStatus", obj_bel_Company._CompanyStatus);
                   sqlcmd2.Parameters.AddWithValue("@CreatedBy", obj_bel_Company._CreatedBy);
                   sqlcmd2.Parameters.AddWithValue("@CreatedOn", obj_bel_Company._CreatedOn);
                   sqlcmd2.Parameters.AddWithValue("@ModifiedBy", obj_bel_Company._ModifiedBy);
                   sqlcmd2.Parameters.AddWithValue("@ModifiedOn", obj_bel_Company._ModifiedOn);
                   sqlcmd2.Parameters.AddWithValue("@ScreenName", obj_bel_Company._ScreenName);
                   sqlcmd2.Parameters.AddWithValue("@Prefix", obj_bel_Company._Prefix);

                   Result = sqlcmd2.ExecuteNonQuery();



               }




               trn.Commit();


           }
           catch (SqlException ex)
           {
               trn.Rollback();

           }


           connection.Close();
           return Result;

       }

       public DataSet dal_AutoGenDesign(bel_Company obj_bel_Company)
       {

           DataSet ds = new DataSet();
           try
           {

               SqlCommand sqlcmd = new SqlCommand("spu_AutoGenMaster");
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@screenName", obj_bel_Company._ScreenName);


               ds = DataFunctions.GetDataSet(sqlcmd);
           }
           catch (Exception ex)
           {


           }
           return ds;

       }
    }
}
