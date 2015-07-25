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
    /// Summary description for TaskList
    /// </summary>
    public class TaskList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
           
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "search" || mode=="fetch-detail")
            {
                object[] ob = new object[9];
                ob[0] = Convert.ToInt32((context.Request["TaskListID"] == "" ? "0" : context.Request["TaskListID"]));
                ob[1] = Convert.ToInt32((context.Request["TaskListDetailID"] == "" ? "0" : context.Request["TaskListDetailID"]));
                ob[2] = Convert.ToInt32((context.Request["UserGroupID"] == "" ? "0" : context.Request["UserGroupID"]));
                ob[3] = Convert.ToInt32((context.Request["UserID"] == "" ? "0" : context.Request["UserID"]));
                ob[4] = Convert.ToInt32((context.Request["JobID"] == "" ? "0" : context.Request["JobID"]));
                ob[5] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
                ob[6] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
                ob[7] = context.Request["iMode"];
                ob[8] = context.Request["ScreenName"];
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_TaskListSearch]", ob);
                if (ds.Tables.Count > 0)
                {
                    if (context.Request["iMode"] == "combobind" || context.Request["iMode"] == "fetch")
                    {
                        DataTable dt = new DataTable();
                        for (int i = 0; i < ds.Tables.Count; i++)
                        {
                            dt.Merge(ds.Tables[i]);
                        }
                        context.Response.Write(Json.GetJson(dt));
                    }
                    else
                    {
                        context.Response.Write(Json.GetJson(ds.Tables[0]));
                    }
                }
            }
            else
            {
                if (mode == "header")
                {
                    object[] ob = new object[9];
                    ob[0] = Convert.ToInt32((context.Request["TaskID"] == "" ? "0" : context.Request["TaskID"]));
                    ob[1] = context.Request["TaskCode"];
                    ob[2] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
                    ob[3] = Convert.ToDateTime(((context.Request["CreatedOn"] == null || context.Request["CreatedOn"] == "") ? "1990/1/1" : context.Request["CreatedOn"]));
                    ob[4] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
                    ob[5] = Convert.ToDateTime(((context.Request["ModifiedOn"] == null || context.Request["ModifiedOn"] == "") ? "1990/1/1" : context.Request["ModifiedOn"]));
                    ob[6] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
                    ob[7] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
                    ob[8] = context.Request["iMode"];
                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_TaskListHeader]", ob);
                    if (ds.Tables.Count > 0)
                    {
                        context.Response.Write(Json.GetJson(ds.Tables[0]));
                    }
                }
                else
                {
                    if (mode == "detail")
                    {
                        object[] ob = new object[16];
                        ob[0] = Convert.ToInt32((context.Request["TaskListID"] == "" ? "0" : context.Request["TaskListID"]));
                        ob[1] = Convert.ToInt32((context.Request["UserGroupID"] == "" ? "0" : context.Request["UserGroupID"]));
                        ob[2] = context.Request["UserID"];
                        ob[3] = context.Request["TaskName"];
                        ob[4] = Convert.ToInt32((context.Request["JobID"] == "" ? "0" : context.Request["JobID"]));
                        ob[5] = Convert.ToInt32((context.Request["PriorityID"] == "" ? "0" : context.Request["PriorityID"]));
                        ob[6] = Convert.ToInt32((context.Request["StatusID"] == "" ? "0" : context.Request["StatusID"]));
                        ob[7] =Convert.ToInt32((context.Request["ProgressID"] == "" ? "0" : context.Request["ProgressID"])) ;
                        ob[8] = Convert.ToDateTime(((context.Request["StartDate"] == null || context.Request["StartDate"] == "") ? "1990/1/1" : context.Request["StartDate"]));
                        ob[9] = Convert.ToDateTime(((context.Request["EndDate"] == null || context.Request["EndDate"] == "") ? "1990/1/1" : context.Request["EndDate"]));
                        ob[10] = context.Request["Description"];
                        ob[11] = context.Request["Documents"];
                        ob[12] = context.Request["Comments"];
                        ob[13] = context.Request["CancelReason"];
                        ob[14] = context.Request["imode"];
                        ob[15] = Convert.ToInt32((context.Request["TaskDetailID"] == "" ? "0" : context.Request["TaskDetailID"]));
                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_TaskListDetail]", ob);
                        if (ds.Tables.Count > 0)
                        {
                            context.Response.Write(Json.GetJson(ds.Tables[0]));
                        }
                    }
                    
                }
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