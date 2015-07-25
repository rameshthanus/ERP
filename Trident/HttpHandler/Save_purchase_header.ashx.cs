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
    /// Summary description for Save_purchase_header
    /// </summary>
    public class Save_purchase_header : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                object[] ob = new object[24];
                ob[0] = Convert.ToInt32(context.Request["PurchaseOrderID"]);
                ob[1] = Convert.ToInt32(context.Request["BranchID"]);
                ob[2] = context.Request["PurchaseOrderNo"];
                ob[3] = Convert.ToInt32(context.Request["Year"]);
                ob[4] = Convert.ToDateTime(context.Request["PurchaseOrderDate"]);
                ob[5] = Convert.ToInt32(context.Request["PartyID"]);
                ob[6] = Convert.ToInt32(context.Request["JOBID"]);
                ob[7] = Convert.ToInt32(context.Request["IndentID"]);
                ob[8] = Convert.ToDateTime(context.Request["DeliveryDate"]);
                ob[9] = context.Request["DeliveryAt"];
                ob[10] = context.Request["Description"];
                ob[11] = context.Request["Remarks"];
                ob[12] = Convert.ToInt32(context.Request["CurrencyID"]);
                ob[13] = Convert.ToInt32(context.Request["CreatedBy"]);
                ob[14] = Convert.ToDateTime(context.Request["CreatedOn"]);
                ob[15] = Convert.ToInt32(context.Request["ModifiedBy"]);
                ob[16] = Convert.ToDateTime(context.Request["ModifiedOn"]);
                ob[17] =  Convert.ToDecimal(context.Request["TotalQty"]);
                ob[18] = Convert.ToDecimal(context.Request["TotalAmount"]);
                ob[19] = context.Request["Status"];
                ob[20] = context.Request["iMode"];
                ob[21] = Convert.ToInt32(context.Request["ApprovedUserID"]);
                ob[22] = Convert.ToInt32(context.Request["ApprovedStatus"]);
                ob[23] = Convert.ToInt32(context.Request["CompanyID"]);

                ds = MSDataAccess.DataAccess.ExecuteDataset("Data Source=DEV;Initial Catalog=Vertias;Integrated Security=false;uid=sa;pwd=Efrontier123", "[spu_PurchaseOrderHeader]", ob);
                context.Response.ContentType = "application/json";
                context.Response.ContentEncoding = Encoding.UTF8;
                if (ds.Tables.Count > 0)
                {                                      
                    context.Response.Write(GetJson(ds.Tables[0]));
                }
            }
            catch (Exception e)
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