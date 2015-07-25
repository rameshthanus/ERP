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
    /// Summary description for AR_invoice
    /// </summary>
    public class AR_invoice : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "get_dropdown" || mode == "get_autocode" || mode == "get_customerjob" || mode == "get_category" || mode == "get_GridPopup" || mode == "get_prod_details" || mode == "get_prod_update")
            {
                object[] ob = new object[10];
                ob[0] = Convert.ToInt32(context.Request["InvoiceID"]);
                ob[1] = Convert.ToInt32(context.Request["Invoice_DetailID"]);
                ob[2] = Convert.ToInt32(context.Request["BranchID"]);

                ob[3] = Convert.ToInt32(context.Request["ProductID"]);
                ob[4] = context.Request["ProductCode"];

                ob[5] = Convert.ToInt32(context.Request["JOBID"]);

                ob[6] = context.Request["ScreenName"];

                ob[7] = Convert.ToInt32(context.Request["CompanyID"]);
           //     ob[8] = Convert.ToInt32(context.Request["WarehouseID"]);
                ob[8] = context.Request["iMode"];
             //   ob[10] = context.Request["CategoryID"];
               // ob[11] = context.Request["QuotationID"];
                ob[9] = Convert.ToInt32(context.Request["PartyID"]);

                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ARInvoiceSearch]", ob);
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
                if (mode == "new_autocode")
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
                else
                {
                    if (mode == "header")
                    {
                        object[] ob = new object[26];
                        ob[0] = context.Request["InvoiceID"];
                        ob[1] = context.Request["BranchID"];
                        ob[2] = context.Request["InvoiceNo"];
                        //ob[3] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["SalesDate"])));
                        ob[3] = context.Request["doc_no"];
                        ob[4] = context.Request["Profit_Center"];
                        ob[5] = Convert.ToDateTime(funDatetime(context.Request["InvoiceDate"]));
                        ob[6] = context.Request["Period"];
                     //   ob[7] = context.Request["Year"];
                        ob[7] = context.Request["JOBID"];
                        ob[8] = context.Request["ac_source"];
                        ob[9] = context.Request["ac_Code"];
                        ob[10] = context.Request["PartyID"];
                        ob[11] = context.Request["PartyCode"];
                        ob[12] = context.Request["doc_type"];
                        ob[13] = context.Request["CurrencyID"];
                        ob[14] = context.Request["Remarks"];
                        ob[15] = context.Request["loc_amt"];
                        ob[16] = context.Request["doc_Amt"];
                        ob[17] = context.Request["PostStatus"];
                        ob[18] = context.Request["TransferStatus"];
                        ob[19] = context.Request["CompanyID"];                      
                        ob[20] = context.Request["CreatedBy"];
                        ob[21] = Convert.ToDateTime(funDatetime(context.Request["CreatedOn"]));
                        ob[22] = context.Request["ModifiedBy"];
                        ob[23] =Convert.ToDateTime(funDatetime( context.Request["ModifiedOn"]));
                        ob[24] = context.Request["iMode"];
                        ob[25] = context.Request["ExRate"];
                        //ob[25] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["DeliveryDate"])));
                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ARInvoiceHeader]", ob);
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
                        object[] ob = new object[13];


                        ob[0] = context.Request["Invoice_DetailID"];
                        ob[1] = context.Request["InvoiceID"];
                        ob[2] = context.Request["ProductCode"];
                        ob[3] = context.Request["Description"];
                        ob[4] = context.Request["ac_code"];
                        ob[5] = context.Request["ac_type"];
                        ob[6] = Convert.ToDecimal(context.Request["ex_rate"]);
                        ob[7] = context.Request["Gst_Type"];                     
                        ob[8] = Convert.ToDecimal(context.Request["Qty"]);
                        ob[9] = Convert.ToDecimal(context.Request["loc_amt"]);
                        ob[10] = Convert.ToDecimal(context.Request["doc_amt"]);                       
                        ob[11] = context.Request["imode"];
                        ob[12] = context.Request["LineType"];

                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ARInvoiceDetail]", ob);
                        if (ds.Tables.Count > 0)
                        {

                            context.Response.Write(Json.GetJson(ds.Tables[0]));


                        }
                    }
                }
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