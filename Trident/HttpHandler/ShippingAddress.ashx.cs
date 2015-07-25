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
    /// Summary description for ShippingAddress
    /// </summary>
    public class ShippingAddress : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                string mode = context.Request["handler_mode"];
                if (mode == "get_dropdown" || mode == "save_Shipping" || mode == "get_autocode" || mode == "update_Shipping" || mode == "fetch_Shipping")
                {
                    object[] ob = new object[17];
                    ob[0] = Convert.ToInt32(context.Request["ShippingAddressID"]);
                    ob[1] = context.Request["Code"];
                    ob[2] = context.Request["PartyID"];
                    ob[3] = context.Request["Address1"];
                    ob[4] = context.Request["Address2"];
                    ob[5] = context.Request["City"];
                    ob[6] = context.Request["State"];
                    ob[7] = context.Request["Country"];
                    ob[8] = context.Request["Zipcode"];
                    ob[9] = context.Request["Status"];
                    ob[10] = Convert.ToInt32(context.Request["CreatedBy"]);
                    ob[11] = context.Request["CreatedOn"];
                    ob[12] = Convert.ToInt32(context.Request["ModifiedBy"]);
                    ob[13] = context.Request["ModifiedOn"];
                    ob[14] = context.Request["iMode"];
                    ob[15] = context.Request["ScreenName"];
                    ob[16] = Convert.ToInt32(context.Request["CompanyID"]);

                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ShippingAddress]", ob);
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