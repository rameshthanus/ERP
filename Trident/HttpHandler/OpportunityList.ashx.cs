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
    /// Summary description for OpportunityList
    /// </summary>
    public class OpportunityList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            object[] ob = new object[22];

            ob[0] = Convert.ToInt32((context.Request["OpportunityID"] == "" ? "0" : context.Request["OpportunityID"]));            
            ob[1] = context.Request["OpportunityName"];
            ob[2] = Convert.ToInt32((context.Request["OrganizationID"] == "" ? "0" : context.Request["OrganizationID"]));
            ob[3] = Convert.ToDecimal((context.Request["Amount"] == "" ? "0" : context.Request["Amount"]));
            ob[4] = Convert.ToInt32((context.Request["TypeID"] == "" ? "0" : context.Request["TypeID"]));
            ob[5] =  Convert.ToDateTime(((context.Request["ExpectedCloseDate"] == null || context.Request["ExpectedCloseDate"] == "") ? "1990/1/1" : context.Request["ExpectedCloseDate"]));
            ob[6] = Convert.ToInt32((context.Request["LeadSourceID"] == "" ? "0" : context.Request["LeadSourceID"]));
            ob[7] = context.Request["NextStep"];
            ob[8] = Convert.ToInt32((context.Request["AssignedTo"] == "" ? "0" : context.Request["AssignedTo"]));
            ob[9] = Convert.ToInt32((context.Request["SalesStageID"] == "" ? "0" : context.Request["SalesStageID"]));
            ob[10] = Convert.ToInt32((context.Request["CampaignSourceID"] == "" ? "0" : context.Request["CampaignSourceID"]));
            ob[11] = Convert.ToDecimal((context.Request["Probability"] == "" ? "0" : context.Request["Probability"]));
            ob[12] = Convert.ToDecimal((context.Request["ForecastAmout"] == "" ? "0" : context.Request["ForecastAmout"]));
            ob[13] = Convert.ToInt32((context.Request["ContactID"] == "" ? "0" : context.Request["ContactID"]));
            ob[14] = context.Request["Description"];
            ob[15] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
            ob[16] = Convert.ToDateTime(((context.Request["CreatedOn"] == null || context.Request["CreatedOn"] == "") ? "1990/1/1" : context.Request["CreatedOn"]));
            ob[17] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
            ob[18] = Convert.ToDateTime(((context.Request["ModifiedOn"] == null || context.Request["ModifiedOn"] == "") ? "1990/1/1" : context.Request["ModifiedOn"]));
            ob[19] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
            ob[20] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
            ob[21] = context.Request["imode"];

            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Opportunity]", ob);
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