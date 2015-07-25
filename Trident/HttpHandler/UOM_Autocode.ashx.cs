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
    /// Summary description for UOM_Autocode
    /// </summary>
    public class UOM_Autocode : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                string mode = context.Request["handler_mode"];
                if (mode == "save_UOM" || mode == "get_autocode" || mode == "update_UOM" || mode == "fetch_UOM")
                {
                    object[] ob = new object[11];
                    ob[0] = Convert.ToInt32(context.Request["UOMID"]);
                    ob[1] = context.Request["UOMCode"];
                    ob[2] = context.Request["UOMName"];
                    ob[3] = context.Request["UOMStatus"];
                    ob[4] = Convert.ToInt32(context.Request["CreatedBy"]);
                    ob[5] = context.Request["CreatedOn"];
                    ob[6] = Convert.ToInt32(context.Request["ModifiedBy"]);
                    ob[7] = context.Request["ModifiedOn"];
                    ob[8] = context.Request["iMode"];
                    ob[9] = context.Request["ScreenName"];
                    ob[10] = Convert.ToInt32(context.Request["CompanyID"]);

                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_UOM]", ob);
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