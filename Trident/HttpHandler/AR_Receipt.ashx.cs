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
    /// Summary description for AR_Receipt
    /// </summary>
    public class AR_Receipt : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "get_dropdown" || mode == "get_autocode" || mode == "get_customerjob" || mode == "get_category" || mode == "get_GridPopup" || mode == "get_prod_details" || mode == "get_prod_update")
            {
                object[] ob = new object[11];
                ob[0] = Convert.ToInt32(context.Request["ReceiptID"]);
                ob[1] = Convert.ToInt32(context.Request["Receipt_DetailID"]);
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
                ob[10] = Convert.ToDateTime(funDatetime(context.Request["period"]));
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ARReceiptSearch]", ob);
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
                        object[] ob = new object[29];
                        ob[0] = context.Request["ReceiptID"];
                        ob[1] = context.Request["BranchID"];
                        ob[2] = context.Request["ReceiptNo"];
                        //ob[3] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["SalesDate"])));
                        ob[3] = context.Request["doc_no"];
                        ob[4] = context.Request["Profit_Center"];
                        ob[5] = Convert.ToDateTime(funDatetime(context.Request["ReceiptDate"]));
                        ob[6] = context.Request["Period"];
                        ob[7] = context.Request["Year"];
                        ob[8] = context.Request["JOBID"];
                        ob[9] = context.Request["ac_source"];
                        ob[10] = context.Request["ac_Code"];
                        ob[11] = context.Request["PartyID"];
                        //ob[12] = context.Request["PartyCode"];
                        ob[12] = context.Request["doc_type"];
                        ob[13] = context.Request["CurrencyID"];
                        ob[14] = context.Request["Remarks"];
                        ob[15] = context.Request["loc_amt"];
                        ob[16] = context.Request["doc_Amt"];
                        ob[17] = context.Request["PostStatus"];
                        ob[18] = context.Request["CompanyID"];
                        ob[19] = context.Request["CreatedBy"];
                        ob[20] = Convert.ToDateTime(funDatetime(context.Request["CreatedOn"]));
                        ob[21] = context.Request["ModifiedBy"];
                        ob[22] = Convert.ToDateTime(funDatetime(context.Request["ModifiedOn"]));
                        ob[23] = context.Request["iMode"];
                        ob[24] = context.Request["Chequeno"];
                        ob[25] = Convert.ToDateTime(funDatetime(context.Request["ChequeDate"]));
                        ob[26] = context.Request["ex_rate"];
                        ob[27] = context.Request["Bank"];
                        ob[28] = context.Request["AdvanceReceipt"];
                        //ob[25] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["DeliveryDate"])));
                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ARReceiptHeader]", ob);
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
                        object[] ob = new object[14];


                        ob[0] = context.Request["Receipt_DetailID"];
                        ob[1] = context.Request["ReceiptID"];
                        ob[2] = context.Request["ProductCode"];
                        ob[3] = context.Request["Description"];
                        ob[4] = context.Request["ac_code"];
                        ob[5] = context.Request["ac_type"];
                        ob[6] = Convert.ToDecimal(context.Request["ex_rate"]);
                        ob[7] = Convert.ToDecimal(context.Request["Qty"]);
                        ob[8] = Convert.ToDecimal(context.Request["loc_amt"]);
                        ob[9] = Convert.ToDecimal(context.Request["doc_amt"]);
                        ob[10] = context.Request["imode"];
                        ob[11] = context.Request["InvoiceID"];
                        ob[12] = context.Request["LineType"];
                        ob[13] = context.Request["Currency"];

                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ARReceiptDetail]", ob);
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
            DateTime date = System.DateTime.Now; ;
            string dob = (datetime);
            string[] dateformat = dob.Split('/');
            string originaldate = dateformat[2] + "/" + dateformat[1] + "/" + dateformat[0];
            date = DateTime.ParseExact(originaldate, "yyyy/MM/dd", CultureInfo.InvariantCulture);
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