<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Organizations.aspx.cs" Inherits="Trident.CRM.Organizations" %>

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
        #basic{
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
                                    <input id="btn_event" class=" btn btn green btn-md" type="button" value="Add Event" onclick="obj_.event_();" /></li>
                                <li>
                                    <input id="btn_attachment" class=" btn btn green btn-md" type="button" value="Add Document" onclick="obj_.document_();" /></li>

                                <li>
                                    <input id="btn_email" class=" btn btn green btn-md" type="button" value="Email" onclick="obj_.Sendmail();" /></li>

                                <li>
                                    <input id="btn_save" class=" btn btn green btn-md" type="button" value="Add Organization" onclick="obj_.addOrganization();" /></li>
                                <li>
                                    <div id="drop" style="border: 2px solid #45B256; /* margin-top: 10px; */ /* height: 43px; */ width: 180px; float: left; /* margin-right: 1%; */text-align: center; padding: 10px; /* background-color: #45B256; *//* color: white; */">Drop an XLSX</div>
                                    <a class="btn" title="Sample Excel File" style="padding: 1px 4px; position: relative; top: 17px; /* left: 28px; *" href="../Excel/book_organization.xlsx" target="_self"><i class="fa fa-download"></i></a>
                                </li>
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
                                <span id="rpt_caption">Organization List</span>
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

            <div id="responsive" class="modal fade" tabindex="-1" data-width="800">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Quick Create Document</h4>

                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">

                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet box">
                                <%--<div class="portlet-title">
                                    
                                    <div class="tools">
                                    </div>
                                </div>--%>
                                <div class="portlet-body">
                                    <div class="caption" style="width: 100%">
                                        <%-- <span id="rpt_caption_pop" style="float: left">Quick Create Document</span>--%>
                                        <div style="float: right; position: relative; /* top: 54px; */ /* left: 86px; */ z-index: 3">
                                            <%-- <button type="button" data-dismiss="modal" class="btn blue">Close</button>--%>
                                            <a href="javascript:;" id="save_document" class="btn green" style="position: relative;">Save <i class="fa fa-plus"></i>
                                            </a>
                                            <%--<button type="button" class="btn blue" id="add_popup">Add</button>--%>
                                            <a href="javascript:;" data-dismiss="modal" class="btn btn red" style="position: relative;">Cancel <i class="fa fa-times"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <ul class="nav nav-pills cls_Accordion">
                                        <li class="active">
                                            <a href="#tab_2_1" data-toggle="tab">Internal </a>
                                        </li>
                                        <li>
                                            <a href="#tab_2_2" data-toggle="tab">External </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade active in" id="tab_2_1">
                                            <table style="width: 100%" id="tbl_internal">
                                                <tr>
                                                    <td>
                                                        <label>Title</label></td>
                                                    <td>
                                                        <input type="text" class="form-control invalid" name="V_file_Title" id="F_V_file_Title" style="width: 440px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label>RelateTo</label></td>
                                                    <td>
                                                        <select id="ddl_relatetype" class="form-control" style="width: 215px"></select>
                                                        <select id="ddl_relateto" class="form-control" style="width: 215px; margin-left: 10px"></select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label>Attachment</label></td>
                                                    <td>
                                                        <input type="file" name="file_upload" id="file_upload" />
                                                        <div id="upload1">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label>Description</label></td>
                                                    <td>
                                                        <div name="summernote" id="txtDescription">
                                                        </div>
                                                        <%--<textarea cols="100" rows="20" id="txtBody"></textarea>--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="tab-pane fade" id="tab_2_2">
                                            <table style="width: 100%" id="tbl_external">
                                                <tr>
                                                    <td>
                                                        <label>Title</label></td>
                                                    <td>
                                                        <input type="text" class="form-control invalid" name="V_file_Title1" id="F_V_file_Title1" style="width: 440px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label>RelateTo</label></td>
                                                    <td>
                                                        <select id="ddl_relatetype1" class="form-control" style="width: 215px"></select>
                                                        <select id="ddl_relateto1" class="form-control" style="width: 215px; margin-left: 10px"></select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label>Url</label></td>
                                                    <td>
                                                        <input type="text" class="form-control invalid" name="file_url" id="file_url" style="width: 440px" />
                                                    </td>
                                                </tr>                                                
                                                <tr>
                                                    <td>
                                                        <label>Description</label></td>
                                                    <td>
                                                        <div name="summernote" id="txtDescription1">
                                                        </div>
                                                        <%--<textarea cols="100" rows="20" id="txtBody"></textarea>--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END EXAMPLE TABLE PORTLET-->
                        </div>
                    </div>
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
        var obj_tbl, att1 = [];
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
                "order": [
                    [1, 'asc']
                ],
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

        Delete = function (id) {
            $.ajax({
                url: "../HttpHandler/OrganizationList.ashx",
                data: obj_.arg('delete', id),
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
            arg: function (imode, organizationid) {
                Args = {
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    imode: imode,
                    OrganizationID: organizationid
                }
                return Args;
            },
            arg_save: function (imode, docid, path) {
                Args = {
                    DocumentID: docid,
                    DocumentTitle: $('#F_V_file_Title').val(),
                    RelateTypeID: $('#ddl_relatetype').val(),
                    RelateToID: $('#ddl_relateto').val(),
                    FilePath: path,
                    Description: $('#txtDescription').parent().children('.note-editor').children('.note-editable').text(),
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    imode: imode
                }
                return Args;
            },
            arg_save1: function (imode, docid) {
                Args = {
                    DocumentID: docid,
                    DocumentTitle: $('#F_V_file_Title1').val(),
                    RelateTypeID: $('#ddl_relatetype1').val(),
                    RelateToID: $('#ddl_relateto1').val(),
                    FilePath: $('#file_url').val(),
                    Description: $('#txtDescription1').parent().children('.note-editor').children('.note-editable').text(),
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    imode: imode
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            load_List: function () {
                $.ajax({
                    url: "../HttpHandler/OrganizationList.ashx",
                    data: this.arg('search', 0),
                    cache: false,
                    success: function (data) {
                        obj_.load_drop();
                        if (data != null) {
                            if (data.length > 0) {
                                if (obj_tbl != undefined) {
                                    $('#sample').dataTable().fnDestroy();
                                }
                                $('#sample thead tr').empty();
                                $('#sample tbody').empty();
                                var sth = '';
                                $.each(data[0], function (key, value) {
                                    sth += '<th>' + key + '</th>';
                                });
                                var str = '';
                                $.each(data, function (key, value) {
                                    str += '<tr>';
                                    $.each(value, function (key, value) {
                                        str += '<td>' + value + '</td>';
                                    });
                                    str += '</tr>';
                                });
                                $('#sample thead tr').append(sth);
                                $('#sample tbody').append(str);
                                obj_tbl = initTable5('sample');
                            }
                        }
                        resizeIframe();
                    }
                });
            },
            load_drop: function () {
                $.ajax({
                    url: "../HttpHandler/OrganizationList.ashx",
                    data: this.arg('document', 0),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].RelateTypeID != null) {
                                        $('#ddl_relatetype').append($('<option></option>').val(data[i].RelateTypeID).html(data[i].RelateType));
                                        $('#ddl_relatetype1').append($('<option></option>').val(data[i].RelateTypeID).html(data[i].RelateType));
                                    }
                                }
                            }
                        }
                    }
                });
            },
            load_relateto: function (id) {
                $('#ddl_relateto,#ddl_relateto1').empty();
                $.ajax({
                    url: "../HttpHandler/OrganizationList.ashx",
                    data: this.arg('relateto', id),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].ID != null) {
                                        $('#ddl_relateto').append($('<option></option>').val(data[i].ID).html(data[i].Name));
                                        $('#ddl_relateto1').append($('<option></option>').val(data[i].ID).html(data[i].Name));
                                    }
                                }
                            }
                        }
                    }
                });
            },
            addOrganization: function () {
                location.href = 'OrganizationsMain.aspx?';
            },
            Sendmail: function () {
                location.href = 'Email.aspx?';
            },
            event_: function () {
                location.href = 'Event.aspx?';
            },
            todo_: function () {
                location.href = 'Master/Task.aspx?';
            },
            document_: function () {
                $("#upload1").empty();
                $('#responsive input').val('');
                $('#responsive select option[value=0]').attr('selected', 'selected');
                $('#txtDescription').parent().children('.note-editor').children('.note-editable').text('')
                $('#txtDescription1').parent().children('.note-editor').children('.note-editable').text('')
                $('#responsive').modal('show');
            },
            save: function () {
                if (att1.length == 0 && $('.cls_Accordion').find('li.active').children('a').attr('href') == "#tab_2_1") {
                    alert('Please attach one document');
                } else {
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
                        alert('Please fill red borderd items');
                    }
                    else {
                        // console.log($('.cls_Accordion').find('li.active').children('a').attr('href'))
                        if ($('.cls_Accordion').find('li.active').children('a').attr('href') == "#tab_2_1") {
                            obj_.save_final();
                        } else {
                            obj_.save_final1()
                        }
                    }
                }
            },
            save_final: function () {
                for (var i = 0, res = 0; i < att1.length; i++) {

                    $.ajax({
                        url: "../HttpHandler/documents.ashx",
                        data: this.arg_save('insert', 0, att1[i]),
                        cache: false,
                        success: function (data) {
                            res++;
                            if (data != null) {
                                if (data.length > 0) {
                                    if (res == att1.length) {
                                        res = 0; att1 = [];
                                        $('#basic').empty();
                                        $('#basic').append(callalert('alert', 'Saved Successfully', '1'));
                                        // $("#basic").css("display", "block");
                                        $('#basic').modal('show');
                                        $("#upload1").empty();
                                    }
                                }
                            }
                        }
                    });
                }

            },
            save_final1: function () {
                $.ajax({
                    url: "../HttpHandler/documents.ashx",
                    data: this.arg_save1('insert', 0),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#basic').empty();
                                $('#basic').append(callalert('alert', 'Saved Successfully', '1'));
                                // $("#basic").css("display", "block");
                                $('#basic').modal('show');
                            }
                        }
                    }
                });
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
        $(window).load(

  function () {
      $('#txtDescription,#txtDescription1').summernote({ height: 50, width: 440 });
      $("#file_upload").fileUpload({
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
                  path = path.replace(/\\/g, "\\");
                  var file = path + '\\' + s[1];
                  file = file.replace(/\\\\/g, "\\");
                  att1.push(file);
                  var r = "<div id=" + s[1].split('.')[0] + " style='width:450px;padding: 10px 5px;height: 30px;'><div style='width:420px;float: left;'><a style='text-decoration: none' class='dellink' href='../HttpHandler/Upload.ashx?filepath=" + path + "&file=" + s[1] + "' >" + s[1] + "</a></div><div style='width:20px;float:left'><a href='#' class='dellink' onclick='deleterow(\"" + s[1] + "\")'><i class='fa fa-times'></i></a></div></div>";
                  $("#upload1").append(r);

              }
          },
          onCancel: function (file) {
              alert('The file ' + file.name + ' was cancelled.');
          },
          'onUploadSuccess': function (file, data, response) {
              alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
          }
      });
  });
  $(document).ready(function () {

      obj_.load_List();
      $(document).on('change', '#ddl_relatetype,#ddl_relatetype1', function () {
          if ($(this).val() != 0) {
              obj_.load_relateto($(this).val());
          } else {
              $('#ddl_relateto1,#ddl_relateto').empty();
          }
      });
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
      $(document).on('click', '#save_document', function () {
          obj_.save();
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


            for (var i = 0, res = 0; i < output[0].length; i++) {
                var arg = {
                    OrganizationName: output[0][i].OrganizationName,
                    BillingCity: output[0][i].BillingCity,
                    Website: output[0][i].Website,
                    PrimaryPhone: output[0][i].PrimaryPhone,
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    imode: 'insert',
                    AssignedTo: 1
                }
                $.ajax({
                    url: "../HttpHandler/OrganizationList.ashx",
                    data: arg,
                    cache: false,
                    success: function (data) {
                        res++;
                        if (res == output[0].length) {
                            obj_.load_List();
                            alert('Saved successfully');
                        }
                    }
                });
            }
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
