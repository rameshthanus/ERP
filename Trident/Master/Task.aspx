<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="Trident.Master.Task" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<script type="text/javascript" src="../JavaScript/Master.js"></script>--%>

    <style type="text/css">
        .cls_div_header div span:first-child {
            float: left;
        }

        .cls_div_header div input {
            width: 150px;
            float: left;
            margin-left: 20px;
        }

        .cls_performo-header div {
            padding: 2px 12px;
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
        }

        body {
            background: #f1f3fa !important;
        }

        #btn_dialog {
            float: left;
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
            width: 100%%;
        }

        .valid {
            border: 1px solid green !important;
        }

        .cls_cal_area label {
            font-weight: bold;
        }
        .spn_files_cls{
            display:none;
        }
        .cls_cal_area {
            margin: 35px 0 0 0;
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

        .dataTables_scrollBody {
            height: auto !important;
        }

        .cls_chk_remove {
            cursor: pointer;
            color: blue;
        }

        .nav-tabs, .nav-pills {
            margin-bottom: 0 !important;
            border-bottom: 1px solid rgb(213, 213, 213);
        }

        .hide_ {
            display: none !important;
        }

        .cls_options {
            z-index: 4;
        }

            .cls_options > div {
                padding: 0 15px !important;
            }

                .cls_options > div a:first-child {
                    float: left;
                }

        .purple-plum.btn {
            background-color: #8DADB8 !important;
        }

        .cls_white {
            background-color: white;
            color: black;
        }

        #dv_usergrp {
            width: 200px;
            height: 150px;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 2px 10px;
        }

            #dv_usergrp table tr td:first-child {
                padding-left: 0;
            }
            .disp_{
                display:none;
            }
        #tbl_users thead {
            border-bottom: 1px solid #ccc;
        }

        #tbl_users, #tbl_usergrp {
            width: 100%;
        }

        #dv_users {
            width: 200px;
            height: 250px;
            overflow-y: auto;
            border: 1px solid #ccc;
        }

            #dv_users table thead tr td, #dv_users table tbody tr td {
                padding: 5px 10px;
            }

        .cls_usergrp_users {
            border-bottom: 1px solid #67809F;
  background-color: rgb(103, 128, 159);
  padding: 2px 10px !important;
  color: white;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
    <link href="../assets/global/plugins/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../assets/global/plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css" rel="stylesheet" />


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


</head>
<body onload="resizeIframe()">
    <form id="form1" runat="server">
        <div id="full_bdy">
            <div class="row">
                <div>
                    <div id="Div1" class="cls_bdy_tp">
                        <table>
                            <tr>
                                <td>
                                    <ul id="ul1">
                                           <li>
                                            <input id="btn_MyTask" class=" btn btn green btn-md" type="button" value="My Task" onclick="obj_.MyTask_();" /></li>

                                        <li>
                                            <input id="btn_list" class=" btn btn green btn-md" type="button" value="Task List" onclick="obj_.List_();" /></li>

                                        <li>
                                            <input id="btn_back" class=" btn btn green btn-md" type="button" value="Back" onclick="obj_.back_();" /></li>

                                        <li>
                                            <input id="btn_save" class="cls_disabled btn green" type="button" value="Save -(F7)"
                                                onclick="obj_.save();" /></li>
                                        <li class="cls_disabled">
                                            <input class="cls_disabled btn green" type="button" value="Search -(F8)" onclick="obj_.searchlist();" />
                                        </li>
                                        <li class="cls_disabled">
                                            <input type="button" class="cls_disabled btn green" value="Clear -(Alt+Shift+C)"
                                                onclick="obj_.clear();" /></li>
                                        <li class="cls_disabled">
                                            <input type="button" class="cls_disabled btn green" value="Exit -(F9)" onclick="obj_.exit();" /></li>
                                        <li>
                                            <div id="drop" style="border: 2px solid #45B256; /* margin-top: 10px; */ /* height: 43px; */ width: 180px; float: left; /* margin-right: 1%; */text-align: center; padding: 10px; /* background-color: #45B256; *//* color: white; */">Drop an XLSX</div>
                                            <a class="btn" title="Sample Excel File" style="padding: 1px 4px; position: relative; top: 17px; /* left: 28px; *" href="../Excel/book_task.xlsx" target="_self"><i class="fa fa-download"></i></a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="portlet box blue-hoki">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-gift"></i>Task
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                            class="config"></a><a href="javascript:;" class="reload"></a>
                    </div>
                </div>
                <div class="portlet-body cls_performo-header" style="height: 286px;">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-xs-3">
                                    <label class="control-label req">Task Code</label>
                                </div>
                                <div class="col-xs-3">
                                    <input type="text" class="form-control" id="F_V_txt_taskcode" name="txt_taskcode" />
                                </div>
                                <div class="col-xs-3">
                                    <label class="control-label req">Task Name</label>
                                </div>
                                <div class="col-xs-3">
                                    <input type="text" class="form-control cls_checking invalid date-picker" id="F_V_txt_taskname" name="V_txt_taskname" />

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3">
                                    <label class="control-label req">JobNo</label>
                                </div>
                                <div class="col-xs-3">
                                    <select class="form-control cls_checking invalid" id="F_V_JobNo" name="V_ddl_JobNo">
                                    </select>
                                </div>
                                <div class="col-xs-3">
                                    <label class="control-label req">Priority</label>
                                </div>
                                <div class="col-xs-3">
                                    <select class="form-control cls_checking invalid" id="F_V_ddl_priority" name="V_ddl_priority">
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3">
                                    <label class="control-label ">Status</label>
                                </div>
                                <div class="col-xs-3">
                                    <select class="form-control cls_checking invalid" id="F_V_ddl_status" name="V_ddl_status">
                                    </select>
                                </div>
                                <div class="col-xs-3">
                                    <label class="control-label req">Progress</label>
                                </div>
                                <div class="col-sm-3  col-xs-3">
                                    <select class="form-control cls_checking invalid" id="F_V_ddl_progress" name="V_ddl_progress">
                                        <option value="0">--select--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 col-xs-3">
                                    <label class="control-label ">Start Date</label>
                                </div>
                                <div class="col-xs-3">
                                    <div class="input-group date form_datetime" data-date="2012-12-21T15:25:00Z" style="padding: 0">
                                        <input type="text" size="16" class="form-control cls_checking invalid" id="F_V_txt_startdate" name="V_txt_startdate" />
                                        <span class="input-group-btn">
                                            <button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
                                            <button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-sm-3 col-xs-3">
                                    <label class="control-label ">End Date</label>
                                </div>
                                <div class="col-xs-3">
                                    <div class="input-group date form_datetime" data-date="2012-12-21T15:25:00Z" style="padding: 0">
                                        <input type="text" size="16" class="form-control cls_checking invalid" id="F_V_txt_enddate" name="V_txt_enddate" />
                                        <span class="input-group-btn">
                                            <button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
                                            <button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
                                        </span>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-3 col-xs-3">
                                    <label class="control-label ">Description</label>
                                </div>
                                <div class="col-xs-6">
                                    <textarea rows="3" cols="40" class="form-control cls_checking invalid" id="F_V_txt_description" name="V_txt_description"></textarea>
                                </div>
                                <div class="col-sm-3 col-xs-3">
                                    <button type="button" data-dismiss="modal" class="btn blue" id="btn_Add">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">

                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span>Task List</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover" id="sample">
                                <thead>
                                    <tr>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>



            <div class="row">
                <div class="col-xs-12">

                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span>Assign</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body" style="height: 300px;">
                            <div class="col-md-4 col-xs-4">
                                <span style="float: left; margin-right: 20px;">User Group</span>

                                <div id="dv_usergrp">
                                    <table id="tbl_usergrp">
                                    </table>
                                </div>

                            </div>

                            <div class="col-xs-6">
                                <span style="float: left; margin-right: 20px;">Users</span>

                                <div id="dv_users">
                                    <table id="tbl_users">
                                        <thead>
                                            <tr>
                                                <td>
                                                    <input type="checkbox" id="chk_all" class="cls_users_chk" /></td>
                                                <td>Users</td>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>

                            </div>


                        </div>
                        <!-- END EXAMPLE TABLE PORTLET-->
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hdnUploadFilePath" runat="server" ClientIDMode="Static" />
    </form>

    <%--   <script src="../JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
    --%>

    <script src='../JavaScript/jquery-1.9.1.min.js' type="text/javascript"></script>
    <script src='../JavaScript/comman_Validation.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-1.11.0.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-migrate-1.2.1.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js' type="text/javascript"></script>

    <link href="../Css/uploadify.css" rel="stylesheet" />
    <script src="../JavaScript/jquery.uploadify.js"></script>

    <script type="text/javascript" src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
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
        function get_TASKID() {
            // return 15;
            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }

        function get_ID() {

            <% if (Request.QueryString["projectid"] != null)
               { %>
            return '<%= Request.QueryString["projectid"] %>';
            
            <% } %>
            return 0;
        }


        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }

        var initTable5 = function (tbl) {

            var table = $('#' + tbl);

            /* Fixed header extension: http://datatables.net/extensions/scroller/ */

            $.extend(true, $.fn.DataTable.TableTools.classes, {
                "container": "btn-group tabletools-dropdown-on-portlet",
                "buttons": {
                    "normal": "btn btn-sm default",
                    "disabled": "btn btn-sm default disabled"
                },
                "collection": {
                    "container": "DTTT_dropdown dropdown-menu tabletools-dropdown-menu"
                }
            });

            var oTable = table.dataTable({
                //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable

                //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
                "dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // datatable layout without  horizobtal scroll
                //"scrollY": "300",
                "deferRender": true,
                //"order": [
                //    [1, 'asc']
                //],
                "lengthMenu": [
                    [4, 15, 20, -1],
                    [4, 10, 15, 20, "All"] // change per page values here
                ],
                "pageLength": 20, // set the initial value            

                "tableTools": {
                    "sSwfPath": "../assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
                    "aButtons": [{
                        "sExtends": "pdf",
                        "sButtonText": "PDF"
                    }, {
                        "sExtends": "csv",
                        "sButtonText": "CSV"
                    }, {
                        "sExtends": "xls",
                        "sButtonText": "Excel"
                    }, {
                        "sExtends": "print",
                        "sButtonText": "Print",
                        "sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
                        "sMessage": "Generated by DataTables"
                    }, {
                        "sExtends": "copy",
                        "sButtonText": "Copy"
                    }]
                }
                //"fnInitComplete": function () {

                //},

            });


            var tableWrapper = $('#' + tbl + '_wrapper'); // datatable creates the table wrapper by adding with id {your_table_jd}_wrapper
            tableWrapper.find('.dataTables_length select').select2(); // initialize select2 dropdown

            return oTable;
        }


        var users = [], final_users = [], user_grp = [], obj_tbl, table_id_count = 0, att1 = [];
        var ind_ = 0, mode = 'new', table_ind_ = -1;

        var obj_ = {
            arg: function (imode, hmode) {
                Args = {
                    TaskListID: get_TASKID(),
                    TaskListDetailID: 0,
                    UserGroupID: 0,
                    UserID: 0,
                    JobID: ($('#F_V_JobNo').val() == null ? 0 : $('#F_V_JobNo').val()),
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    iMode: imode,
                    hmode: hmode,
                    ScreenName: 'Task'
                }
                return Args;
            },
            arg_header: function (imode, hmode) {
                Arg_h = {
                    TaskID: get_TASKID(),
                    TaskCode: ($('#F_V_txt_taskcode').val() == "" ? 0 : $('#F_V_txt_taskcode').val()),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    CompanyID: get_CompanyID(),
                    iMode: imode,
                    hmode: hmode
                }
                return Arg_h;
            },
            arg_detail: function (TaskID, user_grp_id, user_id, index, imode, hmode) {
                Arg_d = {
                    TaskListID: TaskID,
                    UserGroupID: user_grp_id,
                    UserID: user_id,
                    TaskName: $('#taskname_' + index).text(),
                    JobID: $('#jobcode_' + index).text(),
                    PriorityID: $('#priority_' + index).text(),
                    StatusID: $('#status_' + index).text(),
                    ProgressID: $('#progress_' + index).text(),
                    StartDate: $('#startdate_' + index).text(),
                    EndDate: $('#enddate_' + index).text(),
                    Description: $('#description_' + index).text(),
                    Documents: $('#spn_files_' + index).text(),
                    Comments: $('#comments_' + index).val(),
                    CancelReason: '',
                    imode: imode,
                    hmode: hmode
                }
                return Arg_d;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            searchlist: function () {
                window.location.href = '../SearchList.aspx?pg=TASK';
            },
            clear: function () {
                obj_.get_autocode('autocode', 'search');
                $('#F_V_txt_taskname,#F_V_txt_startdate,#F_V_txt_enddate,#F_V_txt_description').val('').removeClass('valid').addClass('invalid');
                $('#F_V_JobNo option[value=0],#F_V_ddl_priority option[value=0],#F_V_ddl_status option[value=0],#F_V_ddl_progress option[value=0]').attr('selected', 'selected');
                $('#F_V_JobNo,#F_V_ddl_priority,#F_V_ddl_status,#F_V_ddl_progress').removeClass('valid').addClass('invalid');
                if (obj_tbl != undefined) {
                    $('#sample').dataTable().fnClearTable();
                }
                ind_ = 0; table_id_count = 0;
                for (var i = 0; i < user_grp.length; i++) {
                    $('#tbl_users tbody tr[id=' + user_grp[i] + ']').remove();
                }
                $('.cls_chk').prop('checked', false);
                final_users = [], user_grp = [];

            },
            exit: function () {
                window.location.href = "../HomeContentPage.aspx";
            },
            back_: function () {
                window.history.back();
            },
            List_:function(){
                window.location.href = "../CRM/TaskList.aspx";
            },
            MyTask_: function () {
                window.location.href = "../CRM/MyTask.aspx";
            },
            get_autocode: function (imode, hmode) {
                // alert()
                $.ajax({
                    url: "../HttpHandler/TaskList.ashx",
                    data: this.arg(imode, hmode),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_txt_taskcode').val(data[0].res);
                            }
                        }
                    }
                });
            },
            get_drpdowns: function (imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/TaskList.ashx",
                    data: this.arg(imode, hmode),
                    cache: false,
                    success: function (data) {
                        obj_.get_autocode('autocode', 'search');
                        if (get_TASKID() != 0) {
                            obj_.fetch_detail('fetch', 'fetch-detail');
                        }
                        $('#F_V_ddl_priority,#F_V_ddl_status,#F_V_ddl_progress,#F_V_JobNo').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0, j = 0; i < data.length; i++) {
                                    if (data[i].JOBID != null) {
                                        $('#F_V_JobNo').append($('<option></option>').val(data[i].JOBID).html(data[i].JOBCode));
                                    } else
                                        if (data[i].PriorityID != null) {
                                            $('#F_V_ddl_priority').append($('<option></option>').val(data[i].PriorityID).html(data[i].Priority));
                                        } else if (data[i].StatusID != null) {
                                            $('#F_V_ddl_status').append($('<option></option>').val(data[i].StatusID).html(data[i].Status));
                                        }
                                        else if (data[i].ProgressID != null) {
                                            $('#F_V_ddl_progress').append($('<option></option>').val(data[i].ProgressID).html(data[i].Progress));
                                        }
                                        else if (data[i].UserGroupID != null) {
                                            $('#tbl_usergrp').append('<tr><td><input type="checkbox" id="chk' + (j++) + '" class="cls_chk" value=' + data[i].UserGroupID + ' /></td><td>' + data[i].UserGroup + '</td></tr>');
                                        } else {
                                            users.push(data[i]);
                                        }
                                }
                                var id = get_ID();
                                if (id != 0) {
                                    $('#F_V_JobNo option[value=' + id.split('-')[2] + ']').attr('selected', 'selected');
                                    $('#F_V_JobNo').removeClass('invalid').addClass('valid');

                                }
                            }
                        }
                    }
                });
            },

            fetch_detail: function (imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/TaskList.ashx",
                    data: this.arg(imode, hmode),
                    cache: false,
                    success: function (data) {
                        user_grp = [], final_users = [];
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_txt_taskcode').val(data[0].TaskCode);
                                if (obj_tbl != undefined) {
                                    $('#sample').dataTable().fnDestroy();
                                } else {
                                    $('#sample thead tr').empty();
                                    var sth = '<th></th><th>Task Name</th><th style="display:none">JobCode</th><th>Priority</th><th>Status</th><th>Progress</th><th>Start Date</th><th>End Date</th><th>Description</th><th></th><th>Comment</th>';
                                    $('#sample thead tr').append(sth);
                                }
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].usergroupid == null) {                                       
                                        var str = '<tr><td><span id=' + ind_ + ' class="cls_chk_edit" ><I class="fa fa-edit"/></span>/<span id=' + ind_ + ' class="cls_chk_remove" ><I class="fa fa-minus-circle"/></span></td></td><td><span id="taskname_' + ind_ + '">' + data[i].TaskName + '</span></td><td><span style="display:none" id="jobcode_' + ind_ + '">' + data[i].JobID + '</span><span>' + data[i].JOBCode + '</span></td>' +
                                        '<td><span style="display:none" id="priority_' + ind_ + '">' + data[i].PriorityID + '</span><span>' + data[i].Priority + '</span></td><td><span style="display:none" id="status_' + ind_ + '">' + data[i].StatusID + '</span><span>' + data[i].Status + '</span></td>' +
                                        '<td><span style="display:none" id="progress_' + ind_ + '">' + data[i].ProgressID + '</span><span>' + data[i].Progress + '</span></td><td><span id="startdate_' + ind_ + '">' + data[i].StartDate + '</span></td>' +
                                        '<td><span id="enddate_' + ind_ + '">' + data[i].EndDate + '</span></td><td><span id="description_' + ind_ + '">' + data[i].Description + '</span></td><td><input type="file" name="file_upload' + ind_ + '" id="file_upload_' + ind_ + '" class="file_upload"/><span class="spn_files_cls" id="spn_files_' + ind_ + '"></span><div class="filename_"></div><div><img class="imgs_" id="img_' + ind_ + '" src=""/></div></td>' +
                                        '<td><textarea id="comments_' + ind_ + '" cols="20" rows="3">' + data[i].Comments + '</textarea></td>';
                                        table_id_count++; ind_++;
                                        $('#sample tbody').append(str);
                                     
                                       
                                        if (data[i].DocumentPath != '') {
                                            var file_ = data[i].DocumentPath.split('\\');
                                            var path_ = '';
                                            for (var j = 0; j < file_.length - 1; j++) {
                                                path_ = path_ + file_[j] + '\\';
                                            }
                                            $('#img_' + (ind_ - 1)).attr('src', '../' + file_[file_.length - 3] + '/' + file_[file_.length - 1]);
                                            $('#img_' + (ind_ - 1)).css('height', 'auto');
                                            $('#img_' + (ind_ - 1)).css('width', '100px');

                                            var r = "<div id=" + file_[file_.length - 1].split('.')[0] + " style='width:250px;padding: 10px 5px;height: 30px;'><div style='width:90%;float: left;word-break: break-all;'><a style='text-decoration: none' class='dellink' href='../HttpHandler/Upload.ashx?filepath=" + path_ + "&file=" + file_[file_.length - 1] + "' >" + file_[file_.length - 1] + "</a></div><div style='width:20px;float:left'><a href='#' class='dellink' onclick='deleterow(\"" + file_[file_.length - 1] + "\"," + (ind_-1) + ")'><i class='fa fa-times'></i></a></div></div>";

                                            // setTimeout(function () {
                                            //   alert(r)
                                            $("#file_upload_" + (ind_ - 1)).parent().children('.filename_').empty();
                                            $("#file_upload_" + (ind_ - 1)).parent().children('.filename_').append(r);
                                            // }, 2000)

                                            $("#spn_files_" + (ind_ - 1)).text(data[i].DocumentPath);
                                        }
                                    }
                                    else {
                                        user_grp.push('' + data[i].usergroupid + '');
                                        final_users.push(data[i].users);
                                        final_users[final_users.length - 1] = new Array();
                                        $(".cls_chk[value='" + data[i].usergroupid + "']").prop('checked', true);
                                        $('tr[id=' + data[i].usergroupid + '] .cls_users_chk').prop('checked', false);

                                        $('#tbl_users tbody').append('<tr id=' + data[i].usergroupid + '><td colspan="2" class="cls_usergrp_users">' + $(".cls_chk[value='" + data[i].usergroupid + "']").parent().next().html() + '</td></tr>');
                                        for (var k = 0; k < users.length; k++) {
                                            if (users[k].GroupID == data[i].usergroupid) {
                                                $('#tbl_users tbody').append('<tr id=' + data[i].usergroupid + '><td><input type="checkbox" id="chk_users' + k + '" class="cls_users_chk" value=' + users[k].UserID + ' /></td><td>' + users[k].LoginID + '</td></tr>');
                                            }
                                        }

                                        var users_ = data[i].users.split(',');
                                        for (var j = 0; j < users_.length; j++) {
                                            $(".cls_users_chk[value='" + users_[j] + "']").prop('checked', true);
                                            final_users[final_users.length - 1].push(Number(users_[j]));
                                        }
                                    }
                                }
                                obj_tbl = initTable5('sample');
                                resizeIframe();
                                $('#sample tbody tr td:nth-child(3)').addClass('disp_');
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].usergroupid == null) {
                                        img_init(i);
                                    }
                                }
                            }
                        }
                    }
                });
            },
            save: function () {
                if ($('#sample tbody tr').length == 0) {
                    alert('Please create one task');
                } else {
                    if ($('.cls_users_chk').is(':checked') == true) {
                        if (get_TASKID() == 0) {
                            obj_.save_header('insert', 'header');
                        } else {
                            obj_.save_header('update', 'header');
                        }
                    } else {
                        alert('Please select one user');
                    }
                }
            },
            save_header: function (imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/TaskList.ashx",
                    data: this.arg_header(imode, hmode),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                if (data[0].res == "saved") {
                                    obj_.save_detail(data[0].TaskID, 'insert', 'detail');
                                } else {
                                    alert(data[0].res);
                                }
                            }
                        }
                    }
                });
            },
            save_detail: function (TaskListID, imode, hmode) {
                var users = '';
                for (var i = 0; i < final_users.length; i++) {
                    for (var j = 0; j < final_users[i].length; j++) {
                        users += ',' + final_users[i][j];
                    }
                }
                users = users.substring(1, users.length);
                var req = $('#sample tbody tr').length, res = 0;
                for (var i = 0; i < table_id_count; i++) {
                    if ($('#taskname_' + i).text() != "") {
                        $.ajax({
                            url: "../HttpHandler/TaskList.ashx",
                            data: this.arg_detail(TaskListID, 0, users, i, imode, hmode),
                            cache: false,
                            success: function (data) {
                                res++;
                                if (req == res) {
                                    if (data != null) {
                                        if (data.length > 0) {
                                            alert(data[0].res);
                                            obj_.get_autocode('autocode', 'autocode');
                                        }
                                    }
                                }
                            }
                        });
                    }
                }
            },
            config_table: function () {
                if ($('.cls_checking').hasClass('invalid')) {
                    $('.invalid').css('border', '1px solid red');
                    alert('Please fill red bordered items');
                }
                else {
                    if (mode == 'new') {
                        if (obj_tbl != undefined) {
                            $('#sample').dataTable().fnDestroy();
                        } else {
                            $('#sample thead tr').empty();
                            var sth = '<th></th><th>Task Name</th><th style="display:none">JobCode</th><th>Priority</th><th>Status</th><th>Progress</th><th>Start Date</th><th>End Date</th><th>Description</th><th></th><th>Comment</th>';
                            $('#sample thead tr').append(sth);
                        }
                        var str = '<tr><td><span id=' + ind_ + ' class="cls_chk_edit" ><I class="fa fa-edit"/></span>/<span id=' + ind_ + ' class="cls_chk_remove" ><I class="fa fa-minus-circle"/></span></td><td><span id="taskname_' + ind_ + '">' + $('#F_V_txt_taskname').val() + '</span></td><td ><span style="display:none" id="jobcode_' + ind_ + '">' + $('#F_V_JobNo').val() + '</span><span >' + $('#F_V_JobNo  option:selected').text() + '</span></td>' +
                            '<td><span style="display:none" id="priority_' + ind_ + '">' + $('#F_V_ddl_priority').val() + '</span><span>' + $('#F_V_ddl_priority option:selected').text() + '</span></td><td><span style="display:none" id="status_' + ind_ + '">' + $('#F_V_ddl_status').val() + '</span><span>' + $('#F_V_ddl_status option:selected').text() + '</span></td>' +
                            '<td><span style="display:none" id="progress_' + ind_ + '">' + $('#F_V_ddl_progress').val() + '</span><span>' + $('#F_V_ddl_progress option:selected').text() + '</span></td><td><span id="startdate_' + ind_ + '">' + $('#F_V_txt_startdate').val() + '</span></td>' +
                            '<td><span id="enddate_' + ind_ + '">' + $('#F_V_txt_enddate').val() + '</span></td><td><span id="description_' + ind_ + '">' + $('#F_V_txt_description').val() + '</span></td><td><input type="file" name="file_upload' + ind_ + '" id="file_upload_' + ind_ + '" class="file_upload"/><span class="spn_files_cls" id="spn_files_' + ind_ + '"></span><div class="filename_"></div><div><img class="imgs_" id="img_'+ind_+'" src=""/></div></td>' +
                            '<td><textarea id="comments_'+ind_+'" cols="20" rows="3"></textarea></td>';
                        ind_++; table_id_count++;
                        $('#sample tbody').append(str);
                        obj_tbl = initTable5('sample');
                      // img_init((ind_ - 1));
                        for (var i = 0; i < ind_; i++) {
                            if ($('#taskname_' + i).text() != "") {
                                img_init(i);
                                $("#file_upload_" + i).parent().children('.fileUploadQueue:gt(0)').remove();
                                $("#file_upload_" + i).parent().children('.fileUploaderBtn:gt(0)').remove();
                            }
                        }
                        $('#sample tbody tr td:nth-child(3)').addClass('disp_');
                    }
                    else {
                        $('#taskname_' + table_ind_).text($('#F_V_txt_taskname').val());
                        $('#jobcode_' + table_ind_).text($('#F_V_JobNo').val());
                        $('#jobcode_' + table_ind_).next().text($('#F_V_JobNo  option:selected').text())
                        $('#priority_' + table_ind_).text($('#F_V_ddl_priority').val());
                        $('#priority_' + table_ind_).next().text($('#F_V_ddl_priority  option:selected').text())
                        $('#status_' + table_ind_).text($('#F_V_ddl_status').val());
                        $('#status_' + table_ind_).next().text($('#F_V_ddl_status  option:selected').text())
                        $('#progress_' + table_ind_).text($('#F_V_ddl_progress').val());
                        $('#progress_' + table_ind_).next().text($('#F_V_ddl_progress  option:selected').text())
                        $('#startdate_' + table_ind_).text($('#F_V_txt_startdate').val());
                        $('#enddate_' + table_ind_).text($('#F_V_txt_enddate').val());
                        $('#description_' + table_ind_).text($('#F_V_txt_description').val());

                        $('#F_V_JobNo,#F_V_ddl_priority,#F_V_ddl_status,#F_V_ddl_progress').removeClass('invalid').addClass('valid');
                    }
                    $('#F_V_txt_taskname,#F_V_txt_startdate,#F_V_txt_enddate,#F_V_txt_description').val('').removeClass('valid').addClass('invalid');
                    $('#F_V_JobNo option[value=0],#F_V_ddl_priority option[value=0],#F_V_ddl_status option[value=0],#F_V_ddl_progress option[value=0]').attr('selected', 'selected');
                    $('#F_V_JobNo,#F_V_ddl_priority,#F_V_ddl_status,#F_V_ddl_progress').removeClass('valid').addClass('invalid');
                    $('#F_V_txt_taskname').focus();
                    mode = 'new';

                }
                resizeIframe();
            }
        }
        img_init = function (ind) {
         
            $("#file_upload_" + ind).fileUpload({
                'uploader': '../JavaScript/uploader.swf',
                'cancelImg': '../Images/cancel.png',
                'buttonText': 'Browse Files',
                'script': '../HttpHandler/attachment.ashx',
                'folder': 'uploads',
                'fileDesc': 'Image Files',
                'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
                'multi': true,
                'auto': true,
                onComplete: function (event, queueID, fileObj, response, data) {
                    if (event.type == "rfuComplete") {
                        var s = response.split('/');
                        var hdnid = 'new';
                        var path = $('#<%=hdnUploadFilePath.ClientID%>').val();
                        var file = path.replace(/\\/g, "\\") + '\\' + s[1];
                        //att1.push(file);
                        var p=path.split('\\');
                        $('#img_' + ind).attr('src','../'+ p[p.length-2] +'/'+ s[1]);
                        $('#img_' + ind).css('height', 'auto');
                        $('#img_' + ind).css('width', '100px');
                        var r = "<div id=" + s[1].split('.')[0] + " style='width:250px;padding: 10px 5px;height: 30px;'><div style='width:90%;float: left;word-break: break-all;'><a style='text-decoration: none' class='dellink' href='../HttpHandler/Upload.ashx?filepath=" + path + "&file=" + s[1] + "' >" + s[1] + "</a></div><div style='float:left'><a href='#' class='dellink' onclick='deleterow(\"" + s[1] + "\"," + ind + ")'><i class='fa fa-times'></i></a></div></div>";
                        $("#file_upload_" + ind).parent().children('.filename_').empty();
                        $("#file_upload_" + ind).parent().children('.filename_').append(r);
                        if ($("#spn_files_" + ind).text() != '') {
                            var r = $("#spn_files_" + ind).text().split('\\');
                           // deleterow(r[r.length - 1], ind);
                            $("#spn_files_" + ind).text('');
                            var str = r[r.length - 1].split(",");
                            var file1 = str[0];
                            var path = $('#hdnUploadFilePath').val();
                            $.ajax({
                                url: "../HttpHandler/attachment.ashx?path=" + path + "&file=" + file1,
                                type: "GET",
                                cache: false,
                                async: true,
                                success: function (html) {
                                    $('#' + r[r.length - 1].split('.')[0]).remove();
                                }
                            });                          
                        }
                        $("#spn_files_" + ind).text(file);
                    }
                },
                onCancel: function (file) {
                    alert('The file ' + file.name + ' was cancelled.');
                },
                'onUploadSuccess': function (file, data, response) {
                    alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
                }
            });
        }

        function deleterow(divrow, ind) {
            var str = divrow.split(",");

            var file = str[0];
            var path = $('#hdnUploadFilePath').val();
           
            if (confirm('Are you sure to delete?')) {
                $.ajax({
                    url: "../HttpHandler/attachment.ashx?path=" + path + "&file=" + file,
                    type: "GET",
                    cache: false,
                    async: true,
                    success: function (html) {

                        $("#spn_files_" + ind).text('');
                        
                        $('#img_' + ind).attr('src', '');
                        $('#img_' + ind).css('height', '0');
                        $('#img_' + ind).css('width', '0');

                        $('#' + divrow.split('.')[0]).remove();
                    }
                });
            }
            return false;
        }
        $(document).ready(function () {

            obj_.get_drpdowns('combobind', 'search');

            setTimeout(function () {
                var today = new Date();
                if (jQuery().datetimepicker) {
                    // alert()
                    $(".form_datetime").datetimepicker({
                        isRTL: Metronic.isRTL(),
                        format: "yyyy/mm/dd hh:ii",
                        autoclose: true,
                        todayBtn: true,
                        startDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()),
                        pickerPosition: (Metronic.isRTL() ? "bottom-right" : "bottom-left"),
                        minuteStep: 1
                    });
                }
            }, 0);

            $(document).on('click', '.cls_chk', function () {
                var chk_val = $(this).val();
                if ($(this).is(':checked')) {
                    user_grp.push(chk_val);
                    final_users.push(chk_val);
                    final_users[final_users.length - 1] = new Array();
                    $('#tbl_users tbody').append('<tr id=' + chk_val + '><td colspan="2" class="cls_usergrp_users">' + $(this).parent().next().html() + '</td></tr>');
                    for (var i = 0; i < users.length; i++) {
                        if (users[i].GroupID == chk_val) {
                            $('#tbl_users tbody').append('<tr id=' + chk_val + '><td><input type="checkbox" id="chk_users' + i + '" class="cls_users_chk" value=' + users[i].UserID + ' /></td><td>' + users[i].LoginID + '</td></tr>');
                            final_users[final_users.length - 1].push(users[i].UserID);
                        }
                    }
                    $('tr[id=' + chk_val + '] .cls_users_chk').prop('checked', true);
                } else {
                    $('#tbl_users tbody tr[id=' + chk_val + ']').remove();
                    final_users.splice(user_grp.indexOf(chk_val), 1);
                    user_grp.splice(user_grp.indexOf(chk_val), 1);
                }
            });

            $(document).on('click', '#chk_all', function () {
                if ($(this).is(':checked')) {
                    $('.cls_users_chk').prop('checked', true);
                    for (var i = 0; i < user_grp.length; i++) {
                        for (var j = 0; j < users.length; j++) {
                            if (users[j].GroupID == user_grp[i]) {
                                if (final_users[i].indexOf(users[j].UserID) == -1) {
                                    final_users[i].push(users[j].UserID);
                                }
                            }
                        }
                    }
                } else {
                    $('.cls_users_chk').prop('checked', false);
                    for (var i = 0; i < user_grp.length; i++) {
                        final_users[i] = [];
                    }
                }
            });

            $(document).on('click', '.cls_chk_edit', function () {
                table_ind_ = $(this)[0].id;
                mode = 'edit';
                $('#F_V_txt_taskname').val($('#taskname_' + table_ind_).text()).removeClass('invalid').addClass('valid');

                $('#F_V_JobNo option[value=' + $('#jobcode_' + table_ind_).text() + ']').attr('selected', 'selected');
                $('#F_V_ddl_priority option[value=' + $('#priority_' + table_ind_).text() + ']').attr('selected', 'selected');
                $('#F_V_ddl_status option[value=' + $('#status_' + table_ind_).text() + ']').attr('selected', 'selected');
                $('#F_V_ddl_progress option[value=' + $('#progress_' + table_ind_).text() + ']').attr('selected', 'selected');

                $('#F_V_txt_startdate').val($('#startdate_' + table_ind_).text()).removeClass('invalid').addClass('valid');
                $('#F_V_txt_enddate').val($('#enddate_' + table_ind_).text()).removeClass('invalid').addClass('valid');
                $('#F_V_txt_description').val($('#description_' + table_ind_).text()).removeClass('invalid').addClass('valid');


                $('#F_V_JobNo,#F_V_ddl_priority,#F_V_ddl_status,#F_V_ddl_progress').removeClass('invalid').addClass('valid');
            });

            $(document).on('click', '.cls_users_chk', function () {
                //console.log($(this).val())
                var chk_val = $(this).val();
                var id = $(this).parent().parent()[0].id;
                //console.log(id)
                if ($(this).is(':checked')) {
                    if (final_users[user_grp.indexOf(id)] != undefined) {
                        if (final_users[user_grp.indexOf(id)].indexOf(chk_val) == -1) {
                            final_users[user_grp.indexOf(id)].push(Number(chk_val));
                        }
                    }
                } else {
                    // console.log('here'); console.log(final_users[user_grp.indexOf(id)])
                    if (final_users[user_grp.indexOf(id)] != undefined) {
                        final_users[user_grp.indexOf(id)].splice(final_users[user_grp.indexOf(id)].indexOf(Number(chk_val)), 1);
                    }
                }
            });


            $(document).on('click', '#btn_Add', function () {
                obj_.config_table();
            });


            $(document).on('click', '.cls_chk_remove', function () {
                var table = $('#sample').DataTable();
                table.row($(this).parents('tr')).remove().draw();
            });

            $(document).on('change', 'input,textarea,select', function () {
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
        });



    </script>

    <script src="../JavaScript/shim.js"></script>
    <script src="../JavaScript/jszip.js"></script>
    <script src="../JavaScript/xlsx.js"></script>
    <!-- uncomment the next line here and in xlsxworker.js for ODS support -->
    <script src="../JavaScript/ods.js"></script>

    <script>


        var X = XLSX;
        var XW = {
            /* worker message */
            msg: 'xlsx',
            /* worker scripts */
            rABS: '../JavaScript/xlsxworker2.js',
            norABS: '../JavaScript/xlsxworker1.js',
            noxfer: '../JavaScript/xlsxworker.js'
        };

        var rABS = typeof FileReader !== "undefined" && typeof FileReader.prototype !== "undefined" && typeof FileReader.prototype.readAsBinaryString !== "undefined";

        var use_worker = typeof Worker !== 'undefined';

        var transferable = use_worker;


        var wtf_mode = false;

        function fixdata(data) {
            var o = "", l = 0, w = 10240;
            for (; l < data.byteLength / w; ++l) o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w, l * w + w)));
            o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w)));
            return o;
        }

        function ab2str(data) {
            var o = "", l = 0, w = 10240;
            for (; l < data.byteLength / w; ++l) o += String.fromCharCode.apply(null, new Uint16Array(data.slice(l * w, l * w + w)));
            o += String.fromCharCode.apply(null, new Uint16Array(data.slice(l * w)));
            return o;
        }

        function s2ab(s) {
            var b = new ArrayBuffer(s.length * 2), v = new Uint16Array(b);
            for (var i = 0; i != s.length; ++i) v[i] = s.charCodeAt(i);
            return [v, b];
        }

        function xw_noxfer(data, cb) {
            var worker = new Worker(XW.noxfer);
            worker.onmessage = function (e) {
                switch (e.data.t) {
                    case 'ready': break;
                    case 'e': console.error(e.data.d); break;
                    case XW.msg: cb(JSON.parse(e.data.d)); break;
                }
            };
            var arr = rABS ? data : btoa(fixdata(data));
            worker.postMessage({ d: arr, b: rABS });
        }

        function xw_xfer(data, cb) {
            var worker = new Worker(rABS ? XW.rABS : XW.norABS);
            worker.onmessage = function (e) {
                switch (e.data.t) {
                    case 'ready': break;
                    case 'e':
                        console.error(e.data.d); break;
                    default:
                        xx = ab2str(e.data).replace(/\n/g, "\\n").replace(/\r/g, "\\r");
                        console.log("done");
                        cb(JSON.parse(xx)); break;
                }
            };
            if (rABS) {
                var val = s2ab(data);
                worker.postMessage(val[1], [val[1]]);
            } else {
                worker.postMessage(data, [data]);
            }
        }

        function xw(data, cb) {
            transferable = true;// document.getElementsByName("xferable")[0].checked;
            if (transferable) xw_xfer(data, cb);
            else xw_noxfer(data, cb);
        }

        function get_radio_value(radioName) {
            var radios = document.getElementsByName(radioName);
            for (var i = 0; i < radios.length; i++) {
                if (radios[i].checked || radios.length === 1) {
                    return radios[i].value;
                }
            }
        }

        function to_json(workbook) {
            var result = {};
            workbook.SheetNames.forEach(function (sheetName) {
                var roa = X.utils.sheet_to_row_object_array(workbook.Sheets[sheetName]);
                if (roa.length > 0) {
                    result[0] = roa;
                }
            });
            return result;
        }


        function process_wb(wb) {
            var output = "";
            switch ("json") {
                case "json":
                    // output = JSON.stringify(to_json(wb), 2, 2);
                    output = to_json(wb);
                    break;
                case "form":
                    output = to_formulae(wb);
                    break;
                default:
                    output = to_csv(wb);
            }


            for (var i = 0; i < output[0].length; i++) {
                if (obj_tbl != undefined) {
                    $('#sample').dataTable().fnDestroy();
                } else {
                    $('#sample thead tr').empty();
                    var sth = '<th></th><th>Task Name</th><th>JobCode</th><th>Priority</th><th>Status</th><th>Progress</th><th>Start Date</th><th>End Date</th><th>Description</th>';
                    $('#sample thead tr').append(sth);
                }

                var jobcodeid = $("#F_V_JobNo option:contains('" + output[0][i].Jobcode + "')").attr('value');
                var priorityid = $("#F_V_ddl_priority option:contains('" + output[0][i].Priority + "')").attr('value');
                var statusid = $("#F_V_ddl_status option:contains('" + output[0][i].Status + "')").attr('value');
                var progressid = $("#F_V_ddl_progress option:contains('" + output[0][i].Progress + "')").attr('value');

                var str = '<tr><td><span id=' + ind_ + ' class="cls_chk_remove" ><I class="fa fa-minus-circle"></span></td><td><span id="taskname_' + ind_ + '">' + output[0][i].TaskName + '</span></td>' +
                    '<td><span style="display:none" id="jobcode_' + ind_ + '">' + jobcodeid + '</span><span>' + output[0][i].Jobcode + '</span></td>' +
                    '<td><span style="display:none" id="priority_' + ind_ + '">' + priorityid + '</span><span>' + output[0][i].Priority + '</span></td>' +
                    '<td><span style="display:none" id="status_' + ind_ + '">' + statusid + '</span><span>' + output[0][i].Status + '</span></td>' +
                    '<td><span style="display:none" id="progress_' + ind_ + '">' + progressid + '</span><span>' + output[0][i].Progress + '</span></td>' +
                    '<td><span id="startdate_' + ind_ + '">' + output[0][i].StartDate + '</span></td>' +
                    '<td><span id="enddate_' + ind_ + '">' + output[0][i].EndDate + '</span></td>' +
                    '<td><span id="description_' + ind_ + '">' + output[0][i].Description + '</span></td>';
                ind_++; table_id_count++;
                $('#sample tbody').append(str);
                obj_tbl = initTable5('sample');
            }
            resizeIframe();
        }

        var drop = document.getElementById('drop');
        function handleDrop(e) {
            e.stopPropagation();
            e.preventDefault();
            rABS = true;// document.getElementsByName("userabs")[0].checked;
            use_worker = true;// document.getElementsByName("useworker")[0].checked;
            var files = e.dataTransfer.files;
            var f = files[0];
            {
                var reader = new FileReader();
                var name = f.name;
                reader.onload = function (e) {
                    if (typeof console !== 'undefined') console.log("onload", new Date(), rABS, use_worker);
                    var data = e.target.result;
                    if (use_worker) {
                        xw(data, process_wb);
                    } else {
                        var wb;
                        if (rABS) {
                            wb = X.read(data, { type: 'binary' });
                        } else {
                            var arr = fixdata(data);
                            wb = X.read(btoa(arr), { type: 'base64' });
                        }
                        process_wb(wb);
                    }
                };
                if (rABS) reader.readAsBinaryString(f);
                else reader.readAsArrayBuffer(f);
            }
        }

        function handleDragover(e) {
            e.stopPropagation();
            e.preventDefault();
            e.dataTransfer.dropEffect = 'copy';
        }

        if (drop.addEventListener) {
            drop.addEventListener('dragenter', handleDragover, false);
            drop.addEventListener('dragover', handleDragover, false);
            drop.addEventListener('drop', handleDrop, false);
        }


    </script>

</body>
</html>
