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
    /// Summary description for ReportChart
    /// </summary>
    public class ReportChart : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();

            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            object[] ob = new object[5];
            ob[0] = context.Request["iMode"];
            ob[1] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["StartDate"])));
           // ob[1] = Convert.ToDateTime(context.Request["StartDate"]);
            ob[2] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["EndDate"])));
          //  ob[2] = Convert.ToDateTime(context.Request["EndDate"]);
            ob[3] = Convert.ToInt32(context.Request["CompanyID"]);
            ob[4] = Convert.ToInt32(context.Request["BranchID"]);

            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ReportChart]", ob);
            if (ds.Tables.Count > 1)
            {
                DataTable dt = new DataTable();
                dt.Merge(ds.Tables[0]);
                dt.Merge(ds.Tables[1]);
                context.Response.Write(Json.GetJson(dt));
            }
            else
            {
                if (ds.Tables.Count > 0)
                {
                    context.Response.Write(Json.GetJson(ds.Tables[0]));
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

        DateTime funDatetime(string datetime)
        {

            datetime = DateTime.ParseExact(datetime, "dd/MM/yyyy", CultureInfo.InvariantCulture)
                 .ToString("MM/dd/yyyy hh:mm:ss", CultureInfo.InvariantCulture);
            DateTime date = System.DateTime.Now;
            date = Convert.ToDateTime(datetime);

            return date;
        }
    }
}