<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChartOfAccounts.aspx.cs" Inherits="Trident.Accounting.ChartOfAccounts" %>

<html>
<head id="Head1" runat="server">
    <title>Chart Of Accounts</title>
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
            background-color: #F9F9F9 !important; 
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
        function get_BranchID() {
            <% if (Session["BranchID"] != null)
               { %>
            return '<%= Session["BranchID"] %>';
            
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
        function get_ChartID() {
            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }
        function GetBS() {
            if ($('#F_V_ddl_Type').val() == 'B') {
                return ($('#F_V_ddl_subgroup').val() == null ? '' : $('#F_V_ddl_subgroup').val());
            }
            else {
                return '';
            }
        }
        function getPL() {
            if ($('#F_V_ddl_Type').val() == 'P') {
                return ($('#F_V_ddl_subgroup').val() == null ? '' : $('#F_V_ddl_subgroup').val());
            }
            else {
                return '';
            }
        }
        var req = 0, res = 0, flag = 0;
        var obj = {
            arg: function (scrn_name, imode, hmode) {
                Args = {
                    CHARTID: get_ChartID(),
                    AC_CODE: ($('#txt_code').val() == null ? '0' : $('#txt_code').val()),
                    AC_DESC: ($('#fv_txt_description').val() == null ? '' : $('#fv_txt_description').val()),
                    AC_TYPE: ($('#F_V_ddl_Type').val() == null ? 0 : $('#F_V_ddl_Type').val()),
                    AC_DORC: ($('#F_V_ddl_acsource').val() == null ? 0 : $('#F_V_ddl_acsource').val()),
                    AC_BANK: ($('#F_V_ddl_Bank').val() == null ? 0 : $('#F_V_ddl_Bank').val()),
                    AC_CURR: ($('#F_V_ddl_currency').val() == null ? 0 : $('#F_V_ddl_currency').val()),
                    AC_SUBTYPE: ($('#F_V_ddl_subgroup').val() == null ? 0 : $('#F_V_ddl_subgroup').val()),
                    AC_SUB_PL: getPL(),
                    AC_SUB_BS: GetBS(),
                    G_NOS: ($('#F_V_ddl_groupdesc').val() == null ? 0 : $('#F_V_ddl_groupdesc').val()),
                    AC_SUB_BS1: '',
                    iMode: imode,
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    handler_mode: hmode
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            get_drpdowns: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/chartacc.ashx",
                    data: this.arg(scname, imode, hmode),
                    cache: false,
                    async: false,
                    success: function (data) {
                        drpdowns = data;
                        $('#F_V_ddl_groupdesc,#F_V_ddl_currency').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].G_NOs != null) {
                                        $('#F_V_ddl_groupdesc').append($('<option></option>').val(data[i].G_NOs).html(data[i].G_DESC));
                                    }
                                    else if (data[i].Currency != null) {
                                        $('#F_V_ddl_currency').append($('<option></option>').val(data[i].Currency).html(data[i].CurrencyName));
                                    }
                                    //else if (data[i].UOMID != null) {
                                    //    $('#F_V_ddl_UOM').append($('<option></option>').val(data[i].UOMID).html(data[i].UOMName));
                                    //}
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
                                        if (sessionStorage.getItem('form_action') == "fetch_ChartOfAccounts") {
                                            $('#txt_code').val(data[0].AC_CODE);
                                            $('#fv_txt_description').val(data[0].AC_DESC).removeClass('invalid').addClass('valid');
                                            $('#F_V_ddl_Type option[value=' + data[0].AC_TYPE + ']').attr('selected', 'selected');
                                            $('#F_V_ddl_Type').removeClass('invalid').addClass('valid');
                                            SetDivs();
                                            $('#F_V_ddl_acsource option[value=' + data[0].AC_DORC + ']').attr('selected', 'selected');
                                            $('#F_V_ddl_acsource').removeClass('invalid').addClass('valid');
                                            $('#F_V_ddl_Bank option[value=' + data[0].AC_BANK + ']').attr('selected', 'selected');
                                            $('#F_V_ddl_Bank').removeClass('invalid').addClass('valid');
                                            $('#F_V_ddl_subgroup option[value=' + data[0].AC_SUBTYPE + ']').attr('selected', 'selected');
                                            $('#F_V_ddl_subgroup').removeClass('invalid').addClass('valid');
                                            $('#F_V_ddl_currency option[value=' + data[0].AC_CURR + ']').attr('selected', 'selected');
                                            $('#F_V_ddl_currency').removeClass('invalid').addClass('valid');
                                            $('#F_V_ddl_groupdesc option[value=' + data[0].G_NOS + ']').attr('selected', 'selected');
                                            $('#F_V_ddl_groupdesc').removeClass('invalid').addClass('valid');
                                        } else {
                                            if (sessionStorage.getItem('form_action') == "update_ChartOfAccounts") {
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
                                                        obj.autocode('chartacc', 'ChartOfAccounts', 'Insert', 'update_autocode');
                                                    }
                                                }
                                                else {
                                                    if (flag == -1) {
                                                        // alert('saved successfully');

                                                        $('#basic1').append(callalert('alert', 'Saved Successfully', '1'));

                                                        $('#basic1').modal('show');
                                                        req++;
                                                        // sessionStorage.setItem('form_action', 'get_autocode');
                                                        // obj.autocode('ChartOfAccounts', 'ChartOfAccounts', 'AutoCode', 'get_autocode');
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
                var form_data = $("#" + "<%=frm_acc.ClientID%>").serializeArray();
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
                        obj.autocode('chartacc', 'ChartOfAccounts', 'Insert', 'save_ChartOfAccounts');
                    }
                    else {
                        sessionStorage.setItem('form_action', 'update_ChartOfAccounts');
                        obj.autocode('chartacc', 'ChartOfAccounts', 'Update', 'update_ChartOfAccounts');
                    }
                }
            },
            searchlist: function () {
                window.location.href = '../SearchList.aspx?pg=CHARTOFACCOUNTS';
            },
            clear: function () {
                $('#txt_code').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_description').val('').removeClass('valid').addClass('invalid');               
                if (sessionStorage.getItem('form_action') != "get_autocode") {
                    sessionStorage.setItem('form_action', 'new_autocode');
                    obj.autocode('chartacc', 'ChartOfAccounts', 'AutoCode', 'get_autocode');
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
            $("#F_V_ddl_subgroup").hide();
            $("#lblsubgroup").hide();
            $("#F_V_ddl_subgroup2").hide();
            $("#lblsubgroup2").hide();
            SetDivs();
            obj.get_drpdowns('ChartOfAccounts', 'ComboBind', 'get_dropdown');
            if (get_ChartID() == 0) {
                sessionStorage.setItem('form_action', 'Insert_start');
                // obj.autocode('ChartOfAccounts', 'ChartOfAccounts', 'AutoCode', 'Insert_start');
            } else {
                sessionStorage.setItem('form_action', 'fetch_ChartOfAccounts');
                obj.autocode('chartacc', 'ChartOfAccounts', 'Fetch', 'fetch_ChartOfAccounts');
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
            $(document).on('change', '#F_V_ddl_Type', function () {
                if ($(this).val() == 'R') {
                    $("#lblsubgroup").hide();
                    $("#F_V_ddl_subgroup").hide();
                    $("#lblsubgroup2").hide();
                    $("#F_V_ddl_subgroup2").hide();
                } else if ($(this).val() == 'P') {
                    $("#lblsubgroup2").hide();
                    $("#F_V_ddl_subgroup2").hide();
                    $("#lblsubgroup").show();
                    $("#F_V_ddl_subgroup").show();
                    $("#F_V_ddl_subgroup").empty();
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('S').html('Sales'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('C').html('Cost Of Sales'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('O').html('Operating Expenses'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('IE').html('Other Income & Expenses'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('I').html('Interests on Fixed Deposists'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('T').html('Taxation'));
                }
                else {
                    $("#lblsubgroup").show();
                    $("#F_V_ddl_subgroup").show();
                    $("#F_V_ddl_subgroup").empty();
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('FA').html('Fixed Assets'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('CA').html('Current Assets'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('LT').html('Long Term Liablities'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('CL').html('Current Liablities'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('SC').html('Share Capital'));
                    $('#F_V_ddl_subgroup').append($('<option></option>').val('LT').html('Long Term Assets'));
                    $("#F_V_ddl_subgroup2").show();
                    $("#lblsubgroup2").hide();
                    $("#F_V_ddl_subgroup2").hide();
                    //$('#F_V_ddl_subgroup2').append($('<option></option>').val('T').html('Tangible'));
                    //$('#F_V_ddl_subgroup2').append($('<option></option>').val('IT').html('In-Tangible'));
                    //$('#F_V_ddl_subgroup2').append($('<option></option>').val('I').html('Investments'));
                }
            });
        });
        function SetDivs() {
            var k = $("#F_V_ddl_Type option:selected").val()
            if (k == 'R') {
                $("#lblsubgroup").hide();
                $("#F_V_ddl_subgroup").hide();
                $("#lblsubgroup2").hide();
                $("#F_V_ddl_subgroup2").hide();
            } else if (k == 'P') {
                $("#lblsubgroup2").hide();
                $("#F_V_ddl_subgroup2").hide();
                $("#lblsubgroup").show();
                $("#F_V_ddl_subgroup").show();
                $("#F_V_ddl_subgroup").empty();
                $('#F_V_ddl_subgroup').append($('<option></option>').val('S').html('Sales'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('C').html('Cost Of Sales'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('O').html('Operating Expenses'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('IE').html('Other Income & Expenses'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('I').html('Interests on Fixed Deposists'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('T').html('Taxation'));
            }
            else {
                $("#lblsubgroup").show();
                $("#F_V_ddl_subgroup").show();
                $("#F_V_ddl_subgroup").empty();
                $('#F_V_ddl_subgroup').append($('<option></option>').val('FA').html('Fixed Assets'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('CA').html('Current Assets'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('LT').html('Long Term Liablities'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('CL').html('Current Liablities'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('SC').html('Share Capital'));
                $('#F_V_ddl_subgroup').append($('<option></option>').val('LT').html('Long Term Assets'));
                $("#F_V_ddl_subgroup2").show();
                $("#lblsubgroup2").hide();
                $("#F_V_ddl_subgroup2").hide();
            }
        }
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

    <script type="text/javascript" src="../JavaScript/Master.js"></script>
</head>
<body onload="resizeIframe();">
    <div id="full_bdy">
        <form id="frm_acc" runat="server">

            <div class="portlet box blue-hoki">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-gift"></i>Chart Of Accounts
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                            class="config"></a><a href="javascript:;" class="reload"></a>
                    </div>
                </div>
                <div class="portlet-body form">
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

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Ac Code</label>
                                    <input type="text" id="txt_code" name="txt_code" class="form-control">
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <%--<div class="form-group">
                                    <label>State</label>
                                    <input type="text" class="form-control">
                                </div>--%>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-12 ">
                                <div class="form-group">
                                    <label>Description</label>
                                    <input type="text" id="fv_txt_description" name="v_txt_description" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Type</label>
                                    <select class="select2_category form-control" data-placeholder="Choose a Type" id="F_V_ddl_Type" name="ddl_Type" tabindex="1">
                                        <option value="B" selected="selected">Balance</option>
                                        <option value="P">P&L</option>
                                        <option value="R">Ret.Earnings</option>
                                    </select>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>AC Source</label>
                                    <select class="select2_category form-control" data-placeholder="Choose AC Source" id="F_V_ddl_acsource" name="ddl_acsource" tabindex="1">
                                        <option value="CR">Credit</option>
                                        <option value="DB">Debit</option>
                                    </select>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Bank</label>
                                    <select class="select2_category form-control" data-placeholder="Choose Bank" id="F_V_ddl_Bank" name="ddl_Bank" tabindex="1">
                                        <option value="Y">Yes</option>
                                        <option value="N">No</option>
                                    </select>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label id="lblsubgroup">Sub Group</label>
                                    <select class="select2_category form-control" data-placeholder="Choose Currency" id="F_V_ddl_subgroup" name="ddl_subgroup" tabindex="1">
                                    </select>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Currency</label>
                                    <select class="select2_category form-control" data-placeholder="Choose Currency" id="F_V_ddl_currency" name="ddl_currency" tabindex="1">
                                    </select>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label id="lblsubgroup2">Sub Group2</label>
                                    <select class="select2_category form-control" data-placeholder="Choose Currency" id="F_V_ddl_subgroup2" name="ddl_subgroup2" tabindex="1">
                                    </select>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <!--/row-->
                        <div class="row">
                            <div class="col-md-12 ">
                                <div class="form-group">
                                    <label>Group Desc</label>
                                    <select class="select2_category form-control" data-placeholder="Choose Group Desc" id="F_V_ddl_groupdesc" name="ddl_groupdesc" tabindex="1">
                                    </select>
                                </div>
                            </div>
                            <!--/span-->
                            <!--/span-->
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal fade in" id="basic1" tabindex="-1" role="basic" aria-hidden="false">
            </div>
            <!-- BEGIN PAGE CONTENT-->

            <!-- END PAGE CONTENT-->



        </form>

    </div>

</body>

</html>
