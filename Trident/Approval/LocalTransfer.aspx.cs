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
    public partial class LocalTransfer : System.Web.UI.Page
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

                obj_Common.functionCheckActhorization("Transfer-Approval", "AssignAuthorization");
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

                funBindGridGTNPopup();


                // mpePurcase.Show();
                txtSearch.Focus();
                        }

            }
        }
        protected void btn_Ok_Click(object sender, EventArgs e)
        {
            try
            {


                funGTNOK();


            }
            catch (Exception ex)
            {

            }
        }
        protected void Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HomeContentPage.aspx");
        }
        void funGTNOK()
        {
            try
            {
                if (Convert.ToString(searchResultGTN.DataKeys[Row_Index]["GTNID"].ToString()) != "0" && Convert.ToString(searchResultGTN.DataKeys[Row_Index]["DCID"].ToString()) != string.Empty)
                {
                    Button btnApproval = (Button)searchResultGTN.Rows[Row_Index].FindControl("btnGalleryApproval");
                    Button btnCancel = (Button)searchResultGTN.Rows[Row_Index].FindControl("btnGalleryCancel");
                    Button btnReset = (Button)searchResultGTN.Rows[Row_Index].FindControl("btnRefersh");
                    btnReset.Visible = true;
                    btnApproval.Visible = true;
                    btnCancel.Visible = false;
                    obj_bel_Approval._ID = Convert.ToInt32(searchResultGTN.DataKeys[Row_Index]["GTNID"].ToString());
                    obj_bel_Approval._NO = Convert.ToString(searchResultGTN.DataKeys[Row_Index]["GTNNo"].ToString());
                    obj_bel_Approval._iMode = "TransferStatus";
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
        protected void searchResultGTN_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToUpper() == "APPROVALROW")
                {




                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResultGTN.DataKeys[row.RowIndex]["GTNID"].ToString()) != "0" && Convert.ToString(searchResultGTN.DataKeys[row.RowIndex]["GTNID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                        Button btnApproval = (Button)searchResultGTN.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                        Button btnCancel = (Button)searchResultGTN.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                        Button btnReset = (Button)searchResultGTN.Rows[row.RowIndex].FindControl("btnRefersh");
                        btnReset.Visible = true;
                        btnApproval.Visible = false;
                        btnCancel.Visible = true;
                        obj_bel_Approval._ID = Convert.ToInt32(searchResultGTN.DataKeys[row.RowIndex]["GTNID"].ToString());

                        obj_bel_Approval._NO = Convert.ToString(searchResultGTN.DataKeys[row.RowIndex]["GTNNo"].ToString());
                        obj_bel_Approval._iMode = "TransferStatus";
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
                    if (Convert.ToString(searchResultGTN.DataKeys[row.RowIndex]["GTNID"].ToString()) != "0" && Convert.ToString(searchResultGTN.DataKeys[row.RowIndex]["GTNID"].ToString()) != string.Empty)
                    {
                        if (Common.CommonVariablesandmsg.EditRigts == "Y")
                        {
                        Button btnApproval = (Button)searchResultGTN.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                        Button btnCancel = (Button)searchResultGTN.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                        Button btnReset = (Button)searchResultGTN.Rows[row.RowIndex].FindControl("btnRefersh");
                        btnApproval.Visible = true;
                        btnReset.Visible = false;
                        btnCancel.Visible = true;
                        obj_bel_Approval._ID = Convert.ToInt32(searchResultGTN.DataKeys[row.RowIndex]["GTNID"].ToString());

                        obj_bel_Approval._NO = Convert.ToString(searchResultGTN.DataKeys[row.RowIndex]["GTNNo"].ToString());
                        obj_bel_Approval._iMode = "TransferStatus";
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
                else if (e.CommandName.ToUpper() == "EDITROW")
                {

                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResultGTN.DataKeys[row.RowIndex]["GTNID"].ToString()) != "0")
                    {

                          Response.Redirect("../Transaction/GTN.aspx?ID=" + searchResultGTN.DataKeys[row.RowIndex]["GTNID"].ToString(), false);




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
                                 where row.Field<string>("GTNNo").ToLower().Contains(txtSearch.Text.ToLower())

                                 select row;

                    try
                    {
                        dt = result.CopyToDataTable();
                        searchResultGTN.DataSource = dt;
                        searchResultGTN.DataBind();


                    }
                    catch (Exception ex)
                    {
                        //Debug.WriteLine(ex.Message);
                        searchResultGTN.DataSource = dt;
                        searchResultGTN.DataBind();
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
                obj_bel_Approval._ID = Convert.ToInt32(searchResultGTN.DataKeys[e.Row.RowIndex]["GTNID"].ToString());
                obj_bel_Approval._NO = Convert.ToString(searchResultGTN.DataKeys[e.Row.RowIndex]["GTNNo"].ToString());
                obj_bel_Approval._iMode = "TransferBind";

                GridView gvGTNChild = e.Row.FindControl("gridGTNChild") as GridView;

                using (DataSet ds = obj_dal_Approval.dal_ApprovalDetail(obj_bel_Approval))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            gvGTNChild.DataSource = ds.Tables[0];
                            gvGTNChild.DataBind();
                        }

                    }
                }


            }
        }
        void funBindGridGTNPopup()
        {
            try
            {
                if (Convert.ToString(rblStatus.SelectedValue) == "P")
                {
                    obj_bel_Approval._iMode = "TransferBindHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }
                else if (Convert.ToString(rblStatus.SelectedValue) == "A")
                {
                    obj_bel_Approval._iMode = "TransferApprovedBindHeader";
                    obj_bel_Approval._FromDate = Convert.ToDateTime(txtFromDate.Text);
                    obj_bel_Approval._ToDate = Convert.ToDateTime(txtToDate.Text);
                }
                else if (Convert.ToString(rblStatus.SelectedValue) == "C")
                {
                    obj_bel_Approval._iMode = "TransferCancelBindHeader";
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
                            searchResultGTN.DataSource = dt_pop;
                            searchResultGTN.DataBind();

                        }
                        else
                        {
                            dt_pop.Clear();
                            searchResultGTN.DataSource = dt_pop;
                            searchResultGTN.DataBind();
                        }

                    }
                    else
                    {
                        dt_pop.Clear();
                        searchResultGTN.DataSource = dt_pop;
                        searchResultGTN.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
       
        protected void Search_Click(object sender, EventArgs e)
        {
            funBindGridGTNPopup();
        }
    }
}