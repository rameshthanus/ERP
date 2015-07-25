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
    /// Summary description for Milestone
    /// </summary>
    public class Milestone : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            object[] ob = new object[14];

            ob[0] = Convert.ToInt32((context.Request["MilestoneID"] == "" ? "0" : context.Request["MilestoneID"]));
            ob[1] = context.Request["MilestoneName"];
            ob[2] = Convert.ToInt32((context.Request["ProjectID"] == "" ? "0" : context.Request["ProjectID"]));
            ob[3] = Convert.ToDateTime(((context.Request["MilestoneDate"] == null || context.Request["MilestoneDate"] == "") ? "1990/1/1" : context.Request["MilestoneDate"]));
            ob[4] = Convert.ToInt32((context.Request["AssignedTo"] == "" ? "0" : context.Request["AssignedTo"]));
            ob[5] = Convert.ToInt32((context.Request["TypeID"] == "" ? "0" : context.Request["TypeID"]));           
            ob[6] = context.Request["Description"];
            ob[7] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
            ob[8] = Convert.ToDateTime(((context.Request["CreatedOn"] == null || context.Request["CreatedOn"] == "") ? "1990/1/1" : context.Request["CreatedOn"]));
            ob[9] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
            ob[10] = Convert.ToDateTime(((context.Request["ModifiedOn"] == null || context.Request["ModifiedOn"] == "") ? "1990/1/1" : context.Request["ModifiedOn"]));
            ob[11] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
            ob[12] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
            ob[13] = context.Request["imode"];

            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Milestone]", ob);
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