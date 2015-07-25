<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductGroup.aspx.cs" Inherits="Trident.Master.ProductGroup1" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>ProductGroup</title>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
<%--<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
<link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="../../assets/global/plugins/select2/select2.css"/>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="../assets/global/css/components.css" rel="stylesheet" type="text/css"/>
<link href="../assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="../assets/admin/layout2/css/layout.css" rel="stylesheet" type="text/css"/>
<link id="style_color" href="../assets/admin/layout2/css/themes/default.css" rel="stylesheet" type="text/css"/>
<link href="../assets/admin/layout2/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->--%>
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
        function get_ProductGroupID() {
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
                    ProductGroupID: get_ProductGroupID(),
                    ProductGroupCode: ($('#txt_code').val() == null ? '0' : $('#txt_code').val()),
                    ProductGroupName: ($('#fv_txt_ProductGroup').val() == null ? '' : $('#fv_txt_ProductGroup').val()),
                    ProductGroupStatus: $("input[name=rad_status]:checked").val(),
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
                                        if (sessionStorage.getItem('form_action') == "fetch_ProductGroup") {
                                            $('#txt_code').val(data[0].ProductGroupCode);
                                            $('#fv_txt_ProductGroup').val(data[0].ProductGroupName).removeClass('invalid').addClass('valid');
                                            $("input[name=rad_status][value=" + data[0].ProductGroupStatus + "]").prop('checked', true);
                                        } else {
                                            if (sessionStorage.getItem('form_action') == "update_ProductGroup") {
                                                if (data[0].design_count != undefined) {
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
                                                    if (data[0].ProductGroup_count != undefined) {
                                                        //alert('Item already exist');

                                                        $('#basic1').append(callalert('alert', 'Item already exist', '1'));                                                      
                                                        $('#basic11').modal('show');
                                                    } else {
                                                        obj.autocode('ProductGroup_autocode', 'ProductGroup', 'Insert', 'update_autocode');
                                                    }
                                                }
                                                else {
                                                    if (flag == -1) {
                                                        // alert('saved successfully');

                                                        $('#basic1').append(callalert('alert', 'Saved Successfully', '1'));
                                                        $('#basic1').modal('show');
                                                        req++;
                                                        sessionStorage.setItem('form_action', 'get_autocode');
                                                        obj.autocode('ProductGroup_autocode', 'ProductGroup', 'AutoCode', 'get_autocode');
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
                var form_data = $("#" + "<%=frm_ProductGroup.ClientID%>").serializeArray();
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
                    //  $("#basic1").css("display", "block");
                    $('#basic1').modal('show');
                }
                else {
                    if (sessionStorage.getItem('form_action') == "Insert_start") {
                        req += 1, flag = 0;
                        obj.autocode('ProductGroup_autocode', 'ProductGroup', 'Insert', 'save_ProductGroup');
                    }
                    else {
                        sessionStorage.setItem('form_action', 'update_ProductGroup');
                        obj.autocode('ProductGroup_autocode', 'ProductGroup', 'Update', 'update_ProductGroup');
                    }
                }
            },
            searchlist: function () {
                window.location.href = '../SearchList.aspx?pg=PRODUCTGROUP';
            },
            clear: function () {
                $('#fv_txt_ProductGroup').val('').removeClass('valid').addClass('invalid');
                if (sessionStorage.getItem('form_action') != "get_autocode") {
                    sessionStorage.setItem('form_action', 'new_autocode');
                    obj.autocode('ProductGroup_autocode', 'ProductGroup', 'AutoCode', 'get_autocode');
                }
            }
        }
        $(document).ready(function () {
            req++;
            if (get_ProductGroupID() == 0) {
                sessionStorage.setItem('form_action', 'get_autocode');
                obj.autocode('ProductGroup_autocode', 'ProductGroup', 'AutoCode', 'get_autocode');
            } else {
                sessionStorage.setItem('form_action', 'fetch_ProductGroup');
                obj.autocode('ProductGroup_autocode', 'ProductGroup', 'Fetch', 'fetch_ProductGroup');
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
</head>
<body>
    <form id="frm_ProductGroup" runat="server">
        <%--<div id="dv_bdy" class="cls_bdy">
            <div id="dv_sve" class="cls_bdy_tp">
                <table>
                    <tr>
                        <td>
                            <ul id="ul_sve">
                                <li>
                                    <input id="btn_save" class="cls_disabled btn btn-info btn-xs" type="button" value="Save -(F7)" onclick="obj.save();" /></li>
                                <li class="cls_disabled">
                                    <input class="cls_disabled btn btn-info btn-xs" type="button" value="Search -(F8)" onclick="obj.searchlist();" />
                                </li>
                                <li class="cls_disabled">
                                    <input type="button" class="cls_disabled btn btn-info btn-xs" value="Clear -(Alt+Shift+C)" onclick="obj.clear();" /></li>
                                <li class="cls_disabled">
                                    <input type="button" class="cls_disabled btn btn-info btn-xs" value="Exit -(F9)" /></li>
                            </ul>
                        </td>
                    </tr>
                </table>

            </div>
            <div class="cls_bdy_btm">
                <h5>Design Detail</h5>
                <table id="tbl_design">
                    <tr>
                        <td>Code </td>
                        <td>
                            <input type="text" id="txt_code" disabled="disabled" name="txt_code" class="cls_disabled" /></td>
                    </tr>                   
                    <tr>
                        <td>Color </td>
                        <td>
                            <input type="text" id="fv_txt_color" name="v_txt_color" class="invalid cls_disabled" /></td>
                    </tr>
                    <tr>
                        <td>Status </td>
                        <td>
                            <input type="radio" name="rad_status" value="A" checked="checked" />
                            Active 
                            <input type="radio" name="rad_status" value="I" />
                            Inactive
                        </td>
                    </tr>
                </table>
            </div>
        </div>--%>
        <div class="portlet box blue-hoki">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>Product Group
            </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                    class="config"></a><a href="javascript:;" class="reload"></a>
            </div>
        </div>
        <div class="portlet-body form" style="height:300px">
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
                        Product Group<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_ProductGroup" name="v_txt_ProductGroup" class="invalid form-control" />
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
        <div class="modal fade in" id="basic1" tabindex="-1" role="basic" aria-hidden="false">          
        </div>
       <!-- BEGIN PAGE CONTENT-->
				
				<!-- END PAGE CONTENT-->
               
               
        
    </form>
      
       
    
</body>
    
</html>
