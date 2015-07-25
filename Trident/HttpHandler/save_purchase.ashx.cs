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
    /// Summary description for save_purchase
    /// </summary>
    public class save_purchase : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "header")
            {
                object[] ob = new object[20];

                ob[0] = context.Request["PurchaseOrderID"];
                ob[1] = context.Request["BranchID"];
                ob[2] = context.Request["PurchaseOrderNo"];
                ob[3] = Convert.ToDateTime(context.Request["PurchaseOrderDate"]);
                ob[4] = context.Request["PartyID"];
                ob[5] = context.Request["JOBID"];
                ob[6] = context.Request["IndentID"];
                ob[7] = Convert.ToDateTime(context.Request["DeliveryDate"]);
                ob[8] = context.Request["Remarks"];
                ob[9] = context.Request["CurrencyID"];                
                ob[10] = context.Request["CreatedBy"];
                ob[11] = context.Request["CreatedOn"];
                ob[12] = context.Request["ModifiedBy"];
                ob[13] = context.Request["ModifiedOn"];
                ob[14] = context.Request["TotalQty"];
                ob[15] = context.Request["TotalAmount"];
                ob[16] = context.Request["Status"];
                ob[17] = context.Request["iMode"];                               
                ob[18] = context.Request["CompanyID"];
                ob[19] = context.Request["SubTotal"];

                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_PurchaseOrderHeader]", ob);
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
            else
            {
                object[] ob = new object[8];


                ob[0] = context.Request["ProductDetailID"];
                ob[1] = context.Request["PurchaseOrderID"];
                ob[2] = context.Request["ProductCode"];
                ob[3] = context.Request["Description"];
                ob[4] = Convert.ToDecimal(context.Request["Qty"]);               
                ob[5] = Convert.ToDecimal(context.Request["Rate"]);
                ob[6] = Convert.ToDecimal(context.Request["Amount"]);
                ob[7] = context.Request["imode"];

                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_PurchaseOrderDetail]", ob);
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