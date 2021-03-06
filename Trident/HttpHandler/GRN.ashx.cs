﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using MSDataAccess;
using Trident.classes;
using System.Globalization;
using System.Web.SessionState;

namespace Trident.HttpHandler
{
    /// <summary>
    /// Summary description for GRN
    /// </summary>
    public class GRN : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "get_dropdown" || mode == "get_autocode" || mode == "new_autocode" || mode == "get_customerjob" || mode == "get_category" || mode == "get_GridPopup" || mode == "get_prod_details" || mode == "get_prod_update")
            {
                object[] ob = new object[13];
                ob[0] = Convert.ToInt32(context.Request["GRNID"]);
                ob[1] = Convert.ToInt32(context.Request["GRNDetailID"]);
                ob[2] = Convert.ToInt32(context.Request["BranchID"]);
                ob[3] = context.Request["GRNNo"];
                ob[4] = Convert.ToInt32(context.Request["ProductID"]);
                ob[5] = context.Request["ProductCode"];
                ob[6] = Convert.ToInt32(context.Request["PartyID"]);
                ob[7] = Convert.ToInt32(context.Request["JOBID"]);

                ob[8] = context.Request["ScreenName"];

                ob[9] = Convert.ToInt32(context.Request["CompanyID"]);
                ob[10] = Convert.ToInt32(context.Request["OrderID"]);
            //    ob[11] = context.Request["Type"];
                ob[11] = context.Request["iMode"];
              //  ob[13] = Convert.ToInt32(context.Request["FromWarehouseID"]);
            //    ob[14] = Convert.ToInt32(context.Request["ToWarehouseID"]);
            //    ob[15] = Convert.ToInt32(context.Request["FromBranchID"]);
              //  ob[16] = Convert.ToInt32(context.Request["InvoiceNo"]);
                ob[12] = Convert.ToInt32(context.Request["CategoryID"]);
                

                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_GRNSearch]", ob);
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
            //{
            //    if (mode == "new_autocode")
            //    {
            //        object[] ob = new object[2];
            //        ob[0] = context.Request["ScreenName"];
            //        ob[1] = Convert.ToInt32(context.Request["CompanyID"]);
            //        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_AutoGenTransaction]", ob);
            //        if (ds.Tables.Count > 0)
            //        {
            //            context.Response.Write(Json.GetJson(ds.Tables[0]));
            //        }
            //    }
            //    else
            //    {
                    if (mode == "header")
                    {
                        object[] ob = new object[22];
                        ob[0] = context.Request["GRNID"];
                        ob[1] = context.Request["BranchID"];
                        ob[2] = context.Request["GRNNo"];
                        ob[3] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["GRNDate"])));
                    //    ob[4] = context.Request["PartyID"];
                        ob[4] = context.Request["JOBID"];
                        ob[5] = context.Request["Status"];
                        ob[6] = context.Request["CreatedBy"];
                        ob[7] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["CreatedOn"]))); 
                        ob[8] = context.Request["ModifiedBy"];
                        ob[9] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["ModifiedOn"]))); 
                        ob[10] = context.Request["TotalQty"];
                        ob[11] = context.Request["TotalAmount"];                      
                        ob[12] = context.Request["Remarks"];
                        ob[13] = context.Request["CompanyID"];
                        ob[14] = HttpContext.Current.Session["Year"];
                        ob[15] = context.Request["attachment1"];
                        ob[16] = context.Request["attachment2"];
                        ob[17] = context.Request["attachment3"];
                        ob[18] = context.Request["comment1"];
                        ob[19] = context.Request["comment2"];
                        ob[20] = context.Request["comment3"];
                       // ob[20] = Convert.ToDateTime(funDatetime(Convert.ToString(context.Request["InvoiceDate"])));
                        ob[21] = context.Request["iMode"];
                       // ob[22] = context.Request["DCNo"];                      
                       
                                                                                                                    
                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_GRNHeader]", ob);
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
                        object[] ob = new object[11];
                        ob[0] = context.Request["GRNDetailID"];
                        ob[1] = context.Request["GRNID"];
                        ob[2] = context.Request["ProductCode"];
                        ob[3] = context.Request["Description"];
                        ob[4] = Convert.ToDecimal(context.Request["Qty"]);                       
                        ob[5] = Convert.ToDecimal(context.Request["Rate"]);
                        ob[6] = Convert.ToDecimal(context.Request["Amount"]);
                        ob[7] = Convert.ToInt16(context.Request["PartyID"]);
                        ob[8] = Convert.ToInt16(context.Request["WareHouseID"]);
                        ob[9] = Convert.ToInt16(context.Request["POID"]);
                        ob[10] = context.Request["imode"];
                        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_GRNDetail]", ob);
                        if (ds.Tables.Count > 0)
                        {
                            context.Response.Write(Json.GetJson(ds.Tables[0]));
                        }
                    }
                //}
           // }

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