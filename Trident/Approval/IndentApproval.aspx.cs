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
    public partial class IndentApproval : System.Web.UI.Page
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

                     obj_Common.functionCheckActhorization("Indent-Approval", "AssignAuthorization");
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
                funBindGridIndentPopup();


                // mpePurcase.Show();
                txtSearch.Focus();
                        }


            }
        }
        protected void btn_Ok_Click(object sender, EventArgs e)
        {
            try
            {


                funIndentOK();


            }
            catch (Exception ex)
            {

            }
        }
        protected void Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HomeContentPage.aspx");
        }

        void funIndentOK()
        {
            try
            {
                if (Convert.ToString(searchResultIndent.DataKeys[Row_Index]["IndentID"].ToString()) != "0" && Convert.ToString(searchResultIndent.DataKeys[Row_Index]["IndentID"].ToString()) != string.Empty)
                {
                    Button btnApproval = (Button)searchResultIndent.Rows[Row_Index].FindControl("btnGalleryApproval");
                    Button btnCancel = (Button)searchResultIndent.Rows[Row_Index].FindControl("btnGalleryCancel");
                    Button btnReset = (Button)searchResultIndent.Rows[Row_Index].FindControl("btnRefersh");
                    btnApproval.Visible = true;
                    btnReset.Visible = true;
                    btnCancel.Visible = false;
                    obj_bel_Approval._ID = Convert.ToInt32(searchResultIndent.DataKeys[Row_Index]["IndentID"].ToString());
                    obj_bel_Approval._NO = Convert.ToString(searchResultIndent.DataKeys[Row_Index]["IndentNo"].ToString());
                    obj_bel_Approval._iMode = "IndentStatus";
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
        protected void searchResultIndent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToUpper() == "APPROVALROW")
                {




                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString()) != "0" && Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                            Button btnApproval = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                            Button btnCancel = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                            Button btnReset = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnRefersh");
                            Button btnClosingCompleted = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnClosingCompleted");
                            Button btnClosingRefersh = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnClosingRefersh");
                            btnApproval.Visible = false;
                            btnCancel.Visible = true;
                            btnReset.Visible = true;
                            btnClosingCompleted.Visible = true;
                            btnClosingRefersh.Visible = true;
                            obj_bel_Approval._ID = Convert.ToInt32(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString());

                            obj_bel_Approval._NO = Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentNo"].ToString());
                            obj_bel_Approval._iMode = "IndentStatus";
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
                    if (Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString()) != "0" && Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                        Button btnApproval = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                        Button btnCancel = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                        Button btnReset = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnRefersh");
                        Button btnClosingCompleted = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnClosingCompleted");
                        Button btnClosingRefersh = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnClosingRefersh");
                        btnApproval.Visible = true;
                        btnReset.Visible = false;
                        btnCancel.Visible = true;
                        btnClosingCompleted.Visible = true;
                        btnClosingRefersh.Visible = true;
                        obj_bel_Approval._ID = Convert.ToInt32(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString());

                        obj_bel_Approval._NO = Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentNo"].ToString());
                        obj_bel_Approval._iMode = "IndentStatus";
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
                    if (Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString()) != "0" && Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                            Button btnApproval = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                            Button btnCancel = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                            Button btnReset = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnRefersh");
                            Button btnClosingCompleted = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnClosingCompleted");
                            Button btnClosingRefersh = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnClosingRefersh");
                            btnApproval.Visible = true;
                            btnCancel.Visible = true;
                            btnReset.Visible = true;
                            btnClosingCompleted.Visible = false;
                            btnClosingRefersh.Visible = true;
                            obj_bel_Approval._ID = Convert.ToInt32(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString());

                            obj_bel_Approval._NO = Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentNo"].ToString());
                            obj_bel_Approval._iMode = "IndentClosingStatus";
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
                    if (Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString()) != "0" && Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                            Button btnApproval = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                            Button btnCancel = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                            Button btnReset = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnRefersh");
                            Button btnClosingCompleted = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnClosingCompleted");
                            Button btnClosingRefersh = (Button)searchResultIndent.Rows[row.RowIndex].FindControl("btnClosingRefersh");
                            btnApproval.Visible = false;
                            btnCancel.Visible = true;
                            btnReset.Visible = true;
                            btnClosingCompleted.Visible = true;
                            btnClosingRefersh.Visible = true;
                            obj_bel_Approval._ID = Convert.ToInt32(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString());

                            obj_bel_Approval._NO = Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentNo"].ToString());
                            obj_bel_Approval._iMode = "IndentClosingStatus";
                            obj_bel_Approval._Closing = "P";


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
                    if (Convert.ToString(searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString()) != "0")
                    {
                        

                        Response.Redirect("../Transaction/Indent.aspx?ID=" + searchResultIndent.DataKeys[row.RowIndex]["IndentID"].ToString(), false);

                        


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
                                 where row.Field<string>("IndentNo").ToLower().Contains(txtSearch.Text.ToLower())

                                 select row;

                    try
                    {
                        dt = result.CopyToDataTable();
                        searchResultIndent.DataSource = dt;
                        searchResultIndent.DataBind();


                    }
                    catch (Exception ex)
                    {
                        searchResultIndent.DataSource = dt;
                        searchResultIndent.DataBind();
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
                obj_bel_Approval._ID = Convert.ToInt32(searchResultIndent.DataKeys[e.Row.RowIndex]["IndentID"].ToString());
                obj_bel_Approval._NO = Convert.ToString(searchResultIndent.DataKeys[e.Row.RowIndex]["IndentNo"].ToString());
                obj_bel_Approval._iMode = "IndentBind";

                GridView gvIndentChild = e.Row.FindControl("gridIndentChild") as GridView;

                using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            gvIndentChild.DataSource = ds.Tables[0];
                            gvIndentChild.DataBind();
                        }

                    }
                }


            }
        }
        void funBindGridIndentPopup()
        {
            try
            {
                if (Convert.ToString(rblStatus.SelectedValue)=="P")
                {
                    obj_bel_Approval._iMode = "IndentBindHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }
                else if (Convert.ToString(rblStatus.SelectedValue) == "A")
                {
                    obj_bel_Approval._iMode = "IndentApprovedBindHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }
                else if (Convert.ToString(rblStatus.SelectedValue) == "C")
                {
                    obj_bel_Approval._iMode = "IndentCancledBindHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }
                else if (Convert.ToString(rblStatus.SelectedValue) == "G")
                {
                    obj_bel_Approval._iMode = "IndentClosingHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }

                else if (Convert.ToString(rblStatus.SelectedValue) == "D")
                {
                    obj_bel_Approval._iMode = "IndentClosedHeader";
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
                            searchResultIndent.DataSource = dt_pop;
                            searchResultIndent.DataBind();

                        }
                        else
                        {
                            dt_pop.Clear();
                            searchResultIndent.DataSource = dt_pop;
                            searchResultIndent.DataBind();
                        }

                    }
                    else
                    {
                        dt_pop.Clear();
                        searchResultIndent.DataSource = dt_pop;
                        searchResultIndent.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

      

        protected void Search_Click(object sender, EventArgs e)
        {
            funBindGridIndentPopup();
        }
    }
}