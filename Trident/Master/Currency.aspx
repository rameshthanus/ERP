﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Currency.aspx.cs" Inherits="Trident.Master.Currency1" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Currency</title>
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
        function get_CurrencyID() {
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
                    CurrencyID: get_CurrencyID(),
                    CurrencyCode: ($('#txt_code').val() == null ? '0' : $('#txt_code').val()),
                    CurrencyName: ($('#fv_txt_currency').val() == null ? '' : $('#fv_txt_currency').val()),
                    CurrencyStatus: $("input[name=rad_status]:checked").val(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj.cur_date(),
                    iMode: imode,
                    ScreenName: scrn_name,
                    CompanyID: get_CompanyID(),
                    handler_mode: hmode,
                    Currency: ($('#fv_txt_currencyname').val() == null ? '' : $('#fv_txt_currencyname').val()),
                    CentsName: ($('#fv_txt_centsname').val() == null ? '' : $('#fv_txt_centsname').val()),
                    ExRate: ($('#fv_txt_exrate').val() == '' ? '0' : $('#fv_txt_exrate').val())
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
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
                                        if (sessionStorage.getItem('form_action') == "fetch_currency") {
                                            $('#txt_code').val(data[0].CurrencyCode);
                                            $('#fv_txt_currency').val(data[0].CurrencyName).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_currencyname').val(data[0].Currency).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_centsname').val(data[0].CentsName).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_exrate').val(data[0].ExRate).removeClass('invalid').addClass('valid');
                                            $("input[name=rad_status][value=" + data[0].CurrencyStatus + "]").prop('checked', true);
                                        } else {
                                            if (sessionStorage.getItem('form_action') == "update_currency") {
                                                if (data[0].currency_count != undefined) {
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
                                                        obj.autocode('currency_autocode', 'Currency', 'Insert', 'update_autocode');
                                                    }
                                                }
                                                else {
                                                    if (flag == -1) {
                                                        // alert('saved successfully');

                                                        $('#basic1').append(callalert('alert', 'Saved Successfully', '1'));
                                                      
                                                        $('#basic1').modal('show');
                                                        req++;
                                                        sessionStorage.setItem('form_action', 'get_autocode');
                                                        obj.autocode('currency_autocode', 'Currency', 'AutoCode', 'get_autocode');
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
                var form_data = $("#" + "<%=frm_currency.ClientID%>").serializeArray();
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
                        obj.autocode('currency_autocode', 'Currency', 'Insert', 'save_currency');
                    }
                    else {
                        sessionStorage.setItem('form_action', 'update_currency');
                        obj.autocode('currency_autocode', 'Currency', 'Update', 'update_currency');
                    }
                }
            },
            searchlist: function () {
                window.location.href = '../SearchList.aspx?pg=CURRENCY';
            },
            clear: function () {
                $('#fv_txt_currency').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_currencyname').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_centsname').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_exrate').val('').removeClass('valid').addClass('invalid');
                $("input[name=rad_status][value=A]").prop('checked', true);             
                if (sessionStorage.getItem('form_action') != "get_autocode") {
                    sessionStorage.setItem('form_action', 'new_autocode');
                    obj.autocode('currency_autocode', 'Currency', 'AutoCode', 'get_autocode');
                }
            }
        }
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
        $(document).ready(function () {
            req++;
            if (get_CurrencyID() == 0) {
                sessionStorage.setItem('form_action', 'get_autocode');
                obj.autocode('currency_autocode', 'Currency', 'AutoCode', 'get_autocode');
            } else {
                sessionStorage.setItem('form_action', 'fetch_currency');
                obj.autocode('currency_autocode', 'Currency', 'Fetch', 'fetch_currency');
            }
            $(document).on('keyup', 'input', function () {
                if ($(this).val() == '') {
                    $(this).removeClass("valid").addClass("invalid");
                }
                else {
                    $(this).removeClass("invalid").addClass("valid");
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
    </script>
   
    <script type="text/javascript" src="../JavaScript/Master.js"></script>
</head>
<body onload="resizeIframe();">
    <div id="full_bdy">
    <form id="frm_currency" runat="server">
        
        <div class="portlet box blue-hoki">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>Currency
            </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                    class="config"></a><a href="javascript:;" class="reload"></a>
            </div>
        </div>
        <div class="portlet-body form" >
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
                        Currency<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_currency" name="v_txt_currency" class="invalid form-control" />
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
                        Currency Name<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_currencyname" name="v_txt_currencyname" class="invalid form-control" />
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
                        Cents Name<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_centsname" name="v_txt_centsname" class="invalid form-control" />
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
                        Ex Rate<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_exrate" name="v_txt_exrate" class="invalid form-control" />
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
               
               
        
    </form>
      
  </div>
    
</body>
    
</html>


