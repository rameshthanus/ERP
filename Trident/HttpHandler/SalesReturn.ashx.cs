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
    /// Summary description for SalesReturn
    /// </summary>
    public class SalesReturn : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "get_dropdown" || mode == "get_autocode" || mode == "get_customerjob" || mode == "get_category" || mode == "get_GridPopup" || mode == "get_prod_details" || mode == "get_prod_update")
            {
                object[] ob = new object[12];
                ob[0] = Convert.ToInt32(context.Request["SalesReturnID"]);
                ob[1] = Convert.ToInt32(context.Request["SalesReturnDetailID"]);
                ob[2] = Convert.ToInt32(context.Request["BranchID"]);
                ob[3] = Convert.ToInt32(context.Request["ProductID"]);
                ob[4] = context.Request["ProductCode"];
                ob[5] = Convert.ToInt32(context.Request["JOBID"]);
                ob[6] = context.Request["ScreenName"];
                ob[7] = Convert.ToInt32(context.Request["CompanyID"]);
                ob[8] = Convert.ToInt32(context.Request["WarehouseID"]);
                ob[9] = context.Request["iMode"];
                ob[10] = context.Request["CategoryID"];               
                ob[11] = Convert.ToInt32(context.Request["PartyID"]);

                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_SalesReturnSearch]", ob);
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
                        ob[0] = context.Request["SalesReturnID"];
                        ob[1] = context.Request["BranchID"];
                        ob[2] = context.Request["SalesNo"];
                        ob[3] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["SalesDate"])));                       
                        ob[4] = context.Request["JOBID"];
                        ob[5] = context.Request["WarehouseID"];
                        ob[6] = context.Request["TAXID"];
                        ob[7] = context.Request["Status"];
                        ob[8] = context.Request["TotalQty"];
                        ob[9] = context.Request["SubTotal"];
                        ob[10] = context.Request["DiscountAmount"];
                        ob[11] = context.Request["TaxAmount"];
                        ob[12] = context.Request["ShippingFee"];
                        ob[13] = context.Request["TotalAmount"];
                        ob[14] = context.Request["CompanyID"];
                        ob[15] = context.Request["CustomerAddress"];
                        ob[16] = context.Request["CreatedBy"];
                        ob[17] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["CreatedOn"])));
                        ob[18] = context.Request["ModifiedBy"];
                        ob[19] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["ModifiedOn"])));
                        ob[20] = context.Request["iMode"];
                       
                        ob[21] = context.Request["InternalNote"];
                        ob[22] = context.Request["PartyID"];
                        ob[23] = context.Request["Attachment1"];
                        ob[24] = context.Request["Attachment2"];
                        ob[25] = context.Request["Attachment3"];
                        ob[26] = context.Request["Comment1"];
                        ob[27] = context.Request["Comment2"];
                        ob[28] = context.Request["Comment3"];                        
                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_SalesReturnHeader]", ob);
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


                        ob[0] = context.Request["SalesReturnDetailID"];
                        ob[1] = context.Request["SalesReturnID"];
                        ob[2] = context.Request["ProductCode"];
                        ob[3] = context.Request["Description"];
                        ob[4] = Convert.ToDecimal(context.Request["Qty"]);
                        ob[5] = context.Request["Discount"];
                        ob[6] = Convert.ToDecimal(context.Request["DiscountAmount"]);
                        ob[7] = Convert.ToDecimal(context.Request["Rate"]);
                        ob[8] = Convert.ToDecimal(context.Request["Amount"]);
                        ob[9] = context.Request["imode"];

                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_SalesReturnDetail]", ob);
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