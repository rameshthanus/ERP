using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using System.Data;
namespace Trident.Security
{
    public partial class UserManagement : System.Web.UI.Page
    {
        public static DataTable Item_dt = new DataTable();
        bel_UserManagement obj_bel_User = new bel_UserManagement();
        dal_UserManagement obj_dal_User = new dal_UserManagement();
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
                        obj_Common.functionCheckActhorization("User-Management", "AssignAuthorization");
                        if (Common.CommonVariablesandmsg.ViewOnlyRights == "Y")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "calling", "cal_Readonly();", true);
                        }
                        if (Common.CommonVariablesandmsg.ViewRights == "N")
                        //if (false)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view');", true);
                            Response.Redirect("../HomeContentPage.aspx");
                        }
                        else
                        {


                            Item_dt.Clear();
                         
                            if (Item_dt.Columns.Count > 1)
                            {

                            }
                            else
                            {

                                Item_dt.Columns.Add("SNo");
                                Item_dt.Columns.Add("ModulesID");
                                Item_dt.Columns.Add("ModulesName");
                                Item_dt.Columns.Add("ModulesGroupID");
                                Item_dt.Columns.Add("SaveRights");
                                Item_dt.Columns.Add("EditRights");
                                Item_dt.Columns.Add("DeleteRights");
                                Item_dt.Columns.Add("ViewRights");
                                Item_dt.Columns.Add("ViewonlyRights");
                                Item_dt.Columns.Add("ReportRights");
                                Item_dt.Columns.Add("PriviledgeID");

                                gridAuthorization.DataSource = Item_dt;
                                gridAuthorization.DataBind();
                                if (gridAuthorization.Rows.Count > 0)
                                    gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;



                            }
                            DropUserGroup.Focus();
                           // DropUser.Enabled = false;
                            functionbindcombo();

                           

                        }
                    }
                }
            }
            catch (Exception ex)
            {
               
            }
        }
       

        void funcAuthorizationScreen()
        {
            try
            {
                if (Convert.ToString(DropUserGroup.SelectedValue) != string.Empty)
                {
                    obj_bel_User._UserGroupID = Convert.ToInt32(DropUserGroup.SelectedValue);
                }
                else
                {
                    obj_bel_User._UserGroupID = 0;
                }
                if (Convert.ToString(DropUser.SelectedValue) != string.Empty)
                {
                    obj_bel_User._UserID = Convert.ToInt32(DropUser.SelectedValue);
                }
                else
                {
                    obj_bel_User._UserID = 0;
                }

                obj_bel_User._iMode = "Fetch";
                using (DataSet ds = obj_dal_User.dal_UserManagementdetail(obj_bel_User))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Item_dt.Clear();
                            Item_dt = ds.Tables[0];
                            gridAuthorization.DataSource = Item_dt;
                            gridAuthorization.DataBind();
                            if (gridAuthorization.Rows.Count > 0)
                                gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;
                        }





                    }
                }
            }
            catch (Exception ex)
            {
               
            }
        }

        void functionbindcombo()
        {
            try
            {


                obj_bel_User._iMode = "ComboBind";
                using (DataSet ds = obj_dal_User.dal_UserManagementdetail(obj_bel_User))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            DropUserGroup.DataValueField = "UserGroupID";
                            DropUserGroup.DataTextField = "UserGroup";
                            DropUserGroup.DataSource = ds.Tables[0];
                            DropUserGroup.DataBind();
                            DropUserGroup.SelectedIndex = 0;
                            gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;
                        }





                    }
                }
                if (gridAuthorization.Rows.Count > 0)
                    gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch (Exception ex)
            {
               
            }
        }


        Boolean funcvalidate()
        {
            if ((Convert.ToString(DropUserGroup.SelectedValue) == string.Empty) || (Convert.ToString(DropUserGroup.SelectedValue) == "0")

                
                )
            {
                return false;
            }






            return true;
        }

       
        protected void DropUserGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (funcvalidate())
                {
                    if (DropUser.SelectedValue == "0" || DropUser.SelectedValue == string.Empty)
                    {
                        functionbindcomboUser();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please Select User Group.');", true);
                }
                if (gridAuthorization.Rows.Count > 0)
                    gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch (Exception ex)
            {
                
            }
        }


        void functionbindcomboUser()
        {
            try
            {
                if (Convert.ToString(DropUserGroup.SelectedValue) != string.Empty)
                {
                    obj_bel_User._UserGroupID = Convert.ToInt32(DropUserGroup.SelectedValue);
                }
                else
                {
                    obj_bel_User._UserGroupID = 0;
                }

                obj_bel_User._iMode = "GetUser";
                using (DataSet ds = obj_dal_User.dal_UserManagementdetail(obj_bel_User))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            DropUser.DataValueField = "UserID";
                            DropUser.DataTextField = "LoginID";
                            DropUser.DataSource = ds.Tables[0];
                            DropUser.DataBind();
                            DropUser.SelectedIndex = 0;
                        }





                    }
                }
                if (gridAuthorization.Rows.Count > 0)
                    gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch (Exception ex)
            {
              
            }
        }

        protected void DropUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            funcAuthorizationScreen();
        }


        void functionSaverecord() //Save the record to the table
        {
            try
            {
                int row = 0;
                int r = 0; int k = 0;

                if (hfldid.Value == "0")
                {
                    obj_bel_User._iMode = "Insert";
                }
                else
                {
                    obj_bel_User._iMode = "Update";
                }


               



                if (Convert.ToString(DropUserGroup.SelectedValue) != string.Empty)
                {

                    obj_bel_User._UserGroupID = Convert.ToInt32(DropUserGroup.SelectedValue);
                }
                else
                {
                    obj_bel_User._UserGroupID = 0;
                }



                if (Convert.ToString(DropUser.SelectedValue) != string.Empty)
                {

                    obj_bel_User._UserID = Convert.ToInt32(DropUser.SelectedValue);
                }
                else
                {
                    obj_bel_User._UserID = 0;
                }

                DataTable dt = new DataTable();
                dt.Columns.Add("ModulesID");
                dt.Columns.Add("ModulesGroupID");
                dt.Columns.Add("SaveRights");
                dt.Columns.Add("EditRights");
                dt.Columns.Add("DeleteRights");
                dt.Columns.Add("ViewRights");
                dt.Columns.Add("ViewonlyRights");
                dt.Columns.Add("ReportRights");
                dt.Columns.Add("PriviledgeID");

               

                while (k <= gridAuthorization.Rows.Count - 1)//get the all the data and bind to the data table
                {

                   string rwo1= Item_dt.Rows[0][0].ToString();
                    DataRow dr = dt.NewRow();
                    dt.Rows.Add(dr);
                    Label chkIsScreenID = (Label)(gridAuthorization.Rows[k].FindControl("lblModulesID"));
                    if (chkIsScreenID.Text.ToString() != string.Empty)
                    {

                        dt.Rows[r][0] = Convert.ToInt32(chkIsScreenID.Text.ToString().Trim());

                    }
                    else
                    {

                        dt.Rows[r][0] =0;
                    }


                    Label chkIsModulesGroupID = (Label)(gridAuthorization.Rows[k].FindControl("lblModulesGroupID"));
                    if (chkIsModulesGroupID.Text.ToString() != string.Empty)
                    {

                        dt.Rows[r][1] = Convert.ToInt32(chkIsModulesGroupID.Text.ToString().Trim());

                    }
                    else
                    {

                        dt.Rows[r][1] = 0;
                    }

                    CheckBox chkIsSave = (CheckBox)(gridAuthorization.Rows[k].FindControl("chkSavePermission"));
                    if (chkIsSave.Checked)
                    {
                        dt.Rows[r][2] = Convert.ToString("Y");
                    }
                    else
                    {
                        dt.Rows[r][2] = Convert.ToString("N");
                    }

                    CheckBox chkIsEdit = (CheckBox)(gridAuthorization.Rows[k].FindControl("chkEditPermission"));
                    if (chkIsEdit.Checked)
                    {
                        dt.Rows[r][3] = Convert.ToString("Y");
                    }
                    else
                    {
                        dt.Rows[r][3] = Convert.ToString("N");
                    }

                    CheckBox chkIsDelete = (CheckBox)(gridAuthorization.Rows[k].FindControl("chkDeletePermission"));
                    if (chkIsDelete.Checked)
                    {
                        dt.Rows[r][4] = Convert.ToString("Y");
                    }
                    else
                    {
                        dt.Rows[r][4] = Convert.ToString("N");
                    }



                    CheckBox chkIsView = (CheckBox)(gridAuthorization.Rows[k].FindControl("chkViewPermission"));
                    if (chkIsView.Checked)
                    {
                        dt.Rows[r][5] = Convert.ToString("Y");
                    }
                    else
                    {
                        dt.Rows[r][5] = Convert.ToString("N");
                    }
                    CheckBox chkIsOnlyView = (CheckBox)(gridAuthorization.Rows[k].FindControl("chkViewonlyPermission"));
                    if (chkIsOnlyView.Checked)
                    {
                        dt.Rows[r][6] = Convert.ToString("Y");
                    }
                    else
                    {
                        dt.Rows[r][6] = Convert.ToString("N");
                    }

                    CheckBox chkIsReport = (CheckBox)(gridAuthorization.Rows[k].FindControl("chkReportPermission"));
                    if (chkIsReport.Checked)
                    {
                        dt.Rows[r][7] = Convert.ToString("Y");
                    }
                    else
                    {
                        dt.Rows[r][7] = Convert.ToString("N");
                    }

                    if (Convert.ToString(gridAuthorization.DataKeys[k].Value) != "0")
                    {
                        dt.Rows[r][8] = Convert.ToInt32(gridAuthorization.DataKeys[k].Value);
                    }
                    else
                    {
                        dt.Rows[r][8] = "0";

                    }
                    r++;



                    k++;

                }


                int result = 0;

                result = obj_dal_User.dal_UserManagementInsert(obj_bel_User, dt);


                if (result.ToString() == "1" || result.ToString() == "2" || result.ToString() == "3" || result.ToString() == "4")
                {
                    

                    functioncleardata();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Saved Successfully');", true);


                }




            }
            catch (Exception ex)
            {
               
            }
        }

        public void functioncleardata()
        {
            try
            {
               // DropUser.Enabled = false;
                hfldid.Value = "0";
                DropUserGroup.SelectedIndex = 0;
                DropUser.SelectedIndex = 0;
                Item_dt.Clear();

                gridAuthorization.DataSource = Item_dt;

                gridAuthorization.DataBind();
                if (gridAuthorization.Rows.Count > 0)
                    gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;

                ChkNew.Checked = false;
                ChkEdit.Checked = false;
                Chkdelete.Checked = false;
                Chkreport.Checked = false;
                Ckview.Checked = false;
                DropUserGroup.Focus();
            }
            catch (Exception ex)
            {
               
            }
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (hfldid.Value == "0")
                {
                    if (Common.CommonVariablesandmsg.SaveRigts == "Y" )
                    {

                        obj_bel_User._iMode = "Insert";
                        functionSaverecord();
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Save this screen');", true);
                        if (gridAuthorization.Rows.Count > 0)
                        {
                            gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;
                        }
                    }
                }
                else
                {
                    if (Common.CommonVariablesandmsg.EditRigts == "Y" )
                    {
                        obj_bel_User._iMode = "Update";
                        functionSaverecord();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);
                        if (gridAuthorization.Rows.Count > 0)
                        {
                            gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;
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
            functioncleardata();
        }

        protected void Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HomeContentPage.aspx");
        }

        protected void ChkNew_CheckedChanged(object sender, EventArgs e)
        {
            funSelectAndDeselect(ChkNew.Checked, "SaveRights");
        }


        private void funSelectAndDeselect(Boolean CheckStatus, string ColumnName)
        {
            try
            {
                int k = 0;

                if (funcvalidate())
                {
                    while (k <= gridAuthorization.Rows.Count - 1)//get the all the data and bind to the data table
                    {

                        if (ColumnName == "SaveRights")
                        {
                            if (CheckStatus)
                            {
                                Item_dt.Rows[k][ColumnName] = "Y";
                            }
                            else
                            {
                                Item_dt.Rows[k][ColumnName] = "N";
                            }
                        }



                        if (ColumnName == "EditRights")
                        {
                            if (CheckStatus)
                            {
                                Item_dt.Rows[k][ColumnName] = "Y";
                            }
                            else
                            {
                                Item_dt.Rows[k][ColumnName] = "N";
                            }
                        }

                        if (ColumnName == "DeleteRights")
                        {
                            if (CheckStatus)
                            {
                                Item_dt.Rows[k][ColumnName] = "Y";
                            }
                            else
                            {
                                Item_dt.Rows[k][ColumnName] = "N";
                            }
                        }

                        if (ColumnName == "ViewRights")
                        {
                            if (CheckStatus)
                            {
                                Item_dt.Rows[k][ColumnName] = "Y";
                            }
                            else
                            {
                                Item_dt.Rows[k][ColumnName] = "N";
                            }
                        }
                        if (ColumnName == "ViewonlyRights")
                        {
                            if (CheckStatus)
                            {
                                Item_dt.Rows[k][ColumnName] = "Y";
                            }
                            else
                            {
                                Item_dt.Rows[k][ColumnName] = "N";
                            }
                        }
                        if (ColumnName == "ReportRights")
                        {
                            if (CheckStatus)
                            {
                                Item_dt.Rows[k][ColumnName] = "Y";
                            }
                            else
                            {
                                Item_dt.Rows[k][ColumnName] = "N";
                            }
                        }

                        k++;

                    }
                }

                gridAuthorization.DataSource = Item_dt;
                gridAuthorization.DataBind();
                if (gridAuthorization.Rows.Count > 0)
                {
                    gridAuthorization.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

            }
            catch (Exception ex)
            {
               
            }
        }

        protected void ChkEdit_CheckedChanged(object sender, EventArgs e)
        {
            funSelectAndDeselect(ChkEdit.Checked, "EditRights");
        }

        protected void Chkdelete_CheckedChanged(object sender, EventArgs e)
        {
            funSelectAndDeselect(Chkdelete.Checked, "DeleteRights");
        }

        protected void Ckview_CheckedChanged(object sender, EventArgs e)
        {
            funSelectAndDeselect(Ckview.Checked, "ViewRights");
        }
        protected void Ckviewonly_CheckedChanged(object sender, EventArgs e)
        {
            funSelectAndDeselect(Ckviewonly.Checked, "ViewonlyRights");
        }
        
        protected void Chkreport_CheckedChanged(object sender, EventArgs e)
        {
            funSelectAndDeselect(Chkreport.Checked, "ReportRights");
        }

    }
}