﻿/********************************************************************************
Copyright (C) Binod Nepal, Mix Open Foundation (http://mixof.org).

This file is part of MixERP.

MixERP is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

MixERP is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with MixERP.  If not, see <http://www.gnu.org/licenses/>.
***********************************************************************************/

using System;
using System.Drawing;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Trident.Common;
using System.Data;
using BEL_LAYER;
using DAL_LAYER;
//using MixERP.Net.Common;
//using MixERP.Net.Common.Helpers;
//using MixERP.Net.Entities.Office;
//using MixERP.Net.FrontEnd.Cache;
//using MixERP.Net.FrontEnd.Data.Helpers;
//using MixERP.Net.FrontEnd.Data.Office;
//using MixERP.Net.i18n.Resources;
//using Serilog;

namespace MixERP.Net.FrontEnd
{
    public partial class SignIn : Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            this.CreateControls(this.Placeholder1);
            this.CreateDimmer(this.Placeholder1);
            this.AddJavascript();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
            try
            {
               this.BindBranchDropDownList();
               this.BindCompanyDropDownList();
            }
            catch
            {
                //Could not bind the branch office dropdownlist.
                //The target database does not contain mixerp schema.
                //Swallow the exception
                //and redirect to application offline page.
                this.RedirectToOfflinePage();
                return;
            }

            //if (branchSelect.Items.Count.Equals(0))
            //{
            //    this.Response.Redirect("~/Install.aspx");
            //}

