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
    public partial class ChangePassword : System.Web.UI.Page
    {
        EnCryptionAndDecription Obj_ComEncript = new EnCryptionAndDecription();
        bel_ChangePassword obj_bel_Password = new bel_ChangePassword();
        dal_ChangePassword obj_dal_Password = new dal_ChangePassword();
       // Trident.Common.CommonFunction obj_Common = new Common.CommonFunction();
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
                        //obj_Common.functionCheckActhorization("Color", "AssignAuthorization");
                        //if (Common.CommonVariablesandmsg.ViewRights == "N")
                        //{
                        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view');", true);
                        //    Response.Redirect("../HomeContentPage.aspx");
                        //}
                        //else
                        //{
                        
                        txtRetypePassword.Attributes.Add("onkeypress", "return handleEnter('" + Submit.ClientID + "', event)");

                        txtOldPassword.Focus();


                           


                        //}
                    }
                }


            }

            catch (Exception exe)
            {

            }

        }
      
        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                
                        obj_bel_Password._iMode = "Update";
                        functionSaverecord();
                   
            }
            catch (Exception exe)
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

        public void functioncleardata()
        {
            try
            {

                hfldid.Value = "0";
                txtOldPassword.Text = string.Empty;
                txtNewPassword.Text = string.Empty;
                txtRetypePassword.Text = string.Empty;
                txtOldPassword.Focus();
               
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
            catch (Exception exe)
            {

            }
        }
      
        void functionSaverecord() //Save the record to the table
        {
            try
            {
                
                    if (hfldid.Value == "0")
                    {
                        obj_bel_Password._iMode = "Update";
                    }
                    else
                    {
                        obj_bel_Password._iMode = "Update";
                    }







                    if (Convert.ToString(txtOldPassword.Text.Trim()) != string.Empty)
                    {

                        obj_bel_Password._LoginPassword = Obj_ComEncript.fEncrypt(txtOldPassword.Text.Trim());


                    }
                    else
                    {
                        obj_bel_Password._LoginPassword = string.Empty;
                    }






                    if (Convert.ToString(txtNewPassword.Text.Trim()) != string.Empty)
                    {

                        obj_bel_Password._NewPassword = Obj_ComEncript.fEncrypt(txtNewPassword.Text.Trim()); 


                    }
                    else
                    {
                        obj_bel_Password._NewPassword = string.Empty;
                    }


                    using (DataSet ds = obj_dal_Password.dal_ChangePasswordDetail(obj_bel_Password))
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                if (ds.Tables[0].Rows[0][0].ToString() == "1")
                                {


                                    functioncleardata();
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Password Changed Successfully');", true);
                                }

                                else if (ds.Tables[0].Rows[0][0].ToString() == "Password")
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please enter the valid Old Password');", true);

                                    functioncleardata();
                                }
                                


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