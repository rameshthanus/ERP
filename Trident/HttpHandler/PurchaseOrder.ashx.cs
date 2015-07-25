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
    /// Summary description for PurchaseOrder
    /// </summary>
    public class PurchaseOrder : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "get_dropdown" || mode == "get_autocode" || mode == "new_autocode" || mode == "get_customerjob" || mode == "get_category" || mode == "get_GridPopup" || mode == "get_prod_details" || mode == "get_prod_update")
            {
                object[] ob = new object[16];
                ob[0] = Convert.ToInt32(context.Request["PurchaseOrderID"]);
                ob[1] = Convert.ToInt32(context.Request["PurchaseOrderDetailID"]);
                ob[2] = Convert.ToInt32(context.Request["BranchID"]);
                ob[3] = context.Request["PurchaseOrderNo"];
                ob[4] = Convert.ToInt32(context.Request["Year"]);
                ob[5] = Convert.ToInt32(context.Request["ProductID"]);
                ob[6] = context.Request["ProductCode"];
                ob[7] = Convert.ToInt32(context.Request["PartyID"]);
                ob[8] = Convert.ToInt32(context.Request["JOBID"]);
                ob[9] = Convert.ToInt32(context.Request["IndentID"]);
                ob[10] = context.Request["ScreenName"];

                ob[11] = Convert.ToInt32(context.Request["CompanyID"]);
                ob[12] = context.Request["iMode"];
                ob[13] = context.Request["CategoryID"];

                ob[14] = Convert.ToInt32(context.Request["CreatedBy"]);
                ob[15] = Convert.ToInt32(context.Request["ModifiedBy"]);


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
                //if (mode == "new_autocode")
                //{
                //    object[] ob = new object[2];
                //    ob[0] = context.Request["ScreenName"];
                //    ob[1] = Convert.ToInt32(context.Request["CompanyID"]);                
                //    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_AutoGenTransaction]", ob);
                //    if (ds.Tables.Count > 0)
                //    {
                //        context.Response.Write(Json.GetJson(ds.Tables[0]));
                //    }
                //}
                //else
                //{
                    if (mode == "header")
                    {
                        object[] ob = new object[22];

                        ob[0] = context.Request["PurchaseOrderID"];
                        ob[1] = context.Request["BranchID"];
                        ob[2] = context.Request["PurchaseOrderNo"];
                        ob[3] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["PurchaseOrderDate"])));
                      
                        ob[4] = context.Request["JOBID"];
                        
                       
                        ob[5] = context.Request["Remarks"];
                        ob[6] = context.Request["CurrencyID"];
                        ob[7] = context.Request["CreatedBy"];
                        //ob[8] = context.Request["CreatedOn"];
                        ob[8] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["CreatedOn"])));
                        ob[9] = context.Request["ModifiedBy"];
                        //ob[10] = context.Request["ModifiedOn"];
                        ob[10] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["ModifiedOn"])));
                        ob[11] = context.Request["TotalQty"];
                        ob[12] = context.Request["TotalAmount"];
                        ob[13] = context.Request["Status"];
                        ob[14] = context.Request["iMode"];
                        ob[15] = context.Request["CompanyID"];

                        ob[16] = context.Request["attachment1"];
                        ob[17] = context.Request["attachment2"];
                        ob[18] = context.Request["attachment3"];
                        ob[19] = context.Request["comment1"];
                        ob[20] = context.Request["comment2"];
                        ob[21] = context.Request["comment3"];
                       

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
                        object[] ob = new object[10];
                        ob[0] = context.Request["ProductDetailID"];
                        ob[1] = context.Request["PurchaseOrderID"];
                        ob[2] = context.Request["ProductCode"];
                        ob[3] = context.Request["Description"];
                        ob[4] = Convert.ToDecimal(context.Request["Qty"]);
                        ob[5] = Convert.ToDecimal(context.Request["Rate"]);
                        ob[6] = Convert.ToDecimal(context.Request["Amount"]);
                        ob[7] = context.Request["imode"];
                        ob[8] = context.Request["PartyID"];
                        ob[9] =   Convert.ToDateTime(((context.Request["DeliveryDate"] == null || context.Request["DeliveryDate"] == "") ? funDatetime("01/01/1990") : funDatetime(Convert.ToString(context.Request["DeliveryDate"]))));

                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_PurchaseOrderDetail]", ob);
                        if (ds.Tables.Count > 0)
                        {

                            context.Response.Write(Json.GetJson(ds.Tables[0]));


                        }
                    }
              //  }
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