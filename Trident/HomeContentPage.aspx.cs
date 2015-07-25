using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using System.Data;
using System.Text;


namespace Trident
{
    public partial class HomeContentPage : System.Web.UI.Page
    {

        bel_Approval obj_bel_Approval = new bel_Approval();
        dal_Approval obj_dal_Approval = new dal_Approval();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                functionGetWaitingCount();

            }
        }
        void functionGetWaitingCount()
        {
            try
            {

                obj_bel_Approval._iMode = "WaitingCount";

                using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            lblPurcaseOrderApproval.Text = ds.Tables[0].Rows[0]["POApproval"].ToString();
                        }

                        if (ds.Tables[1].Rows.Count > 0)
                        {

                            lblPurcaseOrderCount.Text = ds.Tables[1].Rows[0]["POCount"].ToString();
                        }
                        if (ds.Tables[2].Rows.Count > 0)
                        {
                            lblIndentApproval.Text = ds.Tables[2].Rows[0]["IndentApproval"].ToString();
                        }
                        if (ds.Tables[3].Rows.Count > 0)
                        {
                            lblIndentCount.Text = ds.Tables[3].Rows[0]["IndentCount"].ToString();
                        }
                        if (ds.Tables[4].Rows.Count > 0)
                        {
                            lblSOcount.Text = ds.Tables[4].Rows[0]["salesCount"].ToString();
                        }
                        if (ds.Tables[5].Rows.Count > 0)
                        {
                            lblQuotation.Text = ds.Tables[5].Rows[0]["QuotationCount"].ToString();
                        }
                        if (ds.Tables[6].Rows.Count > 0)
                        {
                            lblDelivery.Text = ds.Tables[6].Rows[0]["DeliveryCount"].ToString();
                        }
                       

                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
       
    }
}