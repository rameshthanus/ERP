<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GDN.aspx.cs" Inherits="Trident.Transaction.GDN" %>

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
        #SearchResultPopupterm
        {
            background: #fff;
            border: 1px solid #73b011;
            height: 300px;
            width: 300px;
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
                                                placeholder="Product Code" onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            <asp:Button ID="btnSearchPOP" runat="server" ToolTip="Load" Text="..." OnClick="btnSearchPOP_Click" 
                                                Style="display: none;" />
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
                                     <asp:TemplateField HeaderText="Stock" ItemStyle-CssClass="WithoutBorderCenter">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Qty").ToString() %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Combined Product" ItemStyle-CssClass="WithoutBorderCenter">
                                        <ItemTemplate>
                                            <asp:Image ID="imgStatus" runat="server" CssClass="label" ImageUrl='<%# GetImage((string)Eval("CombinedProduct")) %>' />
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
    
    <ajaxToolkit:ModalPopupExtender ID="termpopup" runat="server" PopupControlID="SearchResultPopupterm"
        X="300" Y="100"   TargetControlID="imgButterm" BackgroundCssClass="modalbackground"
        DropShadow="false" BehaviorID="modalterm">
    </ajaxToolkit:ModalPopupExtender>
    <a href="#" runat="server" id="imgButterm" style="position: absolute; top: 0px; left: 0px;">
        <img src="../Images/px1.gif" alt="Popup" /></a>
    <div id="SearchResultPopupterm" title="Product List">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="box light collapsible size1of1">
                    <div class="head box-gradient-4">
                       <%-- <img src="../Images/x.png" alt='x' id="imgterm" onclick="Hideterm()" />--%>
                        <a href="#" class="text">
                            <h3 class="h4 strong">
                                Delivery Type</h3>
                        </a>
                    </div>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="height: 10px;">
                            </td>
                        </tr>
                        <tr>
                        <td style="width:30%;"></td>
                            <td valign="top">
                                <asp:Button ID="btn_Supplier" runat="server" ToolTip="Supplier" Text="Supplier" class="button-1 unit-left"
                                    TabIndex="22" OnClick="btn_Supplier_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 10px;">
                            </td>
                        </tr>
                        <tr>
                        <td style="width:30%;"></td>
                            <td valign="top">
                                <asp:Button ID="btn_Processor" runat="server" ToolTip="Processor" Text="Processor" class="button-1 unit-left"
                                    TabIndex="22" OnClick="btn_Processor_Click" />
                            </td>
                        </tr>
                         <tr>
                            <td colspan="2" style="height: 10px;">
                            </td>
                        </tr>
                        <tr>
                        <td style="width:30%;"></td>
                            <td valign="top">
                                <asp:Button ID="btn_DepartmentTransfer" runat="server" ToolTip="Transfer" Text="Transfer" class="button-1 unit-left"
                                    TabIndex="22" OnClick="btn_DepartmentTransfer_Click" />
                            </td>
                        </tr>
                         <tr>
                            <td colspan="2" style="height: 10px;">
                            </td>
                        </tr>
                        <tr>
                        <td style="width:30%;"></td>
                            <td valign="top">
                                <asp:Button ID="btn_General" runat="server" ToolTip="General" Text="General" class="button-1 unit-left"
                                    TabIndex="22" OnClick="btn_General_Click" />
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
                        <asp:Button ID="Save" runat="server" ToolTip="Save" Text="Save - (F7)" CssClass="butt_Save"
                            TabIndex="13" OnClientClick="return validation();" OnClick="Save_Click" />
                        <asp:Button ID="Search" runat="server" ToolTip="Search" Text="Search - (F8)" CssClass="butt_Save"
                            TabIndex="14" OnClick="Search_Click" />
                        <asp:Button ID="Clear" AccessKey="C" runat="server" ToolTip="Clear" Text="Clear-(Alt+Shift+C)"
                            TabIndex="15" CssClass="butt_Save" OnClick="Clear_Click" />
                        <asp:Button ID="Exit" runat="server" ToolTip="Exit" Text="Exit - (F9)" CssClass="butt_Save"
                            TabIndex="16" OnClick="Exit_Click" />
                            <asp:Button ID="btn_Print" runat="server" ToolTip="Print" Text="Print" CssClass="butt_Save"
                            TabIndex="17" OnClick="btn_Print_Click" />
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
                            Delivery</h3>
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
                                                        <asp:Label ID="lblGDNNo" Text="Delivery No" runat="server"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                        <asp:TextBox ID="txtGDNNo" runat="server" CssClass="top-inputReadonly" Width="100px"
                                                            MaxLength="20" ReadOnly="true" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
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
                                                        <asp:Label ID="lblParty1" Text="Supplier" runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="lblParty" Text="Party" runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="lblParty2" Text="Processor" runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="lblWareouse" Text="Despatched To(To)" runat="server" Visible="false"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                        <ajaxToolkit:ListSearchExtender ID="ListSearchCustomer" runat="server" TargetControlID="DropParty"
                                                            PromptCssClass="Search">
                                                        </ajaxToolkit:ListSearchExtender>
                                                        <ajaxToolkit:ListSearchExtender ID="ListSearchExtender2" runat="server" TargetControlID="DropWareHouse"
                                                            PromptCssClass="Search">
                                                        </ajaxToolkit:ListSearchExtender>
                                                        <asp:DropDownList ID="DropParty" runat="server" CssClass="top-input" 
                                                            TabIndex="2" Visible="false"
                                                            Width="220px" MaxLength="100" AutoPostBack="true" 
                                                            onselectedindexchanged="DropParty_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:DropDownList ID="DropWareHouse" runat="server" CssClass="top-input" TabIndex="2"
                                                            Visible="false" Width="220px" MaxLength="100" AutoPostBack="true" 
                                                            onselectedindexchanged="DropWareHouse_SelectedIndexChanged"  >
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="Div7">
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
                                                        <asp:Label ID="lblGDNDate" Text="Date" runat="server"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" CssClass="cal_Theme1"
                                                            Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtGDNdate" PopupPosition="BottomRight">
                                                        </ajaxToolkit:CalendarExtender>
                                                        <asp:TextBox ID="txtGDNdate" runat="server" CssClass="top-input" Width="125px" MaxLength="40"
                                                            TabIndex="4" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
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
                                                        <ajaxToolkit:ListSearchExtender ID="ListSearchExtender1" runat="server" TargetControlID="DropJobNo"
                                                            PromptCssClass="Search">
                                                        </ajaxToolkit:ListSearchExtender>
                                                        <asp:DropDownList ID="DropJobNo" runat="server" CssClass="top-input" TabIndex="1"
                                                            Width="200px" MaxLength="100" AutoPostBack="true" onselectedindexchanged="DropJobNo_SelectedIndexChanged">
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
                                                        <asp:Label ID="lblFromWareHouse" Text="Despatch Warehouse (From)" runat="server"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender ID="ListSearchExtender3" runat="server" TargetControlID="DropFromWarehouse"
                                                            PromptCssClass="Search">
                                                        </ajaxToolkit:ListSearchExtender>
                                                        <asp:DropDownList ID="DropFromWarehouse" runat="server" CssClass="top-input" Width="200px" TabIndex="3"
                                                            MaxLength="100"
                                                            AutoPostBack="true"
                                                            onselectedindexchanged="DropFromWarehouse_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
                                                        <div id="Div4">
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
                                                        <asp:Label ID="lblNo" Text="Wo.No." runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="lblNo1" Text="Po.No." runat="server"  Visible="false"></asp:Label>
                                                    </td>
                                                    <td valign="top" style="width: 56%">
                                                    <ajaxToolkit:ListSearchExtender ID="ListSearchExtender4" runat="server" TargetControlID="DropOrder"
                                                            PromptCssClass="Search">
                                                        </ajaxToolkit:ListSearchExtender>
                                                        <asp:DropDownList ID="DropOrder" runat="server" CssClass="top-input" TabIndex="5" 
                                                            Width="200px"  Visible="false" AutoPostBack="true"
                                                            MaxLength="100" onselectedindexchanged="DropOrder_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                       
                                                    </td>
                                                    <td class="Trow_Validator" style="width: 5%">
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
                            Delivery Detail</h3>
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
                                                <asp:TextBox ID="txtProductCode" runat="server" CssClass="top-input" Width="150px"
                                                    MaxLength="20" TabIndex="6" onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                                <asp:Button ID="Button1" runat="server" Text="?" class="btn-add" OnClientClick="return ItemvalidationPOP();" OnClick="Button1_Click" />
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
                                                <asp:DropDownList ID="DropCategory" runat="server" CssClass="top-inputReadonly" Enabled="false"
                                                    Width="200px" MaxLength="100">
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
                                                <asp:Label ID="lblcolour" Text="Colour" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:DropDownList ID="Dropcolour" runat="server" CssClass="top-inputReadonly" Enabled="false"
                                                    Width="200px" MaxLength="100">
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
                                                <asp:DropDownList ID="DropUOM" runat="server" CssClass="top-inputReadonly" Enabled="false"
                                                    Width="200px" MaxLength="100">
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
                                                <asp:Label ID="lblWeight" Text="Weight" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtWeight" runat="server" CssClass="top-input" Width="150px" MaxLength="5"
                                                    TabIndex="8" onkeyup="doMath()" onkeydown="return OnlyNumericvalue(event,this)"
                                                    onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <%--<div id="Div8">
                                                    *
                                                </div>--%>
                                            </td>
                                        </tr>
                                          
                                        <tr>
                                            <td style="height: 5px;">
                                            </td>
                                        </tr>
                                         <tr>
                                            <td class="Trow" style="width: 39%">
                                                <asp:Label ID="lblAmount" Text="Amount" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtAmount" runat="server" CssClass="top-inputReadonly" Width="150px"
                                                    ReadOnly="true" MaxLength="20" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <div id="Div3">
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
                                                <asp:Label ID="lblDescription" Text="Description"  runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%;">
                                                <asp:TextBox ID="txtDescription" runat="server"  CssClass="top-input"
                                                    Width="220px" MaxLength="500"  TextMode="MultiLine" Height="60px"   ></asp:TextBox>
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
                                                    Width="200px" MaxLength="100">
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
                                                <asp:TextBox ID="txtquantity" runat="server" CssClass="top-input" Width="150px" MaxLength="7"
                                                    TabIndex="7" onkeyup="doMath()" onkeydown="return OnlyNumericvalue(event,this)"
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
                                                <asp:Label ID="lblRate" Text="Rate" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtRate" runat="server" CssClass="top-input" Width="150px" MaxLength="6"
                                                    TabIndex="9" onkeydown="return OnlyNumericvalue(event,this)" onkeyup="doMath()"
                                                    onkeypress="return handleEnter(this,onkeypress)"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                                <%--<div id="Div1">
                                                    *
                                                </div>--%>
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
                                <asp:HiddenField ID="HGDNTYPE" runat="server" Value="0" />
                                <asp:HiddenField ID="HAvilableQty" runat="server" Value="0" />
                                <asp:HiddenField ID="HTOBranchID" runat="server" Value="0" />
                                    <asp:HiddenField ID="hUpdateID" runat="server" Value="0" />
                                    <asp:HiddenField ID="hItemID" runat="server" Value="0" />
                                    <asp:HiddenField ID="hfldid" runat="server" Value="0" />
                                    <asp:HiddenField ID="Amt" runat="server" Value="0" />
                                    <asp:HiddenField ID="HProductGroupID" runat="server" Value="0" />
                                    <asp:HiddenField ID="HQualityID" runat="server" Value="0" />
                                    <asp:HiddenField ID="HTotalQty" runat="server" Value="0" />
                                    <asp:HiddenField ID="HTotalAmount" runat="server" Value="0" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <%--<div style="padding-left: 20px; padding-right: 20px;">
                        <div class="Table_Request" style="padding-left: 20px; padding-right: 20px;">
                            <div class="TRow1">--%>
                    <asp:Panel ID="Panel" ScrollBars="Vertical" runat="server" CssClass="top-input" Height="300px">
                        <asp:Label ID="lblmsg" runat="server" Text="No Record Found" Visible="false"></asp:Label>
                        <asp:GridView ID="gridGDN" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                            DataKeyNames="GDNDetailID" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" Style="overflow: scroll;" OnRowCommand="gridGDN_RowCommand"
                            OnRowDataBound="gridGDN_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="SNo" HeaderText="SNo." ItemStyle-CssClass="WithoutBorderCenter" />
                                <asp:BoundField DataField="ProductID" HeaderText="ProductID" ItemStyle-CssClass="WithoutBorder"
                                    Visible="false" />
                                <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" FooterText="Total"
                                    ItemStyle-CssClass="WithoutBorderCenter" />
                                <asp:BoundField DataField="Description" HeaderText="Description"
                                    ItemStyle-CssClass="WithoutBorderLeft" />
                               
                                <asp:BoundField DataField="ProductGroupID" HeaderText="ProductGroupID" ItemStyle-CssClass="WithoutBorder"
                                    Visible="false" />
                                <asp:BoundField DataField="CategoryName" HeaderText="Category" ItemStyle-CssClass="WithoutBorderLeft"
                                    />
                                     <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" ItemStyle-CssClass="WithoutBorderLeft" Visible="false" />
                                <asp:BoundField DataField="QualityID" HeaderText="QualityID" ItemStyle-CssClass="WithoutBorder"
                                    Visible="false" />
                                <asp:BoundField DataField="DesignID" HeaderText="DesignID" ItemStyle-CssClass="WithoutBorder"
                                    Visible="false" />
                                <asp:BoundField DataField="DesignName" HeaderText="Design" ItemStyle-CssClass="WithoutBorderLeft" />
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
                                <asp:BoundField DataField="Weight" HeaderText="Weight" ItemStyle-CssClass="WithoutBorderCenter" />
                                
                                <asp:TemplateField HeaderText="Qty" ItemStyle-CssClass="WithoutBorderCenter">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalQty" Text='<%# Eval("Qty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lblTotalQty" Text='<%# GetTotalQty() %>'></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Rate" HeaderText="Rate" ItemStyle-CssClass="WithoutBorderRigt" />
                                <asp:TemplateField HeaderText="Amount" ItemStyle-CssClass="WithoutBorderRigt">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblAmount" Text='<%# Eval("Amount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lblAmount" Text='<%# GetTotalAmount() %>'></asp:Label>
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
                            <FooterStyle Font-Bold="True" Font-Size="12pt" HorizontalAlign="Right" VerticalAlign="Middle"
                                ForeColor="#507CD1" />
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
                                                <asp:Label ID="lblThrough" Text="Through" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top" style="width: 56%">
                                                <asp:TextBox ID="txtThrough" runat="server" CssClass="top-input" Width="200px" MaxLength="300" TabIndex="11"
                                                    onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            </td>
                                            <td class="Trow_Validator" style="width: 5%">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td valign="top" style="width: 50%">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="height: 5px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="50%" border="0" cellspacing="0" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top" style="width: 2%">
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                </table>
                                                            </td>
                                                            <td valign="top" style="width: 98%">
                                                                <table id="tblCancel" runat="server" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td class="style1">
                                                                        </td>
                                                                        <td>
                                                                            <span style="font-size: 12px; font-family: Verdana">Left:</span>
                                                                            <asp:Label ID="lblChar2" runat="server" CssClass="lblstyle" Text="1000"></asp:Label>
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
                                                                            <asp:Label ID="lblRemarks" Text="Remarks" runat="server" Style="padding-right: 130px;"></asp:Label>
                                                                        </td>
                                                                        <td valign="top" style="padding-right: 100%; width: 20%;">
                                                                            <asp:TextBox ID="txtRemarks" runat="server" Height="80px" MaxLength="1000" TabIndex="12"
                                                                                onkeyup="Javascript:CharactersCountProductPreticulars();" Style="overflow: scroll;"
                                                                                TextMode="MultiLine" Width="200px"></asp:TextBox>
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
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 10px">
                                </td>
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

            var Type = (document.getElementById("HGDNTYPE").value);
            if (validate(document.getElementById("<%= txtGDNNo.ClientID %>"), 'D.C No. should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;

            }
            if (DropdownValidation(document.getElementById("<%= DropJobNo.ClientID %>"), 'Job No. should not be left empty', 'Common_error', 1) == false) {
                document.getElementById("Common_error").className = "error-box";
                return false;
            }
            if (Type=='S')
            {
                if (DropdownValidation(document.getElementById("<%= DropParty.ClientID %>"), 'Supplier should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }

                if (DropdownValidation(document.getElementById("<%= DropFromWarehouse.ClientID %>"), 'From Warehouse should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }

                if (DropdownValidation(document.getElementById("<%= DropOrder.ClientID %>"), 'PO.No. should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }
            
            }
           else if (Type == 'P') {
                if (DropdownValidation(document.getElementById("<%= DropParty.ClientID %>"), 'Processor should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }

                if (DropdownValidation(document.getElementById("<%= DropFromWarehouse.ClientID %>"), 'From Warehouse should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }

                if (DropdownValidation(document.getElementById("<%= DropOrder.ClientID %>"), 'WO.No. should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }
            
            }
            else if (Type == 'D') {
                if (DropdownValidation(document.getElementById("<%= DropWareHouse.ClientID %>"), 'To Warehouse should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }

                if (DropdownValidation(document.getElementById("<%= DropFromWarehouse.ClientID %>"), 'From Warehouse should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }
            }

            else if (Type == 'G') {
                if (DropdownValidation(document.getElementById("<%= DropParty.ClientID %>"), 'Party should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }

                if (DropdownValidation(document.getElementById("<%= DropFromWarehouse.ClientID %>"), 'From Warehouse should not be left empty', 'Common_error', 1) == false) {
                    document.getElementById("Common_error").className = "error-box";
                    return false;
                }
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
            if (validate(document.getElementById("<%= txtDescription.ClientID %>"), 'Description Code should not be left empty', 'Common_error', 1) == false) {
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


//            if (validate(document.getElementById("<%= txtWeight.ClientID %>"), 'Weight should not be left empty', 'Common_error', 1) == false) {
//                document.getElementById("Common_error").className = "error-box";
//                return false;

//            }
            if (validate(document.getElementById("<%= txtquantity.ClientID %>"), 'QTY  should not be left empty', 'Common_error', 1) == false) {
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

         function ItemvalidationPOP() {

             if (DropdownValidation(document.getElementById("<%= DropJobNo.ClientID %>"), 'Job No. should not be left empty', 'Common_error', 1) == false) {
                 document.getElementById("Common_error").className = "error-box";
                 return false;
             }
             if (DropdownValidation(document.getElementById("<%= DropFromWarehouse.ClientID %>"), 'Despatch Warehouse should not be left empty', 'Common_error', 1) == false) {
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
            var CharLength = '<%=txtRemarks.MaxLength %>';
            var txtMsg = document.getElementById('txtRemarks');
            var lblCount = document.getElementById('lblChar2');
            var colorwidth = txtMsg.value.length;
            var divcolor = document.getElementById('Colordiv2');
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
    function doMath() {

        if (isNaN(document.getElementById("txtquantity").value) || document.getElementById("txtquantity").value == "") {
            var quantity = 0;
        } else {
            var quantity = parseFloat(document.getElementById("txtquantity").value);
        }


        if (isNaN(document.getElementById("txtRate").value) || document.getElementById("txtRate").value == "") {
            var price = 0;
        } else {
            var price = parseFloat(document.getElementById("txtRate").value);
        }

        if (isNaN(document.getElementById("HAvilableQty").value) || document.getElementById("HAvilableQty").value == "") {
            var AvailableQty = 0;
        } else {
            var AvailableQty = parseFloat(document.getElementById("HAvilableQty").value);
        }



        var GRNtype = document.getElementById("HGDNTYPE").value;

        if ((GRNtype == "S") || (GRNtype == "P") || (GRNtype == "G") || (GRNtype == "D")) {

            if ((GRNtype == "S") && (parseFloat(AvailableQty) < parseFloat(quantity))) {
                quantity = 0;
                alert("Avilable Stock only : '" + AvailableQty + "' , Quantity value do not exceed the Stock.");
                document.getElementById("txtAmount").value = 0;
                document.getElementById("txtquantity").value = 0;

                document.getElementById("Amt").value = 0;

            }
            else {
               
                    document.getElementById("txtAmount").value = FormatToMoney((quantity * price), "", ",", ".");
                    document.getElementById("Amt").value = FormatToMoney((quantity * price), "", ",", ".");
                
            }

            if ((GRNtype == "P") && (parseFloat(AvailableQty) < parseFloat(quantity))) {
                quantity = 0;
                alert("Avilable Stock only : '" + AvailableQty + "' , Quantity value do not exceed the Stock.");

                document.getElementById("txtquantity").value = 0;
                document.getElementById("txtAmount").value = 0;
                document.getElementById("Amt").value = 0;

            }
            else {

                document.getElementById("txtAmount").value = FormatToMoney((quantity * price), "", ",", ".");
                document.getElementById("Amt").value = FormatToMoney((quantity * price), "", ",", ".");
            }

            if ((GRNtype == "G") && (parseFloat(AvailableQty) < parseFloat(quantity))) {
                quantity = 0;
                alert("Avilable Stock only : '" + AvailableQty + "' , Quantity value do not exceed the Stock.");
                document.getElementById("txtAmount").value = 0;
                document.getElementById("txtquantity").value = 0;
           
                document.getElementById("Amt").value = 0;

            }
            else {

                document.getElementById("txtAmount").value = FormatToMoney((quantity * price), "", ",", ".");
                document.getElementById("Amt").value = FormatToMoney((quantity * price), "", ",", ".");
            }

            if ((GRNtype == "D") && (parseFloat(AvailableQty) < parseFloat(quantity))) {
                quantity = 0;
                alert("Avilable Stock only : '" + AvailableQty + "' , Quantity value do not exceed the Stock.");
                document.getElementById("txtAmount").value = 0;
                document.getElementById("txtquantity").value = 0;

                document.getElementById("Amt").value = 0;

            }
            else {

                document.getElementById("txtAmount").value = FormatToMoney((quantity * price), "", ",", ".");
                document.getElementById("Amt").value = FormatToMoney((quantity * price), "", ",", ".");
            }


        }





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
