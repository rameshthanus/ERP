<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Trident.Security.UserManagement" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <script src="../JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        if (window.captureEvents) {
            window.captureEvents(Event.KeyUp);
            window.onkeyup = executeCode;
        }
        else if (window.attachEvent) {
            document.attachEvent('onkeyup', executeCode);
        }

        function executeCode(evt) {
            if (evt == null) {
                evt = window.event;
            }
            var theKey = parseInt(evt.keyCode, 10);
            switch (theKey) {
                case 118:  // F7
                    document.getElementById('Submit').click();
                    break;
                case 119:  // F8
                    document.getElementById('Search').click();
                    break;
                case 120:  // F9
                    document.getElementById('Exit').click();
                    break;

            }
            evt.returnValue = false;
            return false;
        }
    </script>
    <link href="../App_Themes/Blue/NewGroup.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="../Javascript/ProgressBar/jsUpdateProgress.js"></script>
    <script src="../JavaScript/comman_Validation.js" type="text/javascript"></script>
     <script type="text/javascript" language="javascript" src="../Javascript/jquery_New/media/js/jquery.js"></script>   
      <link type="text/css" href="../javascript/jquery_New/media/css/demo_table_jui.css"
        rel="stylesheet" />
    <link type="text/css" href="../Javascript/jquery_New/media/themes/smoothness/jquery-ui-1.8.4.custom.css"
        rel="stylesheet" />
    <script type="text/javascript" language="javascript" src="../Javascript/jquery_New/media/js/jquery.dataTables without Paging.js"></script>
    
    <script type="text/javascript">
        
        function BindEvents() {
            $(document).ready(function () { $("#gridAuthorization").dataTable({ "sScrollY": 400, "bJQueryUI": true, "sPaginationType": "full_numbers" }); });
        }
       
    </script>
