<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Trident.Security.ChangePassword" %>
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
</head>
<body>
     <form id="form1" runat="server">
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
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
                    
                   
                   <td align="right" style="float:right; padding-left: 0px;">
                                          
                        <asp:Button ID="Submit" runat="server" ToolTip="Save" Text="Save - (F7)" CssClass="butt_Save"
                            TabIndex="4" OnClientClick="return validation();" OnClick="Submit_Click" />
                     
                              <asp:Button ID="Add" runat="server" ToolTip="Add" Text="Clear-(Alt+Shift+C)" AccessKey="C"
                            TabIndex="5" CssClass="butt_Save" OnClick="Add_Click" />
                             <asp:Button ID="Exit" runat="server" ToolTip="Exit" Text="Exit - (F9)" CssClass="butt_Save"
                            TabIndex="6" OnClick="Exit_Click" />
                   <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                    </td>
                    
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
                            Password Detail</h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <div class="line pricing-values">
                        
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td class="Trow" style="width: 39%">
                                                <asp:Label ID="lbloldPassord" Text="Old Password" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 60%">
                                                <asp:TextBox ID="txtOldPassword" runat="server" CssClass="top-input" Width="200px"
                                                 MaxLength="50" TextMode="Password" TabIndex="1"  onkeydown="return (event.keyCode!=13);"></asp:TextBox>
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
                                                <asp:Label ID="lblNewPassword" Text="New Password" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 60%">
                                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="top-input" Width="200px"
                                                 MaxLength="50" TextMode="Password"  TabIndex="2" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 1%">
                                                <div id="Div2">
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
                                                <asp:Label ID="lblRetypePassword" Text="Retype Password" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 60%">
                                                <asp:TextBox ID="txtRetypePassword" runat="server" CssClass="top-input" Width="200px"
                                                 MaxLength="50" TextMode="Password"  TabIndex="3"   onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
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
            if (validate(document.getElementById("<%= txtOldPassword.ClientID %>"), 'Old Password should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;
            }


            if (PasswordValidation(document.getElementById("<%= txtNewPassword.ClientID %>"), 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;
            }

            //alert(1);            
            if (RetypePasswordValidation(document.getElementById("<%= txtNewPassword.ClientID %>"), document.getElementById("<%= txtRetypePassword.ClientID %>"), '=', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;
            }
            
            return true;
        }

        function ClearClientData(ClientId, ErrorId) {
            clearError(ErrorId, '', '', ClientId, 1);
        }
    </script>
  
        <script type="text/javascript" language="javascript">

            function handleEnter(obj, event) {
                var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
                if (keyCode == 13) {
                    document.getElementById(obj).click();
                    return false;
                }
                else {
                    return true;
                }
            } 
    </script>
    </form>
</body>
</html>
