<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" Inherits="Trident.CRM.TaskList" %>

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

        #responsive {
            background-color: #fff;
            margin-left: 30px !important;
            height: 550px !important;
            overflow: auto;
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
            top: 300px !important;
        }

        #basic {
            margin-top: -126px !important;
        }

        #_view {
            height: 1000px !important;
            overflow: auto !important;
        }

        .cls_chk_edit {
            cursor: pointer;
            color: blue;
        }
        .dataTables_scrollBody{
            height:100% !important;
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

        a {
            cursor: pointer;
        }


        #tbl_internal tbody tr td:first-child, #tbl_external tbody tr td:first-child {
            width: 150px;
        }

        #tbl_internal tbody tr td, #tbl_external tbody tr td {
            padding: 5px;
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



</head>
<body onload="resizeIframe()">
    <form id="form1" runat="server">
        <div id="full_bdy">
            <div id="dv_sve" class="cls_bdy_tp">
                <table>
                    <tr>
                        <td>
                            <ul id="ul_sve">

                                <li>
                                    <input id="btn_todo" class=" btn btn green btn-md" type="button" value="Add To Do" onclick="obj_.todo_();" /></li>

                                <li>
                                    <input id="btn_MyTask" class=" btn btn green btn-md" type="button" value="My Task" onclick="obj_.mytask_();" /></li>
                            </ul>
                        </td>
                    </tr>
                </table>

            </div>
            <div class="row">
                <div class="col-xs-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span id="rpt_caption">Task List</span>
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



            <asp:HiddenField ID="hdnUploadFilePath" runat="server" ClientIDMode="Static" />
            <div class="modal fade in" id="basic" tabindex="-1" role="basic" aria-hidden="false">
            </div>
        </div>
    </form>
    <script src='../JavaScript/jquery-1.9.1.min.js' type="text/javascript"></script>
    <script src='../JavaScript/comman_Validation.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-1.11.0.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-migrate-1.2.1.min.js' type="text/javascript"></script>
    <script src='../assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js' type="text/javascript"></script>

    <link href="../Css/uploadify.css" rel="stylesheet" />
    <script src="../JavaScript/jquery.uploadify.js"></script>


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
        var obj_tbl, att1 = [], projectid = 0;
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
                "dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // datatable layout without  horizobtal scroll
                "scrollY": "300",
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
                },
                "fnInitComplete": function () {
                    setTimeout(function () {
                        if (oTable != undefined) {
                            oTable.fnPageChange(0)
                        }
                    }, 100);
                }
            });


            var tableWrapper = $('#' + tbl + '_wrapper'); // datatable creates the table wrapper by adding with id {your_table_jd}_wrapper
            tableWrapper.find('.dataTables_length select').select2(); // initialize select2 dropdown

            return oTable;
        }
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }

        reopen_ = function (id) {
            var ar = {
                TaskDetailID: id,                
                CompanyID: get_CompanyID(),
                BranchID: get_BranchID(),
                iMode: 'status-change',
                hmode: 'detail',
                ScreenName: 'Task'
            }
            $.ajax({
                url: "../HttpHandler/TaskList.ashx",
                data: ar,
                cache: false,
                success: function (data) {
                    if (data != null) {
                        if (data.length > 0) {
                            obj_.load_List();
                            alert(data[0].res);
                        }
                    }
                }
            });
        }
        var obj_ = {
            arg: function (imode, hmode) {
                Args = {
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    iMode: imode,
                    hmode: hmode,
                    ScreenName: 'Task'
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            load_List: function () {
                $.ajax({
                    url: "../HttpHandler/TaskList.ashx",
                    data: this.arg('list-search', 'search'),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (obj_tbl != undefined) {
                                $('#sample').dataTable().fnDestroy();
                            }
                            $('#sample thead tr').empty();
                            $('#sample tbody').empty();
                            if (data.length > 0) {
                                var sth = '';
                                $.each(data[0], function (key, value) {
                                    if (key.indexOf('ColorCode') > -1) {
                                    } else {
                                        sth += '<th>' + key + '</th>';
                                    }                                    
                                });
                                var str = '',color_='';
                                $.each(data, function (key, value) {
                                    str += '<tr>', color_ = '';
                                    $.each(value, function (key, value) {                                       
                                        if (key.indexOf('ColorCode') > -1) {
                                            color_ = value;
                                        } else {
                                            if (key.indexOf('DocumentPath') > -1) {
                                                if (value != "") {
                                                    var file_ = value.split('\\');
                                                    var path_ = '';
                                                    for (var j = 0; j < file_.length - 1; j++) {
                                                        path_ = path_ + file_[j] + '\\';
                                                    }
                                                    var r_ = "<div id=" + file_[file_.length - 1].split('.')[0] + " style='width:250px;padding: 10px 5px;height: 30px;'><div style='width:100%;float: left;word-break: break-all;'><a style='text-decoration: none' class='dellink' href='../HttpHandler/Upload.ashx?filepath=" + path_ + "&file=" + file_[file_.length - 1] + "' >" + file_[file_.length - 1] + "</a></div></div>";
                                                    str += '<td style="background-color:' + color_ + '"><div class="filename_">' + r_ + '</div><div><img class="imgs_" style="height:auto;width:100px"  src="../' + file_[file_.length - 3] + '/' + file_[file_.length - 1] + '"/></div></td>';
                                                } else {
                                                    str += '<td><div style="background-color:' + color_ + '">No Uploads</div></td>';
                                                }
                                            } else {
                                                str += '<td><div style="background-color:' + color_ + '">' + value + '</div></td>';
                                            }
                                        }                                      
                                    });
                                    str += '</tr>';
                                });
                                $('#sample thead tr').append(sth);
                                $('#sample tbody').append(str);
                            } else {
                                $('#sample thead tr').append('<th></th>');
                                $('#sample tbody').append('<tr><td>No Data</td></tr>');
                            }
                            obj_tbl = initTable5('sample');
                            for (var i = 1; i <= $('#sample tbody tr').length; i++) {
                                $('#sample tbody tr:nth-child(' + i + ') td').css('background-color', $('#sample tbody tr:nth-child(' + i + ') td div').css('background-color'));
                            }
                            
                        }
                        resizeIframe();
                    }
                });
            },
            todo_: function () {
                location.href = 'Master/Task.aspx?';
            },
            mytask_: function () {
                location.href = 'MyTask.aspx?';
            }
        }
        jQuery.browser = {};
        (function () {
            jQuery.browser.msie = false;
            jQuery.browser.version = 0;
            if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                jQuery.browser.msie = true;
                jQuery.browser.version = RegExp.$1;
            }
        })();

        $(document).ready(function () {

            obj_.load_List();

            $(document).on('click', '.chk_', function () {
                if ($(this).is(':checked')) {
                    projectid = $(this)[0].id;
                    $('.chk_').prop('disabled', true);
                    $(this).prop('disabled', false);
                } else {
                    projectid = 0;
                    $('.chk_').prop('disabled', false);
                }
            });

        });


        function DownloadFile(file) {
            e.preventDefault();
            window.location.href = file;
        }
        function deleterow(divrow) {
            var ind = att1.indexOf(divrow);
            att1.splice(ind, 1);
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
                        $('#' + divrow.split('.')[0]).remove();
                    }
                });
            }
            return false;
        }

        function callalert(title, content, type) {
            $('#basic1').empty();
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
