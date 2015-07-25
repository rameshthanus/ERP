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
    /// Summary description for documents
    /// </summary>
    public class documents : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            object[] ob = new object[13];
            ob[0] = Convert.ToInt32((context.Request["DocumentID"] == "" ? "0" : context.Request["DocumentID"]));
            ob[1] = context.Request["DocumentTitle"];
            ob[2] =  Convert.ToInt32((context.Request["RelateTypeID"] == "" ? "0" : context.Request["RelateTypeID"]));
            ob[3] =  Convert.ToInt32((context.Request["RelateToID"] == "" ? "0" : context.Request["RelateToID"]));
            ob[4] = context.Request["FilePath"];          
            ob[5] = context.Request["Description"];
            ob[6] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
            ob[7] = Convert.ToDateTime((context.Request["CreatedOn"] == "" ? "1990/1/1" : context.Request["CreatedOn"]));
            ob[8] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
            ob[9] = Convert.ToDateTime((context.Request["ModifiedOn"] == "" ? "1990/1/1" : context.Request["ModifiedOn"]));
            ob[10] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
            ob[11] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
            ob[12] = context.Request["iMode"];


            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_documents]", ob);
            if (ds.Tables.Count > 0)
            {
                DataTable dt = new DataTable();
                for (int i = 0; i < ds.Tables.Count; i++)
                {
                    dt.Merge(ds.Tables[i]);
                }
                context.Response.Write(Json.GetJson(dt));
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