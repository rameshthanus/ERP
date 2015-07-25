<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Config.aspx.cs" Inherits="Trident.Security.Config" %>

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
                            TabIndex="8" OnClientClick="return validation();" OnClick="Submit_Click" />
                      <%-- <asp:Button ID="Search" runat="server" ToolTip="Search" Text="Search - (F8)" CssClass="butt_Save"
                            TabIndex="9" OnClick="Search_Click" />--%>
                       <%-- <asp:Button ID="Add" runat="server" ToolTip="Add" Text="Clear-(Alt+Shift+C)" AccessKey="C"
                            TabIndex="10" CssClass="butt_Save" OnClick="Add_Click" />--%>
                        <asp:Button ID="Exit" runat="server" ToolTip="Exit" Text="Exit - (F9)" CssClass="butt_Save"
                            TabIndex="11" OnClick="Exit_Click" />

                           

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
                           Config Detail</h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <div class="line pricing-values">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="height: 5px;">
                                </td>
                            </tr>
                            <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lblSMTPhost" Text="SMTP-Host" runat="server"></asp:Label>
                                </td>
                                 <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtSMTPhost" runat="server" CssClass="top-input" Width="265px"
                                        MaxLength="150"  TabIndex="1" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
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
                                    <asp:Label ID="lblSMTPPort" Text="SMTP-Port" runat="server"></asp:Label>
                                </td>
                                 <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtSMTPport" runat="server" CssClass="top-input" Width="265px"
                                        MaxLength="150"  TabIndex="2" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
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
                            <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lblSubject" Text="Subject" runat="server"></asp:Label>
                                </td>
                                 <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtSubject" runat="server" CssClass="top-input" Width="265px"
                                        MaxLength="150"  TabIndex="3" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="Div4">
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
                                    <asp:Label ID="lblemailID" Text="EmailID" runat="server"></asp:Label>
                                </td>
                                 <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtemailID" runat="server" CssClass="top-input" Width="265px"
                                        MaxLength="150"  TabIndex="4" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="companyname_error">
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
                                    <asp:Label ID="lblPassword" Text="Password" runat="server"></asp:Label>
                                </td>
                               <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="top-input" Width="265px" MaxLength="100"
                                        TabIndex="5" onkeydown="return (event.keyCode!=13);" TextMode="Password"></asp:TextBox>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="txtAddress1_error">
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
                                    <asp:Label ID="lblretype" Text="Re-Type Password" runat="server"></asp:Label>
                                </td>
                               <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txtretypepassword" runat="server" CssClass="top-input" Width="265px" MaxLength="100"
                                        TabIndex="6" onkeydown="return (event.keyCode!=13);" TextMode="Password"></asp:TextBox>
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
                                                <td colspan="3">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td valign="top" style="width: 98%">
                                                                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                    <tr>
                                                                        <td class="style1">
                                                                        </td>
                                                                        <td>
                                                                            <span style="font-size: 12px; font-family: Verdana">Left:</span>
                                                                            <asp:Label ID="lblChar1" runat="server" CssClass="lblstyle" Text="500"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style1">
                                                                        </td>
                                                                        <td style="width: 90px">
                                                                            <table cellpadding="0" cellspacing="0" width="20%">
                                                                                <tr style="height: 6px; background-color: #9ed40a">
                                                                                    <td>
                                                                                        <div>
                                                                                            <table cellpadding="0" cellspacing="0">
                                                                                                <tr style="height: 6px">
                                                                                                    <td id="Colordiv1" runat="server">
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="height: 3px">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="Trow" style="width: 39%">
                                                                            Description
                                                                            <asp:Label ID="lblRemarks" Text="" runat="server" Style="padding-right: 0%;"></asp:Label>
                                                                        </td>
                                                                        <td valign="top">
                                                                            <asp:TextBox ID="txtRemarks" runat="server" Height="80px" MaxLength="500"
                                                                                TabIndex="7" onkeyup="Javascript:CharactersCountReasonforDelay();" Style="overflow: scroll;"
                                                                                TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                       
                                            <tr>
                                            <td style="height: 5px;">
                                            </td>
                                        </tr>
                            
                          <tr>
                                <td class="Trow" style="width: 39%">
                                    <asp:Label ID="lbltolerance" Text="Tolerance" runat="server"></asp:Label>
                                </td>
                               <td valign="top" style="width: 60%">
                                    <asp:TextBox ID="txttolerance" runat="server" CssClass="top-input" Width="100px" MaxLength="5"
                                        TabIndex="6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                        <asp:Label ID="Label1" Text="%" runat="server"></asp:Label>
                                </td>
                                <td class="Trow_Validator" style="width: 1%">
                                    <div id="Div5">
                                        *
                                    </div>
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

             if (EmailValidation(document.getElementById("<%= txtSMTPhost.ClientID %>"), 'SMTP-Host Should not be left Empty','Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }

             if (validate(document.getElementById("<%= txtSMTPport.ClientID %>"), 'SMTP-Port Should not be left Empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }

             if (validate(document.getElementById("<%= txtSubject.ClientID %>"), 'Subject Should not be left Empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }

             if (EmailValidation(document.getElementById("<%= txtemailID.ClientID %>"), 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }
             if (validate(document.getElementById("<%= txtPassword.ClientID %>"), 'Password should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";

                 return false;
             }
             

           
             if (RetypePasswordValidation(document.getElementById("<%= txtPassword.ClientID %>"), document.getElementById("<%= txtretypepassword.ClientID %>"), '=', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }

             if (validate(document.getElementById("<%= txttolerance.ClientID %>"), 'Tolerance Should not be left Empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }

         }

         function ClearClientData(ClientId, ErrorId) {
             clearError(ErrorId, '', '', ClientId, 1);
         }
    </script>
    <script type="text/javascript">
        function CharactersCountReasonforDelay() {
            var CharLength = '<%=txtRemarks.MaxLength %>';
            var txtMsg = document.getElementById('txtRemarks');
            var lblCount = document.getElementById('lblChar1');
            var colorwidth = txtMsg.value.length;
            var divcolor = document.getElementById('Colordiv1');
            if (txtMsg.value.length > CharLength) {
                txtMsg.value = txtMsg.value.substring(0, CharLength);
            }
            lblCount.innerHTML = CharLength - txtMsg.value.length;
            if (colorwidth >= 1) {
                divcolor.width = (colorwidth * 0.35) + "px";
                divcolor.bgColor = 'red';
                divcolor.height = 6 + "px";
            }
            else {
                divcolor.width = 1 + "px";
                divcolor.bgColor = '#9ED40A';
            }
        }
    </script>
    </form>
</body>
</html>
