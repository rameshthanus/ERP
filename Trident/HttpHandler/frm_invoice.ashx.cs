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
    /// Summary description for frm_invoice
    /// </summary>
    public class frm_invoice : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["handler_mode"];
            if (mode == "print")
            {
                object[] ob = new object[2];
                ob[0] = Convert.ToInt32(context.Request["pid"]);               
                ob[1] = context.Request["imode"];
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "spu_InvoicePrint", ob);
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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}