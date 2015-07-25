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
    /// Summary description for Quotation
    /// </summary>
    public class Quotation : IHttpHandler
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
                ob[0] = Convert.ToInt32(context.Request["QuotationID"]);
                ob[1] = Convert.ToInt32(context.Request["QuotationDetailID"]);
                ob[2] = Convert.ToInt32(context.Request["BranchID"]);

                ob[3] = Convert.ToInt32(context.Request["ProductID"]);
                ob[4] = context.Request["ProductCode"];

                ob[5] = Convert.ToInt32(context.Request["JOBID"]);

                ob[6] = context.Request["ScreenName"];

                ob[7] = Convert.ToInt32(context.Request["CompanyID"]);
                ob[8] = context.Request["iMode"];
                ob[9] = context.Request["CategoryID"];
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_QuotationSearch]", ob);

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
                        object[] ob = new object[33];

                        ob[0] = context.Request["BranchID"];
                        ob[1] = context.Request["QuotationNo"];
                        ob[2] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["QuotationDate"])));
                       // ob[2] = Convert.ToDateTime(context.Request["QuotationDate"]);
                        ob[3] = context.Request["JOBID"];
                        ob[4] = context.Request["TAXID"];
                        ob[5] = context.Request["PartyID"];
                        ob[6] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["DeliveryDate"])));
                       // ob[5] = Convert.ToDateTime(context.Request["DeliveryDate"]);
                        ob[7] = context.Request["Status"];
                        ob[8] = context.Request["InternalNote"];
                        ob[9] = context.Request["InvoiceNote"];
                        ob[10] = context.Request["CreatedBy"];
                        ob[11] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["CreatedOn"])));
                        //ob[10] = context.Request["CreatedOn"];
                        ob[12] = context.Request["ModifiedBy"];
                        ob[13] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["ModifiedOn"])));
                        //ob[12] = context.Request["ModifiedOn"];
                        ob[14] = context.Request["TotalQty"];
                        ob[15] = context.Request["SubTotal"];
                        ob[16] = context.Request["DiscountAmount"];
                        ob[17] = context.Request["TaxAmount"];
                        ob[18] = context.Request["ShippingFee"];
                        ob[19] = context.Request["TotalAmount"];
                        ob[20] = context.Request["CompanyID"];
                        ob[21] = context.Request["iMode"];
                        ob[22] = context.Request["QuotationID"];
                        ob[23] = context.Request["CustomerAddress"];
                        ob[24] = context.Request["SalespersonID"];
                        ob[25] = context.Request["Attachment1"];
                        ob[26] = context.Request["Attachment2"];
                        ob[27] = context.Request["Attachment3"];
                        ob[28] = context.Request["Comment1"];
                        ob[29] = context.Request["Comment2"];
                        ob[30] = context.Request["Comment3"];
                        ob[31] = context.Request["ShippingAddressID"];
                        ob[32] = context.Request["CurrencyID"];
                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_QuotationHeader]", ob);
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


                        ob[0] = context.Request["QuotationDetailID"];
                        ob[1] = context.Request["QuotationID"];
                        ob[2] = context.Request["ProductCode"];
                        ob[3] = context.Request["Description"];
                        ob[4] = Convert.ToDecimal(context.Request["Qty"]);
                        ob[5] = context.Request["Discount"];
                        ob[6] = Convert.ToDecimal(context.Request["DiscountAmount"]);
                        ob[7] = Convert.ToDecimal(context.Request["Rate"]);
                        ob[8] = Convert.ToDecimal(context.Request["Amount"]);
                        ob[9] = context.Request["imode"];

                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_QuotationDetail]", ob);
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
            // string dob = (datetime);
            // string[] dateformat = dob.Split('/');
            // string originaldate = dateformat[2] + "/" + dateformat[1] + "/" + dateformat[0];
            // date = DateTime.ParseExact(originaldate, "yyyy/MM/dd", CultureInfo.InvariantCulture);
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