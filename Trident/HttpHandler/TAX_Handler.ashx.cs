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
    /// Summary description for TAX_Handler
    /// </summary>
    public class TAX_Handler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                string mode = context.Request["handler_mode"];
                if (mode == "save_TAX" || mode == "get_autocode" || mode == "update_TAX" || mode == "fetch_TAX")
                {
                    object[] ob = new object[12];
                    ob[0] = Convert.ToInt32(context.Request["TAXID"]);
                    ob[1] = context.Request["TaxName"];
                    ob[2] = context.Request["TAXCode"];
                    ob[3] =Convert.ToDecimal( context.Request["TaxValue"]);
                    ob[4] = context.Request["TaxStatus"];
                    ob[5] = Convert.ToInt32(context.Request["CreatedBy"]);
                    ob[6] = context.Request["CreatedOn"];
                    ob[7] = Convert.ToInt32(context.Request["ModifiedBy"]);
                    ob[8] = context.Request["ModifiedOn"];
                    ob[9] = context.Request["iMode"];
                    ob[10] = context.Request["ScreenName"];
                    ob[11] = Convert.ToInt32(context.Request["CompanyID"]);

                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_TAX]", ob);
                }
                else
                {
                    object[] ob = new object[1];
                    ob[0] = context.Request["ScreenName"];
                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_AutoGenMaster]", ob);
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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}