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
    /// Summary description for Events
    /// </summary>
    public class Events : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                context.Response.ContentType = "application/json";
                context.Response.ContentEncoding = Encoding.UTF8;
                object[] ob = new object[25];
                ob[0] = context.Request["Tittle"];
                ob[1] = context.Request["Type"];
                ob[2] =  Convert.ToDateTime((context.Request["Startdate"] == "" ? "1990/1/1" : context.Request["Startdate"]));
                ob[3] = Convert.ToDateTime((context.Request["Starttime"] == "" ? "1990/1/1" : context.Request["Starttime"]));
                ob[4] =  Convert.ToDateTime((context.Request["Enddate"] == "" ? "1990/1/1" : context.Request["Enddate"]));
                ob[5] = Convert.ToDateTime((context.Request["Endtime"] == "" ? "1990/1/1" : context.Request["Endtime"]));
                ob[6] = Convert.ToInt32((context.Request["StatusID"] == "" ? "0" : context.Request["StatusID"]));
                ob[7] = context.Request["Notification"];
                ob[8] = Convert.ToInt32((context.Request["ActivityID"] == "" ? "0" : context.Request["ActivityID"]));
                ob[9] = context.Request["Location"];
                ob[10] = Convert.ToInt32((context.Request["PriorityID"] == "" ? "0" : context.Request["PriorityID"]));
                ob[11] = Convert.ToInt32((context.Request["VisibilityID"] == "" ? "0" : context.Request["VisibilityID"]));
                ob[12] = Convert.ToInt32((context.Request["RelatedTypeID"] == "" ? "0" : context.Request["RelatedTypeID"]));
                ob[13] = Convert.ToInt32((context.Request["RelateToID"] == "" ? "0" : context.Request["RelateToID"]));
                ob[14] = context.Request["Backgroundcolor"];
                ob[15] = context.Request["URL"];
                ob[16] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
                ob[17] = Convert.ToDateTime((context.Request["CreatedOn"] == "" ? "1990/1/1" : context.Request["CreatedOn"]));
                ob[18] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
                ob[19] =  Convert.ToDateTime((context.Request["ModifiedOn"] == "" ? "1990/1/1" : context.Request["ModifiedOn"]));
                ob[20] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
                ob[21] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
                ob[22] = context.Request["Descriptions"];
                ob[23] = context.Request["iMode"];
                ob[24] = Convert.ToInt32((context.Request["EventsId"] == "" ? "0" : context.Request["EventsId"]));
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Events]", ob);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables.Count > 1)
                    {
                        DataTable dt = new DataTable();
                        for (var i = 0; i < ds.Tables.Count; i++)
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
            catch (Exception e)
            {

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