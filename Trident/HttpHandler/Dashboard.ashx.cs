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
    /// Summary description for Dashboard
    /// </summary>
    public class Dashboard : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                context.Response.ContentType = "application/json";
                context.Response.ContentEncoding = Encoding.UTF8;
                object[] ob = new object[12];
                ob[0] = context.Request["imode"];
                ob[1] = context.Request["sptype"];
                ob[2] = context.Request["title"];
                ob[3] = context.Request["type"];
                ob[4] = context.Request["start"];
                ob[5] = context.Request["end"];
                ob[6] = context.Request["starttime"];
                ob[7] = context.Request["endtime"];
                ob[8] = context.Request["companyId"];
                ob[9] = context.Request["branchId"];
                ob[10] = context.Request["CalenderID"];
                ob[11] = context.Request["Desc"];
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Dashboard]", ob);
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