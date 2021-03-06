﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consumption.aspx.cs" Inherits="Trident.Transaction.Consumption" %>
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
            width: 570px;
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
  
    <script src="../JavaScript/comman_Validation.js" type="text/javascript"></script>
    
   
    <script type="text/javascript">
        function Hide() {
            $find("modalBehavior").hide();
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
      X="200" Y="100"   CancelControlID="imgid" TargetControlID="imgButton" BackgroundCssClass="modalbackground"
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
                                Product List</h3>
                        </a>
                    </div>
                   
                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                    <td colspan="2" style="height:5px;">
                    </td>
                    </tr>
                    <tr>
                    <td valign="top" style="width: 30%;">
                    
                    </td>
                     <td valign="top" style="width: 70%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                     <tr>
                                     
                                            <td class="Trow" style="width: 39%">
                                                <asp:Label ID="lblSearch" Text="Search" runat="server" style="font-weight:bolder;" ></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                               <asp:TextBox ID="txtSearch" runat="server" CssClass="top-input" Width="200px" MaxLength="100" placeholder="Product Code" 
                                                     onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                             <asp:Button ID="btnSearchPOP" runat="server" ToolTip="Load" Text="..." OnClick="btnSearchPOP_Click"  style="display:none;" />
                                            </td>
                                            <td class="Trow_Validator">
                                                <%-- <div id="div1">
                                    *
                                </div>--%>
                                            </td>
                                        </tr>
                                    </table>
                                    </td>
                    </tr>
                        
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                           
                            <asp:GridView ID="searchResult" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductCode"
                                GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                Style="overflow: scroll;" OnRowCommand="searchResult_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
                                        ItemStyle-CssClass="WithoutBorder">
                                        <ItemTemplate>
                                            <asp:Button ID="btnGalleryEdit" runat="server" CssClass="GridviewEdit" CommandName="EDITROW"
                                                ToolTip="Edit" CausesValidation="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SNo" HeaderText="SNo." ItemStyle-CssClass="WithoutBorderCenter"
                                        ItemStyle-Width="8%" />
                                   <asp:TemplateField HeaderText="Product Code" ItemStyle-CssClass="WithoutBorderLeft">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBarCode" runat="server" Text='<%# Eval("ProductCode").ToString() %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Description" ItemStyle-CssClass="WithoutBorderLeft" HeaderText="Product">
                                        <ItemStyle CssClass="SearchResultItem"></ItemStyle>
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Quantity" ItemStyle-CssClass="WithoutBorderLeft" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity").ToString() %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ProformaID" ItemStyle-CssClass="WithoutBorderLeft" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProformaID" runat="server" Text='<%# Eval("ProformaID").ToString() %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ProductID" ItemStyle-CssClass="WithoutBorderLeft" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductID" runat="server" Text='<%# Eval("ProductID").ToString() %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      
                                   
                                        
                                    
                                </Columns>
                                <SelectedRowStyle CssClass="SelectedResultItem"></SelectedRowStyle>
                            </asp:GridView>
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
                                          
                       <asp:Button ID="Save" runat="server" ToolTip="Save" Text="Save - (F7)" CssClass="butt_Save"
                            TabIndex="11" OnClientClick="return validation();" OnClick="Save_Click" />
                        <asp:Button ID="Search" runat="server" ToolTip="Search" Text="Search - (F8)" CssClass="butt_Save" TabIndex="12"
                            OnClick="Search_Click" />
                        <asp:Button ID="Clear" AccessKey="C" runat="server" ToolTip="Clear" Text="Clear-(Alt+Shift+C)" TabIndex="13"
                            CssClass="butt_Save" OnClick="Clear_Click" />
                        <asp:Button ID="Exit" runat="server" ToolTip="Exit" Text="Exit - (F9)" CssClass="butt_Save" TabIndex="14"
                            OnClick="Exit_Click" />
                            <asp:Button ID="Print" runat="server" ToolTip="Print" Text="Print" CssClass="butt_Save" TabIndex="14"
                            OnClick="Print_Click" />
                            <asp:Button ID="Abstract" runat="server" ToolTip="Abstract" Text="Abstract" 
                            CssClass="butt_Save" TabIndex="15" onclick="Abstract_Click"
                            />
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
                            Consumption</h3>
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
                                                        <asp:Label ID="lblConsumptionNo" Text="Consumption No." runat="server"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                        <asp:TextBox ID="txtConsumtionNo" runat="server" CssClass="top-inputReadonly" Width="100px" MaxLength="20" ReadOnly="true"
                                                        onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                       
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 15px;">
                                                    </td>
                                                </tr>
                                                 
                                                <tr>
                                                    <td class="Trow" style="width: 39%">
                                                        <asp:Label ID="lblConsumptionDate" Text="Date" runat="server"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" CssClass="cal_Theme1"
                                                            Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtConsumptiondate" PopupPosition="BottomRight">
                                                        </ajaxToolkit:CalendarExtender>
                                                        <asp:TextBox ID="txtConsumptiondate" runat="server" CssClass="top-input" Width="125px" MaxLength="40"
                                                            TabIndex="9" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="div">
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
                                                        <asp:DropDownList ID="DropJobNo" runat="server" CssClass="top-input" TabIndex="8"
                                                            Width="200px"  OnSelectedIndexChanged ="DropJobNo_SelectedIndexChanged" AutoPostBack="true" MaxLength="100" >
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
                                                        <asp:Label ID="lblCustomer" Text="Customer" runat="server"></asp:Label>
                                                       
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender   
                                                        ID="ListSearchCustomer"  
                                                           runat="server"   
                     
                                                         TargetControlID="DropCustomer"  
                                                           PromptCssClass="Search"  
                                                             >  
                                                        </ajaxToolkit:ListSearchExtender> 
                                                        <asp:DropDownList ID="DropCustomer" runat="server" CssClass="top-input" TabIndex="10"
                                                            Width="220px" MaxLength="100" >
                                                        </asp:DropDownList>
                                                       
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="Div7">
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
                        
                            Finished Product &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           
                           Requirement Items
                           
                            </h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td valign="top" style="width: 45%">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td class="Trow" style="width: 39%">
                                                <asp:Label ID="lblProductCode" Text="Product Code" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtProductCode" runat="server" CssClass="top-input" Width="150px" MaxLength="50"
                                                    TabIndex="1" onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                                <asp:Button ID="btn_Receive_Pop" runat="server" Text="?" class="btn-add" OnClick="btn_Receive_Pop_Click"/>
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
                                            <td class="Trow" style="width: 39%">
                                                <asp:Label ID="lblCategory" Text="Category" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="DropCategory" runat="server" CssClass="top-inputReadonly"  Enabled="false"
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
                                            <td class="Trow" style="width: 39%;">
                                                <asp:Label ID="lblDescription" Text="Description" runat="server"></asp:Label>
                                                
                                            </td>
                                            <td valign="top" style="width: 56%;">
                                                <asp:TextBox ID="txtDescription" runat="server" CssClass="top-inputReadonly" Width="200px" MaxLength="500"  ReadOnly="true"
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
                                                <asp:Label ID="lblquantity" Text="QTY" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtOredrquantity" runat="server" CssClass="top-input" Width="100px" MaxLength="5"
                                                    TabIndex="2"   onkeydown="return OnlyNumericvalue(event,this)"
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
                                                <asp:Label ID="lblOrderQty" Text="Order QTY" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtquantity" runat="server" CssClass="top-input" Width="150px" MaxLength="7"
                                                    TabIndex="2"   onkeydown="return OnlyNumericvalue(event,this)"
                                                    onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div16">
                                                    *
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 5px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Trow" style="width: 79%">
                                            </td>
                                            <td valign="top" style="width: 20%; padding-right: 60px;">
                                                <asp:Button ID="btn_Deli_ItemSave" runat="server" ToolTip="Item Save" Text="Item Save" TabIndex="7"
                                                    class="button-1 unit-right" OnClientClick="return ItemvalidationDelivery();" OnClick="btn_Deli_ItemSave_Click" />
                                            </td>
                                            <td class="Trow_Validator" style="width: 1%">
                                            </td>
                                        </tr>
                                       
                                    </table>
                                </td>
                                <td valign="top" style="width: 5%">
                                </td>
                                <td valign="top" style="width: 50%">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td class="Trow" style="width: 39%">
                                                <asp:Label ID="lblDeliProductCode" Text="Product Code" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtDeliProductCode" runat="server" CssClass="top-input" Width="150px" MaxLength="20"
                                                    TabIndex="4" onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                                <asp:Button ID="btn_Delivery_Pop" runat="server" Text="?" class="btn-add" OnClick="btn_Delivery_Pop_Click"/>
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
                                                <asp:Label ID="lblDeliCategory" Text="Category" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="DropDeliCategory" runat="server" CssClass="top-inputReadonly"  Enabled="false"
                                                    Width="200px" MaxLength="100" >
                                                </asp:DropDownList>
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
                                                <asp:Label ID="lblDeliColor" Text="Colour" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="DropDeliColor" runat="server" CssClass="top-inputReadonly"  Enabled="false"
                                                    Width="200px" MaxLength="100" >
                                                </asp:DropDownList>
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
                                                <asp:Label ID="lblDeliorderQty" Text="Order QTY" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtDeliOrderQty" runat="server" CssClass="top-inputReadonly"  Width="100px" MaxLength="5"
                                                     onkeyup="doMath()"  onkeydown="return OnlyNumericvalue(event,this)"
                                                    onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
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
                                            <td class="Trow" style="width: 39%;">
                                                <asp:Label ID="lblDeliDescription" Text="Description" runat="server"></asp:Label>
                                                
                                            </td>
                                            <td valign="top" style="width: 56%;">
                                                <asp:TextBox ID="txtDeliDescription" runat="server" CssClass="top-inputReadonly" Width="200px" MaxLength="500"  ReadOnly="true"
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                     
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div8">
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
                                                <asp:Label ID="lblDeliDesign" Text="Design" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="DropDeliDesign" runat="server" CssClass="top-inputReadonly" Enabled="false"
                                                    Width="200px" MaxLength="100" >
                                                </asp:DropDownList>
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
                                                <asp:Label ID="lblDeliSize" Text="Size" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="DropDeliSize" runat="server" CssClass="top-inputReadonly" Enabled="false"
                                                    Width="200px" MaxLength="100">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div14">
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
                                                <asp:Label ID="lblConsumption" Text="Consumption" runat="server"></asp:Label>
                                                
                                            </td>
                                            <td valign="top" style="width: 56%;">
                                                <asp:TextBox ID="txtcomsumption" runat="server" CssClass="top-input" Width="100px" MaxLength="5" TabIndex="5" 
                                                    onkeyup="doMath()"  onkeydown="return OnlyNumericvalue(event,this)"
                                                    onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                                     
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div12">
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
                                                <asp:Label ID="lblExcess" Text="Excess %" runat="server"></asp:Label>
                                                
                                            </td>
                                            <td valign="top" style="width: 56%;">
                                                <asp:TextBox ID="txtExcess" runat="server" CssClass="top-input" Width="100px" MaxLength="3" 
                                                    onkeyup="doMath()"  onkeydown="return OnlyNumericvalue(event,this)"  TabIndex="6"
                                                    onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                                    <asp:TextBox ID="txtExcessValue" runat="server" CssClass="top-inputReadonly" Width="100px" MaxLength="10" 
                                                    ></asp:TextBox>
                                                     
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div13">
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
                                                <asp:Label ID="lblPcsMtr" Text="Pcs/Mtr" runat="server"></asp:Label>
                                                
                                            </td>
                                            <td valign="top" style="width: 56%;">
                                                <asp:TextBox ID="txtPcs" runat="server" CssClass="top-inputReadonly" Width="100px" MaxLength="5" 
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                     
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div15">
                                                    *
                                                </div>
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
                                    <asp:HiddenField ID="hReceiveUpdateID" runat="server" Value="0" />
                                    <asp:HiddenField ID="hDeliveryUpdateID" runat="server" Value="0" />
                                    <asp:HiddenField ID="hReceiveItemID" runat="server" Value="0" />
                                    <asp:HiddenField ID="hDeliveryItemID" runat="server" Value="0" />
                                    <asp:HiddenField ID="hfldid" runat="server" Value="0" />
                                    <asp:HiddenField ID="Amt" runat="server" Value="0" />
                                    <asp:HiddenField ID="HProductGroupID" runat="server" Value="0" />
                                <asp:HiddenField ID="HUOMID" runat="server" Value="0" />
                                <asp:HiddenField ID="HQualityID" runat="server" Value="0" />
                                <asp:HiddenField ID="HDeliProductGroupID" runat="server" Value="0" />
                                <asp:HiddenField ID="HDeliUOMID" runat="server" Value="0" />
                                <asp:HiddenField ID="HDeliQualityID" runat="server" Value="0" />
                                <asp:HiddenField ID="HTotalQty" runat="server" Value="0" />
                                <asp:HiddenField ID="HTotalPcsMtr" runat="server" Value="0" />
                                <asp:HiddenField ID="HPopName" runat="server" Value="0" />
                                <asp:HiddenField ID="HReceiveQty" runat="server" Value="0" />
                                <asp:HiddenField ID="HReceivedProduct" runat="server" Value="0" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
            <asp:Panel ID="Panel1" ScrollBars="Vertical" runat="server" CssClass="top-input" Height="300px">
                                <asp:Label ID="Label8" runat="server" Text="No Record Found" Visible="false"></asp:Label>
                                <asp:GridView ID="gridDelivery" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="ConsumptionDetailID"
                                    GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" style="overflow:scroll;"
                                   OnRowCommand="gridDelivery_RowCommand"
                                    OnRowDataBound="gridDelivery_RowDataBound" >
                                    <Columns>
                                       
                                         <asp:BoundField DataField="SNo" HeaderText="SNo." ItemStyle-CssClass="WithoutBorderCenter" />
                                        <asp:BoundField DataField="ReceivableProductID" HeaderText="ReceivableProductID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="ReceivableProductCode" HeaderText="Prod.Code" ItemStyle-CssClass="WithoutBorderCenter" />
                                        
                                        <asp:BoundField DataField="ReceivableDescription" HeaderText="Description" Visible="false" ItemStyle-CssClass="WithoutBorderLeft" />
                                       
                                        <asp:BoundField DataField="ReceivableProductGroupID" HeaderText="ReceivableProductGroupID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="ReceivableCategoryID" HeaderText="ReceivableCategoryID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="ReceivableQualityID" HeaderText="ReceivableQualityID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="ReceivableDesignID" HeaderText="ReceivableDesignID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="ReceivableCategoryName" HeaderText="Category" ItemStyle-CssClass="WithoutBorderLeft"
                                             />
                                            <asp:BoundField DataField="ReceivableDesignName" HeaderText="Design" ItemStyle-CssClass="WithoutBorderLeft"
                                             />
                                        <asp:BoundField DataField="ReceivableUOMID" HeaderText="ReceivableUOMID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                       
                                        <asp:BoundField DataField="ReceivableColorID" HeaderText="ReceivableColorID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="ReceivableColorName" HeaderText="Color" ItemStyle-CssClass="WithoutBorderLeft" />
                                        
                                        
                                        <asp:BoundField DataField="ReceivableSizeName" HeaderText="Size" ItemStyle-CssClass="WithoutBorderLeft" />
                                        <asp:BoundField DataField="ReceivableSizeID" HeaderText="ReceivableSizeID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                      
                                        
                                        
                                         <asp:BoundField DataField="ReceivableOrderQty" HeaderText="Order Qty" ItemStyle-CssClass="WithoutBorderCenter" Visible="false" />
                                         <asp:BoundField DataField="DeliverableProductID" HeaderText="DeliverableProductID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="DeliverableProductCode" HeaderText="Prod.Code" FooterText="Total" ItemStyle-CssClass="WithoutBorderCenter" />
                                        
                                        <asp:BoundField DataField="DeliverableDescription" HeaderText="Description" Visible="false" ItemStyle-CssClass="WithoutBorderLeft" />
                                       
                                        <asp:BoundField DataField="DeliverableProductGroupID" HeaderText="DeliverableProductGroupID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="DeliverableCategoryID" HeaderText="DeliverableCategoryID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="DeliverableQualityID" HeaderText="DeliverableQualityID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="DeliverableDesignID" HeaderText="DeliverableDesignID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                            <asp:BoundField DataField="DeliverableCategoryName" HeaderText="Category" ItemStyle-CssClass="WithoutBorderLeft"
                                             />
                                            <asp:BoundField DataField="DeliverableDesignName" HeaderText="Design" ItemStyle-CssClass="WithoutBorderLeft"
                                             />
                                        <asp:BoundField DataField="DeliverableUOMID" HeaderText="DeliverableUOMID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                       
                                        <asp:BoundField DataField="DeliverableColorID" HeaderText="DeliverableColorID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                        <asp:BoundField DataField="DeliverableColorName" HeaderText="Color" ItemStyle-CssClass="WithoutBorderLeft" />
                                        
                                        
                                        <asp:BoundField DataField="DeliverableSizeName" HeaderText="Size" ItemStyle-CssClass="WithoutBorderLeft" />
                                        <asp:BoundField DataField="DeliverableSizeID" HeaderText="DeliverableSizeID" ItemStyle-CssClass="WithoutBorder"
                                            Visible="false" />
                                       
                                        <asp:TemplateField HeaderText="Qty" ItemStyle-CssClass="WithoutBorderCenter">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblTotalQty" Text='<%# Eval("DeliverableOrderQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="lblTotalQty" Text='<%# GetOrderQty() %>'></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                                        <asp:BoundField DataField="Consumption" HeaderText="Consumption" ItemStyle-CssClass="WithoutBorderCenter" />
                                         <asp:BoundField DataField="Excess" HeaderText="Excess %" ItemStyle-CssClass="WithoutBorderCenter" />
                                          <asp:BoundField DataField="ExecssValue" HeaderText="Execss" ItemStyle-CssClass="WithoutBorderCenter" Visible="false" />
                                         <asp:TemplateField HeaderText="Req Pcs/Mtr" ItemStyle-CssClass="WithoutBorderCenter">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblReqMtr" Text='<%# Eval("ReqPcs") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="lblReqMtr" Text='<%# GetReqPcsMtr() %>'></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                                       
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

            if (validate(document.getElementById("<%= txtConsumtionNo.ClientID %>"), 'Consumption No. should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (DropdownValidation(document.getElementById("<%= DropJobNo.ClientID %>"), 'Job No. should not be left empty', 'Common_error', 1) == false) {
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

         function ItemvalidationDelivery() {

             if (validate(document.getElementById("<%= txtProductCode.ClientID %>"), 'Product Code should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;

             }
             if (validate(document.getElementById("<%= txtDescription.ClientID %>"), 'Description should not be left empty', 'Common_error', 1) == false) {
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

             if (DropdownValidation(document.getElementById("<%= DropCategory.ClientID %>"), 'Category should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }
             if (validate(document.getElementById("<%= txtquantity.ClientID %>"), 'QTY  should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;

             }
           


             if (validate(document.getElementById("<%= txtDeliProductCode.ClientID %>"), 'Product Code should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;

             }
             if (validate(document.getElementById("<%= txtDeliDescription.ClientID %>"), 'Description should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;

             }

             if (DropdownValidation(document.getElementById("<%= DropDeliDesign.ClientID %>"), 'Design should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }
             if (DropdownValidation(document.getElementById("<%= DropDeliColor.ClientID %>"), 'Colour should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }
             if (DropdownValidation(document.getElementById("<%= DropDeliSize.ClientID %>"), 'Design should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }

             if (DropdownValidation(document.getElementById("<%= DropDeliCategory.ClientID %>"), 'Category should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }
             if (validate(document.getElementById("<%= txtDeliOrderQty.ClientID %>"), 'QTY  should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;

             }
             if (validate(document.getElementById("<%= txtcomsumption.ClientID %>"), 'Consumption should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;

             }
             if (validate(document.getElementById("<%= txtExcess.ClientID %>"), 'Excess % should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;

             }
             if (validate(document.getElementById("<%= txtPcs.ClientID %>"), 'Req Pcs/Mtr should not be left empty', 'Common_error', 1) == false) {
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
        function doMath() {

            if (isNaN(document.getElementById("txtDeliOrderQty").value) || document.getElementById("txtDeliOrderQty").value == "") {
                var quantity = 0;
            } else {
                var quantity = parseFloat(document.getElementById("txtDeliOrderQty").value);
            }

            if (isNaN(document.getElementById("txtcomsumption").value) || document.getElementById("txtcomsumption").value == "") {
                var Consumption = 0;
            } else {
                var Consumption = parseFloat(document.getElementById("txtcomsumption").value);
            }

            if (isNaN(document.getElementById("txtExcess").value) || document.getElementById("txtExcess").value == "") {
                var Excess = 0;
            } else {
                var Excess = parseFloat(document.getElementById("txtExcess").value);
            }



            var Amount = (Consumption * quantity)

            var ExcessAmount = (Amount * (Excess / 100))
            document.getElementById("txtExcessValue").value =Math.ceil(ExcessAmount* 100)/100;
            document.getElementById("txtPcs").value = Math.ceil((Amount + ExcessAmount)*100)/100;
            var TotalAmount = (Amount + ExcessAmount);
            if (isNaN(TotalAmount) || TotalAmount == "") {
                TotalAmount = 0;
            }

            document.getElementById("txtAmount").value = FormatToMoney((TotalAmount), "", ",", ".");
            document.getElementById("Amt").value = FormatToMoney((TotalAmount), "", ",", ".");


            function isThousands(position) {
                if (Math.floor(position / 3) * 3 == position) return true;
                return false;
            };

            function FormatToMoney(theNumber, theCurrency, theThousands, theDecimal) {
                var theDecimalDigits = Math.round((theNumber * 100) - (Math.floor(theNumber) * 100));
                theDecimalDigits = "" + (theDecimalDigits + "0").substring(0, 2);
                theNumber = "" + Math.floor(theNumber);
                var theOutput = theCurrency;
                for (x = 0; x < theNumber.length; x++) {
                    theOutput += theNumber.substring(x, x + 1);
                    if (isThousands(theNumber.length - x - 1) && (theNumber.length - x - 1 != 0)) {
                        theOutput += theThousands;
                    };
                };
                theOutput += theDecimal + theDecimalDigits;
                return theOutput;
            }









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