</head>
<body>
    <form id="form1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
         <script type="text/javascript">             Sys.Application.add_load(BindEvents);</script>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td valign="top" style="width: 30%">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td class="Trow_Validator" style="width: 45%">
                                    <div id="Common_error">
                                        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="right" style="float: right; padding-left: 0px;">
                        <asp:Button ID="Submit" runat="server" ToolTip="Save" Text="Save - (F7)" CssClass="butt_Save"
                                OnClientClick="return validation();" onclick="Submit_Click" />   
                                <asp:Button ID="Add" runat="server" ToolTip="Clear" Text="Clear-(Alt+Sift+C)" AccessKey="C"
                                CssClass="butt_Save" onclick="Add_Click"
                                 />                             
                                 <asp:Button ID="Exit" runat="server" ToolTip="Exit" Text="Exit - (F9)" 
                                CssClass="butt_Save" onclick="Exit_Click"
                                 />
                        <asp:HiddenField ID="hfldid" runat="server" Value="0" />
                    </td>
                </tr>
                <tr>
                    <td style="height: 15px;">
                    </td>
                </tr>
            </table>
            <div class="box light collapsible size1of1">
                <div class="head box-gradient-4">
                    <a href="#" class="text">
                        <h3 class="h4 strong">
                            User Management</h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <div class="line pricing-values">
                        <div id="mainContainer">
                        </div>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                           
                            <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lblUserGroup" Text="User Group" runat="server"></asp:Label>
                                </td>
                                <td valign="top" style="width: 60%">
                                    <asp:DropDownList ID="DropUserGroup" runat="server" CssClass="top-input" TabIndex="1"
                                AutoPostBack="true" Width="200px" MaxLength="60" onkeydown="return (event.keyCode!=13);"
                                OnSelectedIndexChanged="DropUserGroup_SelectedIndexChanged">
                            </asp:DropDownList>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="Div1">
                                        *
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 5px;">
                                </td>
                            </tr>
                            <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lblUser" Text="User" runat="server"></asp:Label>
                                </td>
                                <td valign="top" style="width: 60%">
                                    <asp:DropDownList ID="DropUser" runat="server" CssClass="top-input" TabIndex="2"
                                Width="200px" MaxLength="60" AutoPostBack="true" onkeydown="return (event.keyCode!=13);"
                                OnSelectedIndexChanged="DropUser_SelectedIndexChanged">
                            </asp:DropDownList>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="Div3">
                                        *
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 5px;">
                                </td>
                            
                        </table>
                    </div>
                </div>
            </div>
          <div class="box light collapsible size1of1">
		<div class="head box-gradient-4">
		    <a href="#" class="text"><h3 class="h4 strong">Detail View</h3></a>
		</div>
		<div class="content padded-20">

         <div class="top-left">
                    <div class="top-right">
                    </div>
                    <div class="inside">
                   
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                <td style="padding-left: 250px;">
                           
                        </td>
                        <td>
                        <asp:CheckBox ID="Ckviewonly" runat="server" CssClass="top-input" Checked="false" AutoPostBack="true" Text=" View Only"
                                oncheckedchanged="Ckviewonly_CheckedChanged"  />
                        </td>
                         <td>
                        <asp:CheckBox ID="Ckview" runat="server" CssClass="top-input" Checked="false" AutoPostBack="true" Text=" View"
                                oncheckedchanged="Ckview_CheckedChanged"  />
                        </td>
                        <td>
                        <asp:CheckBox ID="ChkNew" runat="server" CssClass="top-input" Checked="false" AutoPostBack="true" Text=" Save" 
                                oncheckedchanged="ChkNew_CheckedChanged"  />
                        </td>
                        <td>
                       <asp:CheckBox ID="ChkEdit" runat="server" CssClass="top-input" Checked="false" AutoPostBack="true" Text=" Edit"
                                oncheckedchanged="ChkEdit_CheckedChanged"  />
                        </td>
                        <td>
                       <asp:CheckBox ID="Chkdelete" runat="server" CssClass="top-input" Checked="false" AutoPostBack="true" Text=" Delete"
                                oncheckedchanged="Chkdelete_CheckedChanged"  />
                        </td>
                       
                        <td>
                        <asp:CheckBox ID="Chkreport" runat="server" CssClass="top-input" Checked="false" AutoPostBack="true" Text=" Report"
                                oncheckedchanged="Chkreport_CheckedChanged"  />
                        </td>
               </tr>
               <tr>
               <td style="height:10px;">
               
               </td>
               </tr>
               </table>
                        
                        
                        <div style="border-top-color: #fff; border-top-width: 1px; border-top-style: solid;">
                        
                        <asp:Label ID="lblMessage" runat="server" Text="No Records Found" Visible="false"></asp:Label>
                      
                                 <div class="Table_Request" style="border: 0px">
                            <div class="TRow1">
                    <%--  <asp:GridView ID="gridAuthorization" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                            DataKeyNames="PriviledgeID" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" Style="overflow: scroll;">--%>
                               <asp:GridView ID="gridAuthorization" runat="server" AutoGenerateColumns="false" CellPadding="0"
                                    HeaderStyle-CssClass="WithoutBorder" CssClass="display"  RowStyle-CssClass="WithoutBorder"
                                    PagerStyle-HorizontalAlign="Left"  Width="100%"
                                    style="border-left-color:#ABCBE2;border-left-style:solid;border-left-width:1px;
                                    border-right-color:#ABCBE2;border-right-style:solid;border-right-width:1px;"
                                     DataKeyNames="PriviledgeID" BorderColor="#A8CBE3"
                                    BorderWidth="0px">
                                   
                                   <Columns>
                                <asp:BoundField DataField="SNo" HeaderText="SNo." ItemStyle-Width="10%" ItemStyle-CssClass="WithoutBorder" />
                              
                                <asp:TemplateField HeaderText="ModulesID" Visible="false" ItemStyle-CssClass="WithoutBorder">
                                    <ItemTemplate>
                                        <asp:Label ID="lblModulesID" runat="server" Text='<%# Eval("ModulesID").ToString() %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ModulesName" HeaderText="ModulesName" ItemStyle-Width="30%" />

                                <asp:TemplateField HeaderText="ModulesGroupID" ItemStyle-Width="30%" ItemStyle-CssClass="WithoutBorder" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblModulesGroupID" runat="server" Text='<%# Eval("ModulesGroupID").ToString() %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center" HeaderText="View Only">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkViewonlyPermission" runat="server" onclick="toggleSelection(this);"   Checked='<%# Convert.ToBoolean(Convert.ToString(DataBinder.Eval(Container,"DataItem.ViewonlyRights")) == "Y" ? "true" : "false")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center" HeaderText="View">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkViewPermission" runat="server" onclick="toggleSelection(this);"   Checked='<%# Convert.ToBoolean(Convert.ToString(DataBinder.Eval(Container,"DataItem.ViewRights")) == "Y" ? "true" : "false")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center" HeaderText="New">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSavePermission" runat="server" Checked='<%# Convert.ToBoolean(Convert.ToString(DataBinder.Eval(Container,"DataItem.SaveRights")) == "Y" ? "true" : "false")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                           


                                <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center" HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkEditPermission" runat="server" Checked='<%# Convert.ToBoolean(Convert.ToString(DataBinder.Eval(Container,"DataItem.EditRights")) == "Y" ? "true" : "false")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                        
                                <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center" HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkDeletePermission" runat="server" Checked='<%# Convert.ToBoolean(Convert.ToString(DataBinder.Eval(Container,"DataItem.DeleteRights")) == "Y" ? "true" : "false")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center" HeaderText="Report">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkReportPermission" runat="server" Checked='<%# Convert.ToBoolean(Convert.ToString(DataBinder.Eval(Container,"DataItem.ReportRights")) == "Y" ? "true" : "false")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                                     
                                    <PagerStyle HorizontalAlign="Left" />
                                </asp:GridView>
                     </div>
                   
                </div>
                    </div>
                   
                </div>
        </div>
    </div>

     </div>
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
               
                    <tr>
                    <td style="height:600px;">
                    </td>
                    </tr>
                    </table>

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upProgress" runat="server">
        <ContentTemplate>
            <script type="text/javascript" language="javascript">
                var ModalProgress = '<%= ModalProgress.ClientID %>';         
            </script>
            <asp:Panel ID="panelUpdateProgress" runat="server" CssClass="updateProgress">
                <asp:UpdateProgress ID="UpdateProg1" DisplayAfter="0" runat="server">
                    <ProgressTemplate>
                        <img src="../Images/Load Images/loader.gif" style="vertical-align: middle" alt="Processing" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </asp:Panel>
            <ajaxToolkit:ModalPopupExtender ID="ModalProgress" runat="server" TargetControlID="panelUpdateProgress"
                PopupControlID="panelUpdateProgress" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        function validation() {
            if (DropdownValidation(document.getElementById("<%= DropUserGroup.ClientID %>"), 'User Group should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (DropdownValidation(document.getElementById("<%= DropUser.ClientID %>"), 'User should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            
            return true;
        }

        function ClearClientData(ClientId, ErrorId) {
            clearError(ErrorId, '', '', ClientId, 1);
        }
    </script>
    <script type="text/javascript">

    function toggleSelection(source) {
        $("#MainContent_gvCG input[id*='chkSelector']").each(function (index) {
            $(this).prop('checked', source.checked);
            if (source.checked)
                $(this).css({ backgroundColor: "yellow" });
            else
                $(this).css({ backgroundColor: "" });
        });
    }
     </script>
    </form>
</body>
</html>