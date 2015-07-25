using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using MSDataAccess;

namespace Trident.HttpHandler
{
    /// <summary>
    /// Summary description for GetPurchaseOrderDetails
    /// </summary>
    public class GetPurchaseOrderDetails : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                object[] ob = new object[17];
                ob[0] = Convert.ToInt32(context.Request["PurchaseOrderID"]);
                ob[1] = Convert.ToInt32(context.Request["PurchaseOrderDetailID"]);
                ob[2] = Convert.ToInt32(context.Request["BranchID"]);
                ob[3] = context.Request["PurchaseOrderNo"];
                ob[4] = Convert.ToInt32(context.Request["Year"]);
                ob[5] = Convert.ToInt32(context.Request["ProductID"]);
                ob[6] = context.Request["ProductCode"];
                ob[7] = Convert.ToInt32(context.Request["PartyID"]);
                ob[8] = Convert.ToInt32(context.Request["JOBID"]);
                ob[9] = Convert.ToInt32(context.Request["IndentID"]);
                ob[10] = Convert.ToDateTime(context.Request["BillFromDate"]);
                ob[11] = Convert.ToDateTime(context.Request["BillToDate"]);
                ob[12] = context.Request["ScreenName"];
                ob[13] = Convert.ToInt32(context.Request["CompanyID"]);
                ob[14] = context.Request["iMode"];
                ob[15] = Convert.ToInt32(context.Request["CreatedBy"]);
                ob[16] = Convert.ToInt32(context.Request["ModifiedBy"]);
                ds = MSDataAccess.DataAccess.ExecuteDataset("Data Source=EFINDIA2;Initial Catalog=Vertias;Integrated Security=false;uid=sa;pwd=ef", "[spu_PurchaseOrderSearch]", ob);
                context.Response.ContentType = "application/json";
                context.Response.ContentEncoding = Encoding.UTF8;
                if (ds.Tables.Count > 0)
                {
                    DataTable dt_final = new DataTable();
                    DataTable dt = new DataTable();
                    dt_final.Merge(ds.Tables[0]);
                    for (int i = 1; i < ds.Tables.Count; i++)
                    {
                        dt_final.Merge(ds.Tables[i]);
                    }
                    context.Response.Write(GetJson(dt_final));
                }
            }
            catch(Exception e)
            {                 
            }
        }

        private string GetJson(DataTable dt)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = null;

            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
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