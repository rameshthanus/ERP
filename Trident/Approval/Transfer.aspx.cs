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

namespace Trident.Approval
{
    public partial class Transfer : System.Web.UI.Page
    {
        public static DataTable dt_pop = new DataTable();
        public static int Row_Index = 0;

        bel_Approval obj_bel_Approval = new bel_Approval();
        dal_Approval obj_dal_Approval = new dal_Approval();
        Common.CommonFunction obj_Common = new Common.CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                obj_Common.functionCheckActhorization("(B-B)Transfer-Approval", "AssignAuthorization");
                if (Common.CommonVariablesandmsg.ViewOnlyRights == "Y")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "calling", "cal_Readonly();", true);
                }
                        if (Common.CommonVariablesandmsg.ViewRights == "N")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view this screen');", true);
                            Response.Redirect("../HomeContentPage.aspx");
                        }
                        else
                        {
                txtSearch.Attributes.Add("onkeypress", "return handleEnter('" + btnSearchPOP.ClientID + "', event)");

                string ReferenceNo = string.Empty;
                txtFromDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");
                txtToDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");

                funBindGridGDNPopup();


                // mpePurcase.Show();
                txtSearch.Focus();
                        }


            }
        }
        protected void btn_Ok_Click(object sender, EventArgs e)
        {
            try
            {


                funGDNOK();


            }
            catch (Exception ex)
            {

            }
        }
        protected void Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HomeContentPage.aspx");
        }
        void funGDNOK()
        {
            try
            {
                if (Convert.ToString(searchResultGDN.DataKeys[Row_Index]["GDNID"].ToString()) != "0" && Convert.ToString(searchResultGDN.DataKeys[Row_Index]["DCID"].ToString()) != string.Empty)
                {
                    Button btnApproval = (Button)searchResultGDN.Rows[Row_Index].FindControl("btnGalleryApproval");
                    Button btnCancel = (Button)searchResultGDN.Rows[Row_Index].FindControl("btnGalleryCancel");
                    Button btnReset = (Button)searchResultGDN.Rows[Row_Index].FindControl("btnRefersh");
                    btnReset.Visible = true;
                    btnApproval.Visible = true;
                    btnCancel.Visible = false;
                    obj_bel_Approval._ID = Convert.ToInt32(searchResultGDN.DataKeys[Row_Index]["GDNID"].ToString());
                    obj_bel_Approval._NO = Convert.ToString(searchResultGDN.DataKeys[Row_Index]["GDNNo"].ToString());
                    obj_bel_Approval._iMode = "GDNStatus";
                    obj_bel_Approval._ApprovedStatus = 2;
                    obj_bel_Approval._Remarks = txtRemarks.Text;
                    using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {

                                // functionGetWaitingCount();

                                Row_Index = 0;
                                mpe.Hide();
                                txtRemarks.Text = string.Empty;
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Sucessfully Canceled');", true);

                            }

                        }
                    }


                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            try
            {
                mpe.Hide();
            }
            catch (Exception ex)
            {

            }
        }
        protected void btnGalleryCancel_Click(object sender, EventArgs e)
        {
            try
            {
                if (Common.CommonVariablesandmsg.EditRigts == "Y")
                {
                    mpe.Show();
                    txtRemarks.Focus();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);

                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void searchResultGDN_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToUpper() == "APPROVALROW")
                {




                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString()) != "0" && Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                        Button btnApproval = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                        Button btnCancel = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                        Button btnReset = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnRefersh");
                        Button btnClosingCompleted = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnClosingCompleted");
                        Button btnClosingRefersh = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnClosingRefersh");
                        btnReset.Visible = true;
                        btnApproval.Visible = false;
                        btnCancel.Visible = true;
                        btnClosingCompleted.Visible = true;
                        btnClosingRefersh.Visible = true;
                        obj_bel_Approval._ID = Convert.ToInt32(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString());

                        obj_bel_Approval._NO = Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNNo"].ToString());
                        obj_bel_Approval._iMode = "GDNStatus";
                        obj_bel_Approval._ApprovedStatus = 1;

                        obj_bel_Approval._Remarks = string.Empty;
                        using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                        {
                            if (ds.Tables.Count > 0)
                            {
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Sucessfully Approved');", true);
                                    // functionGetWaitingCount();

                                }

                            }
                        }
                         }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);

                        }
                    }


                }

                else if (e.CommandName.ToUpper() == "CANCELROW")
                {


                    if (Common.CommonVariablesandmsg.EditRigts == "Y")
                            {

                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;

                    Row_Index = row.RowIndex;

                            }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);

                    }



                }
                else if (e.CommandName.ToUpper() == "RESETROW")
                {




                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString()) != "0" && Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                        Button btnApproval = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                        Button btnCancel = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                        Button btnReset = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnRefersh");
                        Button btnClosingCompleted = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnClosingCompleted");
                        Button btnClosingRefersh = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnClosingRefersh");
                        btnApproval.Visible = true;
                        btnReset.Visible = false;
                        btnCancel.Visible = true;
                        btnClosingCompleted.Visible = true;
                        btnClosingRefersh.Visible = true;
                        obj_bel_Approval._ID = Convert.ToInt32(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString());

                        obj_bel_Approval._NO = Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNNo"].ToString());
                        obj_bel_Approval._iMode = "GDNStatus";
                        obj_bel_Approval._ApprovedStatus = 0;

                        obj_bel_Approval._Remarks = string.Empty;
                        using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                        {
                            if (ds.Tables.Count > 0)
                            {
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Sucessfully Reset');", true);
                                    // functionGetWaitingCount();

                                }

                            }
                        }
                         }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);

                        }

                    }


                }
                else if (e.CommandName.ToUpper() == "CLOSEROW")
                {




                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString()) != "0" && Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                            Button btnApproval = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                            Button btnCancel = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                            Button btnReset = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnRefersh");
                            Button btnClosingCompleted = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnClosingCompleted");
                            Button btnClosingRefersh = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnClosingRefersh");
                            btnReset.Visible = true;
                            btnApproval.Visible = true;
                            btnCancel.Visible = true;
                            btnClosingCompleted.Visible = false;
                            btnClosingRefersh.Visible = true;
                            obj_bel_Approval._ID = Convert.ToInt32(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString());

                            obj_bel_Approval._NO = Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNNo"].ToString());
                            obj_bel_Approval._iMode = "GDNClosingStatus";
                            obj_bel_Approval._Closing = "C";

                           
                            using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Sucessfully Closed');", true);
                                        // functionGetWaitingCount();

                                    }

                                }
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);

                        }
                    }


                }

                else if (e.CommandName.ToUpper() == "CLOSERESETROW")
                {




                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString()) != "0" && Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                            Button btnApproval = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                            Button btnCancel = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                            Button btnReset = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnRefersh");
                            Button btnClosingCompleted = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnClosingCompleted");
                            Button btnClosingRefersh = (Button)searchResultGDN.Rows[row.RowIndex].FindControl("btnClosingRefersh");
                            btnReset.Visible = true;
                            btnApproval.Visible = true;
                            btnCancel.Visible = true;
                            btnClosingCompleted.Visible = true;
                            btnClosingRefersh.Visible = false;
                            obj_bel_Approval._ID = Convert.ToInt32(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString());

                            obj_bel_Approval._NO = Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNNo"].ToString());
                            obj_bel_Approval._iMode = "GDNClosingStatus";
                            obj_bel_Approval._Closing = "C";


                            using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Sucessfully Reset');", true);
                                        // functionGetWaitingCount();

                                    }

                                }
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);

                        }
                    }


                }
                else if (e.CommandName.ToUpper() == "EDITROW")
                {

                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString()) != "0")
                    {

                      //  Response.Redirect("../Transaction/GDN.aspx?ID=" + searchResultGDN.DataKeys[row.RowIndex]["GDNID"].ToString(), false);




                    }
                }

            }
            catch (Exception ex)
            {

            }
        }
        protected void btnSearchPOP_Click(object sender, EventArgs e)
        {
            try
            {

                if (dt_pop != null && dt_pop.Rows.Count > 0)
                {
                    DataTable dataTable = dt_pop;
                    DataTable dt = new DataTable();
                    var result = from row in dataTable.AsEnumerable()
                                 where row.Field<string>("GDNNo").ToLower().Contains(txtSearch.Text.ToLower())

                                 select row;

                    try
                    {
                        dt = result.CopyToDataTable();
                        searchResultGDN.DataSource = dt;
                        searchResultGDN.DataBind();


                    }
                    catch (Exception ex)
                    {
                        //Debug.WriteLine(ex.Message);
                        searchResultGDN.DataSource = dt;
                        searchResultGDN.DataBind();
                    }
                }

                txtSearch.Focus();
            }
            catch (Exception ex)
            {

            }
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // string customerId = searchResultPurchase.DataKeys[e.Row.RowIndex].Value.ToString();
                obj_bel_Approval._ID = Convert.ToInt32(searchResultGDN.DataKeys[e.Row.RowIndex]["GDNID"].ToString());
                obj_bel_Approval._NO = Convert.ToString(searchResultGDN.DataKeys[e.Row.RowIndex]["GDNNo"].ToString());
                obj_bel_Approval._iMode = "GDNBind";

                GridView gvGDNChild = e.Row.FindControl("gridGDNChild") as GridView;

                using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            gvGDNChild.DataSource = ds.Tables[0];
                            gvGDNChild.DataBind();
                        }

                    }
                }


            }
        }
        void funBindGridGDNPopup()
        {
            try
            {
                if (Convert.ToString(rblStatus.SelectedValue) == "P")
                {
                    obj_bel_Approval._iMode = "GDNBindHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }
                else if (Convert.ToString(rblStatus.SelectedValue) == "A")
                {
                    obj_bel_Approval._iMode = "GDNBindApprovedHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }
                else if (Convert.ToString(rblStatus.SelectedValue) == "C")
                {
                    obj_bel_Approval._iMode = "GDNBindApprovedHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }
                else if (Convert.ToString(rblStatus.SelectedValue) == "G")
                {
                    obj_bel_Approval._iMode = "GDNClosingHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }

                else if (Convert.ToString(rblStatus.SelectedValue) == "D")
                {
                    obj_bel_Approval._iMode = "GDNClosedHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }

                using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            dt_pop = ds.Tables[0];
                            searchResultGDN.DataSource = dt_pop;
                            searchResultGDN.DataBind();

                        }
                        else
                        {
                            dt_pop.Clear();
                            searchResultGDN.DataSource = dt_pop;
                            searchResultGDN.DataBind();
                        }

                    }
                    else
                    {
                        dt_pop.Clear();
                        searchResultGDN.DataSource = dt_pop;
                        searchResultGDN.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
       
        protected void Search_Click(object sender, EventArgs e)
        {
            funBindGridGDNPopup();
        }
    }
}