            if (!this.IsPostBack)
            {
                //if (this.User.Identity.IsAuthenticated)
                //{
                //    long signInId = Conversion.TryCastLong(this.User.Identity.Name);

                //    if (signInId > 0)
                //    {
                //        CurrentUser.SetSignInView();
                //        this.RedirectToDashboard();
                //    }
                //}
            }
        }

        private void BindBranchDropDownList()
        {
            //IEnumerable<DbGetOfficesResult> offices = Offices.GetOffices();           
            bel_login bel = new bel_login();
            dal_login dal = new dal_login();
            bel._iMode = "ComboBind";
            DataSet ds = dal.dal_Logindetail(bel);
            this.branchSelect.DataSource = ds.Tables[1];
            this.branchSelect.DataBind();
        }
        private void BindCompanyDropDownList()
        {
            //IEnumerable<DbGetOfficesResult> offices = Offices.GetOffices();           
            bel_login bel = new bel_login();
            dal_login dal = new dal_login();
            bel._iMode = "ComboBind";
            DataSet ds1 = dal.dal_Logindetail(bel);
            this.CompanySelect.DataSource = ds1.Tables[0];
            this.CompanySelect.DataBind();
        }

        private void CheckDbConnectivity()
        {
            //Log.Verbose("Checking if database server is available.");
            //if (!ServerConnectivity.IsDbServerAvailable())
            //{
            //    Log.Warning("Could not connect to database server.");
            //    this.RedirectToOfflinePage();
            //}
        }

        private void RedirectToDashboard()
        {
            this.Response.Redirect("~/Dashboard/Index.aspx", true);
        }

        private void RedirectToOfflinePage()
        {
           // Log.Debug("Redirecting to offline page.");
            this.Response.Redirect("~/Site/offline.html");
        }

        private void AddJavascript()
        {
            string challenge = Guid.NewGuid().ToString().Replace("-", "");
            this.Session["Challenge"] = challenge;

            //string script = JSUtility.GetVar("challenge", challenge);
            //script += JSUtility.GetVar("shortDateFormat", LocalizationHelper.GetShortDateFormat());
            //script += JSUtility.GetVar("thousandSeparator", LocalizationHelper.GetThousandSeparator());
            //script += JSUtility.GetVar("decimalSeparator", LocalizationHelper.GetDecimalSeparator());
            //script += JSUtility.GetVar("currencyDecimalPlaces", LocalizationHelper.GetCurrencyDecimalPlaces());


            //PageUtility.RegisterJavascript("SignInPage_Vars", script, this.Page, true);
        }

        #region Controls

        private HtmlSelect branchSelect;
        private HtmlSelect CompanySelect;
        private void CreateDimmer(Control container)
        {
            using (HtmlGenericControl pageDimmer = new HtmlGenericControl("div"))
            {
                pageDimmer.Attributes.Add("class", "ui page dimmer");

                using (HtmlGenericControl content = new HtmlGenericControl("div"))
                {
                    content.Attributes.Add("class", "content");

                    using (HtmlGenericControl center = new HtmlGenericControl("div"))
                    {
                        center.Attributes.Add("class", "center");

                        using (HtmlGenericControl header = new HtmlGenericControl("div"))
                        {
                            header.Attributes.Add("class", "ui yellow huge icon header");

                            using (HtmlGenericControl icon = new HtmlGenericControl("i"))
                            {
                                icon.Attributes.Add("class", "ui inverted yellow setting loading icon");

                                header.Controls.Add(icon);
                            }

                            using (Literal literal = new Literal())
                            {
                                literal.Text = "Sign In";
                                header.Controls.Add(literal);
                            }

                            using (HtmlGenericControl subHeader = new HtmlGenericControl("div"))
                            {
                                subHeader.Attributes.Add("class", "ui yellow sub header");
                                subHeader.InnerText = "Signing In, Just a moment Please!";
                                header.Controls.Add(subHeader);
                            }


                            center.Controls.Add(header);
                        }

                        content.Controls.Add(center);
                    }

                    pageDimmer.Controls.Add(content);
                }

                container.Controls.Add(pageDimmer);
            }
        }

        private void CreateControls(Control container)
        {
            using (HtmlGenericControl signInForm = new HtmlGenericControl("div"))
            {
                signInForm.Attributes.Add("id", "signin-form");
                this.CreateLogo(signInForm);
                this.CreateForm(signInForm);

                container.Controls.Add(signInForm);
            }
        }

        private void CreateLogo(HtmlGenericControl container)
        {
            //using (HtmlAnchor anchor = new HtmlAnchor())
            //{
            //    anchor.HRef = "/SignIn.aspx";

            //    using (HtmlImage image = new HtmlImage())
            //    {
            //        image.Src = this.ResolveClientUrl("~/Resource/Static/images/mixerp-logo.png");
            //        anchor.Controls.Add(image);
            //    }
            //    container.Controls.Add(anchor);
            //}
            //Label lbl = new Label();
            //lbl.Text = "Fusion ERP";
            //lbl.Font.Size = 16;
            //lbl.ForeColor = Color.White;
            //container.Controls.Add(lbl);

        }

        #region Form

        private void AddBranchField(HtmlGenericControl container)
        {
            using (HtmlGenericControl field = new HtmlGenericControl("div"))
            {
                field.Attributes.Add("class", "field");

                using (HtmlGenericControl label = HtmlControlHelper.GetLabel("Select Your Branch", "BranchSelect"))
                {
                    field.Controls.Add(label);
                }

                this.branchSelect = new HtmlSelect();
                this.branchSelect.ID = "BranchSelect";
                this.branchSelect.DataTextField = "BranchName";
                this.branchSelect.DataValueField = "BranchID";

                field.Controls.Add(this.branchSelect);

                container.Controls.Add(field);
            }
        }
        private void AddCompanyField(HtmlGenericControl container)
        {
            using (HtmlGenericControl field = new HtmlGenericControl("div"))
            {
                field.Attributes.Add("class", "field");

                using (HtmlGenericControl label = HtmlControlHelper.GetLabel("Select Your Company", "CompanySelect"))
                {
                    field.Controls.Add(label);
                }

                this.CompanySelect = new HtmlSelect();
                this.CompanySelect.ID = "CompanySelect";
                this.CompanySelect.DataTextField = "CompanyName";
                this.CompanySelect.DataValueField = "CompanyID";

                field.Controls.Add(this.CompanySelect);

                container.Controls.Add(field);
            }
        }

        private static void AddDivider(HtmlGenericControl container)
        {
            using (HtmlGenericControl divider = new HtmlGenericControl("div"))
            {
                divider.Attributes.Add("class", "ui divider");
                container.Controls.Add(divider);
            }
        }

        private static void AddExceptionField(HtmlGenericControl container)
        {
            using (HtmlGenericControl exceptionField = new HtmlGenericControl("div"))
            {
                exceptionField.Attributes.Add("class", "exception field");
                container.Controls.Add(exceptionField);
            }
        }

        private static void AddIconDivider(HtmlGenericControl container)
        {
            using (HtmlGenericControl iconDivider = new HtmlGenericControl("div"))
            {
                iconDivider.Attributes.Add("class", "ui horizontal icon divider");

                using (HtmlGenericControl icon = new HtmlGenericControl("i"))
                {
                    icon.Attributes.Add("class", "circular user icon");
                    iconDivider.Controls.Add(icon);
                }

                container.Controls.Add(iconDivider);
            }
        }

        //private void AddLanguageField(HtmlGenericControl container)
        //{
        //    using (HtmlGenericControl field = new HtmlGenericControl("div"))
        //    {
        //        field.Attributes.Add("class", "field");

        //        using (HtmlGenericControl label = HtmlControlHelper.GetLabel(Titles.SelectLanguage, "LanguageSelect"))
        //        {
        //            field.Controls.Add(label);
        //        }

        //        using (DropDownList languageSelect = new DropDownList())
        //        {
        //            languageSelect.ID = "LanguageSelect";
        //            languageSelect.DataTextField = "Text";
        //            languageSelect.DataValueField = "Value";
        //            languageSelect.DataSource = GetLanguages();
        //            languageSelect.DataBind();


        //            for (int i = 0; i < languageSelect.Items.Count; i++)
        //            {
        //                if (languageSelect.Items[i].Value.Equals(CultureInfo.CurrentUICulture.Name))
        //                {
        //                    languageSelect.Items[i].Selected = true;
        //                    break;
        //                }
        //            }


        //            field.Controls.Add(languageSelect);
        //        }
        //        container.Controls.Add(field);
        //    }
        //}

        private static void AddPasswordField(HtmlGenericControl container)
        {
            using (HtmlGenericControl field = new HtmlGenericControl("div"))
            {
                field.Attributes.Add("class", "field");

                using (HtmlGenericControl label = HtmlControlHelper.GetLabel("Password", "PasswordInputPassword"))
                {
                    field.Controls.Add(label);
                }

                using (HtmlInputPassword passwordInputPassword = new HtmlInputPassword())
                {
                    passwordInputPassword.ID = "PasswordInputPassword";
                    passwordInputPassword.Attributes.Add("placeholder", "Password");
                    field.Controls.Add(passwordInputPassword);
                }

                container.Controls.Add(field);
            }
        }

        private static void AddRememberMeField(HtmlGenericControl container)
        {
            using (HtmlGenericControl field = new HtmlGenericControl("div"))
            {
                field.Attributes.Add("class", "field");


                using (HtmlGenericControl toggleCheckBox = new HtmlGenericControl("div"))
                {
                    toggleCheckBox.Attributes.Add("class", "ui toggle checkbox");


                    using (HtmlInputCheckBox rememberInputCheckBox = new HtmlInputCheckBox())
                    {
                        rememberInputCheckBox.ID = "RememberInputCheckBox";
                        toggleCheckBox.Controls.Add(rememberInputCheckBox);
                    }

                    using (HtmlGenericControl label = HtmlControlHelper.GetLabel("Remember Me"))
                    {
                        toggleCheckBox.Controls.Add(label);
                    }


                    field.Controls.Add(toggleCheckBox);
                }

                container.Controls.Add(field);
            }
        }

        private static void AddSignInButtonField(HtmlGenericControl container)
        {
            using (HtmlGenericControl field = new HtmlGenericControl("div"))
            {
                field.Attributes.Add("class", "field");

                using (HtmlInputButton signInButton = new HtmlInputButton())
                {
                    signInButton.ID = "SignInButton";
                    signInButton.Value = "Sign In";
                    signInButton.Attributes.Add("title", "CRTL + RETURN");
                    signInButton.Attributes.Add("class", "ui teal button");
                    field.Controls.Add(signInButton);
                }

                container.Controls.Add(field);
            }
        }

        private static void AddUserIdField(HtmlGenericControl container)
        {
            using (HtmlGenericControl field = new HtmlGenericControl("div"))
            {
                field.Attributes.Add("class", "field");

                using (HtmlGenericControl label = HtmlControlHelper.GetLabel("User Name", "UsernameInputText"))
                {
                    field.Controls.Add(label);
                }

                using (HtmlInputText usernameInputText = new HtmlInputText())
                {
                    usernameInputText.ID = "UsernameInputText";
                    usernameInputText.Attributes.Add("placeholder", "");
                    field.Controls.Add(usernameInputText);

                    container.Controls.Add(field);
                }
            }
        }

        private void CreateForm(HtmlGenericControl container)
        {
            using (HtmlGenericControl form = new HtmlGenericControl("div"))
            {
                form.Attributes.Add("class", "ui form segment");
                form.Attributes.Add("style", "padding:24px 48px;");

                CreateHeader(form);
                AddDivider(form);
                this.AddCompanyField(form);
                this.AddBranchField(form);
                AddUserIdField(form);
                AddPasswordField(form);
                AddRememberMeField(form);
                AddIconDivider(form);               
              //  this.AddLanguageField(form);
                AddExceptionField(form);
                AddSignInButtonField(form);

                container.Controls.Add(form);
            }
        }

        private static void CreateHeader(HtmlGenericControl container)
        {
            using (HtmlGenericControl header = new HtmlGenericControl("div"))
            {
                header.Attributes.Add("class", "ui large header");
                header.Attributes.Add("style", "8px 0;");

                header.InnerText = "Sign In";

                container.Controls.Add(header);
            }
        }



        #endregion

        #endregion
    }
}