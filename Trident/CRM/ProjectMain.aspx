﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMain.aspx.cs" Inherits="Trident.CRM.ProjectMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .cls_performo-header div {
            padding: 5px 15px;
        }

        .cls_bdy_tp table ul {
            list-style: outside none none;
            float: right;
            margin: 0px;
        }

        input[type="search"] {
            float: none !important;
        }

        .cls_bdy_tp table {
            width: 100%;
        }

        /*.nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus {
            background-color: #26a69a !important;
        }*/
        .note-editable {
            height: 251px !important;
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
            float: left;
            width: 70%;
        }

        body {
            background: #f1f3fa !important;
        }

        #btn_dialog {
            float: right;
            margin-right: 7%;
        }

        .cls_pop_dv {
            height: 250px;
            overflow: auto;
        }

        .cls_pop_tbl {
            border-collapse: collapse;
        }

            .cls_pop_tbl tr td, .cls_pop_tbl tr th {
                border: 1px solid gray;
                padding: 5px;
            }

        .invalid {
        }

        input.form-control, select.form-control {
            float: left;
            width: 74%;
        }

        .valid {
            border: 1px solid green !important;
        }

        .cls_cal_area label {
            font-weight: bold;
        }

        #responsive {
            background-color: #fff;
            margin-left: 30px !important;
            height: 550px !important;
            overflow: auto;
        }

        .cls_lbl {
            float: left;
            margin-right: 20px;
            position: relative;
            top: 7px;
            text-align: right;
        }

        .cls_txt {
            width: 150px !important;
            margin: 5px;
        }

        .modal.fade.in {
            top: 31% !important;
        }

        #_view {
            height: 1000px !important;
            overflow: auto !important;
        }

        .cls_chk_edit {
            cursor: pointer;
            color: blue;
        }

        .cls_chk_remove {
            cursor: pointer;
            color: red;
        }

        .nav-tabs, .nav-pills {
            margin-bottom: 0 !important;
            border-bottom: 1px solid rgb(213, 213, 213);
        }

        .hide_ {
            display: none !important;
        }

        #tbl_listmain tbody tr td:nth-child(odd), #tbl_listddress tbody tr td:nth-child(odd), #tbl_listDescription tbody tr td:nth-child(odd), #tbl_listprofilepic tbody tr td:nth-child(odd) {
            text-align: right;
        }


        .table-scrollable {
            border-top: 0 !important;
        }

        #spn_lead_type {
            font-size: 18px;
            font-weight: bold;
            float: left;
            width: 30%;
            padding: 10px 3px;
        }

        .portlet > .portlet-title > .caption {
            font-size: 16px !important;
        }
    </style>
 <link href='../assets/global/plugins/font-awesome/css/font-awesome.min.css' rel="stylesheet" />
    <link href='../assets/global/plugins/simple-line-icons/simple-line-icons.min.css' rel="stylesheet" />
    <link href='../assets/global/plugins/bootstrap/css/bootstrap.min.css' rel="stylesheet" />
    <link href='../assets/global/plugins/uniform/css/uniform.default.css' rel="stylesheet" />
    <link href='../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css' rel="stylesheet" />
    <link href='../Css/font.css' rel="stylesheet" />
    <link href='../assets/global/plugins/select2/select2.css' rel="stylesheet" />
    <link href='../assets/global/css/components.css' rel="stylesheet" />
    <link href='../assets/global/css/plugins.css' rel="stylesheet" />
    <link href='../assets/admin/layout2/css/layout.css' rel="stylesheet" />
    <link href='../assets/admin/layout2/css/themes/default.css' rel="stylesheet" />
    <link href='../assets/admin/layout2/css/custom.css' rel="stylesheet" />

    <link href="../assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" />

    <link href="../assets/global/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-summernote/summernote.css" />
    <link href="../assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css" rel="stylesheet" />
    <link href="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />

