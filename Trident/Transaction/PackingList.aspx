<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingList.aspx.cs" Inherits="Trident.Transaction.PackingList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title></title>
    <script src="../JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
    <style type="text/css">
        #SearchResultPopup
        {
            background: #fff;
            border: 1px solid #73b011;
            height: 500px;
            width: 630px;
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
        .style1
        {
            width: 38%;
        }
        .style2
        {
            height: 3px;
        }
    </style>
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
                    document.getElementById('Save').click();
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
    <script type="text/javascript">
        function Hide() {
            $find("modalBehavior").hide();
        }
    </script>
    <script type="text/javascript">
        function Hideterm() {
            $find("modalterm").hide();
        }
    </script>
    <script type="text/javascript">
        //Function to allow only numbers to textbox
        function OnlyNumericvalue(key, clientID) {
            //getting key code of pressed key
            var keycode = (key.which) ? key.which : key.keyCode;
            var phn = document.getElementById(clientID);
            //comparing pressed keycodes
            if (!(keycode == 8 || keycode == 46 || keycode == 110 || keycode == 13 || keycode == 9 || keycode == 37 || keycode == 39 || keycode == 190) && (keycode < 48 || keycode > 57) && (keycode < 96 || keycode > 105)) {
                return false;
            }
            else {

            }
        }
</script>
</head>
<body class="landscape has-receipt-80" id="products">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" PopupControlID="SearchResultPopup"
        X="100" Y="100" CancelControlID="imgid" TargetControlID="imgButton" BackgroundCssClass="modalbackground"
        DropShadow="false" BehaviorID="modalBehavior">
    </ajaxToolkit:ModalPopupExtender>
    <a href="#" runat="server" id="imgButton" style="position: absolute; top: 0px; left: 0px;">
        <img src="../Images/px1.gif" alt="Popup" /></a>
    <div id="SearchResultPopup" title="Product List">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="box light collapsible size1of1">
                    <div class="head box-gradient-4">
                        <img src="../Images/x.png" alt='x' id="imgid" onclick="Hide()" />
                        <a href="#" class="text">
                            <h3 class="h4 strong">
                                Product List</h3>
                        </a>
                    </div>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td colspan="2" style="height: 5px;">
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 30%;">
                            </td>
                            <td valign="top" style="width: 70%">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td class="Trow" style="width: 39%">
                                            <asp:Label ID="lblSearch" Text="Search" runat="server" Style="font-weight: bolder;"></asp:Label>
                                        </td>
                                        <td valign="top" style="width: 56%">
                                            <asp:TextBox ID="txtSearch" runat="server" CssClass="top-input" Width="200px" MaxLength="100"
                                                placeholder="Carton No." onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
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
                      <tr>
                                  <td valign="top" style="width: 35%"></td>
                                    <td valign="top" style="width: 30%">
                                    <asp:Button ID="btn_CortonOk" runat="server" ToolTip="Ok" Text="Ok" CssClass="butt_Save" 
                                           TabIndex="38" onclick="btn_CortonOk_Click" />
                                     <asp:Button ID="btn_CortonCancel" runat="server" ToolTip="Cancel" Text="Cancel" CssClass="butt_Save"
                                           TabIndex="39" onclick="btn_CortonCancel_Click" />
                                     
                                          
                                    </td>
                                    <td valign="top" style="width: 35%"></td>
                                    
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <asp:GridView ID="searchResult" runat="server" AutoGenerateColumns="False" DataKeyNames="PackingDetailID"
                                GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                Style="overflow: scroll;" OnRowCommand="searchResult_RowCommand" >
                               <Columns>
                                    <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center" HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkselect" runat="server" Checked='<%# Convert.ToBoolean(Convert.ToString(DataBinder.Eval(Container,"DataItem.Selectno")) == "Y" ? "true" : "false")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
                                            ItemStyle-CssClass="WithoutBorder">
                                            <ItemTemplate>
                                                <asp:Button ID="btnGalleryEdit" runat="server" CssClass="GridviewEdit" CommandName="EDITROW"
                                                    ToolTip="Edit" CausesValidation="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="SNo" HeaderText="SNo." ItemStyle-CssClass="WithoutBorderCenter" ItemStyle-Width="8%" />
                                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="CartonNo" HeaderText="Carton No."  ItemStyle-CssClass="WithoutBorderCenter" ItemStyle-Width="10%" />
                                         <asp:BoundField DataField="NewCartonNo" HeaderText="New Carton No."  ItemStyle-CssClass="WithoutBorderCenter" ItemStyle-Width="20%" />
                                       <asp:BoundField DataField="ProductCode" HeaderText="Product Code" FooterText="Total" ItemStyle-CssClass="WithoutBorderCenter" ItemStyle-Width="20%" />
                                         <asp:BoundField DataField="Description" HeaderText="Description"  ItemStyle-CssClass="WithoutBorderLeft" Visible="false" />
                                       <asp:BoundField DataField="BuyerReferences" HeaderText="Buyer Ref."  ItemStyle-CssClass="WithoutBorderLeft" ItemStyle-Width="20%" />
                                        <asp:BoundField DataField="ProductGroupID" HeaderText="ProductGroupID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="CategoryName" HeaderText="Category" ItemStyle-CssClass="WithoutBorder" Visible="false"/>
                                            <asp:BoundField DataField="QualityID" HeaderText="QualityID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="DesignID" HeaderText="DesignID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="DesignName" HeaderText="Design" ItemStyle-CssClass="WithoutBorderLeft"
                                            Visible="false" />
                                        <asp:BoundField DataField="UOMID" HeaderText="UOMID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="UOMName" HeaderText="UOM" ItemStyle-CssClass="WithoutBorderLeft"
                                            Visible="false" />
                                        <asp:BoundField DataField="ColorID" HeaderText="ColorID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="ColorName" HeaderText="Colour" ItemStyle-CssClass="WithoutBorderLeft" Visible="false"/>
                                        
                                        <asp:BoundField DataField="SizeName" HeaderText="Size" ItemStyle-CssClass="WithoutBorderLeft" Visible="false"/>
                                        <asp:BoundField DataField="SizeID" HeaderText="SizeID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                           
                                              <asp:BoundField DataField="Qty" HeaderText="Qty" ItemStyle-CssClass="WithoutBorderRigt" ItemStyle-Width="10%" />
                                       
                                        <asp:BoundField DataField="PcsCarton" HeaderText="Pcs/Carton" ItemStyle-CssClass="WithoutBorderRigt" />
                                        <asp:BoundField DataField="TotalPcs" HeaderText="TotalPcs" ItemStyle-CssClass="WithoutBorderRigt" ItemStyle-Width="10%" />
                                         
                                      <asp:BoundField DataField="NetWt" HeaderText="NetWt" ItemStyle-CssClass="WithoutBorderRigt" Visible="false" />
                                         <asp:BoundField DataField="GrsWt" HeaderText="GrsWt" ItemStyle-CssClass="WithoutBorderRigt" Visible="false" />
                                         <asp:BoundField DataField="CartonSize" HeaderText="Carton Size" ItemStyle-CssClass="WithoutBorderLeft" Visible="false" />
                                   
                                </Columns>
                                <SelectedRowStyle CssClass="SelectedResultItem"></SelectedRowStyle>
                            </asp:GridView>
                        </tr>
                       
                    </table>
                   
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
    <ajaxToolkit:ModalPopupExtender ID="termpopup" runat="server" PopupControlID="SearchResultPopupterm"
        X="200" Y="100" CancelControlID="imgterm" TargetControlID="imgButterm" BackgroundCssClass="modalbackground"
        DropShadow="false" BehaviorID="modalterm">
    </ajaxToolkit:ModalPopupExtender>
   
    <a href="#" runat="server" id="imgButterm" style="position: absolute; top: 0px; left: 0px;">
        <img src="../Images/px1.gif" alt="Popup" /></a>
    <div id="SearchResultPopupterm" title="Product List">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="box light collapsible size1of1">
                    <div class="head box-gradient-4">
                        <img src="../Images/x.png"alt='x' id="imgterm" onclick="Hideterm()" />
                        <a href="#" class="text">
                            <h3 class="h4 strong">
                                Print Box No.</h3>
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
                                        
                                            <asp:Label ID="lblRemarks" Text="New Carton No." runat="server" Style="font-weight: bolder;"></asp:Label>
                                        </td>
                                        <td valign="top" style="width: 30%">
                                            <asp:TextBox ID="txtPopNewCortonNo" runat="server" MaxLength="50" TabIndex="21" 
                                                  onkeypress="return handleEnter(this,onkeypress)"  Width="200px"></asp:TextBox>
                                           
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
                                    <asp:Button ID="btn_Ok" runat="server" ToolTip="Ok" Text="Ok" CssClass="butt_Save" OnClientClick="return validationPopUp();" 
                                           TabIndex="22" onclick="btn_Ok_Click" />
                                     <asp:Button ID="btn_cancen" runat="server" ToolTip="Cancel" Text="Cancel" CssClass="butt_Save" 
                                           TabIndex="23" onclick="btn_cancen_Click" />
                                     
                                          
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
                    <td align="right" style="float: right; padding-left: 0px;">
                   
                     <%-- <asp:Button ID="btn_Printsam" runat="server" ToolTip="Print" Text="Print - (F7)" CssClass="butt_Save"
                            TabIndex="23" OnClientClick="return validation();" />--%>
                        <asp:Button ID="Save" runat="server" ToolTip="Save" Text="Save - (F7)" CssClass="butt_Save"
                            TabIndex="23" OnClientClick="return validation();" OnClick="Save_Click" />
                        <asp:Button ID="Search" runat="server" ToolTip="Search" Text="Search - (F8)" CssClass="butt_Save"
                            TabIndex="24" OnClick="Search_Click" />
                        <asp:Button ID="Clear" AccessKey="C" runat="server" ToolTip="Clear" Text="Clear-(Alt+Shift+C)"
                            TabIndex="25" CssClass="butt_Save" OnClick="Clear_Click" />
                        <asp:Button ID="Exit" runat="server" ToolTip="Exit" Text="Exit - (F9)" CssClass="butt_Save"
                            TabIndex="26" OnClick="Exit_Click" />
                            <asp:Button ID="btn_Print" runat="server" ToolTip="Print" Text="Print" CssClass="butt_Save"
                            TabIndex="27" OnClick="btn_Print_Click" />
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
                            Packing List</h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <fieldset class="product-price">
                        <div class="line pricing-values">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td valign="top" style="width: 50%">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblInvoiceNO" Text="Invoice No." runat="server"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                        <asp:TextBox ID="txtInvoiceNo" runat="server" CssClass="top-inputReadonly" Width="100px" MaxLength="20" ReadOnly="true"
                                                        onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                       
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 5px;">
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblInvoiceDate" Text="Invoice Date" runat="server"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" CssClass="cal_Theme1"
                                                            Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtInvoiceDate" PopupPosition="BottomRight">
                                                        </ajaxToolkit:CalendarExtender>
                                                        <asp:TextBox ID="txtInvoiceDate" runat="server" CssClass="top-input" Width="125px" MaxLength="40"
                                                            TabIndex="2" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="div">
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
                                                        <asp:Label ID="lblCustomer" Text="Customer" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchExtender3"  
                                                           runat="server"   
                     
                                                         TargetControlID="DropCustomer"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender> 
                                                        <asp:DropDownList ID="DropCustomer" runat="server" CssClass="top-input" TabIndex="4"
                                                            Width="200px" MaxLength="100" >
                                                        </asp:DropDownList>
                                                       
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="Div8">
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
                                                        <asp:Label ID="lblOtherReference" Text="Other Reference(s)" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                   <asp:TextBox ID="txtOtherReference" runat="server"  CssClass="top-input" Width="220px" MaxLength="500" TabIndex="6"

                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                       
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="Div17">
                                                            *
                                                        </div>
                                                    </td>
                                                </tr>
                                                 
                                               
                                            </table>
                                        </td>
                                        <td valign="top" style="width: 50%">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                               
                                                <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblJobNo" Text="Job No." runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchExtender1"  
                                                           runat="server"   
                     
                                                         TargetControlID="DropJobNo"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender> 
                                                        <asp:DropDownList ID="DropJobNo" runat="server" CssClass="top-input" TabIndex="1"
                                                            Width="200px" MaxLength="100" AutoPostBack="true"  
                                                            onselectedindexchanged="DropJobNo_SelectedIndexChanged" >
                                                        </asp:DropDownList>
                                                       
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="dropsupplier_error">
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
                                                        <asp:Label ID="lblBuyerRefNo" Text="Buyer's Oreder No." runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                 
                                                        <asp:TextBox ID="txtBuyerOrderNo" runat="server" CssClass="top-input" Width="125px" MaxLength="40"
                                                            TabIndex="5" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                       
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="Div7">
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
                                                        <asp:Label ID="lblBuyerDate" Text="Buyer's Date" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                   
                                                   <td valign="top" style="width: 56%">
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="cal_Theme1"
                                                            Enabled="True" Format="dd-MM-yyyy" TargetControlID="txtBuyerDate" PopupPosition="BottomRight">
                                                        </ajaxToolkit:CalendarExtender>
                                                        <asp:TextBox ID="txtBuyerDate" runat="server" CssClass="top-input" Width="125px" MaxLength="40"
                                                            TabIndex="5" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="Div16">
                                                            *
                                                        </div>
                                                    </td>
                                                </tr>
                                               
                                            </table>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td style="height: 10px">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </div>
            </div>

            <div class="box light collapsible size1of1">
                <div class="head box-gradient-4">
                    <a href="#" class="text">
                        <h3 class="h4 strong">
                            Packing List Detail</h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td valign="top" style="width: 50%">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td class="Trow" style="width: 39%">
                                                <asp:Label ID="lblProductCode" Text="Product Code" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtProductCode" runat="server" CssClass="top-input" Width="150px" MaxLength="20"
                                                    TabIndex="7" onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                                <asp:Button ID="Button1" runat="server" Text="?" class="btn-add" OnClientClick="return validationJobNo();"  OnClick="Button1_Click"/>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div6">
                                                    *
                                                </div>
                                            </td>
                                        </tr>
                                       <tr>
                                            <td style="height: 5px;">
                                            </td>
                                        </tr>
                                       

                                         <tr>
                                            <td class="Trow" style="width: 39%;">
                                                <asp:Label ID="Label1" Text="Buyer Ref."  runat="server"></asp:Label> 
                                            </td>
                                            <td valign="top" style="width: 56%;">
                                                <asp:TextBox ID="txtBuyerRef" runat="server"  CssClass="top-inputReadonly" Width="220px" MaxLength="500"  Enabled="false"
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                     
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
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
                                                <asp:Label ID="lblsize" Text="Size" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="Dropsize" runat="server" CssClass="top-inputReadonly" Enabled="false"
                                                    Width="200px" MaxLength="100">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Dropsize_error">
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
                                                <asp:Label ID="lblcategory" Text="Category" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                             
                                                <asp:DropDownList ID="Dropcategory" runat="server" CssClass="top-inputReadonly" Enabled="false"
                                                    Width="200px" MaxLength="100" >
                                                </asp:DropDownList>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div5">
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
                                                <asp:Label ID="lblquantity" Text="QTY" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtquantity" runat="server" CssClass="top-input" Width="150px" MaxLength="7"
                                                    TabIndex="9"   onkeydown="return OnlyNumericvalue(event,this)"
                                                    onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="txtquantity_error">
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
                                                <asp:Label ID="lblPcs" Text="Total Pcs" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtPcs" runat="server"  CssClass="top-input" Width="150px" MaxLength="10"  
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
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
                                                <asp:Label ID="lblGrsWt" Text="Gross Weight" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtGrossWeight" runat="server" CssClass="top-input"  Width="150px" MaxLength="6"  TabIndex="10" onkeydown="return OnlyNumericvalue(event,this)"
                                                     onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div12">
                                                    *
                                                </div>
                                            </td>
                                        </tr>

                                       
                                                                              
                                    </table>
                                </td>
                                <td valign="top" style="width: 50%;">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                       
                                      
                                          <tr>
                                            <td class="Trow" style="width: 39%;">
                                                <asp:Label ID="lblCartonNo" Text="Carton No."  runat="server"></asp:Label> 
                                            </td>
                                            <td valign="top" style="width: 56%;">
                                                <asp:TextBox ID="txtNewCartonNo" runat="server"  CssClass="top-input" Width="220px" MaxLength="500" TabIndex="8"  
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                     
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div9">
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
                                                <asp:Label ID="lblDesign" Text="Design" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="DropDesign" runat="server" CssClass="top-inputReadonly" Enabled="false"
                                                    Width="200px" MaxLength="100" >
                                                </asp:DropDownList>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
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
                                                <asp:Label ID="lblcolour" Text="Colour" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="Dropcolour" runat="server" CssClass="top-inputReadonly"  Enabled="false"
                                                    Width="200px" MaxLength="100" >
                                                </asp:DropDownList>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Dropcolour_error">
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
                                                <asp:Label ID="lblUom" Text="UOM" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="DropUOM" runat="server" CssClass="top-inputReadonly"  Enabled="false"
                                                    Width="200px" MaxLength="100" >
                                                </asp:DropDownList>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div10">
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
                                                <asp:Label ID="lblCortonPcs" Text="Pcs/Carton" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtCortonPcs" runat="server" CssClass="top-input"  Width="150px" MaxLength="6"   onkeydown="return OnlyNumericvalue(event,this)"
                                                onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
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
                                                <asp:Label ID="lblNetWeight" Text="Net Weight" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtNetWeight" runat="server" CssClass="top-input"  Width="150px" MaxLength="6" onkeydown="return OnlyNumericvalue(event,this)"
                                                    onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div11">
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
                                                <asp:Label ID="lblCartonSize" Text="Carton Size" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtCartonSize" runat="server" CssClass="top-input"  Width="150px" MaxLength="50" 
                                                  onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div13">
                                                    *
                                                </div>
                                            </td>
                                        </tr>
                                       
                                        
                                        <tr>
                                            <td class="Trow" style="width: 79%">
                                            </td>
                                            <td valign="top" style="width: 20%; padding-right: 60px;">
                                                <asp:Button ID="ItemSave" runat="server" ToolTip="Item Save" Text="Item Save" TabIndex="10"
                                                    class="button-1 unit-right" OnClientClick="return Itemvalidation();" OnClick="ItemSave_Click" />
                                            </td>
                                            <td class="Trow_Validator" style="width: 1%">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                               
                                <tr>
                                    <td style="height: 3px;">
                                    </td>
                                </tr>
                            </tr>
                           
                            </tr>
                            <tr>
                                <td colspan="2" style="padding: 10px">
                                    <asp:HiddenField ID="hUpdateID" runat="server" Value="0" />                               
                                     
                                    
                                    <asp:HiddenField ID="hItemID" runat="server" Value="0" />
                                    <asp:HiddenField ID="hfldid" runat="server" Value="0" />
                                    <asp:HiddenField ID="Amt" runat="server" Value="0" />
                                    <asp:HiddenField ID="HProductGroupID" runat="server" Value="0" />
                                <asp:HiddenField ID="HCategoryID" runat="server" Value="0" />
                                <asp:HiddenField ID="HQualityID" runat="server" Value="0" />
                                <asp:HiddenField ID="HTotalQty" runat="server" Value="0" />
                                 <asp:HiddenField ID="HCortonNo" runat="server" Value="0" />
                                <asp:HiddenField ID="HTotalAmount" runat="server" Value="0" />
                                 <asp:HiddenField ID="HCortonTotal" runat="server" Value="0" />
                                
                                
                                </td>
                            </tr>
                        </tbody>
                    </table>
                  
                           <asp:Panel ID="Panel" ScrollBars="Vertical" runat="server" CssClass="top-input" Height="300px">
                                <asp:Label ID="lblmsg" runat="server" Text="No Record Found" Visible="false"></asp:Label>
                                <asp:GridView ID="gridPacking" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="PackingDetailID"
                                    GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" style="overflow:scroll;"
                                   OnRowCommand="gridPacking_RowCommand3"
                                    OnRowDataBound="gridPacking_RowDataBound" >
                                   <Columns>
                                       
                                         <asp:BoundField DataField="SNo" HeaderText="SNo." ItemStyle-CssClass="WithoutBorderCenter" />
                                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="CartonNo" HeaderText="Carton No."  ItemStyle-CssClass="WithoutBorderLeft" />
                                         <asp:BoundField DataField="NewCartonNo" HeaderText="New Carton No."  ItemStyle-CssClass="WithoutBorderLeft" />
                                       <asp:BoundField DataField="ProductCode" HeaderText="Product Code" FooterText="Total" ItemStyle-CssClass="WithoutBorderCenter" />
                                        <%-- <asp:BoundField DataField="Description" HeaderText="Description"  ItemStyle-CssClass="WithoutBorderLeft" Visible="false" />--%>
                                        
                                       <asp:BoundField DataField="BuyerReferences" HeaderText="Buyer Ref."  ItemStyle-CssClass="WithoutBorderLeft" />
                                        <asp:BoundField DataField="ProductGroupID" HeaderText="ProductGroupID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="CategoryName" HeaderText="Category" ItemStyle-CssClass="WithoutBorder" />
                                            <asp:BoundField DataField="QualityID" HeaderText="QualityID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="DesignID" HeaderText="DesignID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="DesignName" HeaderText="Design" ItemStyle-CssClass="WithoutBorderLeft"
                                             />
                                        <asp:BoundField DataField="UOMID" HeaderText="UOMID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="UOMName" HeaderText="UOM" ItemStyle-CssClass="WithoutBorderLeft"
                                            Visible="false" />
                                        <asp:BoundField DataField="ColorID" HeaderText="ColorID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="ColorName" HeaderText="Colour" ItemStyle-CssClass="WithoutBorderLeft" />
                                        
                                        <asp:BoundField DataField="SizeName" HeaderText="Size" ItemStyle-CssClass="WithoutBorderLeft" />
                                        <asp:BoundField DataField="SizeID" HeaderText="SizeID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:TemplateField HeaderText="Qty"  ItemStyle-CssClass="WithoutBorderCenter">
                                            <ItemTemplate>
                            <asp:Label runat="server" ID="lblTotalQty" Text='<%# Eval("Qty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="lblTotalQty" Text='<%# GetTotalQty() %>'></asp:Label>
                        </FooterTemplate>
                                            </asp:TemplateField>
                                       
                                        <asp:BoundField DataField="PcsCarton" HeaderText="Pcs/Carton" ItemStyle-CssClass="WithoutBorderRigt" />
                                          <asp:TemplateField HeaderText="Total Pcs"  ItemStyle-CssClass="WithoutBorderRigt">
                                            <ItemTemplate>
                            <asp:Label runat="server" ID="lblAmount" Text='<%# Eval("TotalPcs") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="lblAmount" Text='<%# GetTotalAmount() %>'></asp:Label>
                        </FooterTemplate>
                                            </asp:TemplateField>
                                        
                                       
                                      <asp:BoundField DataField="NetWt" HeaderText="NetWt" ItemStyle-CssClass="WithoutBorderRigt" />
                                         <asp:BoundField DataField="GrsWt" HeaderText="GrsWt" ItemStyle-CssClass="WithoutBorderRigt" />
                                         <asp:BoundField DataField="CartonSize" HeaderText="Carton Size" ItemStyle-CssClass="WithoutBorderLeft" />
                                         

                                         <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                                            ItemStyle-CssClass="WithoutBorder">
                                            <ItemTemplate>
                                                <asp:Button ID="btnGalleryEdit" runat="server" CssClass="GridviewEdit" CommandName="EDITROW"
                                                    ToolTip="Edit" CausesValidation="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                                            ItemStyle-CssClass="WithoutBorder">
                                            <ItemTemplate>
                                                <asp:Button ID="Edit" runat="server" CssClass="GridviewDelete" OnClientClick="return confirm('Do you want to delete this Record?')"
                                                    HeaderStyle-Width="20px" CommandName="DELETEROW" ToolTip="Delete" CausesValidation="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                     <FooterStyle Font-Bold="True" Font-Size="12pt" HorizontalAlign="Right" VerticalAlign="Middle"  ForeColor="#507CD1" />
                                    <SelectedRowStyle CssClass="SelectedResultItem"></SelectedRowStyle>
                                </asp:GridView>
                            <%--</div>
                        </div>
                    </div>--%>
                </asp:Panel>
           
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="height: 20px">
                    </td>
                </tr>
            </table>

           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td valign="top" style="width: 50%">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblCountryofOrigin" Text="Country of Origin of Goods" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchExtender7"  
                                                           runat="server"   
                     
                                                         TargetControlID="DropCountryofOrigin"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender> 
                                                        <asp:DropDownList ID="DropCountryofOrigin" runat="server" CssClass="top-input" TabIndex="11"
                                                            Width="200px" MaxLength="100" >
                                                        </asp:DropDownList>
                                                       
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="Div18">
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
                                                        <asp:Label ID="lblCountryFinal" Text="Country of Final Destination" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchCountry" 
                                                           runat="server"   
                     
                                                         TargetControlID="DropCountryFinal"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender> 
                                                        <asp:DropDownList ID="DropCountryFinal" runat="server" CssClass="top-input" TabIndex="12"
                                                            Width="200px" MaxLength="100" >
                                                        </asp:DropDownList>
                                                       
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="Div20">
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
                                                        <asp:Label ID="lblDeliveryterm" Text="Delivery Term" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchDropDeliveryterm" 
                                                           runat="server"   
                     
                                                         TargetControlID="DropDeliveryterm"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender>
                                                        <asp:DropDownList ID="DropDeliveryterm" runat="server" CssClass="top-input" TabIndex="13"
                                                            Width="200px" MaxLength="100" onkeypress="return handleEnter(this,onkeypress)">
                                                        </asp:DropDownList>
                                                      
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <%--<div id="Div17">
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
                                                        <asp:Label ID="lblPaymentTerm" Text="Payment Term" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                     <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchDropPaymentterm" 
                                                           runat="server"   
                     
                                                         TargetControlID="DropPaymentterm"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender>
                                                        <asp:DropDownList ID="DropPaymentterm" runat="server" CssClass="top-input" TabIndex="14"
                                                            Width="200px" MaxLength="100" onkeypress="return handleEnter(this,onkeypress)">
                                                        </asp:DropDownList>
                                                       
                                                       
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <%--<div id="Div18">
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
                                                        <asp:Label ID="lblvessel1" Text="Vessel / Fligt No." runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                     
                                                       <asp:TextBox ID="txtVesselFlight" runat="server"  CssClass="top-input" Width="220px" MaxLength="500" TabIndex="15"
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                    </td>
                                                   
                                                     <td class="Trow_Validator" style="width: 5%">
                                                       <%-- <div id="Div17">
                                                            *
                                                        </div>--%>
                                                </tr>

                                                 <tr>
                                                    <td style="height: 15px;">
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblPlaceofreceipt" Text="Place of Receipt by Pre-Carrier" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                     
                                                       <asp:TextBox ID="txtPlaceofReceipt" runat="server"  CssClass="top-input" Width="220px" MaxLength="500" TabIndex="16"
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                    </td>
                                                    
                                                     <td class="Trow_Validator" style="width: 5%">
                                                       <%-- <div id="Div17">
                                                            *
                                                        </div>--%>
                                                </tr>
                                               
                                                 <tr>
                                                    <td style="height: 15px;">
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblVessel" Text="Vessel / Flight No." runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                     
                                                        <asp:TextBox ID="txtVesselFligt2" runat="server"  CssClass="top-input" Width="220px" MaxLength="500" TabIndex="17"
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                    </td>
                                                   
                                                     <td class="Trow_Validator" style="width: 5%">
                                                       <%-- <div id="Div17">
                                                            *
                                                        </div>--%>
                                                </tr>
                                               
                                                 <tr>
                                                    <td style="height: 15px;">
                                                    </td>
                                                </tr>

                                                  <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblPortofdestination" Text="Port of Destination" runat="server"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchExtender4" 
                                                           runat="server"   
                     
                                                         TargetControlID="DropPortofDestination"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender>
                                                        <asp:DropDownList ID="DropPortofDestination" runat="server" CssClass="top-input" TabIndex="18"
                                                            Width="200px" MaxLength="100" onkeypress="return handleEnter(this,onkeypress)">
                                                        </asp:DropDownList>
                                                         
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                       
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td style="height: 15px;">
                                                    </td>
                                                </tr>
                                               
                                               
                                                 
                                            </table>
                                        </td>
                                        <td valign="top" style="width: 50%">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                               

                                                <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblPortOfLoading" Text="Port of Loading" runat="server"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchExtender5" 
                                                           runat="server"   
                     
                                                         TargetControlID="DropPortofLoading"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender>
                                                        <asp:DropDownList ID="DropPortofLoading" runat="server" CssClass="top-input" TabIndex="19"
                                                            Width="200px" MaxLength="100" onkeypress="return handleEnter(this,onkeypress)">
                                                        </asp:DropDownList>
                                                         
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                       
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 5px;">
                                                    </td>
                                                </tr>
                                       <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblFinalDestionation" Text="Final Destination" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                     
                                                         <asp:TextBox ID="txtFinalDestination" runat="server"  CssClass="top-input" Width="220px" MaxLength="500" TabIndex="20"
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                    </td>
                                                   
                                                     <td class="Trow_Validator" style="width: 5%">
                                                       <%-- <div id="Div17">
                                                            *
                                                        </div>--%>
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
                                                                    <table id="Table2" runat="server" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td class="style1">
                                                                            </td>
                                                                            
                                                                            <td>
                                                                                <span style="font-size: 12px; font-family: Verdana">Left:</span>
                                                                                <asp:Label ID="Label3" runat="server" CssClass="lblstyle" Text="1000"></asp:Label>
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
                                                                                                        <td id="Td1" runat="server">
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
                                                                               
                                                                                <asp:Label ID="Label4" Text="Marks & Nos." runat="server" style="padding-right:130px;"></asp:Label>
                                                                            </td>
                                                                            
                                                                            <td valign="top" style="padding-right:100%; width:20%;">
                                                                                <asp:TextBox ID="txtMarkNos" runat="server" Height="80px" MaxLength="1000"
                                                                                    TabIndex="22" onkeyup="Javascript:CharactersCountProductPreticulars();" Style="overflow: scroll;"
                                                                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                                            </td>
                                                                           
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
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
                                                                    <table id="Table1" runat="server" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td class="style1">
                                                                            </td>
                                                                            
                                                                            <td>
                                                                                <span style="font-size: 12px; font-family: Verdana">Left:</span>
                                                                                <asp:Label ID="lblChar5" runat="server" CssClass="lblstyle" Text="1000"></asp:Label>
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
                                                                                                        <td id="Color5" runat="server">
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
                                                                               
                                                                                <asp:Label ID="Label2" Text="No. & Kind of Pkgs" runat="server" style="padding-right:130px;"></asp:Label>
                                                                            </td>
                                                                            
                                                                            <td valign="top" style="padding-right:100%; width:20%;">
                                                                                <asp:TextBox ID="txtNoKinfofPage" runat="server" Height="80px" MaxLength="1000"
                                                                                    TabIndex="22" onkeyup="Javascript:CharactersCountProduct();" Style="overflow: scroll;"
                                                                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
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
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td style="height: 10px">
                                        
                                    </tr>
                                </tbody>
                            </table>
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

           if (validate(document.getElementById("<%= txtInvoiceNo.ClientID %>"), 'Invoice No. should not be left empty', 'Common_error', 1) == false) {
               document.getElementById("Common_error").className = "error-box";
               return false;

           }
           if (DropdownValidation(document.getElementById("<%= DropJobNo.ClientID %>"), 'Job No. should not be left empty', 'Common_error', 1) == false) {
               document.getElementById("Common_error").className = "error-box";
               return false;
           }

           if (validate(document.getElementById("<%= txtBuyerOrderNo.ClientID %>"), 'Buyer Order No. should not be left empty', 'Common_error', 1) == false) {
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
           clearError(ErrorId, '', '', ClientId, 5);
       }
    </script>
    <script type="text/javascript">

        function Itemvalidation() {


            if (validate(document.getElementById("<%= txtProductCode.ClientID %>"), 'Product Code should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (validate(document.getElementById("<%= txtNewCartonNo.ClientID %>"), 'Carton No. should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }

            if (DropdownValidation(document.getElementById("<%= DropDesign.ClientID %>"), 'Design should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;
            }
            if (DropdownValidation(document.getElementById("<%= Dropcolour.ClientID %>"), 'Colour should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;
            }
            if (DropdownValidation(document.getElementById("<%= Dropsize.ClientID %>"), 'Design should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;
            }

            if (DropdownValidation(document.getElementById("<%= DropUOM.ClientID %>"), 'UOM should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;
            }
            if (validate(document.getElementById("<%= txtquantity.ClientID %>"), 'QTY should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (validate(document.getElementById("<%= txtCortonPcs.ClientID %>"), 'Carton/Pcs should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (validate(document.getElementById("<%= txtPcs.ClientID %>"), 'Total Pcs should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (validate(document.getElementById("<%= txtNetWeight.ClientID %>"), 'Net Weight should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (validate(document.getElementById("<%= txtGrossWeight.ClientID %>"), 'Gross Weight should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (validate(document.getElementById("<%= txtCartonSize.ClientID %>"), 'Carton Size should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            


            return true;
        }

        function ClearClientData(ClientId, ErrorId) {
            clearError(ErrorId, '', '', ClientId, 5);
        }
    </script>
        <script type="text/javascript">

            function validationPopUp() {

                if (validate(document.getElementById("<%= txtPopNewCortonNo.ClientID %>"), 'Carton No. should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Pop_error").className = "error-box";
                    return false;

                }


                return true;
            }

            function ClearClientData(ClientId, ErrorId) {
                clearError(ErrorId, '', '', ClientId, 5);
            }
    </script>
    <script type="text/javascript">

        function validationJobNo() {
            if (DropdownValidation(document.getElementById("<%= DropJobNo.ClientID %>"), 'Job No. should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;
            }
            


            return true;
        }

        function ClearClientData(ClientId, ErrorId) {
            clearError(ErrorId, '', '', ClientId, 5);
        }
    </script>
  <script type="text/javascript">
      function CharactersCountProductPreticulars() {
          var CharLength = '<%=txtMarkNos.MaxLength %>';
          var txtMsg = document.getElementById('txtRemarks');
          var lblCount = document.getElementById('Label3');
          var colorwidth = txtMsg.value.length;
          var divcolor = document.getElementById('Td1');
          if (txtMsg.value.length > CharLength) {
              txtMsg.value = txtMsg.value.substring(0, CharLength);
          }
          lblCount.innerHTML = CharLength - txtMsg.value.length;
          if (colorwidth >= 5) {
              divcolor.width = (colorwidth * 0.35) + "px";
              divcolor.bgColor = 'red';
              divcolor.height = 6 + "px";
          }
          else {
              divcolor.width = 5 + "px";
              divcolor.bgColor = '#9ED40A';
          }
      }
    </script>
    <script type="text/javascript">
        function CharactersCountProduct() {
            var CharLength = '<%=txtNoKinfofPage.MaxLength %>';
            var txtMsg = document.getElementById('txtDGoods');
            var lblCount = document.getElementById('lblChar5');
            var colorwidth = txtMsg.value.length;
            var divcolor = document.getElementById('Color5');
            if (txtMsg.value.length > CharLength) {
                txtMsg.value = txtMsg.value.substring(0, CharLength);
            }
            lblCount.innerHTML = CharLength - txtMsg.value.length;
            if (colorwidth >= 5) {
                divcolor.width = (colorwidth * 0.35) + "px";
                divcolor.bgColor = 'red';
                divcolor.height = 6 + "px";
            }
            else {
                divcolor.width = 5 + "px";
                divcolor.bgColor = '#9ED40A';
            }
        }
    </script>
    
    <script type="text/javascript">
        var TotalChkBx;
        var Counter;

        window.onload = function () {
            //Get total no. of CheckBoxes in side the GridView.
            TotalChkBx = parseInt('<%= this.searchResult.Rows.Count %>');
            //Get total no. of checked CheckBoxes in side the GridView.
            Counter = 0;
        }

        function HeaderClick(CheckBox) {
            //Get target base & child control.
            var TargetBaseControl = document.getElementById('<%= this.searchResult.ClientID %>');
            var TargetChildControl = "chkBxSelect";

            //Get all the control of the type INPUT in the base control.
            var Inputs = TargetBaseControl.getElementsByTagName("input");

            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' && Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                    Inputs[n].checked = CheckBox.checked;
            //Reset Counter
            Counter = CheckBox.checked ? TotalChkBx : 0;
        }

        function ChildClick(CheckBox, HCheckBox) {
            //get target base & child control.
            var HeaderCheckBox = document.getElementById(HCheckBox);

            //Modifiy Counter;            
            if (CheckBox.checked && Counter < TotalChkBx)
                Counter++;
            else if (Counter > 0)
                Counter--;

            //Change state of the header CheckBox.
            if (Counter < TotalChkBx)
                HeaderCheckBox.checked = false;
            else if (Counter == TotalChkBx)
                HeaderCheckBox.checked = true;
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
