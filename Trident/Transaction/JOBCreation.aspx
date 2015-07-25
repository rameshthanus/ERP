<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JOBCreation.aspx.cs" Inherits="Trident.Transaction.JOBCreation" %>
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
                    
                    <td align="right" style="float:right; padding-left: 0px;">
                                          
                        <asp:Button ID="Submit" runat="server" ToolTip="Save" Text="Save - (F7)" CssClass="butt_Save"
                            TabIndex="6" OnClientClick="return validation();" OnClick="Submit_Click" />
                      <asp:Button ID="Search" runat="server" ToolTip="Search" Text="Search - (F8)" CssClass="butt_Save"
                            TabIndex="7" OnClick="Search_Click" />
                              <asp:Button ID="Add" runat="server" ToolTip="Add" Text="Clear-(Alt+Shift+C)" AccessKey="C"
                            TabIndex="8" CssClass="butt_Save" OnClick="Add_Click" />
                             <asp:Button ID="Exit" runat="server" ToolTip="Exit" Text="Exit - (F9)" CssClass="butt_Save"
                            TabIndex="9" OnClick="Exit_Click" />
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
                            JOB Creation Detail</h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <div class="line pricing-values">
                        
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td class="Trow" style="width: 20%">
                                                <asp:Label ID="lblJobno" Text="Job No." runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 79%">
                                                <asp:TextBox ID="txtJobNo" runat="server" CssClass="top-inputReadonly" Width="100px" ReadOnly="true"
                                                 MaxLength="50"  onkeydown="return (event.keyCode!=13);"></asp:TextBox>
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
                                                <td class="Trow" style="width: 20%">
                                                    <asp:Label ID="lblCustomer" Text="Customer" runat="server"></asp:Label>
                                                </td>
                                                <td valign="top" style="width: 79%">
                                                 
           
                                                    <asp:DropDownList ID="DropCustomer" runat="server" CssClass="top-input"  TabIndex="1"
                                                        Width="200px" MaxLength="60"  >
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
                                        </tr>

                                        <tr>
                                                <td colspan="3">
                                                    <table width="50%" border="0" cellspacing="0" cellpadding="0">
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
                                                                            Remarks
                                                                            <asp:Label ID="lblRemarks" Text="" runat="server" Style="padding-right: 0%;"></asp:Label>
                                                                        </td>
                                                                        <td valign="top">
                                                                            <asp:TextBox ID="txtRemarks" runat="server" Height="50px" MaxLength="500"
                                                                                TabIndex="2" onkeyup="Javascript:CharactersCountReasonforDelay();" Style="overflow: scroll;"
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
                                            <td class="Trow" style="width: 20%">
                                                <asp:Label ID="lblStatus" Text="Status" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 79%">
                                                <asp:RadioButtonList ID="rblDesignStatus" runat="server" RepeatDirection="Horizontal"
                                                    TabIndex="3" Width="250px" CssClass="radio_My" AutoPostBack="true" 
                                                    onselectedindexchanged="rblDesignStatus_SelectedIndexChanged">
                                                    <asp:ListItem Text="Active" Value="A" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="InActive" Value="I"></asp:ListItem>
                                                    <asp:ListItem Text="Cancel" Value="C"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                             <td class="Trow_Validator" style="width: 1%">
                                                <%--<div id="Div10">
                                                    *
                                                </div>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 5px;">
                                            </td>
                                        </tr>
                                      <tr>
                                            <td class="Trow" style="width: 20%">
                                                <asp:Label ID="txtGeneralOrder" Text="General Order" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 79%">
                                                <asp:RadioButtonList ID="rblGeneralOrder" runat="server" RepeatDirection="Horizontal"
                                                    TabIndex="4" Width="250px" CssClass="radio_My" AutoPostBack="true" 
                                                    >
                                                    <asp:ListItem Text="No" Value="N" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                    
                                                </asp:RadioButtonList>
                                            </td>
                                             <td class="Trow_Validator" style="width: 1%">
                                                <%--<div id="Div10">
                                                    *
                                                </div>--%>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td style="height: 5px;">
                                            </td>
                                        </tr>
                                        
                                         <tr>
                                                <td colspan="3">
                                                    <table width="50%" border="0" cellspacing="0" cellpadding="0">
                                                        <tbody>
                                                            <tr>
                                                                <td valign="top" style="width: 2%">
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    </table>
                                                                </td>
                                                                <td valign="top" style="width: 98%">
                                                                    <table id="tblCancel" runat="server" border="0" cellspacing="0" cellpadding="0" visible="false">
                                                                        <tr>
                                                                            <td class="style1">
                                                                            </td>
                                                                            <td>
                                                                                <span style="font-size: 12px; font-family: Verdana">Left:</span>
                                                                                <asp:Label ID="lblChar2" runat="server" CssClass="lblstyle" Text="500"></asp:Label>
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
                                                                                                        <td id="Colordiv2" runat="server">
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
                                                                               
                                                                                <asp:Label ID="lblCancelReason" Text="Cancel Reason" runat="server" Style="padding-right: 0%;"></asp:Label>
                                                                            </td>
                                                                            <td valign="top">
                                                                                <asp:TextBox ID="txtcancelReason" runat="server" Height="50px" MaxLength="500"
                                                                                    TabIndex="5" onkeyup="Javascript:CharactersCountProductPreticulars();" Style="overflow: scroll;"
                                                                                    TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
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
            <script type="text/javascript" src="../Javascript/ProgressBar/jsUpdateProgress.js"></script>
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

            if (validate(document.getElementById("<%= txtJobNo.ClientID %>"), 'Job No. should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (DropdownValidation(document.getElementById("<%= DropCustomer.ClientID %>"), 'Customer should not be left empty', 'Common_error', 1) == false) {
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
    <script type="text/javascript">
        function CharactersCountProductPreticulars() {
            var CharLength = '<%=txtcancelReason.MaxLength %>';
            var txtMsg = document.getElementById('txtcancelReason');
            var lblCount = document.getElementById('lblChar2');
            var colorwidth = txtMsg.value.length;
            var divcolor = document.getElementById('Colordiv2');
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