</head>
<body onload="resizeIframe()">
    <form id="form1" runat="server">
        <div id="full_bdy">
            <span id="spn_lead_type">Creating New Project</span>
            <div id="dv_sve" class="cls_bdy_tp">
                <table>
                    <tr>
                        <td>
                            <ul id="ul_sve">
                                <li>
                                    <input id="btn_save" class=" btn btn green btn-md" type="button" value="Save" onclick="obj_.save();" /></li>
                                <li>
                                    <input id="btn_cancel" class=" btn btn green btn-md" type="button" value="Cancel" onclick="obj_.cancel_();" /></li>

                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span>Project Details</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_listmain">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label>Project Code</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_ProjectCode" name="V_txt_ProjectCode" />
                                            </td>
                                            <td>
                                                <label>Project Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_ProjectName" name="V_txt_ProjectName" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Start Date</label>
                                            </td>
                                            <td>
                                                <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy">
                                                    <input type="text" class="form-control" id="F_V_txt_StartDate" name="txt_StartDate" />
                                                    <span class="input-group-btn">
                                                        <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </td>
                                            <td>
                                                <label>Assigned To</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_AssignedTo" name="V_ddl_AssignedTo">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Target End Date</label>
                                            </td>
                                            <td>
                                                <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy">
                                                    <input type="text" class="form-control" id="F_V_txt_TargetEndDate" name="txt_TargetEndDate" />
                                                    <span class="input-group-btn">
                                                        <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </td>
                                            <td>
                                                <label>Actual End Date</label>
                                            </td>
                                            <td>
                                                <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy">
                                                    <input type="text" class="form-control" id="F_V_txt_ActualEndDate" name="txt_ActualEndDate" />
                                                    <span class="input-group-btn">
                                                        <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Status</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Status" name="ddl_Status">
                                                </select>
                                            </td>
                                            <td>
                                                <label>Type</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Type" name="ddl_Type">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>RelateTo</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_RelateTo" name="ddl_RelateTo">
                                                </select>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_PartyId" name="ddl_PartyId">
                                                </select>
                                            </td>
                                            <td></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span>Custom Information</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_listddress">
                                    <tbody>

                                        <tr>
                                            <td>
                                                <label>Target Budget</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_TargetBudget" name="txt_TargetBudget" />
                                            </td>
                                            <td>
                                                <label>Project Url</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_ProjectUrl" name="txt_ProjectUrl" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Priority</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Priority" name="ddl_Priority">
                                                </select>
                                            </td>
                                            <td>
                                                <label>Progress</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Progress" name="ddl_Progress">
                                                </select>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12">
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span>Description Details</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_listDescription">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label>Description</label>
                                            </td>
                                            <td>
                                                <textarea cols="100" rows="3" class="form-control invalid" id="txtarea_Description"></textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <asp:HiddenField ID="hdnUploadFilePath" runat="server" ClientIDMode="Static" />
        <div class="modal fade in" id="basic" tabindex="-1" role="basic" aria-hidden="false">
        </div>
    </form>
    <script src='../JavaScript/jquery-1.9.1.min.js' type="text/javascript"></script>
    <script src='../JavaScript/comman_Validation.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-1.11.0.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-migrate-1.2.1.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js' type="text/javascript"></script>

    <script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src='../assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery.blockui.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery.cokie.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/uniform/jquery.uniform.min.js' type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src='../assets/global/plugins/select2/select2.min.js' type="text/javascript"></script>
    <script src='../assets/global/scripts/metronic.js' type="text/javascript"></script>
    <script src='../assets/admin/layout2/scripts/layout.js' type="text/javascript"></script>
    <script src='../assets/admin/layout2/scripts/demo.js' type="text/javascript"></script>
    <script src='../assets/admin/pages/scripts/form-samples.js' type="text/javascript"></script>
    <script src='../JavaScript/Layout.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/bootbox/bootbox.min.js' type="text/javascript"></script>
    <script src='../assets/admin/pages/scripts/table-advanced.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/select2/select2.min.js' type="text/javascript"></script>

    <script src="../assets/global/plugins/datatables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js" type="text/javascript"></script>


    <script src="../assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>


    <script src="../assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js" type="text/javascript"></script>

    <script src='../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js' type="text/javascript"></script>
    <script src="../assets/admin/pages/scripts/ui-extended-modals.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>

    <script type="text/javascript" src="../assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script src="../assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>

    <script src="../assets/admin/pages/scripts/components-editors.js" type="text/javascript"></script>
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

    <link href="../Css/uploadify.css" rel="stylesheet" />
    <script src="../JavaScript/jquery.uploadify.js"></script>



    <script type="text/javascript">
        var drpdowns = [], att1 = [];
        function get_CompanyID() {
            <% if (Session["CompanyID"] != null)
               { %>
            return '<%= Session["CompanyID"] %>';
            
            <% } %>
            return undefined;
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
        function get_ProjectID() {

            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        } 
        


        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
        var obj_ = {
            arg: function (imode) {
                Args = {                   
                    JOBCode: $('#F_V_txt_ProjectCode').val(),
                    ProjectName: $('#F_V_txt_ProjectName').val(),
                    StartDate: $('#F_V_txt_StartDate').val(),
                    AssignedTo: $('#F_V_ddl_AssignedTo').val(),
                    TargetEndDate: $('#F_V_txt_TargetEndDate').val(),
                    ActualEndDate: $('#F_V_txt_ActualEndDate').val(),
                    StatusID: $('#F_V_ddl_Status').val(),
                    TypeID: $('#F_V_ddl_Type').val(),
                    RelateTypeID: $('#F_V_ddl_RelateTo').val(),
                    PartyID: $('#F_V_ddl_PartyId').val(),
                    TargetBudget: $('#F_V_txt_TargetBudget').val(),
                    ProjectUrl: $('#F_V_txt_ProjectUrl').val(),
                    PriorityID: $('#F_V_ddl_Priority').val(),
                    ProgressID: $('#F_V_ddl_Progress').val(),
                    Description: $('#txtarea_Description').val(),
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    imode: imode,
                    ScreenName: 'Project',
                    ProjectID: get_ProjectID()
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            save_: function (imode) {
                $.ajax({
                    url: "../HttpHandler/ProjectsList.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                alert(data[0].res)
                            }
                        }
                    }
                });
            },
            load_autocode: function () {
                $.ajax({
                    url: "../HttpHandler/ProjectsList.ashx",
                    data: this.arg('AutoCode'),
                    cache: false,
                    success: function (data) {
                        obj_.Load_drpdowns('dropdown');
                        if (data != null) {
                            if (data.length > 0) {

                                $('#F_V_txt_ProjectCode').val(data[0].res).removeClass('invalid').addClass('valid');

                            }
                        }
                    }
                });
            },
            Load_drpdowns: function (imode) {
                $.ajax({
                    url: "../HttpHandler/ProjectsList.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                        if (get_ProjectID() != 0) {
                            obj_.fetch_details();
                        }
                        drpdowns = data;
                        $('#F_V_ddl_AssignedTo,#F_V_ddl_Status,#F_V_ddl_Type,#F_V_ddl_RelateTo,#F_V_ddl_PartyId,#F_V_ddl_Priority,#F_V_ddl_Progress').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].UserID != null) {
                                        $('#F_V_ddl_AssignedTo').append($('<option></option>').val(data[i].UserID).html(data[i].LoginID));
                                    }
                                    else if (data[i].StatusID != null) {
                                        $('#F_V_ddl_Status').append($('<option></option>').val(data[i].StatusID).html(data[i].Status));
                                    } else if (data[i].TypeID != null) {
                                        $('#F_V_ddl_Type').append($('<option></option>').val(data[i].TypeID).html(data[i].TypeName));
                                    }
                                    else if (data[i].RelateTypeID != null) {
                                        $('#F_V_ddl_RelateTo').append($('<option></option>').val(data[i].RelateTypeID).html(data[i].RelateType));
                                    }
                                    else if (data[i].PriorityID != null) {
                                        $('#F_V_ddl_Priority').append($('<option></option>').val(data[i].PriorityID).html(data[i].Priority));
                                    }
                                    else if (data[i].ProgressID != null) {
                                        $('#F_V_ddl_Progress').append($('<option></option>').val(data[i].ProgressID).html(data[i].Progress));
                                    }
                                }
                              
                            }
                        }
                        
                    }
                });
            },
            fetch_details: function () {
                $.ajax({
                    url: "../HttpHandler/ProjectsList.ashx",
                    data: this.arg('fetch'),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                               
                                $('#F_V_txt_ProjectCode').val(data[0].JOBCode).removeClass('invalid').addClass('valid');
                                $('#F_V_txt_ProjectName').val(data[0].ProjectName).removeClass('invalid').addClass('valid');
                                $('#F_V_txt_StartDate').val(data[0].StartDate);
                                $('#F_V_ddl_AssignedTo option[value=' + data[0].AssignedTo + ']').attr('selected', 'selected');
                                $('#F_V_ddl_AssignedTo').removeClass('invalid').addClass('valid');
                              

                                $('#F_V_txt_TargetEndDate').val(data[0].TargetEndDate);
                                $('#F_V_txt_ActualEndDate').val(data[0].ActualEndDate);
                                $('#F_V_ddl_Status option[value=' + data[0].StatusID + ']').attr('selected', 'selected');
                                $('#F_V_ddl_Type option[value=' + data[0].TypeID + ']').attr('selected', 'selected');
                               
                                $('#F_V_txt_TargetBudget').val(data[0].TargetBudget);
                                $('#F_V_txt_ProjectUrl').val(data[0].ProjectUrl);
                                $('#F_V_ddl_Priority option[value=' + data[0].PriorityID + ']').attr('selected', 'selected');
                                $('#F_V_ddl_Progress option[value=' + data[0].ProgressID + ']').attr('selected', 'selected');

                             
                                $('#txtarea_Description').val(data[0].Description);
                                $('#F_V_ddl_RelateTo option[value=' + data[0].RelateTypeID + ']').attr('selected', 'selected');
                                $('#F_V_ddl_RelateTo').change();
                                sessionStorage.setItem('partyid', data[0].PartyID);
                                

                            }
                        }
                    }
                });
            },
            load_relateto: function () {
                $('#F_V_ddl_PartyId').empty();
                $.ajax({
                    url: "../HttpHandler/ProjectsList.ashx",
                    data: this.arg('relate_for_p'),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].ID != null) {
                                        $('#F_V_ddl_PartyId').append($('<option></option>').val(data[i].ID).html(data[i].Name));                                     
                                    }
                                }
                                if (get_ProjectID() != 0) {
                                    $('#F_V_ddl_PartyId option[value=' + sessionStorage.getItem('partyid') + ']').attr('selected', 'selected');

                                } 

                            }
                        }
                    }
                });
            },
            save: function () {
                var form_data = $("#" + "<%=form1.ClientID%>").serializeArray();
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
                    $('#basic').append(callalert('alert', 'Please fill red bordered items.', '1'));
                    $("#basic").css("display", "block");
                    $('#basic').modal('show');
                }
                else {
                    if (get_ProjectID() == 0) {
                        obj_.save_('insert');
                    } else {
                        obj_.save_('update');
                    }

                }
            },
            cancel_: function () {
                window.history.back();
            }
        }
    
        $(document).ready(function () {
            
            obj_.load_autocode();

            $('input[name^="V_"],select[name^="V_"]').parent().children('span').remove();
            $('input[name^="V_"],select[name^="V_"]').parent().append('<span style="color:red;margin-left:10px;">*</span>');

            if (jQuery().datetimepicker) {
                // alert()
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "right",
                    autoclose: true,
                    format: 'yyyy/mm/dd',
                    startDate: -Infinity
                });
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

            $(document).on('change', '#F_V_ddl_RelateTo', function () {
                if ($(this).val() != 0) {
                    obj_.load_relateto();
                } else {
                    $('#F_V_ddl_PartyId').empty();
                }
            });


        });
        function callalert(title, content, type) {
            $('#basic').empty();
            var str = '<div class="modal-dialog">';
            str += '<div class="modal-content">';
            str += '<div class="modal-header">';
            str += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>';
            str += '<h4 class="modal-title">' + title + '</h4>';
            str += '</div>';
            str += '<div class="modal-body">';
            str += ' <img src="../assets/admin/layout/img/1429184960_messagebox_warning.png" height="48px" width="48px" alt=""> ' + content;
            str += '</div>';
            str += ' <div class="modal-footer">';
            switch (type) {
                case "1":
                    str += ' <input type="button" id="btn_Cancel" class="btn blue" data-dismiss="modal" value="Close">';
                    break;
                case "2":
                    str += ' <input type="button" id="btn_OK" class="btn blue"  value="OK">';
                    str += ' <input type="button" id="btn_Cancel" class="btn blue" data-dismiss="modal" value="Close">';
            }

            str += ' </div>';
            str += ' </div>';
            str += ' </div>';
            return str;
        }
       
    </script>
</body>


</html>
