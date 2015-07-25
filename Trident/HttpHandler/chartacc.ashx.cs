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
    /// Summary description for chartacc
    /// </summary>
    public class chartacc : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                string mode = context.Request["handler_mode"];
                if (mode == "save_ChartOfAccounts" || mode == "get_autocode" || mode == "update_ChartOfAccounts" || mode == "fetch_ChartOfAccounts" || mode == "get_dropdown")
                {
                    object[] ob = new object[15];
                    ob[0] = Convert.ToInt32(context.Request["CHARTID"]);
                    ob[1] = context.Request["AC_CODE"];
                    ob[2] = context.Request["AC_DESC"];
                    ob[3] = context.Request["AC_TYPE"];
                    ob[4] = context.Request["AC_DORC"];
                    ob[5] = context.Request["AC_BANK"];
                    ob[6] = context.Request["AC_CURR"];
                    ob[7] = context.Request["AC_SUBTYPE"];
                    ob[8] = context.Request["AC_SUB_PL"];
                    ob[9] = context.Request["AC_SUB_BS"];
                    ob[10] = Convert.ToDecimal(context.Request["G_NOS"]);
                    ob[11] = context.Request["AC_SUB_BS1"];
                    ob[12] = context.Request["iMode"];
                    ob[13] = Convert.ToInt32(context.Request["CompanyID"]);
                    ob[14] = Convert.ToInt32(context.Request["BranchID"]);
                    
                   
                    ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_ChartOfAccounts]", ob);
                }               
                context.Response.ContentType = "application/json";
                context.Response.ContentEncoding = Encoding.UTF8;
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