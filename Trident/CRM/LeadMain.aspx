<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeadMain.aspx.cs" Inherits="Trident.CRM.LeadMain" %>

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
          #tbl_internal tbody tr td:first-child, #tbl_external tbody tr td:first-child {
            width: 150px;
        }

        #tbl_internal tbody tr td, #tbl_external tbody tr td {
            padding: 5px;
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

        #tbl_listmain tbody tr td:nth-child(odd), #tbl_listddress tbody tr td:nth-child(odd), #tbl_listDescription tbody tr td:nth-child(odd) {
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
</head>
<body onload="resizeIframe()">
    <form id="form1" runat="server">
        <div id="full_bdy">
            <span id="spn_lead_type">Creating New Lead</span>
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
                                <span>Lead Details</span>
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
                                                <label>First Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_FirstName" name="V_txt_FirstName" />
                                            </td>
                                            <td>
                                                <label>Last Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_LastName" name="txt_LastName" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Primary Phone</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_PrimaryPhone" name="txt_PrimaryPhone" />
                                            </td>
                                            <td>
                                                <label>Company</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Company" name="txt_Company" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Mobile Phone</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_MobilePhone" name="txt_MobilePhone" />
                                            </td>
                                            <td>
                                                <label>Designation</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Designation" name="txt_Designation" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Fax</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Fax" name="txt_Fax" />
                                            </td>
                                            <td>
                                                <label>Lead Source</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_LeadSource" name="ddl_LeadSource">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Primary Email</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_PrimaryEmail" name="V_txt_PrimaryEmail" />
                                            </td>
                                            <td>
                                                <label>Industry</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Industry" name="ddl_Industry">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Website</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Website" name="txt_Website" />
                                            </td>
                                            <td>
                                                <label>Annual Revenue</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_AnnualRevenue" name="txt_AnnualRevenue" />
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <label>Lead Status</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_LeadStatus" name="ddl_LeadStatus">
                                                </select>
                                            </td>
                                            <td>
                                                <label>Number Of Employees</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_noofemp" name="txt_noofemp" />
                                            </td>
                                        </tr>

                                        <tr>

                                            <td>
                                                <label>Rating</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Rating" name="ddl_Rating">
                                                </select>
                                            </td>
                                            <td>
                                                <label>Secondary Email</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_SecondaryEmail" name="txt_SecondaryEmail" />
                                            </td>
                                        </tr>


                                        <tr>

                                            <td>
                                                <label>Assigned To</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_AssignedTo" name="V_ddl_AssignedTo">
                                                </select>
                                            </td>
                                            <td>
                                                <label>Email Opt Out</label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="chk_emailoptout" />
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
                                <span>Address Details</span>
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
                                                <label>Street</label>
                                            </td>
                                            <td>
                                                <textarea cols="20" rows="4" class="form-control invalid" id="txtarea_Street"></textarea>
                                            </td>
                                            <td>
                                                <label>PO Box</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_PObox" name="txt_PObox" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Postal Code</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_PostalCode" name="txt_PostalCode" />
                                            </td>
                                            <td>
                                                <label>City</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_City" name="txt_City" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Country</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Country" name="txt_Country" />
                                            </td>
                                            <td>
                                                <label>State</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_State" name="txt_State" />
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
                                                <textarea cols="100" rows="4" class="form-control invalid" id="txtarea_Description"></textarea>
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
                                <span>Document List</span>
                            </div>
                            <div class="tools">
                                 <input id="btn_attachment" class=" btn btn green btn-md" type="button" value="Add Document" onclick="obj_.document_();" />
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="cls_doclist">

                            </div>
                        </div>
                    </div>
                </div>
                  <asp:HiddenField ID="hdnUploadFilePath" runat="server" ClientIDMode="Static" />
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
            </div>
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
        function get_LeadID() {

            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }


        var rtpeid = 0;
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
        var obj_ = {
            arg: function (imode) {
                Args = {
                    FirstName: $('#F_V_txt_FirstName').val(),
                    LastName: $('#F_V_txt_LastName').val(),
                    PrimaryPhone: $('#F_V_txt_PrimaryPhone').val(),
                    Company: $('#F_V_txt_Company').val(),
                    MobilePhone: $('#F_V_txt_MobilePhone').val(),
                    Designation: $('#F_V_txt_Designation').val(),
                    Fax: $('#F_V_txt_Fax').val(),
                    LeadSourceID: $('#F_V_ddl_LeadSource').val(),
                    PrimaryEmail: $('#F_V_txt_PrimaryEmail').val(),
                    IndustryID: $('#F_V_ddl_Industry').val(),
                    Website: $('#F_V_txt_Website').val(),
                    AnnualRevenue: $('#F_V_txt_AnnualRevenue').val(),
                    LeadStatusID: $('#F_V_ddl_LeadStatus').val(),
                    NumberOfEmployees: $('#F_V_txt_noofemp').val(),
                    RatingID: $('#F_V_ddl_Rating').val(),
                    SecondaryEmail: $('#F_V_txt_SecondaryEmail').val(),
                    AssignedTo: $('#F_V_ddl_AssignedTo').val(),
                    EmailOut: ($('#chk_emailoptout').prop('checked') == true ? 'T' : 'F'),
                    Street: $('#txtarea_Street').val(),
                    POBox: $('#F_V_txt_PObox').val(),
                    PostalCode: $('#F_V_txt_PostalCode').val(),
                    City: $('#F_V_txt_City').val(),
                    Country: $('#F_V_txt_Country').val(),
                    State: $('#F_V_txt_State').val(),
                    Description: $('#txtarea_Description').val(),
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    iMode: imode,
                    ScreenName: '',
                    LeadsID: get_LeadID()
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
                    iMode: imode
                }
                return Args;
            },
            arg_: function (imode, leadid) {
                Args = {
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    iMode: imode,
                    LeadsID: leadid
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            save_: function (imode) {
                $.ajax({
                    url: "../HttpHandler/LeadsList.ashx",
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
            Load_drpdowns: function (imode) {
                $.ajax({
                    url: "../HttpHandler/LeadsList.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                        if (get_LeadID() != 0) {
                            obj_.fetch_details();
                        }
                        drpdowns = data;
                        $('#F_V_ddl_LeadSource,#F_V_ddl_Industry,#F_V_ddl_LeadStatus,#F_V_ddl_Rating,#F_V_ddl_AssignedTo').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].LeadSourceID != null) {
                                        $('#F_V_ddl_LeadSource').append($('<option></option>').val(data[i].LeadSourceID).html(data[i].LeadSource));
                                    } else if (data[i].IndustryID != null) {
                                        $('#F_V_ddl_Industry').append($('<option></option>').val(data[i].IndustryID).html(data[i].IndustryName));
                                    }
                                    else if (data[i].LeadStatusID != null) {
                                        $('#F_V_ddl_LeadStatus').append($('<option></option>').val(data[i].LeadStatusID).html(data[i].LeadStatus));
                                    }
                                    else if (data[i].RatingID != null) {
                                        $('#F_V_ddl_Rating').append($('<option></option>').val(data[i].RatingID).html(data[i].Rating));
                                    }
                                    else if (data[i].UserID != null) {
                                        $('#F_V_ddl_AssignedTo').append($('<option></option>').val(data[i].UserID).html(data[i].LoginID));
                                    }
                                    else if (data[i].RelateTypeID != null) {
                                        $('#ddl_relatetype').append($('<option></option>').val(data[i].RelateTypeID).html(data[i].RelateType));
                                        $('#ddl_relatetype1').append($('<option></option>').val(data[i].RelateTypeID).html(data[i].RelateType));
                                    }
                                }
                            }
                        }
                    }
                });
            },
            fetch_details: function () {
                $.ajax({
                    url: "../HttpHandler/LeadsList.ashx",
                    data: this.arg('fetch'),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_txt_FirstName').val(data[0].FirstName).removeClass('invalid').addClass('valid');
                                //  $('#F_V_txt_FirstName').attr('disabled', 'disabled');
                                $('#F_V_txt_LastName').val(data[0].LastName);
                                $('#F_V_txt_PrimaryPhone').val(data[0].PrimaryPhone);
                                $('#F_V_txt_Company').val(data[0].Company);
                                $('#F_V_txt_MobilePhone').val(data[0].MobilePhone);
                                $('#F_V_txt_Designation').val(data[0].Description);
                                $('#F_V_txt_Fax').val(data[0].Fax);
                                $('#F_V_ddl_LeadSource option[value=' + data[0].LeadSource + ']').attr('selected', 'selected');
                                $('#F_V_txt_PrimaryEmail').val(data[0].PrimaryEmail).removeClass('invalid').addClass('valid');
                                // $('#F_V_txt_PrimaryEmail').attr('disabled', 'disabled');
                                $('#F_V_ddl_Industry option[value=' + data[0].IndustryID + ']').attr('selected', 'selected');
                                $('#F_V_txt_Website').val(data[0].Website);
                                $('#F_V_txt_AnnualRevenue').val(data[0].AnnualRevenue);
                                $('#F_V_ddl_LeadStatus option[value=' + data[0].LeadStatus + ']').attr('selected', 'selected');
                                $('#F_V_txt_noofemp').val(data[0].NumberOfEmployees);
                                $('#F_V_ddl_Rating option[value=' + data[0].Rating + ']').attr('selected', 'selected');
                                $('#F_V_txt_SecondaryEmail').val(data[0].SecondaryEmail);
                                $('#F_V_ddl_AssignedTo option[value=' + data[0].AssignedTo + ']').attr('selected', 'selected');
                                $('#F_V_ddl_AssignedTo').removeClass('invalid').addClass('valid');
                                $('#chk_emailoptout').prop('checked');
                                $('#txtarea_Street').val(data[0].Street);
                                $('#F_V_txt_PObox').val(data[0].POBox);
                                $('#F_V_txt_PostalCode').val(data[0].PostalCode);
                                $('#F_V_txt_City').val(data[0].City);
                                $('#F_V_txt_Country').val(data[0].Country);
                                $('#F_V_txt_State').val(data[0].State);
                                $('#txtarea_Description').val(data[0].Description);
                            }
                            $('.cls_doclist').empty();
                            for (var i = 1; i < data.length; i++) {
                                rtpeid = data[i].rtpeid;
                                var file_ = data[i].FilePath.split('\\');
                                var path_ = '';
                                for (var j = 0; j < file_.length - 1; j++) {
                                    path_ = path_ + file_[j] + '\\';
                                }                             
                                var id_ = $.trim(file_[file_.length - 1].split('.')[0].split('-')[0]);
                                var r_ = "<div id='" + id_ + "' style='padding: 10px 5px;height: 30px;'><div style='float: left;margin-right: 20px;'>Title : " + data[i].DocumentTitle + "</div><div style='float: left;word-break: break-all;'><a style='text-decoration: none' class='dellink' href='../HttpHandler/Upload.ashx?filepath=" + path_ + "&file=" + file_[file_.length - 1] + "' >" + file_[file_.length - 1] + "</a></div></div>";
                                $('.cls_doclist').append(r_);
                            }
                        }
                    }
                });
            },
            document_: function () {
                $("#upload1").empty();
                $('#responsive input').val('');
                $('#responsive select option[value=0]').attr('selected', 'selected');
                $('#txtDescription').parent().children('.note-editor').children('.note-editable').text('');
                $('#txtDescription1').parent().children('.note-editor').children('.note-editable').text('');
                $('#responsive').modal('show');
                //if (projectid != 0) {
                $('#ddl_relatetype option[value=' + rtpeid + ']').attr('selected', 'selected');
                $('#ddl_relatetype1 option[value=' + rtpeid + ']').attr('selected', 'selected');
                $('#ddl_relatetype,#ddl_relatetype1').removeClass('invalid').addClass('valid');
                $('#ddl_relatetype').trigger('change');
                //}
            },
            load_relateto: function (id) {
                $('#ddl_relateto,#ddl_relateto1').empty();
                $.ajax({
                    url: "../HttpHandler/LeadsList.ashx",
                    data: this.arg_('relateto', id),
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
                                if (rtpeid != 0) {
                                    $('#ddl_relateto option[value=' + get_LeadID() + ']').attr('selected', 'selected');
                                    $('#ddl_relateto1 option[value=' + get_LeadID() + ']').attr('selected', 'selected');
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
                    if (get_LeadID() == 0) {
                        obj_.save_('insert');
                    } else {
                        obj_.save_('update');
                    }

                }
            },
            save_doc: function () {
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
                                       // $('#basic').empty();
                                       // $('#basic').append(callalert('alert', 'Saved Successfully', '1'));
                                       // // $("#basic").css("display", "block");
                                       // $('#basic').modal('show');
                                        $("#upload1").empty();
                                        $('#responsive').modal('hide');
                                        alert('Document Uploaded')
                                    }
                                }
                            }
                        }
                    });
                }

            },
            cancel_: function () {
                window.history.back();
            }
        }
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
            rtpeid = 0;

            $('input[name^="V_"],select[name^="V_"]').parent().children('span').remove();
            $('input[name^="V_"],select[name^="V_"]').parent().append('<span style="color:red;margin-left:10px;">*</span>');


            obj_.Load_drpdowns('dropdown');
            $(document).on('click', '#save_document', function () {               
                obj_.save_doc();
            });

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
        });
    </script>
</body>
</html>
