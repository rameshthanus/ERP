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
    /// Summary description for PurchaseReturn
    /// </summary>
    public class PurchaseReturn : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "get_dropdown" || mode == "get_autocode" || mode == "get_customerjob" || mode == "get_category" || mode == "get_GridPopup" || mode == "get_prod_details" || mode == "get_prod_update")
            {
                object[] ob = new object[14];
                ob[0] = Convert.ToInt32(context.Request["PurchaseReturnID"]);
                ob[1] = Convert.ToInt32(context.Request["PurchaseReturnDetailID"]);
                ob[2] = Convert.ToInt32(context.Request["BranchID"]);
                ob[3] = context.Request["PurchaseReturnNo"];
               // ob[4] = Convert.ToInt32(context.Request["Year"]);
                ob[4] = Convert.ToInt32(context.Request["ProductID"]);
                ob[5] = context.Request["ProductCode"];
                ob[6] = Convert.ToInt32(context.Request["PartyID"]);
                ob[7] = Convert.ToInt32(context.Request["JOBID"]);
              //  ob[9] = Convert.ToInt32(context.Request["IndentID"]);
                ob[8] = context.Request["ScreenName"];

                ob[9] = Convert.ToInt32(context.Request["CompanyID"]);
                ob[10] = context.Request["iMode"];
                ob[11] = context.Request["CategoryID"];

                ob[12] = Convert.ToInt32(context.Request["CreatedBy"]);
                ob[13] = Convert.ToInt32(context.Request["ModifiedBy"]);


                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_PurchaseReturnSearch]", ob);
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
                        object[] ob = new object[16];

                        ob[0] = context.Request["PurchaseReturnID"];
                        ob[1] = context.Request["BranchID"];
                        ob[2] = context.Request["PurchaseReturnNo"];
                        ob[3] = Convert.ToDateTime(context.Request["PurchaseReturnDate"]);
                        ob[4] = context.Request["PartyID"];
                        ob[5] = context.Request["JOBID"];
                       // ob[6] = context.Request["IndentID"];
                     //   ob[7] = Convert.ToDateTime(context.Request["DeliveryDate"]);
                        ob[6] = context.Request["Remarks"];
                       // ob[9] = context.Request["CurrencyID"];
                        ob[7] = context.Request["CreatedBy"];
                        ob[8] = context.Request["CreatedOn"];
                        ob[9] = context.Request["ModifiedBy"];
                        ob[10] = context.Request["ModifiedOn"];
                        ob[11] = context.Request["TotalQty"];
                        ob[12] = context.Request["TotalAmount"];
                        ob[13] = context.Request["Status"];
                        ob[14] = context.Request["iMode"];
                        ob[15] = context.Request["CompanyID"];


                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_PurchaseReturnHeader]", ob);

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
                        ob[1] = context.Request["PurchaseReturnID"];
                        ob[2] = context.Request["ProductCode"];
                        ob[3] = context.Request["Description"];
                        ob[4] = Convert.ToDecimal(context.Request["Qty"]);
                        ob[5] = Convert.ToDecimal(context.Request["Rate"]);
                        ob[6] = Convert.ToDecimal(context.Request["Amount"]);
                        ob[7] = context.Request["imode"];

                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_PurchaseReturnDetail]", ob);
                        if (ds.Tables.Count > 0)
                        {

                            context.Response.Write(Json.GetJson(ds.Tables[0]));


                        }
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