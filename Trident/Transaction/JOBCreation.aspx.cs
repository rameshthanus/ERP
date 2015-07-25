using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using System.Data;

namespace Trident.Transaction
{
    public partial class JOBCreation : System.Web.UI.Page
    {
        public static DataTable dt_pop = new DataTable();
        bel_JobCreation obj_bel_Job = new bel_JobCreation();
        dal_JobCreation obj_dal_Job = new dal_JobCreation();
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
                        obj_Common.functionCheckActhorization("Job-Creation", "AssignAuthorization");
                        if (Common.CommonVariablesandmsg.ViewOnlyRights == "Y")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "calling", "cal_Readonly();", true);
                        }
                        if (Common.CommonVariablesandmsg.ViewRights == "N")

                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view');", true);
                            Response.Redirect("../HomeContentPage.aspx");
                        }
                        else
                        {

                            DropCustomer.Focus();
                            funGetAutoCode();
                           // funAutoGentration();
                            hfldid.Value = Request.QueryString["ID"];
                            if (hfldid.Value != "0" && hfldid.Value != string.Empty)
                            {


                                obj_bel_Job._JOBID = Convert.ToInt32(hfldid.Value);
                                functionfetcdata(obj_bel_Job);
                            }
                            else if (hfldid.Value == string.Empty)
                                hfldid.Value = "0";


                        }
                    }
                }


            }

            catch (Exception exe)
            {

            }
        }
        void funGetAutoCode()
        {
            try
            {
                string Year = string.Empty;
                string FromYear = string.Empty;
                string ToYear = string.Empty;
                string FromDate = string.Empty;
                string Todate = string.Empty;
                Year = Convert.ToString(Session["Year"]);
                string[] financialyear = Year.Split('-');
                FromYear = financialyear[0].Trim();
                ToYear = financialyear[1].Trim();
                FromDate = "01/04/" + FromYear;
                Todate = "03/31/" + ToYear;
                obj_bel_Job._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Job._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_Job._iMode = "AutoCode";
                using (DataSet ds = obj_dal_Job.dal_JobCreationDetail(obj_bel_Job))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                           
                            DropCustomer.DataSource = ds.Tables[0];
                            DropCustomer.DataTextField = "PartyName";
                            DropCustomer.DataValueField = "PartyID";
                            
                            DropCustomer.DataBind();
                            
                        }

                        if (ds.Tables[1].Rows.Count > 0)
                        {

                            txtJobNo.Text = ds.Tables[1].Rows[0][0].ToString();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Creation:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
       

        void functionfetcdata(bel_JobCreation obj_bel_Job)  //selected item will sow the corresponding text box
        {
            try
            {

                obj_bel_Job._iMode = "Fetch";
                using (DataSet ds = obj_dal_Job.dal_JobCreationDetail(obj_bel_Job))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["JOBID"] != null)
                            {
                                hfldid.Value = ds.Tables[0].Rows[0]["JOBID"].ToString();
                            }



                            if (ds.Tables[0].Rows[0]["JOBCode"] != null)
                            {

                                txtJobNo.Text = ds.Tables[0].Rows[0]["JOBCode"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["PartyID"] != null)
                            {

                                DropCustomer.SelectedValue = ds.Tables[0].Rows[0]["PartyID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["Remarks"] != null)
                            {

                                txtRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["GeneralOrderStatus"] != null)
                            {
                                rblGeneralOrder.SelectedValue = ds.Tables[0].Rows[0]["GeneralOrderStatus"].ToString();
                            }






                            if (ds.Tables[0].Rows[0]["JOBStatus"] != null)
                            {

                                rblDesignStatus.SelectedValue = ds.Tables[0].Rows[0]["JOBStatus"].ToString();
                                if (rblDesignStatus.SelectedValue == "C")
                                {
                                    tblCancel.Visible = true;
                                }
                                else
                                {
                                    tblCancel.Visible = false;
                                }
                                
                                if (ds.Tables[0].Rows[0]["CancelReason"] != null)
                                {

                                    txtcancelReason.Text = ds.Tables[0].Rows[0]["CancelReason"].ToString();

                                }
                            }

                        }


                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Creation:functionfetcdata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }



        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {

                Response.Redirect("../SearchList.aspx?pg=JOB");


            }
            catch (Exception ex)
            {

            }
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            try
            {
                functioncleardata();

            }
            catch (Exception exe)
            {

            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (hfldid.Value == "0")
                {
                    if (Common.CommonVariablesandmsg.SaveRigts == "Y")
                    {

                        obj_bel_Job._iMode = "Insert";
                        functionSaverecord();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Save');", true);
                    }




                }
                else
                {
                    if (Common.CommonVariablesandmsg.EditRigts == "Y")
                    {
                        obj_bel_Job._iMode = "Update";
                        functionSaverecord();
                    }

                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit');", true);
                    }




                }
            }
            catch (Exception exe)
            {


            }
        }


        protected void Exit_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("../HomeContentPage.aspx");
            }
            catch (Exception exe)
            {

            }
        }
        
        Boolean CheckDuplicatecustomer()
        {
              string Year = string.Empty;
                string FromYear = string.Empty;
                string ToYear = string.Empty;
                string FromDate = string.Empty;
                string Todate = string.Empty;
                Year = Year = Convert.ToString(Session["Year"]);
                string[] financialyear = Year.Split('-');
                FromYear = financialyear[0].Trim();
                ToYear = financialyear[1].Trim();
                FromDate = "04/01/" + FromYear;
                Todate = "03/31/" + ToYear;            
            obj_bel_Job._BillFromDate = Convert.ToDateTime(FromDate);
            obj_bel_Job._iMode = "Duplicate";
            obj_bel_Job._BillToDate = Convert.ToDateTime(Todate);


            using (DataSet dsUom = obj_dal_Job.dal_JobCreationDetail(obj_bel_Job))
            {

                if (dsUom.Tables[0].Rows[0][0].ToString() == "0")
                {
                    
                        return false;
                    
                }

            }
            return true;
        }
       
        void functionSaverecord() //Save the record to the table
        {
            try
            {
                if (CheckDuplicatecustomer() == false)
                {

                    if (hfldid.Value == "0")
                    {
                       
                        funAutoGentration();
                        obj_bel_Job._iMode = "Insert";
                    }
                    else
                    {
                        obj_bel_Job._iMode = "Update";
                    }


                    obj_bel_Job._JOBID = Convert.ToInt32(hfldid.Value);




                    if (Convert.ToString(DropCustomer.SelectedValue) != string.Empty)
                    {

                        obj_bel_Job._CustomerID = Convert.ToInt32(DropCustomer.SelectedValue);


                    }
                    else
                    {
                        obj_bel_Job._CustomerID = 0;
                    }



                    obj_bel_Job._JOBStatus = Convert.ToString(rblDesignStatus.SelectedValue);

                    obj_bel_Job._GeneralOrderStatus = Convert.ToString(rblGeneralOrder.SelectedValue);


                    if (Convert.ToString(txtRemarks.Text.Trim()) != string.Empty)
                    {

                        obj_bel_Job._Remarks = Convert.ToString(txtRemarks.Text.Trim());


                    }
                    else
                    {
                        obj_bel_Job._Remarks = string.Empty;
                    }


                    if (Convert.ToString(txtcancelReason.Text.Trim()) != string.Empty)
                    {

                        obj_bel_Job._CancelReason = Convert.ToString(txtcancelReason.Text.Trim());


                    }
                    else
                    {
                        obj_bel_Job._CancelReason = string.Empty;
                    }


                    if (Convert.ToString(txtJobNo.Text.Trim()) != string.Empty)
                    {

                        obj_bel_Job._JOBCode = Convert.ToString(txtJobNo.Text.Trim());


                    }
                    else
                    {
                        obj_bel_Job._JOBCode = string.Empty;
                    }
                    using (DataSet ds = obj_dal_Job.dal_JobCreationDetail(obj_bel_Job))
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                if (ds.Tables[0].Rows[0][0].ToString() == "1")
                                {


                                    functioncleardata();
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Saved Successfully');", true);
                                }


                            }


                        }


                    }
                }

                else
                {
                    functioncleardata();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please verify the Financial year in login page');", true);
                }

            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Creation:functionSaverecord", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        void funAutoGentration()
        {
            try
            {
                string Year = string.Empty;
                string FromYear = string.Empty;
                string ToYear = string.Empty;
                string FromDate = string.Empty;
                string Todate = string.Empty;
                Year = Year = Convert.ToString(Session["Year"]);
                string[] financialyear = Year.Split('-');
                FromYear = financialyear[0].Trim();
                ToYear = financialyear[1].Trim();
                FromDate = "04/01/" + FromYear;
                Todate = "03/31/" + ToYear;
                obj_bel_Job._iMode = "JobCreation";
                obj_bel_Job._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Job._BillToDate = Convert.ToDateTime(Todate);
                using (DataSet ds = obj_dal_Job.dal_JobCreationDetail(obj_bel_Job))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0][0].ToString() == "Error" || ds.Tables[0].Rows[0][0].ToString() == "Date Error")
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please verify your system date or Financial year in login page');", true);
                               
                            }
                            else
                            {
                                txtJobNo.Text = ds.Tables[0].Rows[0][0].ToString();
                            }

                        }
                    }

                }

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Creation:funGentrateAutogen", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        public void functioncleardata()
        {
            try
            {

                hfldid.Value = "0";
                txtJobNo.Text = string.Empty;
                txtRemarks.Text = string.Empty;
                txtcancelReason.Text = string.Empty;
                rblDesignStatus.SelectedIndex = 0;
                DropCustomer.Focus();
                funGetAutoCode();
                if (rblDesignStatus.SelectedValue == "C")
                {
                    tblCancel.Visible = true;
                }
                else
                {
                    tblCancel.Visible = false;
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Creation:functioncleardata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void rblDesignStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (rblDesignStatus.SelectedValue == "C")
                {
                    tblCancel.Visible = true;
                }
                else
                {
                    tblCancel.Visible = false;
                }

            }
            catch(Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Job-Creation:rblDesignStatus_SelectedIndexChanged", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }





    }
}