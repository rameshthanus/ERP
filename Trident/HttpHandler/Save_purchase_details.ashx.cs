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
    /// Summary description for Save_purchase_details
    /// </summary>
    public class Save_purchase_details : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                DataSet ds = new DataSet();
                object[] ob = new object[14];
                ob[0] = Convert.ToInt32(context.Request["PurchaseOrderDetailID"]);
                ob[1] = Convert.ToInt32(context.Request["PurchaseOrderID"]);
                ob[2] = Convert.ToInt32(context.Request["ProductGroupID"]);
                ob[3] = Convert.ToInt32(context.Request["ProductID"]);
                ob[4] = Convert.ToInt32(context.Request["DesignID"]);
                ob[5] = Convert.ToInt32(context.Request["ColorID"]);
                ob[6] = Convert.ToInt32(context.Request["SizeID"]);
                ob[7] = Convert.ToInt32(context.Request["CategoryID"]);
                ob[8] = Convert.ToInt32(context.Request["QualityID"]);
                ob[9] = Convert.ToInt32(context.Request["UOMID"]);
                ob[10] = Convert.ToDecimal(context.Request["Qty"]);
                ob[11] = Convert.ToDecimal(context.Request["Rate"]);
                ob[12] = Convert.ToDecimal(context.Request["Amount"]);
                ob[13] = context.Request["iMode"];

                ds = MSDataAccess.DataAccess.ExecuteDataset("Data Source=DEV;Initial Catalog=Vertias;Integrated Security=false;uid=sa;pwd=Efrontier123", "[spu_PurchaseOrderDetail]", ob);
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