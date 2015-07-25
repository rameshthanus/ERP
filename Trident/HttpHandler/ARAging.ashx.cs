using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using MSDataAccess;
using Trident.classes;
using System.Globalization;

namespace Trident.HttpHandler
{
    /// <summary>
    /// Summary description for ARAging
    /// </summary>
    public class ARAging : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["Type"];
            if (mode == "1")
            {
                object[] ob = new object[6];
               // ob[0] = Convert.ToDateTime(funDatetime(context.Request["Fromdate"]));
                ob[0] = Convert.ToDateTime(funDatetime(context.Request["Fromdate"]));
                ob[1] = Convert.ToDateTime(funDatetime(context.Request["Todate"]));
                ob[2] = context.Request["Type"];
                ob[3] = context.Request["iMode"];
                ob[4] = Convert.ToInt16(context.Request["CompanyID"]);
                ob[5] = Convert.ToInt16(context.Request["BranchID"]);
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "spu_AccARReports", ob);
            }
            else if (mode=="2")
            {
                object[] ob = new object[6];
                 ob[0] = Convert.ToDateTime(funDatetime(context.Request["Fromdate"]));
               // ob[1] = Convert.ToDateTime(funDatetime(DateTime.Now.ToString()));
                ob[1] = Convert.ToDateTime(funDatetime(context.Request["Todate"]));
                ob[2] = context.Request["Type"];
                ob[3] = context.Request["iMode"];
                ob[4] = Convert.ToInt16(context.Request["CompanyID"]);
                ob[5] = Convert.ToInt16(context.Request["BranchID"]);
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "spu_AccARReports", ob);
            }
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
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
        DateTime funDatetime(string datetime)
        {

            datetime = DateTime.ParseExact(datetime, "dd/MM/yyyy", CultureInfo.InvariantCulture)
                 .ToString("MM/dd/yyyy hh:mm:ss", CultureInfo.InvariantCulture);
            DateTime date = System.DateTime.Now;
            date = Convert.ToDateTime(datetime);

            return date;
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