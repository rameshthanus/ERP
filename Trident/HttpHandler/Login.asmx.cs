
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

using BEL_LAYER;
using DAL_LAYER;
using System.Web.Services;
using System.Web.Script.Services;
using System.ComponentModel;

namespace Trident.HttpHandler
{
    /// <summary>
    /// Summary description for Login1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Login1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod(EnableSession = true)]
        public string Authenticate(string LoginID, string LoginPassword, int BranchID, int CompanyID,string BranchName ,string CompanyName,bool rememberMe)
        {
            DataSet ds = new DataSet();
            EnCryptionAndDecription Obj_ComEncript = new EnCryptionAndDecription();
            bel_login bel = new bel_login();
            dal_login dal = new dal_login();
            bel._LoginID = LoginID;
            bel._LoginPassword = Obj_ComEncript.fEncrypt(LoginPassword);
            bel._iMode = "login";
            bel._BranchID = BranchID;
            bel._CompanyID = CompanyID;
            ds = dal.dal_Logindetail(bel);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows[0][0].ToString() != "ERROR_USERNAME")
                {
                    // string n = ds.Tables[1].Rows[0]["LoginID"].ToString();
                    HttpContext.Current.Session["UserName"] = ds.Tables[1].Rows[0]["LoginID"].ToString();
                    HttpContext.Current.Session["UserID"] = ds.Tables[1].Rows[0]["UserID"].ToString();
                    HttpContext.Current.Session["UserGroupID"] = ds.Tables[1].Rows[0]["UserGroupID"].ToString();
                    HttpContext.Current.Session["IsSuperAdmin"] = ds.Tables[1].Rows[0]["IsSuperAdmin"].ToString();
                    HttpContext.Current.Session["CompanyName"] = Convert.ToString(CompanyName);
                    HttpContext.Current.Session["Year"] = ds.Tables[2].Rows[0]["Year"].ToString();
                    HttpContext.Current.Session["CompanyID"] = CompanyID;
                    HttpContext.Current.Session["BranchName"] = Convert.ToString(BranchName);
                    HttpContext.Current.Session["BranchID"] = BranchID;
                    //context.Response.Write(Json.GetJson(ds.Tables[0]));
                    if (rememberMe)
                    {
                        HttpContext.Current.Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                        HttpContext.Current.Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        HttpContext.Current.Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                        HttpContext.Current.Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                    }
                    HttpContext.Current.Response.Cookies["UserName"].Value = LoginID.Trim();
                    HttpContext.Current.Response.Cookies["Password"].Value = LoginPassword.Trim();

                    return "SUCCESS";
                }
                else
                {
                    return "FAIL";
                }
            }
            else
            {
                return "FAIL";
            }
           

        }
    }
}
