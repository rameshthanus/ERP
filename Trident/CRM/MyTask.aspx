<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyTask.aspx.cs" Inherits="Trident.CRM.MyTask" %>

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

        .scroller {
            overflow: auto !important;
        }

        .img_lst li {
            float: left;
            list-style: none;
            margin: 0 10px;
        }

        .cls_dv_img_lst {
            height: 200px;
            padding: 10px;
        }

        .tbl_tsk_Det {
            max-width: 330px;
        }

        .cls_dv_img_lst {
            display: none;
        }

        .tbl_tsk_Det tr td:first-child {
            width: 90px;
        }

        .img_lst li:nth-child(2) {
            border-right: 1px solid gainsboro;
            padding-right: 20px;
        }

        .tbl_tsk_Det tr td {
            padding: 5px;
        }

        .dv_img_n {
            max-width: 200px;
        }

        .tasks-widget .task-list > li > .task-title {
            margin-bottom: 15px;
        }

        .task-title {
            cursor: pointer;
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

    <link href="../assets/admin/pages/css/tasks.css" rel="stylesheet" />
</head>
<body onload="resizeIframe()">
    <form id="form1" runat="server">
        <div class="col-xs-12" id="full_bdy">
            <div id="dv_sve" class="cls_bdy_tp">
                <table>
                    <tr>
                        <td>
                            <ul id="ul_sve">

                                <li>
                                    <input id="btn_todo" class=" btn btn green btn-md" type="button" value="Add To Do" onclick="todo_();" /></li>

                                <li>
                                    <input id="btn_TaskList" class=" btn btn green btn-md" type="button" value="Task List" onclick="tasklist_();" /></li>
                            </ul>
                        </td>
                    </tr>
                </table>

            </div>
            <div class="portlet light tasks-widget">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-share font-green-haze hide"></i><span class="caption-subject font-green-haze bold uppercase">My Tasks</span> 
                         <%--<div id="dv_legend">
                             <ul>

                             </ul>
                         </div>--%>
                    </div>

                </div>
                <div class="portlet-body">
                    <div class="task-content">
                        <div class="scroller" data-always-visible="1" data-rail-visible1="1">                           
                            <ul class="task-list">                               
                            </ul>                            
                        </div>
                    </div>

                </div>
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
    <script src="../assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>

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
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 400 + 'px';
        }
        todo_ = function () {
            location.href = '/Master/Task.aspx?';
        },
        tasklist_ = function () {
            location.href = '/CRM/TaskList.aspx?';
        }
        loadlist = function () {
            var ar = {
                UserID:get_UserID(),
                CompanyID: get_CompanyID(),
                BranchID: get_BranchID(),
                iMode: 'MyTask-Search',
                hmode: 'search',
                ScreenName: 'Task'
            }
            $.ajax({
                url: "../HttpHandler/TaskList.ashx",
                data: ar,
                cache: false,
                success: function (data) {
                    $('.task-list').empty();
                    if (data != null) {
                        if (data.length > 0) {
                            var s_ = '';
                            for (var i = 0; i < data.length; i++) {
                                var file_, path_ = '';
                                if (data[i].DocumentPath != '') {
                                    file_ = data[i].DocumentPath.split('\\');
                                    for (var j = 0; j < file_.length - 1; j++) {
                                        path_ = path_ + file_[j] + '\\';
                                    }


                                    s = '<li style="background-color:' + data[i].ColorCode + '"><div class="task-checkbox"><input type="checkbox" class="liChild" value="" /></div><div class="task-title"><span class="task-title-sp">' + data[i].TaskName + ' </span></div><div class="task-config">'
                                                             + '<div class="task-config-btn btn-group"><a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown"data-close-others="true"><i class="fa fa-cog"></i><i class="fa fa-angle-down"></i></a>'
                            + '<ul class="dropdown-menu pull-right"><li><a href="#" onclick="f_(' + data[i].TaskListDetailID + ','+i+')"><i class="fa fa-check"></i>Complete </a></li><li><a href="../Master/Task.aspx?ID=' + data[i].TaskID + '"><i class="fa fa-pencil"></i>Edit </a></li>'
                                + '<li><a href="#" onclick="C_(' + data[i].TaskListDetailID + ',' + i + ')"><i class="fa fa-trash-o"></i>Cancel </a></li></ul></div></div> <div class="cls_dv_img_lst">'
                    + '<ul class="img_lst"><li> <div><img src="../' + file_[file_.length - 3] + '/' + file_[file_.length - 1] + '" style="height:auto;width:150px" /></div>'
                               + ' <div class="dv_img_n"><a style="text-decoration: none" class="dellink" href="../HttpHandler/Upload.ashx?filepath=' + path_ + "&file=" + file_[file_.length - 1] + '">' + file_[file_.length - 1] + '</a></div></li> <li> <table class="tbl_tsk_Det">'
                               + ' <tr> <td>Status</td> <td>:</td><td>' + data[i].Status + '</td> </tr><tr><td>Priority</td><td>:</td><td>' + data[i].Priority + '</td>'
                              + ' </tr><tr><td>Progress</td><td>:</td><td>' + data[i].Progress + '</td></tr><tr><td>Description</td><td>:</td><td> ' + data[i].Description + '</td></tr>'
                                    + '</table> </li><li> Comments</li><li><textarea cols="30" rows="6" id="comments_'+i+'">' + data[i].Comments + '</textarea></li></ul></div></li>';
                                } else {
                                    s = '<li style="background-color:' + data[i].ColorCode + '"><div class="task-checkbox"><input type="checkbox" class="liChild" value="" /></div><div class="task-title"><span class="task-title-sp">' + data[i].TaskName + ' </span></div><div class="task-config">'
                                                                                               + '<div class="task-config-btn btn-group"><a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown"data-close-others="true"><i class="fa fa-cog"></i><i class="fa fa-angle-down"></i></a>'
                                                            + '<ul class="dropdown-menu pull-right"><li><a href="#" onclick="f_(' + data[i].TaskListDetailID + ','+i+')"><i class="fa fa-check"></i>Complete </a></li><li><a href="../Master/Task.aspx?ID=' + data[i].TaskID + '"><i class="fa fa-pencil"></i>Edit </a></li>'
                                                                  + '<li><a href="#" onclick="C_(' + data[i].TaskListDetailID + ',' + i + ')"><i class="fa fa-trash-o"></i>Cancel </a></li></ul></div></div> <div class="cls_dv_img_lst">'
                                                      + '<ul class="img_lst"><li> <div><img src="../uploads/10072015071637-Jellyfish.jpg" style="height:auto;width:150px" /></div>'
                                                                 + ' <div class="dv_img_n"><a style="text-decoration: none" class="dellink" href="" ></a></div></li> <li> <table class="tbl_tsk_Det">'
                                                                  + ' <tr> <td>Status</td> <td>:</td><td>' + data[i].Status + '</td> </tr><tr><td>Priority</td><td>:</td><td>' + data[i].Priority + '</td>'
                              + ' </tr><tr><td>Progress</td><td>:</td><td>' + data[i].Progress + '</td></tr><tr><td>Description</td><td>:</td><td> ' + data[i].Description + '</td></tr>'
                                    + '</table> </li><li> Comments</li><li><textarea cols="30" rows="6" id="comments_' + i + '">' + data[i].Comments + '</textarea></li></ul></div></li>';
                                }
                                //console.log(s)
                                $('.task-list').append(s);
                            }
                           
                        }
                    }
                }
            });
        }
        f_ = function (id,ind) {
            var ar = {
                TaskDetailID: id,
                UserID:get_UserID(),
                CompanyID: get_CompanyID(),
                BranchID: get_BranchID(),
                iMode: 'task-status',
                hmode: 'detail',
                ScreenName: 'Task',
                Comments: $('#comments_'+ind).val()
            }
            $.ajax({
                url: "../HttpHandler/TaskList.ashx",
                data: ar,
                cache: false,
                success: function (data) {
                    if (data != null) {
                        if (data.length > 0) {
                            loadlist();
                            alert(data[0].res);
                        }
                    }
                }
            });
        }
        C_ = function (id, ind) {
            var ar = {
                TaskDetailID: id,
                UserID: get_UserID(),
                CompanyID: get_CompanyID(),
                BranchID: get_BranchID(),
                iMode: 'task-cancel',
                hmode: 'detail',
                ScreenName: 'Task',
                Comments: $('#comments_' + ind).val()
            }
            $.ajax({
                url: "../HttpHandler/TaskList.ashx",
                data: ar,
                cache: false,
                success: function (data) {
                    if (data != null) {
                        if (data.length > 0) {
                            loadlist();
                            alert(data[0].res);
                        }
                    }
                }
            });
        }
        $(document).ready(function () {
            loadlist();
            $(document).on('mouseover', '.task-list .task-title', function () {
                if (!$('.liChild').is(':checked')) {
                    $('.cls_dv_img_lst').css('display', 'none');
                    $(this).parent().children('.cls_dv_img_lst').css('display', 'block');
                }

            });
            $(document).on('mouseleave', '.task-list .task-title', function () {
                if (!$('.liChild').is(':checked')) {
                    $('.cls_dv_img_lst').css('display', 'none');
                }
            });
            $(document).on('click', '.task-list .liChild', function () {

                if ($('.liChild').is(':checked')) {
                    $('.liChild').prop('checked', false);
                    $(this).prop('checked', true);
                    $('.cls_dv_img_lst').css('display', 'none');
                    $(this).parent().parent().children('.cls_dv_img_lst').css('display', 'block');
                } else {
                    $('.cls_dv_img_lst').css('display', 'none');
                }

            });
        });
    </script>
</body>
</html>
