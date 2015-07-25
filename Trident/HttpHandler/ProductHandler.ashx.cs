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
    /// Summary description for ProductHandler
    /// </summary>
    public class ProductHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                string mode = context.Request["handler_mode"];
                if (mode == "save_Product" || mode == "get_autocode" || mode == "update_Product" || mode == "fetch_Product" || mode == "get_dropdown")
                {
                    object[] ob = new object[17];
                    ob[0] = Convert.ToInt32(context.Request["ProductID"]);
                    ob[1] = Convert.ToInt32(context.Request["CompanyID"]);
                    ob[2] = Convert.ToInt32(context.Request["CategoryID"]);
                    ob[3] = context.Request["Description"];
                    ob[4] = Convert.ToInt32(context.Request["UOMID"]);
                    ob[5] = context.Request["BuyPrice"];
                    ob[6] = context.Request["SalePrice"];
                    ob[7] = context.Request["ProductCode"];
                    ob[9] = context.Request["ProductStatus"];
                    ob[10] = Convert.ToInt32(context.Request["CreatedBy"]);
                    ob[11] = context.Request["CreatedOn"];
                    ob[12] = Convert.ToInt32(context.Request["ModifiedBy"]);
                    ob[13] = context.Request["ModifiedOn"];
                    ob[14] = context.Request["ProductGroupID"];
                    ob[15] = context.Request["ScreenName"];
                    ob[16] = context.Request["iMode"];
                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Product]", ob);
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