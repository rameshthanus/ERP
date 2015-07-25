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
    public partial class Config : System.Web.UI.Page
    {
        DataSet ds_bind = new DataSet();

        DataTable dt_base = new DataTable();
        bel_Config obj_bel_Config = new bel_Config();
        dal_Config obj_dal_Config = new dal_Config();
        Common.CommonFunction obj_Common = new Common.CommonFunction();
        EnCryptionAndDecription Obj_ComEncript = new EnCryptionAndDecription();
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
                        obj_Common.functionCheckActhorization("Config", "AssignAuthorization");
                        if (Common.CommonVariablesandmsg.ViewOnlyRights == "Y")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "calling", "cal_Readonly();", true);
                        }
                        if (Common.CommonVariablesandmsg.ViewRights == "N")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view this screen');", true);
                            Response.Redirect("../HomeContentPage.aspx",false);
                        }
                        else
                        {

                            txtemailID.Focus();

                            
                            hfldid.Value = Request.QueryString["ID"];
                            if (hfldid.Value != "0" && hfldid.Value != string.Empty)
                            {
                                obj_bel_Config._ConfigID = Convert.ToInt32(hfldid.Value);
                                functionfetcdata(obj_bel_Config);
                            }
                            else if (hfldid.Value == string.Empty)
                                hfldid.Value = "0";

                            checkvalue();
                        }
                    }

                }
            }

            catch (Exception ex)
            {

            }
        }
        //protected void Add_Click(object sender, EventArgs e)
        //{
        //    try
        //    {

        //        functioncleardata();
        //        //   gridCompany.HeaderRow.TableSection = TableRowSection.TableHeader;

        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}
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
                txtemailID.Text = string.Empty;
                txtPassword.Attributes.Add("value", string.Empty);
                txtretypepassword.Attributes.Add("value", string.Empty);
                txtRemarks.Text = string.Empty;
                txttolerance.Text = string.Empty;
                txtemailID.Focus();


            }
            catch (Exception ex)
            {

            }
        }
        void functionfetcdata(bel_Config obj_bel_Config)  //selected item will sow the corresponding text box
        {
            try
            {

                obj_bel_Config._iMode = "Fetch";
                using (DataSet ds = obj_dal_Config.dal_Configdetail(obj_bel_Config))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["ConfigID"] != null)
                            {
                                hfldid.Value = ds.Tables[0].Rows[0]["ConfigID"].ToString();
                            }

                            if (ds.Tables[0].Rows[0]["SMTPhost"] != null)
                            {

                                txtSMTPhost.Text = ds.Tables[0].Rows[0]["SMTPhost"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["SMTPport"] != null)
                            {

                                txtSMTPport.Text = ds.Tables[0].Rows[0]["SMTPport"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["Subject"] != null)
                            {

                                txtSubject.Text = ds.Tables[0].Rows[0]["Subject"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["EmailID"] != null)
                            {

                                txtemailID.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["Password"] != null)
                            {

                                txtPassword.Attributes.Add("value", Obj_ComEncript.fDecrypt(ds.Tables[0].Rows[0]["Password"].ToString()));
                                txtretypepassword.Attributes.Add("value", Obj_ComEncript.fDecrypt(ds.Tables[0].Rows[0]["Password"].ToString()));

                            }

                          

                            if (ds.Tables[0].Rows[0]["Description"] != null)
                            {

                                txtRemarks.Text = ds.Tables[0].Rows[0]["Description"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["Tolerance"] != null)
                            {

                                txttolerance.Text = ds.Tables[0].Rows[0]["Tolerance"].ToString();

                            }

                           

                        }
                    }
                }

                txtemailID.Focus();
            }
            catch (Exception es)
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
                        obj_bel_Config._iMode = "Insert";

                    }
                    else
                    {
                        obj_bel_Config._iMode = "Update";
                    }


                    obj_bel_Config._ConfigID = Convert.ToInt32(hfldid.Value);


                    if (txtSMTPhost.Text.Trim() != string.Empty)
                    {


                        obj_bel_Config._SMTPhost = txtSMTPhost.Text.Trim();
                    }
                    else
                    {
                        obj_bel_Config._SMTPhost = string.Empty;
                    }

                    if (txtSMTPport.Text.Trim() != string.Empty)
                    {


                        obj_bel_Config._SMTPport = Convert.ToInt32(txtSMTPport.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Config._SMTPport = 0;
                    }


                    if (txtSubject.Text.Trim() != string.Empty)
                    {


                        obj_bel_Config._Subject = txtSubject.Text.Trim();
                    }
                    else
                    {
                        obj_bel_Config._Subject = string.Empty;
                    }

                    if (txtemailID.Text.Trim() != string.Empty)
                    {


                        obj_bel_Config._EmailID = txtemailID.Text.Trim();
                    }
                    else
                    {
                        obj_bel_Config._EmailID = string.Empty;
                    }



                    if (txtPassword.Text.Trim() != string.Empty)
                    {

                        obj_bel_Config._Password = Obj_ComEncript.fEncrypt(txtPassword.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Config._Password = string.Empty;
                    }




                    if (txtRemarks.Text.Trim() != string.Empty)
                    {


                        obj_bel_Config._Description = txtRemarks.Text.Trim();
                    }
                    else
                    {
                        obj_bel_Config._Description = string.Empty;
                    }
                    if (txttolerance.Text.Trim() != string.Empty)
                    {


                        obj_bel_Config._Tolerance = Convert.ToInt32( txttolerance.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Config._Tolerance = 0;
                    }

                    using (DataSet ds = obj_dal_Config.dal_Configdetail(obj_bel_Config))
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

                                    functionfetcdata(obj_bel_Config);
                                }


                            }


                        }


                    }




                }

                else
                {
                    // functionbindgrid();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Company Name Already Exists.');", true);
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void  checkvalue()
        {


         
            obj_bel_Config._iMode = "CheckEntry";
            

            using (DataSet dsUom = obj_dal_Config.dal_Configdetail(obj_bel_Config))
            {
                //if (dsUom.Tables.Count > 0)
                //{
                if (dsUom.Tables[0].Rows[0][0].ToString() == "0")
                {
                    functioncleardata();
                }
                else
                {
                    obj_bel_Config._ConfigID = Convert.ToInt32(dsUom.Tables[1].Rows[0][0].ToString());
                    functionfetcdata(obj_bel_Config);
                }
                //}
            }
            
        }
        Boolean CheckDuplicatecustomer()
        {

            
            obj_bel_Config._EmailID = txtemailID.Text.ToString().Trim();
            obj_bel_Config._iMode = "Duplicate";
            obj_bel_Config._ConfigID = Convert.ToInt32(hfldid.Value);

            using (DataSet dsUom = obj_dal_Config.dal_Configdetail(obj_bel_Config))
            {
                //if (dsUom.Tables.Count > 0)
                //{
                if (dsUom.Tables[0].Rows[0][0].ToString() == "0")
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

                        obj_bel_Config._iMode = "Insert";
                        functionSaverecord();
                        functioncleardata();
                        checkvalue();
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
                        obj_bel_Config._iMode = "Update";
                        functionSaverecord();
                        functioncleardata();
                        checkvalue();
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
        //protected void Search_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Response.Redirect("../SearchList.aspx?pg=CONFIG");
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}
    }
}