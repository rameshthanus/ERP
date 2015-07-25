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
    /// Summary description for Company
    /// </summary>
    public class Company : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                string mode = context.Request["handler_mode"];
                if (mode == "save_Company" || mode == "get_autocode" || mode == "update_Company" || mode == "fetch_Company" || mode == "get_dropdown")
                {
                    object[] ob = new object[25];
                    ob[0] = context.Request["CompanyID"];
                    ob[1] = context.Request["CompanyCode"];
                    ob[2] = context.Request["CompanyName"];                   
                    ob[3] = context.Request["Address1"];
                    ob[4] = context.Request["Address2"];
                    ob[5] = context.Request["Address3"];
                    ob[6] = context.Request["City"];
                    ob[7] = context.Request["State"];
                    ob[8] = context.Request["Country"];
                    ob[9] = context.Request["PostalCode"];
                    ob[10] = context.Request["PhoneNumber"];
                    ob[11] = context.Request["Fax"];
                    ob[12] = context.Request["Email"];
                    ob[13] = context.Request["PAN"];
                    ob[14] = context.Request["CST"];
                    ob[15] = context.Request["TIN"];
                    ob[16] = context.Request["ContactPerson"];                   
                    ob[17] = context.Request["CompanyStatus"];
                    ob[18] = Convert.ToInt32(context.Request["CreatedBy"]);
                    ob[19] = context.Request["CreatedOn"];
                    ob[20] = Convert.ToInt32(context.Request["ModifiedBy"]);
                    ob[21] = context.Request["ModifiedOn"];
                    ob[22] = context.Request["iMode"];
                    ob[23] = context.Request["ScreenName"];
                    ob[24] = context.Request["Prefix"];                   
                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Company]", ob);
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