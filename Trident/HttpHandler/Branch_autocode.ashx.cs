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
    /// Summary description for Branch_autocode
    /// </summary>
    public class Branch_autocode : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
             DataSet ds = new DataSet();
                string mode = context.Request["handler_mode"];
                if (mode == "save_Branch" || mode == "get_autocode" || mode == "update_Branch" || mode == "fetch_Branch" || mode == "get_dropdown")
                {
                    object[] ob = new object[21];
                    ob[0] = Convert.ToInt32(context.Request["BranchID"]);
                    ob[1] = context.Request["BranchCode"];
                    ob[2] = context.Request["BranchName"];
                    ob[3] = context.Request["Address1"];
                    ob[4] = context.Request["Address2"];
                    ob[5] = context.Request["Address3"];
                    ob[6] = context.Request["City"];
                    ob[7] = context.Request["State"];
                    ob[8]=context.Request["Country"];
                    ob[9]=context.Request["PostalCode"];
                    ob[10]=context.Request["PhoneNumber"];
                      ob[11]=context.Request["EMail"];
                      ob[12]=context.Request["ContactPerson"];                                            
                    ob[13] = context.Request["BranchStatus"];
                    ob[14] = Convert.ToInt32(context.Request["CreatedBy"]);
                    ob[15] = context.Request["CreatedOn"];
                    ob[16] = Convert.ToInt32(context.Request["ModifiedBy"]);
                    ob[17] = context.Request["ModifiedOn"];                   
                    ob[18] = context.Request["iMode"];
                    ob[19] = context.Request["ScreenName"];                    
                    ob[20] = Convert.ToInt32(context.Request["CompanyID"]);
                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Branch]", ob);
                }
                else
                {
                    object[] ob = new object[1];
                    ob[0] = context.Request["ScreenName"];
                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_AutoGenMaster]", ob);
                }
                context.Response.ContentType = "application/json";
                context.Response.ContentEncoding = Encoding.UTF8;
                if (ds.Tables.Count > 0)
                {
                    context.Response.Write(Json.GetJson(ds.Tables[0]));
                }
            }
            catch (Exception e)
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