using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using MSDataAccess;
using Trident.classes;

namespace Trident.HttpHandler
{
    /// <summary>
    /// Summary description for LeadsList
    /// </summary>
    public class LeadsList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            object[] ob = new object[34];
            ob[0] = context.Request["FirstName"];
            ob[1] = context.Request["LastName"];
            ob[2] = context.Request["PrimaryPhone"];
            ob[3] = context.Request["Company"];
            ob[4] = context.Request["MobilePhone"];
            ob[5] = context.Request["Designation"];
            ob[6] = context.Request["Fax"];
            ob[7] = Convert.ToInt32((context.Request["LeadSourceID"] == "" ? "0" : context.Request["LeadSourceID"]));
            ob[8] = context.Request["PrimaryEmail"];
            ob[9] = Convert.ToInt32((context.Request["IndustryID"] == "" ? "0" : context.Request["IndustryID"]));
            ob[10] = context.Request["Website"];
            ob[11] = Convert.ToDecimal((context.Request["AnnualRevenue"] == "" ? "0" : context.Request["AnnualRevenue"]));
            ob[12] = Convert.ToInt32((context.Request["LeadStatusID"] == "" ? "0" : context.Request["LeadStatusID"]));
            ob[13] = Convert.ToInt32((context.Request["NumberOfEmployees"] == "" ? "0" : context.Request["NumberOfEmployees"]));
            ob[14] = Convert.ToInt32((context.Request["RatingID"] == "" ? "0" : context.Request["RatingID"])); 
            ob[15] = context.Request["SecondaryEmail"];
            ob[16] = Convert.ToInt32((context.Request["AssignedTo"] == "" ? "0" : context.Request["AssignedTo"])); 
            ob[17] = context.Request["EmailOut"];
            ob[18] = context.Request["Street"];
            ob[19] = context.Request["POBox"];
            ob[20] = context.Request["PostalCode"];
            ob[21] = context.Request["City"];
            ob[22] = context.Request["Country"];
            ob[23] = context.Request["State"];
            ob[24] = context.Request["Description"];
            ob[25] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
            ob[26] = Convert.ToDateTime((context.Request["CreatedOn"] == "" ? "1990/1/1" : context.Request["CreatedOn"]));
            ob[27] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
            ob[28] = Convert.ToDateTime((context.Request["ModifiedOn"] == "" ? "1990/1/1" : context.Request["ModifiedOn"]));
            ob[29] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
            ob[30] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
            ob[31] = context.Request["iMode"];
            ob[32] = context.Request["ScreenName"];
            ob[33] = Convert.ToInt32((context.Request["LeadsID"] == "" ? "0" : context.Request["LeadsID"]));

            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Leads]", ob);
            if (ds.Tables.Count > 0)
            {
                DataTable dt = new DataTable();
                for (int i = 0; i < ds.Tables.Count; i++)
                {
                    dt.Merge(ds.Tables[i]);
                }
                context.Response.Write(Json.GetJson(dt));
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}