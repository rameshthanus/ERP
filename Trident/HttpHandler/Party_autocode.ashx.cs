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
    /// Summary description for Party_autocode
    /// </summary>
    public class Party_autocode : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                string mode = context.Request["handler_mode"];
                if (mode == "save_Party" || mode == "get_autocode" || mode == "update_Party" || mode == "fetch_Party" || mode == "get_dropdown")
                {
                    object[] ob = new object[24];
                    ob[0] = context.Request["PartyID"];
                    ob[1] = context.Request["PartyCode"];
                    ob[2] = context.Request["PartyName"];
                    ob[3] = context.Request["Type"];
                    ob[4] = context.Request["Address1"];
                    ob[5] = context.Request["Address2"];
                    ob[6] = context.Request["Address3"];
                    ob[7] = context.Request["City"];
                    ob[8] = context.Request["State"];
                    ob[9] = context.Request["Country"];
                    ob[10] = context.Request["PostalCode"];
                    ob[11] = context.Request["PhoneNumber"];
                    ob[12] = context.Request["Email"];
                    ob[13] = context.Request["PAN"];
                    ob[14] = context.Request["CST"];
                    ob[15] = context.Request["ContactPerson"];
                    ob[16] = context.Request["PartyStatus"];
                    ob[17] = Convert.ToInt32(context.Request["CreatedBy"]);
                    ob[18] = context.Request["CreatedOn"];
                    ob[19] = Convert.ToInt32(context.Request["ModifiedBy"]);
                    ob[20] = context.Request["ModifiedOn"];
                    ob[21] = context.Request["iMode"];
                    ob[22] = context.Request["ScreenName"];
                    ob[23] = Convert.ToInt32(context.Request["CompanyID"]);
                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Party]", ob);
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