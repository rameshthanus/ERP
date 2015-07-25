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
    /// Summary description for Indent_handler
    /// </summary>
    public class Indent_handler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                string mode = context.Request["hmode"];
                context.Response.ContentType = "application/json";
                context.Response.ContentEncoding = Encoding.UTF8;
                if (mode == "get_dropdown" || mode == "get_autocode" || mode == "get_customerjob" || mode == "get_category" || mode == "get_GridPopup" || mode == "get_prod_details" || mode == "get_prod_update")
                {
                    object[] ob = new object[11];
                    ob[0] = Convert.ToInt32(context.Request["IndentID"]);
                    ob[1] = Convert.ToInt32(context.Request["IndentDetailID"]);
                    ob[2] = Convert.ToInt32(context.Request["BranchID"]);
                    ob[3] = Convert.ToInt32(context.Request["ProductID"]);
                    ob[4] = (context.Request["ProductCode"]);
                    ob[5] = Convert.ToInt32(context.Request["JOBID"]);
                    ob[6] = context.Request["ScreenName"];
                    ob[7] = Convert.ToInt32(context.Request["CompanyID"]);
                    ob[8] = context.Request["iMode"];
                    ob[9] = context.Request["CategoryID"];
                    ob[10] = context.Request["QuotationID"];

                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_IndentSearch]", ob);
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
                            object[] ob = new object[15];
                            ob[0] = context.Request["IndentID"];
                            ob[1] = context.Request["BranchID"];
                            ob[2] = context.Request["IndentNo"];
                            ob[3] = Convert.ToDateTime(context.Request["IndentDate"]);
                            ob[4] = context.Request["JOBID"];
                            ob[5] = context.Request["Status"];
                            ob[6] = context.Request["TotalQty"];
                            ob[7] = context.Request["TotalAmount"];
                            ob[8] = context.Request["CreatedBy"];
                            ob[9] = context.Request["CreatedOn"];
                            ob[10] = context.Request["ModifiedBy"];
                            ob[11] = context.Request["ModifiedOn"];
                            //ob[12] = context.Request["ApprovedStatus"];
                            //ob[13] = context.Request["ApprovedUserID"];
                            ob[12] = context.Request["CompanyID"];
                            ob[13] = context.Request["Remarks"];
                            ob[14] = context.Request["iMode"];

                            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_IndentHeader]", ob);
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


                            ob[0] = context.Request["IndentDetailID"];
                            ob[1] = context.Request["IndentID"];
                            ob[2] = context.Request["ProductCode"];
                            ob[3] = context.Request["Description"];
                            ob[4] = Convert.ToDecimal(context.Request["Qty"]);

                            ob[5] = Convert.ToDecimal(context.Request["Rate"]);
                            ob[6] = Convert.ToDecimal(context.Request["Amount"]);
                            ob[7] = context.Request["imode"];

                            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_IndentDetail]", ob);
                            if (ds.Tables.Count > 0)
                            {

                                context.Response.Write(Json.GetJson(ds.Tables[0]));


                            }
                        }
                    }
                }
            }
            catch(Exception lk)
            {

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