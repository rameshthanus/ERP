<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobClosing.aspx.cs" Inherits="Trident.Transaction.JobClosing" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <script src="../JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
    <style type="text/css">
        #SearchResultPopup
        {
            background: #fff;
            border: 1px solid #73b011;
            height: 200px;
            width: 500px;
            overflow: scroll;
            font-family: Segoe UI;
            
            border-radius: 5px;
        }
        #SearchResultPopupterm
        {
            background: #fff;
            border: 1px solid #73b011;
            height: 250px;
            width: 500px;
            overflow: scroll;
            font-family: Segoe UI;
            
            border-radius: 5px;
        }
        
        .SearchResultItem
        {
            font-family: Segoe UI;
           
            font-size: 13px;
            vertical-align: top;
        }
        
        
        .SelectedResultItem
        {
            font-family: Segoe UI;
            background: #3A6191;
            color: #fff;
            font-size: 13px;
            vertical-align: top;
        }
        
        #searchResult
        {
            position: absolute;
            left: 10px;
            margin-top: 10px;
            width: 550px;
        }
        
        .modalbackground
        {
            background-color: #000;
            opacity: 0.3;
            filter: Alpha(opacity=0.3);
        }
    </style>
   <script type="text/javascript" language="javascript">
       function textboxMultilineMaxNumber(txt, maxLen) {

           if (txt.value.length > (maxLen)) return false;
           else {
               return true;
           }
       }
      
    </script>
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
   <script type="text/javascript" src="../App_Themes/HierachicalGrid/Hierachi.js"></script> 
   <script type="text/javascript">
       $("[src*=plus]").live("click", function () {
           $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
           $(this).attr("src", "../images/minus.png");
       });
       $("[src*=minus]").live("click", function () {
           $(this).attr("src", "../images/plus.png");
           $(this).closest("tr").next().remove();

       });
</script>
   
    <script type="text/javascript">
        function Hide() {
            $find("modalBehavior").hide();
        }
    </script>
    
