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
    /// Summary description for ConvertLead
    /// </summary>
    public class ConvertLead : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            object[] ob = new object[22];

            ob[0] = context.Request["OrganizationStatus"];
            ob[1] = context.Request["OrganizationName"];
            ob[2] = Convert.ToInt32((context.Request["IndustryID"] == "" ? "0" : context.Request["IndustryID"]));
            ob[3] = context.Request["ContractStatus"];
            ob[4] = context.Request["LastName"];
            ob[5] = context.Request["FirstName"];
            ob[6] = context.Request["PrimaryEmail"];
            ob[7] = context.Request["OpportunityStatus"];
            ob[8] = context.Request["OpportunityName"];
            ob[9] = Convert.ToDateTime(((context.Request["ExpectedCloseDate"] == null || context.Request["ExpectedCloseDate"] == "") ? "1990/1/1" : context.Request["ExpectedCloseDate"]));
            ob[10] = Convert.ToInt32((context.Request["SalesStageID"] == "" ? "0" : context.Request["SalesStageID"]));
            ob[11] = Convert.ToDecimal((context.Request["Amount"] == "" ? "0.0" : context.Request["Amount"]));
            ob[12] = Convert.ToInt32((context.Request["AssignedTo"] == "" ? "0" : context.Request["AssignedTo"]));
            ob[13] = context.Request["TRRT"];
            ob[14] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
            ob[15] = Convert.ToDateTime(((context.Request["CreatedOn"] == null || context.Request["CreatedOn"] == "") ? "1990/1/1" : context.Request["CreatedOn"]));
            ob[16] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
            ob[17] = Convert.ToDateTime(((context.Request["ModifiedOn"] == null || context.Request["ModifiedOn"] == "") ? "1990/1/1" : context.Request["ModifiedOn"]));
            ob[18] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
            ob[19] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
            ob[20] = context.Request["imode"];
            ob[21] = Convert.ToInt32((context.Request["LeadID"] == "" ? "0" : context.Request["LeadID"]));
            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ConvertLead]", ob);
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