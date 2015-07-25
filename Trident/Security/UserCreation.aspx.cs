using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using System.Data;
using Trident.Common;

namespace Trident.Security
{
    public partial class UserCreation : System.Web.UI.Page
    {
        DataSet ds_bind = new DataSet();

        DataTable dt_base = new DataTable();
        bel_UserCreation obj_bel_UserCreation = new bel_UserCreation();
        dal_UserCreation obj_dal_UserCreation = new dal_UserCreation();
        Common.CommonFunction obj_Common = new Common.CommonFunction();
        EnCryptionAndDecription Obj_ComEncript = new EnCryptionAndDecription();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Convert.ToInt32(Session["UserID"]) == 0)
                {
                    Response.Redirect("../Default.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        obj_Common.functionCheckActhorization("UserCreation", "AssignAuthorization");
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

                            txtusername.Focus();
                            functionbindcombo();
                         

                            hfldid.Value = Request.QueryString["ID"];
                            if (hfldid.Value != "0" && hfldid.Value != string.Empty)
                            {
                                obj_bel_UserCreation._UserID = Convert.ToInt32(hfldid.Value);
                                functionfetcdata(obj_bel_UserCreation);
                            }
                            else if (hfldid.Value == string.Empty)
                                hfldid.Value = "0";
                        }
                    }

                }
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
                //   gridCompany.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
            catch (Exception ex)
            {

            }
        }
        protected void Exit_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("../HomeContentPage.aspx");
            }
            catch (Exception ex)
            {

            }
        }
        void functioncleardata()
        {
            try
            {

                hfldid.Value = "0";
                txtusername.Text = string.Empty;
                txtPassword.Attributes.Add("value", string.Empty);
                txtretypepassword.Attributes.Add("value", string.Empty);
                txtEmail.Text = string.Empty;
                rbluserstatus.SelectedValue = "A";
                dropusergroup.SelectedIndex = 0;
                rblIsAdmin.SelectedIndex=0;
                rblIsSuperAdmin.SelectedIndex=0;
                txtusername.Focus();
                

            }
            catch (Exception ex)
            {

            }
        }
        void functionfetcdata(bel_UserCreation obj_bel_UserCreation)  //selected item will sow the corresponding text box
        {
            try
            {

                obj_bel_UserCreation._iMode = "Fetch";
                using (DataSet ds = obj_dal_UserCreation.dal_UserCreationdetail(obj_bel_UserCreation))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["UserID"] != null)
                            {
                                hfldid.Value = ds.Tables[0].Rows[0]["UserID"].ToString();
                            }



                            if (ds.Tables[0].Rows[0]["LoginID"] != null)
                            {

                              txtusername.Text = ds.Tables[0].Rows[0]["LoginID"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["LoginPassword"] != null)
                            {

                                txtPassword.Attributes.Add("value", Obj_ComEncript.fDecrypt(ds.Tables[0].Rows[0]["LoginPassword"].ToString()));
                                txtretypepassword.Attributes.Add("value", Obj_ComEncript.fDecrypt(ds.Tables[0].Rows[0]["LoginPassword"].ToString()));
                              
                            }

                            if (ds.Tables[0].Rows[0]["UserGroupID"] != null)
                            {

                                dropusergroup.SelectedValue = ds.Tables[0].Rows[0]["UserGroupID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["Email"] != null)
                            {

                                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["IsAdmin"] != null)
                            {

                                rblIsAdmin.SelectedValue = ds.Tables[0].Rows[0]["IsAdmin"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["IsSuperAdmin"] != null)
                            {

                                rblIsSuperAdmin.SelectedValue = ds.Tables[0].Rows[0]["IsSuperAdmin"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["UserLoginStatus"] != null)
                            {

                               rbluserstatus.SelectedValue = ds.Tables[0].Rows[0]["UserLoginStatus"].ToString();

                            }
                        
                           
                        }
                    }
                }

                txtusername.Focus();
            }
            catch (Exception es)
            {
            }
        }
        void functionbindcombo()
        {
            try
            {


                obj_bel_UserCreation._iMode = "ComboBind";
                using (DataSet ds = obj_dal_UserCreation.dal_UserCreationdetail(obj_bel_UserCreation))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            dropusergroup.DataValueField = "UserGroupID";
                            dropusergroup.DataTextField = "UserGroup";
                            dropusergroup.DataSource = ds.Tables[0];
                            dropusergroup.DataBind();
                            dropusergroup.SelectedIndex = 0;
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        void functionSaverecord() //Save the record to the table
        {
            try
            {
                if (CheckDuplicatecustomer() == false)
                {
                    if (hfldid.Value == "0")
                    {
                        obj_bel_UserCreation._iMode = "Insert";
                       
                    }
                    else
                    {
                        obj_bel_UserCreation._iMode = "Update";
                    }

                    
                    obj_bel_UserCreation._UserID = Convert.ToInt32(hfldid.Value);
                    if (txtusername.Text.Trim() != string.Empty)
                    {


                        obj_bel_UserCreation._UserName = txtusername.Text.Trim();
                    }
                    else
                    {
                        obj_bel_UserCreation._UserName = string.Empty;
                    }



                    if (txtPassword.Text.Trim() != string.Empty)
                    {

                        obj_bel_UserCreation._Password = Obj_ComEncript.fEncrypt(txtPassword.Text.Trim());
                    }
                    else
                    {
                        obj_bel_UserCreation._Password = string.Empty;
                    }

                    if (dropusergroup.SelectedValue != null)
                    {


                        obj_bel_UserCreation._UserGroupID = Convert.ToInt32(dropusergroup.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_UserCreation._UserGroupID = 0;
                    }


                    if (txtEmail.Text.Trim() != string.Empty)
                    {


                        obj_bel_UserCreation._Email = txtEmail.Text.Trim();
                    }
                    else
                    {
                        obj_bel_UserCreation._Email = string.Empty;
                    }



                    if (rbluserstatus.SelectedValue != null)
                    {
                        obj_bel_UserCreation._UserStatus = rbluserstatus.SelectedValue.Trim();
                    }
                    else
                    {
                        obj_bel_UserCreation._UserStatus = "A";
                    }

                    if ((rblIsAdmin.SelectedValue != null) && (rblIsAdmin.SelectedValue != ""))
                    {
                        obj_bel_UserCreation._AdminStatus = rblIsAdmin.SelectedValue.Trim();
                    }
                    else
                    {
                        obj_bel_UserCreation._AdminStatus = "N";
                    }


                    if ((rblIsSuperAdmin.SelectedValue != null) && (rblIsSuperAdmin.SelectedValue != ""))
                    {
                        obj_bel_UserCreation._SuperAdminStatus = rblIsSuperAdmin.SelectedValue.Trim();
                    }
                    else
                    {
                        obj_bel_UserCreation._SuperAdminStatus = "N";
                    }




                    using (DataSet ds = obj_dal_UserCreation.dal_UserCreationdetail(obj_bel_UserCreation))
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                if (ds.Tables[0].Rows[0][0].ToString() == "1")
                                {
                                    // functionbindgrid();
                                    // functioncleardata();
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Saved Successfully');", true);

                                    functionfetcdata(obj_bel_UserCreation);
                                }


                            }


                        }


                    }




                }

                else
                {
                    // functionbindgrid();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('User Name or EmailID Already Exists.');", true);
                }
            }
            catch (Exception ex)
            {

            }
        }
        Boolean CheckDuplicatecustomer()
        {


            obj_bel_UserCreation._UserName = txtusername.Text.ToString().Trim();
            obj_bel_UserCreation._iMode = "Duplicate";
            obj_bel_UserCreation._UserID = Convert.ToInt32(hfldid.Value);
            obj_bel_UserCreation._Email = txtEmail.Text.ToString().Trim();

            using (DataSet dsUom = obj_dal_UserCreation.dal_UserCreationdetail(obj_bel_UserCreation))
            {
                //if (dsUom.Tables.Count > 0)
                //{
                if ((dsUom.Tables[0].Rows[0][0].ToString() == "0") && (dsUom.Tables[1].Rows[0][0].ToString() == "0"))
                {
                    return false;
                }
                //}
            }
            return true;
        }
        
        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (hfldid.Value == "0")
                {
                    if (Common.CommonVariablesandmsg.SaveRigts == "Y")
                    {

                        obj_bel_UserCreation._iMode = "Insert";
                        functionSaverecord();
                        functioncleardata();
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Save this screen');", true);
                        // gridColour.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }
                else
                {
                    if (Common.CommonVariablesandmsg.SaveRigts == "Y")
                    {
                        obj_bel_UserCreation._iMode = "Update";
                        functionSaverecord();
                        functioncleardata();
                    }

                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);
                        //gridColour.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }


                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("../SearchList.aspx?pg=USERCREATION");
            }
            catch (Exception ex)
            {

            }
        }
    }
}