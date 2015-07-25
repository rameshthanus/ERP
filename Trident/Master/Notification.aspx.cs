using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Text;
using BEL_LAYER;
using DAL_LAYER;
using Trident.classes;

namespace Trident.Master
{
    public partial class Notification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static List<Dictionary<string, object>> Load_users(string imode)
        {
            DataSet ds = new DataSet();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = new Dictionary<string, object>();
            try
            {

                bel_UserCreation obj_bel_UserCreation = new bel_UserCreation();
                dal_UserCreation obj_dal_UserCreation = new dal_UserCreation();
                obj_bel_UserCreation._iMode = imode;
                using (ds = obj_dal_UserCreation.dal_UserCreationdetail(obj_bel_UserCreation))
                {                    
                    if (ds.Tables.Count > 0)
                    {
                        return Json.getjson_(ds.Tables[0]);
                    }
                    else
                    {
                        row.Add("res", "No Data");
                        rows.Add(row);
                        return rows;
                    }
                }
            }
            catch (Exception ex)
            {
                row.Add("res", "exception");
                rows.Add(row);
                return rows;
            }
        }

        [WebMethod(EnableSession=true)]
        public static List<Dictionary<string, object>> Save_Notifcaion(string imode, string userid, string type, DateTime date, string shrtdesc, string desc, int noticationid, string usergrpid)
        {
            DataSet ds = new DataSet();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = new Dictionary<string, object>();
            try
            {
                bel_Notification obj_bel_Notification = new bel_Notification();
                dal_Notification obj_dal_Notificaion = new dal_Notification();
                obj_bel_Notification._iMode = imode;
                obj_bel_Notification._UserID = userid;
                obj_bel_Notification._Type = type;
                obj_bel_Notification._NotificationDate = date;
                obj_bel_Notification._shrtdescription = shrtdesc;
                obj_bel_Notification._description = desc;
                obj_bel_Notification._BranchID = 1;
                obj_bel_Notification._NotificationID = noticationid;
                obj_bel_Notification._UsergroupID = usergrpid;
                using (ds = obj_dal_Notificaion.dal_NotificationHeader(obj_bel_Notification))
                {
                    if (ds.Tables.Count > 0)
                    {
                        return Json.getjson_(ds.Tables[0]);
                    }
                    else
                    {
                        row.Add("res", "No Data");
                        rows.Add(row);
                        return rows;
                    }
                }
            }
            catch (Exception ex)
            {
                row.Add("res", "exception");
                rows.Add(row);
                return rows;
            }
        }

        [WebMethod(EnableSession=true)]
        public static List<Dictionary<string, object>> Fetch_Details(string imode, int NotificationID)
        {
            DataSet ds = new DataSet();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = new Dictionary<string, object>();
            try
            {
                bel_Notification obj_bel_Notification = new bel_Notification();
                dal_Notification obj_dal_Notificaion = new dal_Notification();
                obj_bel_Notification._iMode = imode;
                obj_bel_Notification._NotificationID = NotificationID;
                obj_bel_Notification._BranchID = 1;
                using (ds = obj_dal_Notificaion.dal_NotificationHeader(obj_bel_Notification))
                {
                    if (ds.Tables.Count > 0)
                    {
                        return Json.getjson_(ds.Tables[0]);
                    }
                    else
                    {
                        row.Add("res", "No Data");
                        rows.Add(row);
                        return rows;
                    }
                }
            }
            catch (Exception ex)
            {
                row.Add("res", "exception");
                rows.Add(row);
                return rows;
            }

        }       
    }
}