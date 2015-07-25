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

namespace Trident.Transaction
{
    public partial class JobClosing : System.Web.UI.Page
    {
        public static DataTable dt_pop = new DataTable();
        public static int Row_Index = 0;
        bel_JobCreation obj_bel_jobcreation = new bel_JobCreation();
        dal_JobCreation obj_dal_jobcreation = new dal_JobCreation();
        Trident.Common.CommonFunction obj_Common = new Common.CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Convert.ToInt32(Session["UserID"]) == 0)
                {
                    Response.Redirect("../SessionTimeout.aspx");
                }

                else
                {

                    if (!IsPostBack)
                    {
                        obj_Common.functionCheckActhorization("Job-Closing", "AssignAuthorization");
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


                            funBindGridWorkPopup();


                            // mpePurcase.Show();
                            // txtSearch.Focus();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btn_Ok_Click(object sender, EventArgs e)
        {
            try
            {


                funWorkOK();


            }
            catch (Exception ex)
            {

            }
        }
        protected void Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HomeContentPage.aspx");
        }
        void funWorkOK()
        {
            try
            {
                if (Convert.ToString(searchResultWork.DataKeys[Row_Index]["JOBCode"].ToString()) != "0" && Convert.ToString(searchResultWork.DataKeys[Row_Index]["JOBCode"].ToString()) != string.Empty)
                {
                    Button btnApproval = (Button)searchResultWork.Rows[Row_Index].FindControl("btnGalleryApproval");
                    Button btnCancel = (Button)searchResultWork.Rows[Row_Index].FindControl("btnGalleryCancel");
                    btnApproval.Visible = true;
                    btnCancel.Visible = false;
                    //obj_bel_jobcreation._JOBID = Convert.ToInt32(searchResultWork.DataKeys[Row_Index]["JOBID"].ToString());
                    obj_bel_jobcreation._JOBCode = Convert.ToString(searchResultWork.DataKeys[Row_Index]["JOBCode"].ToString());
                    obj_bel_jobcreation._iMode = "ClosingStatus";
                    obj_bel_jobcreation._JOBStatus = "C";
                    obj_bel_jobcreation._Remarks = txtRemarks.Text;
                    using (DataSet ds = obj_dal_jobcreation.dal_JobCreationDetail(obj_bel_jobcreation))
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {

                                // functionGetWaitingCount();

                                Row_Index = 0;
                                mpe.Hide();
                                txtRemarks.Text = string.Empty;
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Sucessfully Closed');", true);
                                funBindGridWorkPopup();
                            }

                        }
                    }


                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Closing:funWorkOK", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                obj_Common.LogFile(ex.Message, "Job-Closing:btn_Cancel_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        protected void btnGalleryCancel_Click(object sender, EventArgs e)
        {
            try
            {
                mpe.Show();
                txtRemarks.Focus();
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Closing:btnGalleryCancel_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        protected void searchResultWork_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToUpper() == "APPROVALROW")
                {




                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResultWork.DataKeys[row.RowIndex]["JOBCode"].ToString()) != "0" && Convert.ToString(searchResultWork.DataKeys[row.RowIndex]["JOBCode"].ToString()) != string.Empty)
                    {
                        Button btnApproval = (Button)searchResultWork.Rows[row.RowIndex].FindControl("btnGalleryApproval");
                        Button btnCancel = (Button)searchResultWork.Rows[row.RowIndex].FindControl("btnGalleryCancel");
                        btnApproval.Visible = false;
                        btnCancel.Visible = true;
                        //obj_bel_jobcreation._JOBID = Convert.ToInt32(searchResultWork.DataKeys[row.RowIndex]["JOBID"].ToString());

                        obj_bel_jobcreation._JOBCode = Convert.ToString(searchResultWork.DataKeys[row.RowIndex]["JOBCode"].ToString());
                        obj_bel_jobcreation._iMode = "ClosingStatus";
                        obj_bel_jobcreation._JOBStatus = "A";

                        obj_bel_jobcreation._Remarks = string.Empty;
                        using (DataSet ds = obj_dal_jobcreation.dal_JobCreationDetail(obj_bel_jobcreation))
                        {
                            if (ds.Tables.Count > 0)
                            {
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Sucessfully Active');", true);
                                    // functionGetWaitingCount();
                                    funBindGridWorkPopup();
                                }

                            }
                        }

                    }


                }

                else if (e.CommandName.ToUpper() == "CANCELROW")
                {




                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;

                    Row_Index = row.RowIndex;





                }
                else if (e.CommandName.ToUpper() == "EDITROW")
                {
                    if (Common.CommonVariablesandmsg.EditRigts == "Y")
                            {
                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    
                    if (Convert.ToString(searchResultWork.DataKeys[row.RowIndex]["JOBID"].ToString()) != "0")
                    {
                       
                       // Response.Write("<script type='text/javascript'>window.open('../Report/ReportViewer.aspx?value=Stock','_blank');</script>");

                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('../Report/ReportViewer.aspx?value=Stock&JOBID=" + searchResultWork.DataKeys[row.RowIndex]["JOBID"].ToString() + "');", true);



                    }
                            }
                    else
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);


                    }

                }

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Closing:searchResultWork_RowCommand", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
       
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // string customerId = searchResultPurchase.DataKeys[e.Row.RowIndex].Value.ToString();
               // obj_bel_jobcreation._JOBID = Convert.ToInt32(searchResultWork.DataKeys[e.Row.RowIndex]["JOBID"].ToString());
                obj_bel_jobcreation._JOBCode = Convert.ToString(searchResultWork.DataKeys[e.Row.RowIndex]["JOBCode"].ToString());
                obj_bel_jobcreation._iMode = "ClosingBind";

                GridView gvWorkChild = e.Row.FindControl("gridWorkChild") as GridView;

                using (DataSet ds = obj_dal_jobcreation.dal_JobCreationDetail(obj_bel_jobcreation))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            gvWorkChild.DataSource = ds.Tables[0];
                            gvWorkChild.DataBind();
                        }

                    }
                }


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
                                 where row.Field<string>("JOBCode").ToLower().Contains(txtSearch.Text.ToLower())

                                 select row;

                    try
                    {
                        dt = result.CopyToDataTable();
                        searchResultWork.DataSource = dt;
                        searchResultWork.DataBind();


                    }
                    catch (Exception ex)
                    {
                        //Debug.WriteLine(ex.Message);
                        searchResultWork.DataSource = dt;
                        searchResultWork.DataBind();
                    }
                }

                txtSearch.Focus();
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Closing:btnSearchPOP_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        public static string GetImage(string value)
        {

            if (value == "C")
            {
                return "../Images/Pending3.png";
            }
            else
            {
                return "../Images/Completed.png";

            }


        }
        void funBindGridWorkPopup()
        {
            try
            {

                obj_bel_jobcreation._iMode = "ClosingHeader";

                using (DataSet ds = obj_dal_jobcreation.dal_JobCreationDetail(obj_bel_jobcreation))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            dt_pop = ds.Tables[0];
                            searchResultWork.DataSource = dt_pop;
                            searchResultWork.DataBind();

                        }

                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Closing:funBindGridWorkPopup", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

    }
}