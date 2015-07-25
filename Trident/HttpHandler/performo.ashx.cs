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
    /// Summary description for performo
    /// </summary>
    public class performo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "get_dropdown" || mode == "get_customerjob" || mode == "get_autocode" || mode == "get_GridPopup" || mode == "get_prod_details" || mode == "get_prod_update")
            {
                object[] ob = new object[9];
                ob[0] = Convert.ToInt32(context.Request["QuotationID"]);
                ob[1] = Convert.ToInt32(context.Request["QuotationDetailID"]);
                ob[2] =  Convert.ToInt32(context.Request["BranchID"]);
             
                ob[3] = Convert.ToInt32(context.Request["ProductID"]);
                ob[4] = context.Request["ProductCode"];
               
                ob[5] = Convert.ToInt32(context.Request["JOBID"]);
               
                ob[6] = context.Request["ScreenName"];

                ob[7] = Convert.ToInt32(context.Request["CompanyID"]);
                ob[8] = context.Request["iMode"];

                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_QuotationSearch]", ob);
                if (ds.Tables.Count > 0)
                {
                    if (mode == "get_dropdown" || mode=="get_prod_update" )
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
               
                    if (mode == "header")
                    {
                        object[] ob = new object[22];

                        ob[0] = context.Request["BranchID"];
                        ob[1] = context.Request["QuotationNo"];
                        ob[2] = Convert.ToDateTime(context.Request["QuotationDate"]);
                        ob[3] = context.Request["JOBID"];
                        ob[4] = context.Request["TAXID"];
                        ob[5] = Convert.ToDateTime(context.Request["DeliveryDate"]);
                        ob[6] = context.Request["Status"];
                        ob[7] = context.Request["InternalNote"];
                        ob[8] = context.Request["InvoiceNote"];
                        ob[9] = context.Request["CreatedBy"];
                        ob[10] = context.Request["CreatedOn"];
                        ob[11] = context.Request["ModifiedBy"];
                        ob[12] = context.Request["ModifiedOn"];
                        ob[13] = context.Request["TotalQty"];
                        ob[14] = context.Request["SubTotal"];
                        ob[15] = context.Request["DiscountAmount"];
                        ob[16] = context.Request["TaxAmount"];
                        ob[17] = context.Request["ShippingFee"];
                        ob[18] = context.Request["TotalAmount"];
                        ob[19] = context.Request["CompanyID"];
                        ob[20] = context.Request["iMode"];
                        ob[21] = context.Request["QuotationID"];

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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}