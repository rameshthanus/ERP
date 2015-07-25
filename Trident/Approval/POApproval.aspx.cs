using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using System.Text;
using System.Data;
using Trident.classes;

namespace Trident.Approval
{
    public partial class POApproval1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<Dictionary<string, object>> search_(string imode, string frmdate, string todate,string id)
        {
            DataSet ds = new DataSet();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = new Dictionary<string, object>();
            try
            {
                bel_Approval obj_bel_Approval = new bel_Approval();
                dal_Approval obj_dal_Approval = new dal_Approval();
                obj_bel_Approval._iMode = imode;
                obj_bel_Approval._ID = Convert.ToInt16(id);
                if (frmdate != null && todate != null && frmdate != "" && todate != "")
                {
                    obj_bel_Approval._FromDate = Convert.ToDateTime(frmdate);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(todate);
                }
                using (ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                {
                    return Json.getjson_(ds.Tables[0]);
                }
            }
            catch (Exception ex)
            {
                row.Add("res", "exception");
                rows.Add(row);
                return rows;
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<Dictionary<string, object>> action_(string imode,string status,string remarks,string id)
        {
            DataSet ds = new DataSet();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = new Dictionary<string, object>();
            try
            {
                bel_Approval obj_bel_Approval = new bel_Approval();
                dal_Approval obj_dal_Approval = new dal_Approval();
                obj_bel_Approval._iMode = imode;
                obj_bel_Approval._ID = Convert.ToInt16(id);
                if (imode != "PurchaseClosingStatus")
                    obj_bel_Approval._ApprovedStatus = Convert.ToInt16(status);
                else
                    obj_bel_Approval._Closing = status;

                obj_bel_Approval._Remarks = remarks.Trim();
                using (ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                {
                    row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                    rows.Add(row);
                    return rows;
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