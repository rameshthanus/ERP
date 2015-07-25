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
    /// Summary description for AccPeriod
    /// </summary>
    public class AccPeriod : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                string mode = context.Request["iMode"];
                if (mode == "Insert" || mode == "Update" || mode == "Fetch" || mode == "Delete" || mode == "Count")
                {
                    object[] ob = new object[12];
                    ob[0] = Convert.ToInt32(context.Request["AccountsPeriodID"]);
                    ob[1] = context.Request["Year"];
                    ob[2] = context.Request["Period"];
                    ob[3] = Convert.ToDateTime(funDatetime(context.Request["StartDate"]));
                    ob[4] = Convert.ToDateTime(funDatetime(context.Request["EndDate"]));                   
                    ob[5] = context.Request["CloseStatus"];
                    ob[6] = Convert.ToInt32(context.Request["CreatedBy"]);
                    ob[7] = Convert.ToDateTime(funDatetime(context.Request["CreatedOn"]));
                    ob[8] = Convert.ToInt32(context.Request["ModifiedBy"]);
                    ob[9] = Convert.ToDateTime(funDatetime(context.Request["ModifiedOn"]));
                    ob[10] = context.Request["iMode"];                 
                    ob[11] = Convert.ToInt32(context.Request["CompanyID"]);
                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_AccountsPeriod]", ob);
                }               
                context.Response.ContentType = "application/json";
                context.Response.ContentEncoding = Encoding.UTF8;
                if (ds.Tables.Count > 0)
                {
                    context.Response.Write(Json.GetJson(ds.Tables[0]));
                }
            }
            catch (Exception e)
            {
            }
        }
        DateTime funDatetime(string datetime)
        {

            datetime = DateTime.ParseExact(datetime, "dd/M/yyyy", CultureInfo.InvariantCulture)
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