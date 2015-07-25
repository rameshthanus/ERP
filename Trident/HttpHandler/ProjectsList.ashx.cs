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
    /// Summary description for ProjectsList
    /// </summary>
    public class ProjectsList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            object[] ob = new object[24];

            ob[0] = Convert.ToInt32((context.Request["ProjectID"] == "" ? "0" : context.Request["ProjectID"]));           
            ob[1] = context.Request["JOBCode"];
            ob[2] = context.Request["ProjectName"];
            ob[3] = Convert.ToDateTime(((context.Request["StartDate"] == null || context.Request["StartDate"] == "") ? "1990/1/1" : context.Request["StartDate"]));
            ob[4] = Convert.ToInt32((context.Request["AssignedTo"] == "" ? "0" : context.Request["AssignedTo"]));
            ob[5] = Convert.ToDateTime(((context.Request["TargetEndDate"] == null || context.Request["TargetEndDate"] == "") ? "1990/1/1" : context.Request["TargetEndDate"]));
            ob[6] = Convert.ToDateTime(((context.Request["ActualEndDate"] == null || context.Request["ActualEndDate"] == "") ? "1990/1/1" : context.Request["ActualEndDate"]));
            ob[7] = Convert.ToInt32((context.Request["StatusID"] == "" ? "0" : context.Request["StatusID"]));
            ob[8] = Convert.ToInt32((context.Request["TypeID"] == "" ? "0" : context.Request["TypeID"]));
            ob[9] = Convert.ToInt32((context.Request["RelateTypeID"] == "" ? "0" : context.Request["RelateTypeID"]));
            ob[10] = Convert.ToInt32((context.Request["PartyID"] == "" ? "0" : context.Request["PartyID"]));
            ob[11] = Convert.ToDecimal((context.Request["TargetBudget"] == "" ? "0.0" : context.Request["TargetBudget"]));
            ob[12] = context.Request["ProjectUrl"];
            ob[13] = Convert.ToInt32((context.Request["PriorityID"] == "" ? "0" : context.Request["PriorityID"]));
            ob[14] = Convert.ToInt32((context.Request["ProgressID"] == "" ? "0" : context.Request["ProgressID"]));
            ob[15] = context.Request["Description"];
            ob[16] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
            ob[17] = Convert.ToDateTime(((context.Request["CreatedOn"] == null || context.Request["CreatedOn"] == "") ? "1990/1/1" : context.Request["CreatedOn"]));
            ob[18] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
            ob[19] = Convert.ToDateTime(((context.Request["ModifiedOn"] == null || context.Request["ModifiedOn"] == "") ? "1990/1/1" : context.Request["ModifiedOn"]));
            ob[20] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
            ob[21] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
            ob[22] = context.Request["imode"];
            ob[23] = context.Request["ScreenName"];
            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Projects]", ob);
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