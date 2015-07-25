<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCreation.aspx.cs" Inherits="Trident.Security.UserCreation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
</head>
<body>
    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ToolkitScriptManager1" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td valign="top" style="width: 40%">
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
                            TabIndex="9" OnClientClick="return validation();" OnClick="Submit_Click" />
                       <asp:Button ID="Search" runat="server" ToolTip="Search" Text="Search - (F8)" CssClass="butt_Save"
                            TabIndex="10" OnClick="Search_Click" />
                        <asp:Button ID="Add" runat="server" ToolTip="Add" Text="Clear-(Alt+Shift+C)" AccessKey="C"
                            TabIndex="11" CssClass="butt_Save" OnClick="Add_Click" />
                        <asp:Button ID="Exit" runat="server" ToolTip="Exit" Text="Exit - (F9)" CssClass="butt_Save"
                            TabIndex="12" OnClick="Exit_Click" />

                           

                        <asp:HiddenField ID="hfldid" runat="server" Value="0" />
                    </td>
                </tr>
                <tr>
                    <td style="height: 5px;">
                    </td>
                </tr>
            </table>
            <div class="box light collapsible size1of1">
                <div class="head box-gradient-4">
                    <a href="#" class="text">
                        <h3 class="h4 strong">
                           User Detail</h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <div class="line pricing-values">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            
                            <tr>
                                <td style="height: 15px;">
                                </td>
                            </tr>
                            <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lblname" Text="User Name" runat="server"></asp:Label>
                                </td>
                                 <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtusername" runat="server" CssClass="top-input" Width="265px"
                                        MaxLength="150"  TabIndex="1" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="companyname_error">
                                        *
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 15px;">
                                </td>
                            </tr>
                            <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lblPassword" Text="Password" runat="server"></asp:Label>
                                </td>
                               <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="top-input" Width="265px" MaxLength="100"
                                        TabIndex="2" onkeydown="return (event.keyCode!=13);" TextMode="Password"></asp:TextBox>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="txtAddress1_error">
                                        *
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 15px;">
                                </td>
                            </tr>
                            <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lblretype" Text="Re-Type Password" runat="server"></asp:Label>
                                </td>
                               <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtretypepassword" runat="server" CssClass="top-input" Width="265px" MaxLength="100"
                                        TabIndex="3" onkeydown="return (event.keyCode!=13);" TextMode="Password"></asp:TextBox>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="Div1">
                                        *
                                    </div>
                                </td>
                            </tr>                                                  
                            <tr>
                                <td style="height: 15px;">
                                </td>
                            </tr>
                            <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lblusergroup" Text="User Group" runat="server"></asp:Label>
                                </td>
                               <td valign="top" style="width: 60%">
                                    <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchExtender1"  
                                                           runat="server"   
                     
                                                         TargetControlID="dropusergroup"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender> 
                                                        <asp:DropDownList ID="dropusergroup" runat="server" CssClass="top-input" TabIndex="4"
                                                            Width="200px" MaxLength="100" >
                                                        </asp:DropDownList>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                  <%--  <div id="Div3">
                                        *
                                    </div>--%>
                                </td>
                            </tr>
                            
                          
                            <tr>
                                <td style="height: 15px;">
                                </td>
                            </tr>
                            <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lblEmail" Text="Email" runat="server"></asp:Label>
                                </td>
                                <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="top-input" Width="265px" MaxLength="50"
                                        TabIndex="5" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="txtEmail_error">
                                        *
                                    </div>
                                </td>
                            </tr>                                                     
                               <tr>
                                <td style="height: 15px;">
                                </td>
                            </tr>  
                            <tr>
                                <td class="Trow">
                                    <asp:Label ID="lblAdmin" Text="IsAdmin" runat="server"></asp:Label>
                                </td>
                                <td valign="top" style="width: 60%">
                                    <asp:RadioButtonList ID="rblIsAdmin" runat="server" RepeatDirection="Horizontal"
                                        Width="300px" CssClass="radio_My" TabIndex="6">
                                         <asp:ListItem Text="Normal" Value="N" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="IsAdmin" Value="Y"></asp:ListItem>
                                       
                                    </asp:RadioButtonList>
                                </td>
                                <td class="Trow_Validator">
                                    <%--<div id="Div1">
                                *
                            </div>--%>
                                </td>
                                 <tr>
                                <td style="height: 15px;">
                                </td>
                            </tr>                
                             <tr>
                                <td class="Trow">
                                    <asp:Label ID="lbluserstatus" Text="Status" runat="server"></asp:Label>
                                </td>
                                <td valign="top" style="width: 60%">
                                    <asp:RadioButtonList ID="rbluserstatus" runat="server" RepeatDirection="Horizontal"
                                        Width="150px" CssClass="radio_My" TabIndex="7">
                                        <asp:ListItem Text="Active" Value="A" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="InActive" Value="I"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="Trow_Validator">
                                    <%--<div id="Div1">
                                *
                            </div>--%>
                                </td>
                            </tr>
                             <tr>
                                <td style="height: 15px;">
                                </td>
                            </tr>  
                             <tr>
                                <td class="Trow">
                                    <asp:Label ID="lblsuperadmin" Text="IsSuperAdmin" runat="server"></asp:Label>
                                </td>
                                <td valign="top" style="width: 60%">
                                    <asp:RadioButtonList ID="rblIsSuperAdmin" runat="server" RepeatDirection="Horizontal"
                                        Width="300px" CssClass="radio_My" TabIndex="8">
                                         <asp:ListItem Text="Normal" Value="N" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="IsSuperAdmin" Value="Y"></asp:ListItem>
                                       
                                    </asp:RadioButtonList>
                                </td>
                                <td class="Trow_Validator">
                                    <%--<div id="Div1">
                                *
                            </div>--%>
                                </td>
                                 <tr>
                                <td style="height: 15px;">
                                </td>
                            </tr>   
                        </table>
                    </div>
                </div>
            </div>
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


             if (validate(document.getElementById("<%= txtusername.ClientID %>"), 'User Name should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }
             if (validate(document.getElementById("<%= txtPassword.ClientID %>"), 'Password should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";

                 return false;
             }

             if (DropdownValidation(document.getElementById("<%= dropusergroup.ClientID %>"), 'User Group should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";

                 return false;
             }

             if (EmailValidation(document.getElementById("<%= txtEmail.ClientID %>"), 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";

                 return false;
             }
             if (RetypePasswordValidation(document.getElementById("<%= txtPassword.ClientID %>"), document.getElementById("<%= txtretypepassword.ClientID %>"), '=', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }

         }

         function ClearClientData(ClientId, ErrorId) {
             clearError(ErrorId, '', '', ClientId, 1);
         }
    </script>
    </form>
</body>
</html>
