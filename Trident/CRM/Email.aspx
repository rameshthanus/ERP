<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="Trident.CRM.Email" %>

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

        #sample tbody tr td:first-child {
            width: 200px;
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

        .note-editor {
            float: left;
            margin-right: 5px;
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

        #responsive, #responsive1 {
            background-color: #fff;
            margin-left: 30px !important;
            height: 550px !important;
            overflow: auto;
        }

        .tabletools-dropdown-on-portlet {
            display: none !important;
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
            top: 287px !important;
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
    </style>


    <script src="../JavaScript/jquery-1.9.1.min.js"></script>
    <script src="../JavaScript/jquery-ui-1.9.2.custom.min.js"></script>


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
    <%--<script src='../assets/admin/pages/scripts/table-advanced.js' type="text/javascript"></script>--%>
    <script src='../assets/global/plugins/select2/select2.min.js' type="text/javascript"></script>

    <script src="../assets/global/plugins/datatables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js" type="text/javascript"></script>


    <script src="../assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>

    <script src="../assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js" type="text/javascript"></script>

    <script src='../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js' type="text/javascript"></script>
    <script src="../assets/admin/pages/scripts/ui-extended-modals.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script src="../assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>
    <script src="../assets/admin/pages/scripts/components-form-tools.js"></script>


</head>
<body onload="resizeIframe();">
    <form id="form1" runat="server">
        <div>
            <%-- <input name="txtName" type="text" id="txtName" class="txt" value="Name" />--%>
            <%-- <label></label>
            <br />
            <br />
            <input name="txtMessage" type="text" class="txt" id="txtMessage" value="Message" maxlength="500" />
            <br />
            <br />
            <input type="file" name="file_upload" id="file_upload" />
            <a href="javascript:$('#file_upload').fileUploadStart()">Upload Files</a>
            <div id="upload1">
            </div>--%>
            <%--         <br />
            <br />
            <br />
            <span class="style1">Max charater length for Meassage is 500.
            </span>
            <input name="submit" type="button" class="btn" value="submit"
                style="font-size: x-small" onclick="javascript: SendMail();" />--%>

            <asp:HiddenField ID="hdnUploadFilePath" runat="server" ClientIDMode="Static" />
        </div>
        <div id="full_bdy">
            <div id="dv_sve" class="cls_bdy_tp">
                <table>
                    <tr>
                        <td>
                            <ul id="ul_sve">
                                <li>
                                    <input id="btn_template" class=" btn btn green btn-md" type="button" value="Add Template" onclick="addtemplate_();" /></li>

                                <li>
                                    <input id="btn_email" class=" btn btn green btn-md" type="button" value="Send Email" onclick="javascript: SendMail();" /></li>

                                <li>
                                    <input id="btn_cancel" class=" btn btn green btn-md" type="button" value="Back" onclick="back_();" /></li>
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
                                <span id="rpt_caption">New Message</span>
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
                                <tbody>
                                    <tr>
                                        <td>
                                            <label>To</label></td>
                                        <td>
                                            <input name="txtEmail" type="text" id="txtEmail" class="txt" style="width: 450px; height: 30px;" />
                                            <input id="btn_Contacts" class=" btn btn green btn-md" type="button" value="Contacts" onclick="contacts_();" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>CC</label></td>
                                        <td>
                                            <input name="txtCC" type="text" id="txtCC" class="txt" style="width: 450px; height: 30px;" />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <label>BCC</label></td>
                                        <td>
                                            <input name="txtCC" type="text" id="txtBCC" class="txt" style="width: 450px; height: 30px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Subject</label></td>
                                        <td>
                                            <input name="txtsubject" type="text" id="txtSubject" class="txt" style="width: 450px; height: 30px;" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Attachments</label></td>
                                        <td>
                                            <input type="file" name="file_upload" id="file_upload" />
                                            <%--   <a href="javascript:$('#file_upload').fileUploadStart()" style="float: left; margin-right: 30px;">Upload Files</a>--%>
                                            <div id="upload1">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Body</label></td>
                                        <td>
                                            <div name="summernote" id="txtBody">
                                            </div>
                                            <input id="btn_template1" class=" btn btn green btn-md" type="button" value="Template" onclick="template_();" />
                                            <%--<textarea cols="100" rows="20" id="txtBody"></textarea>--%>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>

            <div id="responsive" class="modal fade" tabindex="-1" data-width="800">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Contacts</h4>

                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet box blue-hoki">
                                <div class="portlet-title">
                                    <div class="caption" style="width: 100%">
                                        <span id="rpt_caption1">Contact List</span>
                                        <input id="btn_close" class=" btn btn green btn-md" type="button" value="Close" onclick="close_();" style="float: right; margin-right: 2px;" />
                                        <input id="btn_addcc" class=" btn btn green btn-md" type="button" value="Add CC" onclick="Addcc_();" style="float: right; margin-right: 2px;" />
                                         <input id="btn_addbcc" class=" btn btn green btn-md" type="button" value="Add BCC" onclick="Addbcc_();" style="float: right; margin-right: 2px;" />
                                        <input id="btn_addto" class=" btn btn green btn-md" type="button" value="Add To" onclick="Add_();" style="float: right; margin-right: 2px;" />


                                    </div>
                                    <div class="tools">
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <table class="table table-striped table-bordered table-hover" id="sample1">
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
                </div>

            </div>

            <div id="responsive1" class="modal fade" tabindex="-1" data-width="800">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Templates</h4>

                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet box blue-hoki">
                                <div class="portlet-title">
                                    <div class="caption" style="width: 100%">
                                        <span id="rpt_caption2">Template List</span>
                                        <input id="btn_confirm" class=" btn btn green btn-md" type="button" value="Confirm" onclick="Confirm_();" style="float: right" />
                                    </div>
                                    <div class="tools">
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <table class="table table-striped table-bordered table-hover" id="sample2">
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
                </div>

            </div>
        </div>
    </form>
</body>
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
        var obj_tbl, obj_tbl1, att1 = [], mailid = [];
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
        contacts_ = function () {
            load_List();
            mailid = [];
            $('#responsive').modal('show');
        }
        template_ = function () {
            load_List1();
            $('#responsive1').modal('show');
        }
        Confirm_ = function () {
            $('#responsive1').modal('hide');
        }
        addtemplate_ = function () {

            location.href = '/CRM/EmailTemplate.aspx?';
        }
        Add_ = function () {
            var mail_ = '';
            //console.log(mailid)
            for (var i = 0; i < mailid.length; i++) {
                if (mailid[i] != '' && mailid[i] != null) {
                    mail_ = mailid[i] + ',' + mail_;
                }
            }

            if (mail_ != '') {
                mail_ = mail_.slice(0, -1);
                if ($('#txtEmail').val() != '') {
                    $('#txtEmail').val(mail_ + ',' + $('#txtEmail').val());
                } else {
                    $('#txtEmail').val(mail_);
                }

            }

        }
        Addcc_ = function () {
            var mail_ = '';
            for (var i = 0; i < mailid.length; i++) {
                if (mailid[i] != '' && mailid[i] != null) {
                    mail_ = mailid[i] + ',' + mail_;
                }
            }

            if (mail_ != '') {
                mail_ = mail_.slice(0, -1);
                if ($('#txtCC').val() != '') {
                    $('#txtCC').val(mail_ + ',' + $('#txtCC').val());
                } else {
                    $('#txtCC').val(mail_);
                }
            }

        }
        Addbcc_ = function () {
            var mail_ = '';
            for (var i = 0; i < mailid.length; i++) {
                if (mailid[i] != '' && mailid[i] != null) {
                    mail_ = mailid[i] + ',' + mail_;
                }
            }

            if (mail_ != '') {
                mail_ = mail_.slice(0, -1);
                if ($('#txtBCC').val() != '') {
                    $('#txtBCC').val(mail_ + ',' + $('#txtBCC').val());
                } else {
                    $('#txtBCC').val(mail_);
                }
            }

        }
        close_ = function () {
            $('#responsive').modal('hide');
        }
        var att1 = [];
        jQuery.browser = {};
        (function () {
            jQuery.browser.msie = false;
            jQuery.browser.version = 0;
            if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                jQuery.browser.msie = true;
                jQuery.browser.version = RegExp.$1;
            }
        })();
        $(window).load(function () {
            $("#upload1").empty()
            $('#txtBody').summernote({ height: 150, width: 630 });
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
                    var file = path.replace(/\\/g, "\\") + '\\' + s[1];
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
        $(document).on('click', '.chk_', function () {
            var email_ = $(this)[0].id.split('-c-e-')[1];
            if ($(this).is(':checked')) {
                mailid.push(email_);
            } else {
                mailid.splice(mailid.indexOf(email_), 1);
            }
        }); 
        $(document).on('click', '.chk_all', function () {
            mailid = [];
            if ($(this).is(':checked')) {
                $('.chk_').prop('checked', true);
                for (var i = 1; i <= $('#sample1 tbody tr').length; i++) {
                    mailid.push($('#sample1 tbody tr:nth-child(' + i + ') td:nth-child(1) input')[0].id.split('-c-e-')[1]);
                }
            } else {
                $('.chk_').prop('checked', false);
            }
        });
        $(document).on('click', '.chk_t', function () {
            if ($(this).is(':checked')) {
                $('.note-editable').html('');
                $('.note-editable').html($(this)[0].value);
                // projectid = $(this)[0].id;
                $('.chk_t').prop('disabled', true);
                $(this).prop('disabled', false);
            } else {
                $('.note-editable').html('');
                $('.chk_t').prop('disabled', false);
            }
        });
    }
);
    function back_() {

        window.history.back();

    }

    function resizeIframe() {
        var iframe = window.parent.document.getElementById("_view");
        var container = document.getElementById('full_bdy');
        iframe.style.height = container.offsetHeight + 200 + 'px';
    }
    var obj_ = {
        arg: function (imode, contactid) {
            Args = {
                CompanyID: get_CompanyID(),
                BranchID: get_BranchID(),
                CreatedBy: get_UserID(),
                CreatedOn: obj_.cur_date(),
                ModifiedBy: get_UserID(),
                ModifiedOn: obj_.cur_date(),
                imode: imode,
                ContactID: contactid
            }
            return Args;
        },
        arg1: function (imode) {
            Args = {
                Template: '',
                CompanyID: get_CompanyID(),
                BranchID: get_BranchID(),
                CreatedBy: get_UserID(),
                CreatedOn: obj_.cur_date(),
                ModifiedBy: get_UserID(),
                ModifiedOn: obj_.cur_date(),
                imode: imode,
                TemplateID: 0
            }
            return Args;
        },
        cur_date: function () {
            var date = new Date();
            return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        }
    }
    load_List = function () {
        $.ajax({
            url: "../HttpHandler/ContactList.ashx",
            data: obj_.arg('emailsearch', 0),
            cache: false,
            success: function (data) {
                if (data != null) {
                    if (obj_tbl != undefined) {
                        $('#sample1').dataTable().fnDestroy();
                    }
                    $('#sample1 thead tr').empty();
                    $('#sample1 tbody').empty();
                    if (data.length > 0) {
                        var sth = '';
                        $.each(data[0], function (key, value) {
                            if (key == ' ') {
                                sth += '<th><span><input type="checkbox" class="chk_all"/></span></th>';
                            } else {
                                sth += '<th>' + key + '</th>';
                            }
                           
                        });
                        var str = '';
                        $.each(data, function (key, value) {
                            str += '<tr>';
                            $.each(value, function (key, value) {
                                str += '<td>' + value + '</td>';
                            });
                            str += '</tr>';
                        });
                        $('#sample1 thead tr').append(sth);
                        $('#sample1 tbody').append(str);
                    } else {
                        $('#sample1 thead tr').append('<th></th>');
                        $('#sample1 tbody').append('<tr><td>No Data</td></tr>');
                    }
                    obj_tbl = initTable5('sample1');
                }

            }
        });
    }

    load_List1 = function () {
        $.ajax({
            url: "../HttpHandler/Template.ashx",
            data: obj_.arg1('fetch', 0),
            cache: false,
            success: function (data) {
                if (data != null) {
                    if (obj_tbl1 != undefined) {
                        $('#sample2').dataTable().fnDestroy();
                    }
                    $('#sample2 thead tr').empty();
                    $('#sample2 tbody').empty();
                    if (data.length > 0) {
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
                        $('#sample2 thead tr').append(sth);
                        $('#sample2 tbody').append(str);
                    } else {
                        $('#sample2 thead tr').append('<th></th>');
                        $('#sample2 tbody').append('<tr><td>No Data</td></tr>');
                    }
                    obj_tbl1 = initTable5('sample2');
                }

            }
        });
    }

    function SendMail() {
        if ($("#txtEmail").val() != '') {
            Metronic.blockUI({ boxed: true, message: 'Saving...' });
            var domain = location.host;
            var serviceurl = location.protocol + "//" + domain + "/CRM/MailWebService.asmx/SendUserMail";
            var name = $("#txtName").val();
            var toMailId = $("#txtEmail").val();
            var message = $('#txtBody').parent().children('.note-editor').children('.note-editable').text();
            var subject = $("#txtSubject").val();
            var cc = $('#txtCC').val();
            var bcc = $('#txtBCC').val();
            ////att1="G:\\13-06-15-VERTIAS\\Vertias\\Trident\\uploads\\efrontier.png"; 
            var path = '';
            for (var i = 0; i < att1.length; i++) {
                path = att1[i] + ',' + path;
            }
            path = path.slice(0, -1);
            var args = {};
            args.toMailId = toMailId;
            args.subject = subject;
            args.message = message;
            args.attachment = path;
            args.cc = cc;
            args.bcc = bcc;
            // console.log(JSON.stringify(args))
            //var upload
            $.ajax({
                url: serviceurl,
                // data: "{'toMailId': '" + toMailId + "','subject': '" + subject + "','message': '" + message + "','attachment': '" + att1 + "'}",
                data: JSON.stringify(args),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    Metronic.unblockUI();
                    var result = response.d;
                    if (result == true) {
                        alert('Mail sent successfully');
                    }
                },

                error: function (xhr, status, error) {
                    Metronic.unblockUI();
                    // Boil the ASP.NET AJAX error down to JSON.
                    var err = eval("(" + xhr.responseText + ")");

                    // Display the specific error raised by the server (e.g. not a
                    //   valid value for Int32, or attempted to divide by zero).
                    alert(err.Message);
                }
            });
        } else {
            alert('To address cannot be empty');
        }

    } function DownloadFile(file) {
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
</script>

</html>
