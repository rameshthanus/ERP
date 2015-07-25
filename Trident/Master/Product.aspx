<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Trident.Master.Product1" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Product</title>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <style type="text/css">
        .cls_bdy_tp table ul {
            list-style: outside none none;
            float: right;
            margin: 0px;
        }

        .cls_bdy_tp table {
            width: 100%;
        }
        #tbl_design{background-color:white;}
        .cls_bdy_tp ul li {
            float: left;
            padding: 3px 10px;
            cursor: pointer;
            border-right: 1px solid #BCBCBC;
        }

            .cls_bdy_tp ul li:last-child {
                border-right: none;
            }

            .cls_bdy_tp ul li:hover {
                color: green;
            }

        .cls_bdy_tp {
            padding: 5px 0;
        }

        .cls_bdy_btm h5 {
            margin: 0;
            padding: 10px 30px;
            border: 1px solid #CCC;
            background-image: linear-gradient(#F6F6F6, #ECECEE);
            font-weight: bold;
        }

        #tbl_design {
            width: 100%;
            border: 1px solid #CCC;
            border-top: none;
        }

            #tbl_design tr td {
                padding: 7px 5px;
            }

                #tbl_design tr td:first-child {
                    padding-left: 30px;width:18%;
                }

        .invalid {
            border: 1px solid red;
        }

        .valid {
            border: 1px solid green !important;
        }

        .cls_bdy_btm h5 {
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
        html,body{
            background-color:#F1F3FA;
        }
        @media screen and (max-width:500px){
              #tbl_design tr td:first-child {
                    padding-left: 15px;
                    width:30%;
                }
            .cls_bdy_btm h5 {
            padding: 5px 15px;
            }
        }
    </style>
    <%--<script src="../JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../JavaScript/comman_Validation.js" type="text/javascript"></script>--%>
     <script src="../JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../JavaScript/Master.js"></script>
    <script type="text/javascript">
        function get_CompanyID() {
            <% if (Session["CompanyID"] != null)
               { %>
            return '<%= Session["CompanyID"] %>';
            
            <% } %>
            return 0;
        }
        function get_UserID() {
            <% if (Session["UserID"] != null)
               { %>
            return '<%= Session["UserID"] %>';
            
            <% } %>
            return 0;
        }
        function get_ProductID() {
            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }
        var req = 0, res = 0, flag = 0;
        var obj = {
            arg: function (scrn_name, imode, hmode) {
                Args = {
                    ProductID: get_ProductID(),
                    ProductCode: ($('#txt_code').val() == null ? '0' : $('#txt_code').val()),
                    Description: $('#txtarea_customerAdd').val(),
                    ProductGroupID: ($('#fv_ddl_ProductGroup').val() == null ? '0' : $('#fv_ddl_ProductGroup').val()),
                    CategoryID: ($('#fv_ddl_Category').val() == null ? '0' : $('#fv_ddl_Category').val()),
                    UOMID: ($('#fv_ddl_UOM').val() == null ? '0' : $('#fv_ddl_UOM').val()),
                    BuyPrice: ($('#fv_txt_buyprice').val() == "" ? 0 : $('#fv_txt_buyprice').val()),
                    SalePrice: ($('#fv_txt_SalePrice').val() == "" ? 0 : $('#fv_txt_SalePrice').val()),
                    ProductStatus: $("input[name=rad_status]:checked").val(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj.cur_date(),
                    iMode: imode,
                    ScreenName: scrn_name,
                    CompanyID: get_CompanyID(),
                    handler_mode: hmode,
                    InventoryType: $("input[name=rad_type]:checked").val(),
                    ARNO: ($('#fv_txt_ArNo').val() == null ? '' : $('#fv_txt_ArNo').val()),
                    APNo: ($('#fv_txt_ApNo').val() == null ? '': $('#fv_txt_ApNo').val())
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            get_drpdowns: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/Product_Handler.ashx",
                    data: this.arg(scname, imode, hmode),
                    cache: false,
                    async: false,
                    success: function (data) {
                        drpdowns = data;
                        $('#fv_ddl_ProductGroup,#fv_ddl_Category').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].ProductGroupID != null) {
                                        $('#fv_ddl_ProductGroup').append($('<option></option>').val(data[i].ProductGroupID).html(data[i].ProductGroupName));
                                    }
                                    else if (data[i].CategoryID != null)
                                    {
                                        $('#fv_ddl_Category').append($('<option></option>').val(data[i].CategoryID).html(data[i].CategoryName));
                                    }
                                    else if (data[i].UOMID != null)
                                    {
                                        $('#fv_ddl_UOM').append($('<option></option>').val(data[i].UOMID).html(data[i].UOMName));
                                    }
                                }

                            }
                        }
                    }
                });
            },
            autocode: function (hndler, scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/" + hndler + ".ashx",
                    data: this.arg(scname, imode, hmode),
                    cache: false,
                    success: function (data) {
                        res++;
                        if (data != null) {
                            if (data.length > 0) {
                                if (sessionStorage.getItem('form_action') == "get_autocode") {
                                    $.each(data[0], function (key, value) {
                                        $('#txt_code').val(value);
                                    });
                                    obj.clear();
                                    sessionStorage.setItem('form_action', 'Insert_start');
                                }
                                else {
                                    if (sessionStorage.getItem('form_action') == "new_autocode") {
                                        $.each(data[0], function (key, value) {
                                            $('#txt_code').val(value);
                                        });
                                        sessionStorage.setItem('form_action', 'Insert_start');
                                    } else {
                                        if (sessionStorage.getItem('form_action') == "fetch_Product") {
                                            $('#txt_code').val(data[0].ProductCode);
                                            $('#txtarea_customerAdd').val(data[0].Description).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_buyprice').val(data[0].BuyPrice).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_SalePrice').val(data[0].SalePrice).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_ApNo').val(data[0].apno).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_ArNo').val(data[0].arno).removeClass('invalid').addClass('valid');
                                          //  $('#fv_txt_Address3').val(data[0].Address3).removeClass('invalid').addClass('valid');
                                           //$('#fv_txt_City').val(data[0].City).removeClass('invalid').addClass('valid');
                                            //$('#fv_txt_State').val(data[0].State).removeClass('invalid').addClass('valid');
                                            $('#fv_ddl_ProductGroup option[value=' + data[0].ProductGroupID + ']').attr('selected', 'selected');
                                            $('#fv_ddl_ProductGroup').removeClass('invalid').addClass('valid');
                                            $('#fv_ddl_Category option[value=' + data[0].CategoryID + ']').attr('selected', 'selected');
                                            $('#fv_ddl_Category').removeClass('invalid').addClass('valid');
                                            $('#fv_ddl_UOM option[value=' + data[0].UOMID + ']').attr('selected', 'selected');
                                            $('#fv_ddl_UOM').removeClass('invalid').addClass('valid');
                                         //   $('#fv_txt_PostalCode').val(data[0].PostalCode).removeClass('invalid').addClass('valid');
                                           // $('#fv_txt_PhoneNumber').val(data[0].PhoneNumber).removeClass('invalid').addClass('valid');
                                            //$('#fv_txt_Email').val(data[0].Email).removeClass('invalid').addClass('valid');
                                            //$('#fv_txt_ContactPerson').val(data[0].ContactPerson).removeClass('invalid').addClass('valid');
                                            $("input[name=rad_status][value=" + data[0].ProductStatus + "]").prop('checked', true);
                                            $("input[name=rad_type][value=" + data[0].InventoryType + "]").prop('checked', true);
                                        } else {
                                            if (sessionStorage.getItem('form_action') == "update_Product") {
                                                if (data[0].Product_count != undefined) {
                                                    //alert('Item already exist');

                                                    $('#basic1').append(callalert('alert', 'Item already exist', '1'));
                                                    $('#basic1').modal('show');
                                                } else {
                                                    //alert('updated successfully');

                                                    $('#basic1').append(callalert('alert', 'updated successfully', '1'));
                                                    $('#basic1').modal('show');
                                                    obj.clear();
                                                }
                                            }
                                            else {
                                                if (flag == 0) {
                                                    req = 1; res = 0, flag = -1;
                                                    if (data[0].color_count != undefined) {
                                                        //alert('Item already exist');

                                                        $('#basic1').append(callalert('alert', 'Item already exist', '1'));
                                                        $('#basic1').modal('show');
                                                    } else {
                                                        obj.autocode('Product_Handler', 'Product', 'Insert', 'update_autocode');
                                                    }
                                                }
                                                else {
                                                    if (flag == -1) {
                                                        // alert('saved successfully');

                                                        $('#basic1').append(callalert('alert', 'Saved Successfully', '1'));
                                                        $('#basic1').modal('show');
                                                        req++;
                                                        sessionStorage.setItem('form_action', 'get_autocode');
                                                        obj.autocode('Product_Handler', 'Product', 'AutoCode', 'get_autocode');
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                });
            },
            save: function () {
                var form_data = $("#" + "<%=frm_Product.ClientID%>").serializeArray();
                var error_free = true;
                for (var input in form_data) {
                    if (form_data[input]['name'].indexOf('v_') == 0) {
                        var element = $("#f" + form_data[input]['name']);
                        var valid;
                        valid = element.hasClass("valid");
                        var error_element = $("span", element.parent());
                        if (!valid) {
                            error_element.removeClass("valid").addClass("invalid");
                            element.css('border', '1px solid red');
                            error_free = false;
                        }
                        else {
                            error_element.removeClass("invalid").addClass("valid");
                        }
                    }
                }
                if (!error_free) {
                    //alert('Please fill red bordered items.')

                    $('#basic1').append(callalert('alert', 'Please fill red bordered items.', '1'));
                    $('#basic1').modal('show');
                }
                else {
                    if (sessionStorage.getItem('form_action') == "Insert_start") {
                        req += 1, flag = 0;
                        obj.autocode('Product_Handler', 'Product', 'Insert', 'save_Product');
                    }
                    else {
                        sessionStorage.setItem('form_action', 'update_Product');
                        obj.autocode('Product_Handler', 'Product', 'Update', 'update_Product');
                    }
                }
            },
            searchlist: function () {
                window.location.href = '../SearchList.aspx?pg=PRODUCT';
            },
            clear: function () {
               // $('#fv_txt_Product').val('').removeClass('valid').addClass('invalid');
               // $('#fv_txt_Product').val('').removeClass('invalid').addClass('valid');
                $('#txtarea_customerAdd').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_buyprice').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_SalePrice').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_ApNo').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_ArNo').val('').removeClass('valid').addClass('invalid');
                $('#fv_ddl_ProductGroup option[value=0]').attr('selected', 'selected');
                $('#fv_ddl_ProductGroup').removeClass('valid').addClass('invalid');
                $('#fv_ddl_Category option[value=0]').attr('selected', 'selected');
                $('#fv_ddl_Category').removeClass('valid').addClass('invalid');
                $('#fv_ddl_UOM option[value=0]').attr('selected', 'selected');
                $('#fv_ddl_UOM').removeClass('valid').addClass('invalid');
              //  $('#fv_txt_PostalCode').val('').removeClass('invalid').addClass('valid');
              //  $('#fv_txt_PhoneNumber').val('').removeClass('invalid').addClass('valid');
              //  $('#fv_txt_Email').val('').removeClass('invalid').addClass('valid');
             //   $('#fv_txt_ContactPerson').val('').removeClass('invalid').addClass('valid');
                $("input[name=rad_status][value=A]").prop('checked', true);
                $("input[name=rad_type][value=Y]").prop('checked', true);
                if (sessionStorage.getItem('form_action') != "get_autocode") {
                    sessionStorage.setItem('form_action', 'new_autocode');
                    obj.autocode('Product_Handler', 'Product', 'AutoCode', 'get_autocode');
                }
            }
        }
        $(document).ready(function () {
            req++;
            obj.get_drpdowns('Product', 'ComboBind', 'get_dropdown');
            if (get_ProductID() == 0) {
                sessionStorage.setItem('form_action', 'get_autocode');
                obj.autocode('Product_Handler', 'Product', 'AutoCode', 'get_autocode');
            } else {
                sessionStorage.setItem('form_action', 'fetch_Product');
                obj.autocode('Product_Handler', 'Product', 'Fetch', 'fetch_Product');
            }
            $(document).on('change', 'input,select', function () {
                if ($(this).val() == '') {
                    $(this).removeClass("valid").addClass("invalid");
                    $(this).css('border', '1px solid red');
                }
                else {
                    if ($(this).val() != '0') {
                        $(this).removeClass("invalid").addClass("valid");
                    }
                    else {
                        $(this).removeClass("valid").addClass("invalid");
                        $(this).css('border', '1px solid red');
                    }
                }
            });
            $(document).keydown(function (e) {
                executeCode(e)
            });
        });
        function executeCode(evt) {
            if (evt == null) {
                evt = window.event;
            }
            var theKey = parseInt(evt.keyCode, 10);
            switch (theKey) {
                case 118:  // F7
                    obj.save();
                    break;
                case 119:  // F8
                    obj.searchlist();
                    break;
                case 120:  // F9
                    window.location.href = '../HomeHeader.aspx';
                    break;
            }
            evt.returnValue = false;
            return false;
        }
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
    </script>
   
    
</head>
<body onload="resizeIframe();">
    <form id="frm_Product" runat="server">
         <div id="full_bdy">
        <div class="portlet box blue-hoki">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>Product
            </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                    class="config"></a><a href="javascript:;" class="reload"></a>
            </div>
        </div>
        <div class="portlet-body form">
            <form action="#" class="form-horizontal">
            <div class="form-actions top">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <div id="Div1" class="cls_bdy_tp">
                            <table>
                                <tr>
                                    <td>
                                        <ul id="ul1">
                                            <li>
                                                <input id="btn_save" class="cls_disabled btn green" type="button" value="Save -(F7)"
                                                    onclick="obj.save();" /></li>
                                            <li class="cls_disabled">
                                                <input class="cls_disabled btn green" type="button" value="Search -(F8)" onclick="obj.searchlist();" />
                                            </li>
                                            <li class="cls_disabled">
                                                <input type="button" class="cls_disabled btn green" value="Clear -(Alt+Shift+C)"
                                                    onclick="obj.clear();" /></li>
                                            <li class="cls_disabled">
                                                <input type="button" class="cls_disabled btn green" value="Exit -(F9)" /></li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-body">
                <div class="form-group">
                <table style="width:100%">
                <tr>
                <td style="width:100%">
                <label class="col-md-3 control-label">
                        Code</label>
                    <div class="col-md-4">
                    <input type="text" id="txt_code" disabled="disabled" name="txt_code" class="form-control" />
                       
                        
                    </div>
                    </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Description<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <textarea class="form-control" id="txtarea_customerAdd" cols="30" rows="3" placeholder="Description"></textarea>
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        ProductGroup<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                         <select class="form-control " id="fv_ddl_ProductGroup" name="v_ddl_ProductGroup">
                            </select>
                    </div>
                </td>
                </tr>
                    <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Category<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                         <select class="form-control " id="fv_ddl_Category" name="v_ddl_Category">
                            </select>
                    </div>
                </td>
                </tr>
                    <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        UOM<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <select class="form-control " id="fv_ddl_UOM" name="v_ddl_UOM">
                            </select>
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                     <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Buy Price<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_buyprice" name="v_txt_buyprice" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                    <tr>
                <td style="height:15px">
                </td>
                </tr>
                     <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Sale Price<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_SalePrice" name="v_txt_SalePrice" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>    
                    <tr>
                <td style="width:100%">
                <label class="col-md-3 control-label">
                        Inventory Type
                    </label>    
                    <div class="col-md-4">                
                        <input type="radio" name="rad_type" value="Y" checked="checked" class="radio-list" />
                        Yes
                        <input type="radio" name="rad_type" value="N" class="radio-list" />
                        No
                    </div>
                </td>
                </tr>             
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        AR No<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_ArNo" name="v_txt_ArNo" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                     <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        AP No<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_ApNo" name="v_txt_ApNo" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                <tr>
                <td style="width:100%">
                <label class="col-md-3 control-label">
                        Status
                    </label>    
                    <div class="col-md-4">                
                        <input type="radio" name="rad_status" value="A" checked="checked" class="radio-list" />
                        Active
                        <input type="radio" name="rad_status" value="I" class="radio-list" />
                        Inactive
                    </div>
                </td>
                </tr>
                </table>
                    
                   
                </div>
            </div>
        </form>
    </div>
    </div>
        <div class="modal fade in" id="basic1" tabindex="-1" role="basic" aria-hidden="false" >          
        </div>
       <!-- BEGIN PAGE CONTENT-->
				
				<!-- END PAGE CONTENT-->
               
               
        </div>
    </form>
      
  
    
</body>
    
</html>





