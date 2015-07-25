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
    /// Summary description for purchase
    /// </summary>
    public class purchase : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "get_dropdown" || mode == "get_customerjob" || mode == "get_GridPopup" || mode == "get_prod_details" || mode == "get_prod_update")
            {
                object[] ob = new object[15];
                ob[0] = Convert.ToInt32(context.Request["PurchaseOrderID"]);
                ob[1] = Convert.ToInt32(context.Request["PrurchaseOrderDetailID"]);
                ob[2] = Convert.ToInt32(context.Request["BranchID"]);
                ob[3] = context.Request["PrurchaseOrderNo"];
                ob[4] = Convert.ToInt32(context.Request["Year"]);
                ob[5] = Convert.ToInt32(context.Request["ProductID"]);
                ob[6] = context.Request["ProductCode"];
                ob[7] = Convert.ToInt32(context.Request["PartyID"]);
                ob[8] = Convert.ToInt32(context.Request["JOBID"]);
                ob[9] = Convert.ToInt32(context.Request["IndentID"]);                
                ob[10] = context.Request["ScreenName"];

                ob[11] = Convert.ToInt32(context.Request["CompanyID"]);
                ob[12] = context.Request["iMode"];
               
                ob[13] = Convert.ToInt32(context.Request["CreatedBy"]);
                ob[14] = Convert.ToInt32(context.Request["ModifiedBy"]);
                

                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_PurchaseOrderSearch]", ob);
                if (ds.Tables.Count > 0)
                {
                    if (mode == "get_dropdown" || mode == "get_prod_update")
                    {
                        DataTable dt = new DataTable();
                        for (int i = 0; i < ds.Tables.Count; i++)
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
            else
            {
                object[] ob = new object[2];
                ob[0] = context.Request["ScreenName"];
                ob[1] = Convert.ToInt32(context.Request["CompanyID"]);
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_AutoGenTransaction]", ob);
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
    }
}