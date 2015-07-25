<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Warehouse.aspx.cs" Inherits="Trident.Master.Warehouse" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
        function get_BranchID() {
            <% if (Session["BranchID"] != null)
               { %>
             return '<%= Session["BranchID"] %>';
            
            <% } %>
             return undefined;
         }
        function get_WarehouseID() {
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
                    WarehouseID: get_WarehouseID(),
                    WarehouseCode: ($('#txt_code').val() == null ? '0' : $('#txt_code').val()),
                    WarehouseName: ($('#F_V_txtWarehouse').val() == '' ? '' : $('#F_V_txtWarehouse').val()),
                    WarehouseStatus: $("input[name=rad_status]:checked").val(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj.cur_date(),
                    iMode: imode,
                    ScreenName: scrn_name,
                    CompanyID: get_CompanyID(),
                    StoreBranchID: ($('#F_V_ddl_Branch').val() == null ? '0' : $('#F_V_ddl_Branch').val()),
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
                                        if (sessionStorage.getItem('form_action') == "fetch_Warehouse") {
                                            $('#txt_code').val(data[0].WarehouseCode);
                                            $('#F_V_txtWarehouse').val(data[0].WarehouseName).removeClass('invalid').addClass('valid');
                                            $('#F_V_ddl_Branch').val(data[0].BranchID).removeClass('invalid').addClass('valid');
                                            $("input[name=rad_status][value=" + data[0].WarehouseStatus + "]").prop('checked', true);
                                        } else {
                                            if (sessionStorage.getItem('form_action') == "update_Warehouse") {
                                                if (data[0].design_count != undefined) {

                                                    $('#basic1').append(callalert('alert', 'Item already exist.', '1'));
                                                   
                                                    $('#basic1').modal('show');
                                                } else {


                                                    $('#basic1').append(callalert('alert', 'update Sucessfully.', '1'));
                                                   
                                                    $('#basic1').modal('show');
                                                    obj.clear();
                                                }
                                            }
                                            else {
                                                if (flag == 0) {
                                                    req = 1; res = 0, flag = -1;
                                                    if (data[0].design_count != undefined) {

                                                        $('#basic1').append(callalert('alert', 'Item already exist.', '1'));
                                                       
                                                        $('#basic1').modal('show');
                                                    } else {
                                                        obj.autocode('Warehouse_handler', 'Warehouse', 'Insert', 'update_autocode');
                                                    }
                                                }
                                                else {
                                                    if (flag == -1) {

                                                        $('#basic1').append(callalert('alert', 'saved successfully.', '1'));
                                                       
                                                        $('#basic1').modal('show');
                                                        req++;
                                                        sessionStorage.setItem('form_action', 'get_autocode');
                                                        obj.autocode('Warehouse_handler', 'Warehouse', 'AutoCode', 'get_autocode');
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
                var form_data = $("#" + "<%=frm_Warehouse.ClientID%>").serializeArray();
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

                    $('#basic1').append(callalert('alert', 'Please fill red bordered items.', '1'));
                   
                    $('#basic1').modal('show');
                }
                else {
                    if (sessionStorage.getItem('form_action') == "Insert_start") {
                        req += 1, flag = 0;
                        obj.autocode('Warehouse_handler', 'Warehouse', 'Insert', 'save_Warehouse');
                    }
                    else {
                        sessionStorage.setItem('form_action', 'update_Warehouse');
                        obj.autocode('Warehouse_handler', 'Warehouse', 'Update', 'update_Warehouse');
                    }
                }
            },
            get_dropdown: function (hndler,scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/" + hndler + ".ashx",
                    data: this.arg(scname, imode, hmode),
                    cache: false,
                    async:false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_ddl_Branch').empty();
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].BranchName != null) {
                                        $('#F_V_ddl_Branch').append($('<option></option>').val(data[i].BranchID).html(data[i].BranchName));
                                    }
                                }
                            }
                        }
                    }
                });
            },
            searchlist: function () {
                window.location.href = '../SearchList.aspx?pg=WAREHOUSE';
            },
            Exist: function () {
                window.location.href = '../HomeContentPage.aspx';
            },
            clear: function () {
                $('#F_V_txtWarehouse').val('').removeClass('valid').addClass('invalid');
                $('#F_V_ddl_Branch option[value=0]').attr('selected', 'selected');
                $('#F_V_ddl_Branch').removeClass('valid').addClass('invalid');
                if (sessionStorage.getItem('form_action') != "get_autocode") {
                    sessionStorage.setItem('form_action', 'new_autocode');
                    obj.autocode('Warehouse_handler', 'Warehouse', 'AutoCode', 'get_autocode');
                }
            }
        }
        $(document).ready(function () {
            req++;
            if (get_WarehouseID() == 0) {
                sessionStorage.setItem('form_action', 'get_autocode');
                obj.autocode('Warehouse_handler', 'Warehouse', 'AutoCode', 'get_autocode');
                obj.get_dropdown('Warehouse_handler', 'Warehouse', 'ComboBind', 'get_dropdown');
            } else {
                sessionStorage.setItem('form_action', 'fetch_Warehouse');
                obj.get_dropdown('Warehouse_handler', 'Warehouse', 'ComboBind', 'get_dropdown');
                obj.autocode('Warehouse_handler', 'Warehouse', 'Fetch', 'fetch_Warehouse');
                
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
    <form id="frm_Warehouse" runat="server">
        <div class="portlet box blue-hoki">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>Warehouse
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                        class="config"></a><a href="javascript:;" class="reload"></a>
                </div>
            </div>
            <div class="portlet-body form" style="height: 350px">
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
                                                        <input type="button" class="cls_disabled btn green" value="Exit -(F9)" onclick="obj.Exist()" /></li>
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
                                            Warehouse<span class="required">
											* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="F_V_txtWarehouse" name="V_txtWarehouse" class="invalid form-control" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 15px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
                                        <label class="col-md-3 control-label">
                                            Branch<span class="required">
											* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control invalid"  id="F_V_ddl_Branch" name="V_ddl_Branch">
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
                <div class="modal fade in" id="basic1" tabindex="-1" role="basic" aria-hidden="false" >
                </div>
            </div>
        </div>

    </form>
</body>
</html>


