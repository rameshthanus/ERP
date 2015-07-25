using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using MSDataAccess;
using Trident.classes;
using Trident.Common;
using System.Web.SessionState;

namespace Trident.HttpHandler
{
    /// <summary>
    /// Summary description for Login
    /// </summary>
    public class Login : IHttpHandler, IRequiresSessionState 
    {

        //public void ProcessRequest(HttpContext context)
        //{
        //    DataSet ds = new DataSet();
        //    EnCryptionAndDecription Obj_ComEncript = new EnCryptionAndDecription();
        //    string mode = context.Request["hmode"];
        //    context.Response.ContentType = "application/json";
        //    context.Response.ContentEncoding = Encoding.UTF8;
        //    if (mode == "search" || mode == "fetch-detail")
        //    {
        //        object[] ob = new object[11];
        //        ob[0] = Convert.ToInt32(context.Request["UserID"]);
        //        ob[1] = Convert.ToInt32(context.Request["UserGroupID"]);
        //        ob[2] = context.Request["LoginID"];
        //        ob[3] = Obj_ComEncript.fEncrypt(context.Request["LoginPassword"]);
        //        ob[4] = context.Request["iMode"];
        //        ob[5] = Convert.ToInt32(context.Request["BranchID"]);
        //        ob[6] = Convert.ToInt32(context.Request["CompanyID"]);
        //        ob[7] = Convert.ToInt32(context.Request["PassordCompanyID"]);
        //        ob[8] = context.Request["EmailID"];
        //        ob[9] = Convert.ToDateTime(System.DateTime.Now);
        //        ob[10] = Convert.ToDateTime(System.DateTime.Now);
        //        ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Login]", ob);
        //        if (ds.Tables.Count > 0)
        //        {
        //            if (context.Request["iMode"] == "ComboBind" || context.Request["iMode"] == "fetch" || context.Request["iMode"] == "MenuBind")
        //            {
        //                DataTable dt = new DataTable();
        //                for (int i = 0; i < ds.Tables.Count; i++)
        //                {
        //                    dt.Merge(ds.Tables[i]);
        //                }
        //                context.Response.Write(Json.GetJson(dt));
        //            }
        //            else if (context.Request["iMode"] == "login")
        //            {
        //               // string n = ds.Tables[1].Rows[0]["LoginID"].ToString();
        //                HttpContext.Current.Session["UserName"] = ds.Tables[1].Rows[0]["LoginID"].ToString();
        //                HttpContext.Current.Session["UserID"] = ds.Tables[1].Rows[0]["UserID"].ToString();
        //                HttpContext.Current.Session["UserGroupID"] = ds.Tables[1].Rows[0]["UserGroupID"].ToString();
        //                HttpContext.Current.Session["IsSuperAdmin"] = ds.Tables[1].Rows[0]["IsSuperAdmin"].ToString();
        //                //    HttpContext.Current.Session["CompanyName"] = Convert.ToString(CompanyName);
        //                HttpContext.Current.Session["CompanyID"] = context.Request["CompanyID"];
        //                //HttpContext.Current.Session["BranchName"] = Convert.ToString(BranchName);
        //                HttpContext.Current.Session["BranchID"] = context.Request["BranchID"];
        //                context.Response.Write(Json.GetJson(ds.Tables[0]));
        //            }
        //            else
        //            {
        //                context.Response.Write(Json.GetJson(ds.Tables[0]));
        //            }

        //        }
        //    }
        //}
        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            EnCryptionAndDecription Obj_ComEncript = new EnCryptionAndDecription();
            string mode = context.Request["hmode"];
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;
            if (mode == "search" || mode == "fetch-detail")
            {
                object[] ob = new object[11];
                ob[0] = Convert.ToInt32(context.Request["UserID"]);
                ob[1] = Convert.ToInt32(context.Request["UserGroupID"]);
                ob[2] = context.Request["LoginID"];
                ob[3] = Obj_ComEncript.fEncrypt(context.Request["LoginPassword"]);
                ob[4] = context.Request["iMode"];
                ob[5] = Convert.ToInt32(context.Request["BranchID"]);
                ob[6] = Convert.ToInt32(context.Request["CompanyID"]);
                ob[7] = Convert.ToInt32(context.Request["PassordCompanyID"]);
                ob[8] = context.Request["EmailID"];
                ob[9] = Convert.ToDateTime(System.DateTime.Now);
                ob[10] = Convert.ToDateTime(System.DateTime.Now);
                ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Login]", ob);
                if (ds.Tables.Count > 0)
                {
                    if (context.Request["iMode"] == "ComboBind" || context.Request["iMode"] == "fetch" || context.Request["iMode"] == "MenuBind")
                    {
                        DataTable dt = new DataTable();
                        for (int i = 0; i < ds.Tables.Count; i++)
                        {
                            dt.Merge(ds.Tables[i]);
                        }
                        context.Response.Write(Json.GetJson(dt));
                    }
                    else if (context.Request["iMode"] == "login")
                    {
                        if (ds.Tables.Count > 1)
                        {

                            string n = ds.Tables[1].Rows[0]["LoginID"].ToString();
                            HttpContext.Current.Session["UserName"] = ds.Tables[1].Rows[0]["LoginID"].ToString();
                            HttpContext.Current.Session["UserID"] = ds.Tables[1].Rows[0]["UserID"].ToString();
                            HttpContext.Current.Session["UserGroupID"] = ds.Tables[1].Rows[0]["UserGroupID"].ToString();
                            HttpContext.Current.Session["IsSuperAdmin"] = ds.Tables[1].Rows[0]["IsSuperAdmin"].ToString();
                            HttpContext.Current.Session["Year"] = Convert.ToString("2015-2016");
                            HttpContext.Current.Session["CompanyID"] = context.Request["CompanyID"];
                            //HttpContext.Current.Session["BranchName"] = Convert.ToString(BranchName);
                            HttpContext.Current.Session["BranchID"] = context.Request["BranchID"];
                            context.Response.Write(Json.GetJson(ds.Tables[0]));
                        }
                        context.Response.Write(Json.GetJson(ds.Tables[0]));
                    }
                    else
                    {
                        context.Response.Write(Json.GetJson(ds.Tables[0]));
                    }

                }
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