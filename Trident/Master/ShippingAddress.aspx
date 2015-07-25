<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShippingAddress.aspx.cs" Inherits="Trident.Master.ShippingAddress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .cls_bdy_tp table ul {
            list-style: outside none none;
            float: right;
            margin: 0px;
        }

        .cls_bdy_tp table {
            width: 100%;
        }

        #tbl_design {
            background-color: white;
        }

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
                    padding-left: 30px;
                    width: 18%;
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

        html, body {
            background-color: #F1F3FA;
        }

        @media screen and (max-width:500px) {
            #tbl_design tr td:first-child {
                padding-left: 15px;
                width: 30%;
            }

            .cls_bdy_btm h5 {
                padding: 5px 15px;
            }
        }
    </style>
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
        function get_ShippingID() {
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
                    ShippingAddressID: get_ShippingID(),
                    Code: ($('#txt_code').val() == null ? '0' : $('#txt_code').val()),
                    PartyID: ($('#F_V_ddl_Customer').val() == null ? '0' : $('#F_V_ddl_Customer').val()),
                    Address1: ($('#F_V_txtAddress1').val() == '' ? '' : $('#F_V_txtAddress1').val()),
                    Address2: ($('#F_V_txtAddress2').val() == '' ? '' : $('#F_V_txtAddress2').val()),
                    City: ($('#F_V_txtCity').val() == '' ? '' : $('#F_V_txtCity').val()),
                    State: ($('#F_V_txtState').val() == '' ? '' : $('#F_V_txtState').val()),
                    Country: ($('#F_V_txtCountry').val() == '' ? '' : $('#F_V_txtCountry').val()),
                    Zipcode: ($('#F_V_txtZipcode').val() == '' ? '' : $('#F_V_txtZipcode').val()),
                    Status: $("input[name=rad_status]:checked").val(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj.cur_date(),
                    iMode: imode,
                    ScreenName: scrn_name,
                    CompanyID: get_CompanyID(),
                    handler_mode: hmode
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
                                        if (sessionStorage.getItem('form_action') == "fetch_Shipping") {
                                            $('#txt_code').val(data[0].Code);
                                            $('#F_V_ddl_Customer').val(data[0].PartyID).removeClass('invalid').addClass('valid');
                                            $('#F_V_txtAddress1').val(data[0].Address1).removeClass('invalid').addClass('valid');;
                                            $('#F_V_txtAddress2').val(data[0].Address2);
                                            $('#F_V_txtCity').val(data[0].City).removeClass('invalid').addClass('valid');;
                                            $('#F_V_txtState').val(data[0].State);
                                            $('#F_V_txtCountry').val(data[0].Country);
                                            $('#F_V_txtZipcode').val(data[0].Zipcode).removeClass('invalid').addClass('valid');;
                                            $("input[name=rad_status][value=" + data[0].Status + "]").prop('checked', true);
                                        } else {
                                            if (sessionStorage.getItem('form_action') == "update_Shipping") {
                                                if (data[0].Shipping_count != undefined) {

                                                    $('#basic1').append(callalert('alert', 'Item already exist.', '1'));

                                                    $('#basic1').modal('show');
                                                } else {

                                                    // alert('update Sucessfully');
                                                    $('#basic1').append(callalert('alert', 'update Sucessfully.', '1'));

                                                    $('#basic1').modal('show');
                                                    obj.clear();
                                                }
                                            }
                                            else {
                                                if (flag == 0) {
                                                    req = 1; res = 0, flag = -1;
                                                    if (data[0].Shipping_count != undefined) {

                                                        $('#basic1').append(callalert('alert', 'Item already exist.', '1'));

                                                        $('#basic1').modal('show');
                                                    } else {
                                                        obj.autocode('ShippingAddress', 'Shipping', 'Insert', 'update_autocode');
                                                    }
                                                }
                                                else {
                                                    if (flag == -1) {

                                                        $('#basic1').append(callalert('alert', 'saved successfully.', '1'));

                                                        $('#basic1').modal('show');
                                                        req++;
                                                        sessionStorage.setItem('form_action', 'get_autocode');
                                                        obj.autocode('ShippingAddress', 'Shipping', 'AutoCode', 'get_autocode');
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
                var form_data = $("#" + "<%=frm_Shipping.ClientID%>").serializeArray();
                var error_free = true;
                for (var input in form_data) {
                    if (form_data[input]['name'].indexOf('V_') == 0) {
                        var element = $("#F_" + form_data[input]['name']);
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

                    $('#basic1').append(callalert('Warning', 'Please fill red bordered items.', '1'));

                    $('#basic1').modal('show');
                }
                else {
                    if (sessionStorage.getItem('form_action') == "Insert_start") {
                        req += 1, flag = 0;
                        obj.autocode('ShippingAddress', 'Shipping', 'Insert', 'save_Shipping');
                    }
                    else {
                        sessionStorage.setItem('form_action', 'update_Shipping');
                        obj.autocode('ShippingAddress', 'Shipping', 'Update', 'update_Shipping');
                    }
                }
            },
            searchlist: function () {
                window.location.href = '../SearchList.aspx?pg=SHIPPINGADDRESS';
            },
            get_dropdown: function (hndler, scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/" + hndler + ".ashx",
                    data: this.arg(scname, imode, hmode),
                    cache: false,
                    async: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_ddl_Customer').empty();
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].PartyName != null) {
                                        $('#F_V_ddl_Customer').append($('<option></option>').val(data[i].PartyID).html(data[i].PartyName));
                                    }
                                }
                            }
                        }
                    }
                });
            },
            clear: function () {
               
                $('#F_V_ddl_Customer option[value=0]').attr('selected', 'selected');
                $('#F_V_ddl_Customer').removeClass('valid').addClass('invalid');
                $('#F_V_txtAddress1').val('').removeClass('valid').addClass('invalid');
                $('#F_V_txtAddress2').val('');
                $('#F_V_txtCity').val('').removeClass('valid').addClass('invalid');
                $('#F_V_txtState').val('');
                $('#F_V_txtCountry').val('');
                $('#F_V_txtZipcode').val('').removeClass('valid').addClass('invalid');
                if (sessionStorage.getItem('form_action') != "get_autocode") {
                    sessionStorage.setItem('form_action', 'new_autocode');
                    obj.autocode('Warehouse_handler', 'Warehouse', 'AutoCode', 'get_autocode');
                }
            }
        }
        $(document).ready(function () {
            req++;
            if (get_ShippingID() == 0) {
                sessionStorage.setItem('form_action', 'get_autocode');
                obj.autocode('ShippingAddress', 'Shipping', 'AutoCode', 'get_autocode');
                obj.get_dropdown('ShippingAddress', 'Shipping', 'ComboBind', 'get_dropdown');
            } else {
                sessionStorage.setItem('form_action', 'fetch_Shipping');
                obj.autocode('ShippingAddress', 'Shipping', 'Fetch', 'fetch_Shipping');
                obj.get_dropdown('ShippingAddress', 'Shipping', 'ComboBind', 'get_dropdown');
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
    </script>
</head>
<body>
    <form id="frm_Shipping" runat="server">
        <div class="portlet box blue-hoki">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>Shipping
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                        class="config"></a><a href="javascript:;" class="reload"></a>
                </div>
            </div>
            <div class="portlet-body form" style="height:100%">
                <form action="#" class="form-horizontal">
                    <div class="form-actions top">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <div id="dv_sve" class="cls_bdy_tp">
                                    <table>
                                        <tr>
                                            <td>
                                                <ul id="ul_sve">
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
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 100%">
                                        <label class="col-md-3 control-label">
                                            Code</label>
                                        <div class="col-md-4">
                                            <input type="text" id="txt_code" disabled="disabled" name="txt_code" class="form-control" />


                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 15px"></td>
                                </tr>

                                <tr>
                                    <td style="width: 100%">
                                        <label class="col-md-3 control-label">
                                            Customer<span class="required">
											* </span>
                                        </label>
                                        <div class="col-md-4">
                                             <select class="form-control invalid"  id="F_V_ddl_Customer" name="V_ddl_Customer">
                                                <option value="0"></option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 15px"></td>
                                </tr>

                                <tr>
                                    <td style="width: 100%">
                                        <label class="col-md-3 control-label">
                                            Address1<span class="required">
											* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="F_V_txtAddress1" name="V_txtAddress1" class="invalid form-control" />
                                        </div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="height: 15px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
                                        <label class="col-md-3 control-label">
                                            Address2
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="F_V_txtAddress2" name="txtAddress2" class="invalid form-control" />
                                        </div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="height: 15px"></td>
                                </tr>
                                 <tr>
                                    <td style="width: 100%">
                                        <label class="col-md-3 control-label">
                                            City<span class="required">
											* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="F_V_txtCity" name="V_txtCity" class="invalid form-control" />
                                        </div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="height: 15px"></td>
                                </tr>
                                 <tr>
                                    <td style="width: 100%">
                                        <label class="col-md-3 control-label">
                                            State
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="F_V_txtState" name="txtState" class="invalid form-control" />
                                        </div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="height: 15px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
                                        <label class="col-md-3 control-label">
                                            Country
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="F_V_txtCountry" name="txtCountry" class="invalid form-control" />
                                        </div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="height: 15px"></td>
                                </tr>
                                 <tr>
                                    <td style="width: 100%">
                                        <label class="col-md-3 control-label">
                                            Zip code<span class="required">
											* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="F_V_txtZipcode" name="V_txtZipcode" class="invalid form-control" />
                                        </div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="height: 15px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
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
                <div class="modal fade in" id="basic1" tabindex="-1" role="basic1" aria-hidden="false" style="display: none;">          
        </div>
            </div>
        </div>

    </form>
</body>
</html>