</head>
<body class="landscape has-receipt-80" id="products">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" PopupControlID="SearchResultPopup"
        X="200" Y="100" CancelControlID="imgid" TargetControlID="imgButton" BackgroundCssClass="modalbackground"
        DropShadow="false" BehaviorID="modalBehavior">
    </ajaxToolkit:ModalPopupExtender>
   
    <a href="#" runat="server" id="imgButton" style="position: absolute; top: 0px; left: 0px;">
        <img src="../Images/px1.gif" alt="Popup" /></a>
    <div id="SearchResultPopup" title="Product List">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="box light collapsible size1of1">
                    <div class="head box-gradient-4">
                        <img src="../Images/x.png"alt='x' id="imgid" onclick="Hide()" />
                        <a href="#" class="text">
                            <h3 class="h4 strong">
                                Closing Reason</h3>
                        </a>
                    </div>
                   
                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                    <td colspan="2" style="height:10px;">
                    </td>
                    </tr>
                   
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                    
                                        <td class="TrowBox" style="width: 30%">
                                        
                                            <asp:Label ID="lblRemarks" Text="Remarks" runat="server" Style="font-weight: bolder;"></asp:Label>
                                        </td>
                                        <td valign="top" style="width: 30%">
                                            <asp:TextBox ID="txtRemarks" runat="server" Height="50px" MaxLength="300" onkeypress="return textboxMultilineMaxNumber(this,300);" TabIndex="21" 
                                                        Style="overflow: scroll;" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                           
                                        </td>
                                        <td class="Trow_Validator" style="width: 40%">
                                           <div id="Error_Remarks">
                                             *
                                          </div>
                                        </td>
                                    </tr>
                                     <tr>
                            <td colspan="3" style="height: 5px;">
                            </td>
                        </tr>
                                    <tr>
                                    <td></td>
                                    <td>
                                    <asp:Button ID="btn_Ok" runat="server" ToolTip="Ok" Text="Ok" CssClass="butt_Save" OnClientClick="return validation();" OnClick="btn_Ok_Click"
                                           TabIndex="22" />
                                     <asp:Button ID="btn_Cancel" runat="server" ToolTip="Cancel" Text="Cancel" CssClass="butt_Save" OnClick="btn_Cancel_Click"
                                           TabIndex="23" />
                                     
                                          
                                    </td>
                                    <td></td>
                                    
                                    </tr>

                                     <tr>
                            <td colspan="3" style="height: 15px;">
                            </td>
                        </tr>
                                     <tr>
                               <td>
                               </td>
                                <td class="Trow_Validator" colspan="2">
                                    <div id="Pop_error">
                                        
                                         <asp:Label ID="lblpoperror" runat="server"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                                </table>
                    
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

  
   
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
                        <asp:Button ID="Exit" runat="server" ToolTip="Exit" Text="Exit - (F9)" CssClass="butt_Save" TabIndex="29"
                            OnClick="Exit_Click" />
                            
                   <asp:HiddenField ID="Hterm" runat="server" Value="0" />
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
                            Job Closing</h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <div class="line pricing-values">
                        <div id="mainContainer">
                        </div>
                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td colspan="2" style="height: 5px;">
                            </td>
                        </tr>
                        <tr>
                           
                            <td valign="top" style="width: 40%">
                            
                                                               
                          
                            </td>
                            <td valign="top" style="width: 60%">
                             
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                     <td valign="top" style="width: 40%">
                                           
                                          
                                        </td>
                                        <td class="Trow" style="width: 19%">
                                            <asp:Label ID="Label1" Text="Search" runat="server" Style="font-weight: bolder;"></asp:Label>
                                        </td>
                                       <td valign="top" style="width: 40%">
                                            <asp:TextBox ID="txtSearch" runat="server" CssClass="top-input" Width="200px" MaxLength="100"
                                                placeholder="Job.Code" onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            <asp:Button ID="btnSearchPOP" runat="server" ToolTip="Load" Text="..." OnClick="btnSearchPOP_Click"
                                                Style="display: none;" />
                                        </td>
                                        <td class="Trow_Validator">
                                            <%-- <div id="div1">
                                    *
                                </div>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td style="height:10px;">
                                    
                                    </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="padding-left:10px; padding-right:10px;">
                               
                                
                                 <asp:Panel ID="Panel" ScrollBars="Vertical" runat="server" CssClass="top-input" Height="350px">
                                <asp:Label ID="lblmsg" runat="server" Text="No Record Found" Visible="false"></asp:Label>
                                <asp:GridView ID="searchResultWork" runat="server"  AutoGenerateColumns="False" DataKeyNames="JOBID,JOBCode"
                                    GridLines="None" CssClass="mGrid" EmptyDataText="No Record Found" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                     OnRowCommand="searchResultWork_RowCommand">
                                    <AlternatingRowStyle CssClass="alt" />
        <Columns>
      
            <asp:TemplateField HeaderText="Job Closing" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
                                            ItemStyle-CssClass="WithoutBorder">
                                            <ItemTemplate>
                                                <asp:Button ID="btnGalleryApproval" runat="server" CssClass="GridviewApproval" CommandName="APPROVALROW"
                                                    ToolTip="Active" CausesValidation="false" />
                                           
                                                          &nbsp;&nbsp;&nbsp;
                                             
                                                <asp:Button ID="btnGalleryCancel" runat="server" CssClass="GridviewCancel"  CommandName="CANCELROW"   OnClick="btnGalleryCancel_Click"
                                                    ToolTip="Closing" />
                                            </ItemTemplate>
                                            <ItemStyle CssClass="WithoutBorder" HorizontalAlign="Center" Width="10%" />
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="JOBID" Visible="false" ItemStyle-CssClass="WithoutBorderCenter"
                                            HeaderText="JOBID">
                                            <ItemStyle CssClass="WithoutBorderCenter"  Width="60px"></ItemStyle>                                           
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SNo" ItemStyle-CssClass="WithoutBorderCenter"
                                            HeaderText="S.No">
                                            <ItemStyle CssClass="WithoutBorderCenter" Width="60px"></ItemStyle>                                           
                                        </asp:BoundField>
                                         <asp:BoundField DataField="JOBCode" ItemStyle-CssClass="WithoutBorderCenter"
                                            HeaderText="Job.No">
                                            <ItemStyle CssClass="WithoutBorderCenter" Width="60px"></ItemStyle>                                           
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Remarks" ItemStyle-CssClass="WithoutBorderCenter"
                                            HeaderText="Remarks">
                                            <ItemStyle CssClass="WithoutBorderCenter" Width="70px"></ItemStyle>
                                        </asp:BoundField>
                                          <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="WithoutBorderCenter" >
                                            <ItemTemplate>
                                                <asp:Image ID="imgStatus" runat="server"  CssClass="label" ImageUrl='<%# GetImage((string)Eval("JobStatus")) %>' />
                                            </ItemTemplate>
                                            <ItemStyle CssClass="WithoutBorderCenter" Width="70px"></ItemStyle>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                                            ItemStyle-CssClass="WithoutBorder">
                                            <ItemTemplate>
                                                <asp:Button ID="btnGalleryEdit" runat="server" CssClass="GridviewEdit" CommandName="EDITROW"
                                                    ToolTip="Edit"  CausesValidation="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      
                                       
        </Columns>
                                    <PagerStyle CssClass="pgr" />
    </asp:GridView>
                                
                                
                                </asp:Panel>
                             
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
                        <img src="../images/Load Images/loader.gif" style="vertical-align: middle" alt="Processing" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </asp:Panel>
            <ajaxToolkit:ModalPopupExtender ID="ModalProgress" runat="server" TargetControlID="panelUpdateProgress"
                PopupControlID="panelUpdateProgress" />
        </ContentTemplate>
    </asp:UpdatePanel>
 
    <div id="dialog-message">
    </div>
   
    <script type="text/javascript">

        function validation() {

            if (validate(document.getElementById("<%= txtRemarks.ClientID %>"), 'Remarks should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Pop_error").className = "error-box";
                return false;

            }


            return true;
        }

        function ClearClientData(ClientId, ErrorId) {
            clearError(ErrorId, '', '', ClientId, 5);
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
