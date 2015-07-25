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
    /// Summary description for OrganizationList
    /// </summary>
    public class OrganizationList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            object[] ob = new object[40];
            
            ob[0] = Convert.ToInt32((context.Request["OrganizationID"] == "" ? "0" : context.Request["OrganizationID"]));
            ob[1] = context.Request["OrganizationName"];
            ob[2] = context.Request["PrimaryEmail"];
            ob[3] = context.Request["Website"];
            ob[4] = context.Request["PrimaryPhone"];
            ob[5] = Convert.ToInt32((context.Request["Employees"] == "" ? "0" : context.Request["Employees"]));
            ob[6] = Convert.ToInt32((context.Request["IndustryID"] == "" ? "0" : context.Request["IndustryID"]));
            ob[7] = Convert.ToDecimal((context.Request["AnnualRevenue"] == "" ? "0" : context.Request["AnnualRevenue"]));
            ob[8] = context.Request["Fax"];
            ob[9] = Convert.ToInt32((context.Request["MemberOf"] == "" ? "0" : context.Request["MemberOf"]));
            ob[10] = context.Request["Ownership"];
            ob[11] = Convert.ToInt32((context.Request["TypeID"] == "" ? "0" : context.Request["TypeID"]));
            ob[12] = context.Request["TickerSymbol"];
            ob[13] = Convert.ToInt32((context.Request["AssignedTo"] == "" ? "0" : context.Request["AssignedTo"]));
            ob[14] = Convert.ToInt32((context.Request["RatingID"] == "" ? "0" : context.Request["RatingID"]));
            ob[15] = context.Request["NotifyOwner"];
            ob[16] = context.Request["EmailOptOut"];
            ob[17] = context.Request["SICCode"];
            ob[18] = context.Request["PrimaryTwitter"];
            ob[19] = context.Request["BillingAddress"];
            ob[20] = context.Request["BillingPOBox"];
            ob[21] = context.Request["BillingCity"];
            ob[22] = context.Request["BillingState"];
            ob[23] = context.Request["BillingPostalCode"];
            ob[24] = context.Request["BillingCountry"];
            ob[25] = context.Request["ShippingAddress"];
            ob[26] = context.Request["ShippingPOBox"];
            ob[27] = context.Request["ShippingCity"];
            ob[28] = context.Request["ShippingState"];
            ob[29] = context.Request["ShippingPostalCode"];
            ob[30] = context.Request["ShippingCountry"];
            ob[31] = context.Request["Descriptions"];
            ob[32] = context.Request["ImagePath"];
            ob[33] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
            ob[34] = Convert.ToDateTime((context.Request["CreatedOn"] == "" ? "1990/1/1" : context.Request["CreatedOn"]));
            ob[35] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
            ob[36] = Convert.ToDateTime((context.Request["ModifiedOn"] == "" ? "1990/1/1" : context.Request["ModifiedOn"]));
            ob[37] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
            ob[38] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
            ob[39] = context.Request["imode"];

            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Organizations]", ob);
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