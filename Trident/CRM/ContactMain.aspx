<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactMain.aspx.cs" Inherits="Trident.CRM.ContactMain" %>

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

        #tbl_listmain tbody tr td:nth-child(odd), #tbl_listddress tbody tr td:nth-child(odd), #tbl_listDescription tbody tr td:nth-child(odd), #tbl_listprofilepic tbody tr td:nth-child(odd), #tbl_listPortalDetails tbody tr td:nth-child(odd) {
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
            <span id="spn_lead_type">Creating New Contact</span>
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
                                <span>Contact Details</span>
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
                                                <label>Code</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" disabled="disabled" id="F_V_txt_Code" name="txt_Code" />
                                            </td>
                                            <td>
                                                <label>First Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_FirstName" name="txt_FirstName" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Last Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_LastName" name="V_txt_LastName" />
                                            </td>
                                            <td>
                                                <label>Primary Email</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_PrimaryEmail" name="txt_PrimaryEmail" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Office Phone</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_OfficePhone" name="txt_OfficePhone" />
                                            </td>
                                            <td>
                                                <label>Mobile Phone</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_MobilePhone" name="txt_MobilePhone" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Home Phone</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_HomePhone" name="txt_HomePhone" />
                                            </td>
                                            <td>
                                                <label>Date of Birth</label>
                                            </td>
                                            <td>
                                                <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy">
                                                    <input type="text" class="form-control" id="F_V_txt_dob" name="txt_dob" />
                                                    <span class="input-group-btn">
                                                        <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>

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
                                                <label>Organization Name</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_OrganizationName" name="ddl_OrganizationName">
                                                </select>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Title</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Title" name="txt_Title" />
                                            </td>
                                            <td>
                                                <label>Department</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Department" name="txt_Department" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Reference</label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="chk_Reference" />
                                            </td>
                                            <td>
                                                <label>Reports To</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_ReportsTo" name="V_ddl_ReportsTo">
                                                </select>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Lead Source</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_LeadSource" name="ddl_LeadSource">
                                                </select>
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
                                                <label>Do Not Call</label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="chk_donotcall" />
                                            </td>
                                            <td>
                                                <label>Notify Owner</label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="chk_NotifyOwner" />
                                            </td>

                                        </tr>


                                        <tr>
                                            <td>
                                                <label>Email Opt Out</label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="chk_emailoptout" />
                                            </td>
                                            <td>
                                                <label>Primary Twitter</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_PrimaryTwitter" name="txt_PrimaryTwitter" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Type</label>
                                            </td>
                                            <td>

                                                <input type="radio" name="rad_party" value="C" checked="checked" class="radio-list" />
                                                Customer
                        <input type="radio" name="rad_party" value="S" class="radio-list" />
                                                Supplier
                         
                   
                                            </td>
                                            <td>
                                                <label>Status</label>
                                            </td>
                                            <td>
                                                <input type="radio" name="rad_status" value="A" checked="checked" class="radio-list" />
                                                Active
                        <input type="radio" name="rad_status" value="I" class="radio-list" />
                                                Inactive
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
                                <span>Customer Portal Details</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_listPortalDetails">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label>Portal User</label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="chk_PortalUser" />
                                            </td>
                                            <td>
                                                <label>Support Start Date</label>
                                            </td>
                                            <td>
                                                <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy">
                                                    <input type="text" class="form-control" id="F_V_txt_SupportStartDate" name="txt_SupportStartDate" />
                                                    <span class="input-group-btn">
                                                        <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Support End Date</label>
                                            </td>
                                            <td>
                                                <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy">
                                                    <input type="text" class="form-control" id="F_V_txt_SupportEndDate" name="txt_SupportEndDate" />
                                                    <span class="input-group-btn">
                                                        <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>

                                            </td>
                                            <td></td>
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
                                                <label>Address 1</label>
                                            </td>
                                            <td>
                                                <textarea cols="20" rows="3" class="form-control invalid" id="txtarea_MailingStreet"></textarea>
                                            </td>
                                            <td>
                                                <label>Address 2</label>
                                            </td>
                                            <td>
                                                <textarea cols="20" rows="3" class="form-control invalid" id="F_V_txt_MailingPOBox"></textarea>
                                                
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>City</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_MailingCity" name="txt_MailingCity" />
                                            </td>
                                            <td>
                                                <label>State</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_MailingState" name="txt_MailingState" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>Zip Code</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_MailingZip" name="txt_MailingZip" />
                                            </td>
                                            <td>
                                                <label>Country</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_MailingCountry" name="txt_MailingCountry" />
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
                <div class="col-xs-12">
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span>Profile Picture</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_listprofilepic">
                                    <tbody>
                                        <tr>
                                            <td style="width: 200px">
                                                <label>Contact Image</label>
                                            </td>
                                            <td>
                                                <input type="file" name="file_upload" id="file_upload" />
                                                <div id="upload1">
                                                </div>
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
        function get_PartyID() {

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
                    PartyName: $('#F_V_txt_FirstName').val(),
                    LastName: $('#F_V_txt_LastName').val(),
                    PrimaryEmail: $('#F_V_txt_PrimaryEmail').val(),
                    OfficePhone: $('#F_V_txt_OfficePhone').val(),
                    MobilePhone: $('#F_V_txt_MobilePhone').val(),
                    HomePhone: $('#F_V_txt_HomePhone').val(),
                    DateOfBirth: $('#F_V_txt_dob').val(),
                    Fax: $('#F_V_txt_Fax').val(),
                    OrganizationID: $('#F_V_ddl_OrganizationName').val(),
                    Title: $('#F_V_txt_Title').val(),
                    Department: $('#F_V_txt_Department').val(),
                    Reference: ($('#chk_Reference').prop('checked') == true ? 'T' : 'F'),
                    ReportsTo: $('#F_V_ddl_ReportsTo').val(),
                    LeadSourceID: $('#F_V_ddl_LeadSource').val(),
                    AssignedTo: $('#F_V_ddl_AssignedTo').val(),
                    DoNotCall: ($('#chk_donotcall').prop('checked') == true ? 'T' : 'F'),
                    NotifyOwner: ($('#chk_NotifyOwner').prop('checked') == true ? 'T' : 'F'),
                    EmailOptOut: ($('#chk_emailoptout').prop('checked') == true ? 'T' : 'F'),
                    PrimaryTwitter: $('#F_V_txt_PrimaryTwitter').val(),
                    PortalUser: ($('#chk_PortalUser').prop('checked') == true ? 'T' : 'F'),
                    SupportStartDate: $('#F_V_txt_SupportStartDate').val(),
                    SupportEndDate: $('#F_V_txt_SupportEndDate').val(),
                    Address1: $('#txtarea_MailingStreet').val(),
                    Address2: $('#F_V_txt_MailingPOBox').val(),
                    City: $('#F_V_txt_MailingCity').val(),
                    State: $('#F_V_txt_MailingState').val(),
                    Zipcode: $('#F_V_txt_MailingZip').val(),
                    Country: $('#F_V_txt_MailingCountry').val(),
                    Description: $('#txtarea_Description').val(),
                    ImagePath: att1[0],
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    imode: imode,
                    ScreenName: '',
                    CustomerType: $("input[name=rad_party]:checked").val(),
                    CustomerStatus: $("input[name=rad_status]:checked").val(),
                    PartyID: get_PartyID()
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            save_: function (imode) {
                $.ajax({
                    url: "../HttpHandler/ContactList.ashx",
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
                    url: "../HttpHandler/ContactList.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                        if (get_PartyID() != 0) {
                            obj_.fetch_details();
                        }
                        drpdowns = data;
                        $('#F_V_ddl_OrganizationName,#F_V_ddl_LeadSource,#F_V_ddl_AssignedTo').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].OrganizationID != null) {
                                        $('#F_V_ddl_OrganizationName').append($('<option></option>').val(data[i].OrganizationID).html(data[i].OrganizationName));
                                    }
                                    else if (data[i].LeadSourceID != null) {
                                        $('#F_V_ddl_LeadSource').append($('<option></option>').val(data[i].LeadSourceID).html(data[i].LeadSource));
                                    }
                                    else if (data[i].UserID != null) {
                                        $('#F_V_ddl_AssignedTo').append($('<option></option>').val(data[i].UserID).html(data[i].LoginID));
                                    }
                                }
                            }
                        }
                    }
                });
            },

            get_autocode: function (imode) {
                $.ajax({
                    url: "../HttpHandler/ContactList.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_txt_Code').val(data[0].Column1);
                                $('#F_V_txt_Code').removeClass('invalid').addClass('valid');
                                $('#F_V_txt_Code').css('border', '1px solid red');
                            }
                        }
                    }
                });
            },
            fetch_details: function () {
                $.ajax({
                    url: "../HttpHandler/ContactList.ashx",
                    data: this.arg('fetch'),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                                                
                                $('#F_V_txt_Code').val(data[0].PartyCode);
                                $('#F_V_txt_FirstName').val(data[0].PartyName);
                                $('#F_V_txt_LastName').val(data[0].LastName).removeClass('invalid').addClass('valid');
                                $('#F_V_txt_PrimaryEmail').val(data[0].PrimaryEmail);
                                $('#F_V_txt_OfficePhone').val(data[0].OfficePhone);
                                $('#F_V_txt_MobilePhone').val(data[0].MobilePhone);
                                $('#F_V_txt_HomePhone').val(data[0].HomePhone);
                                $('#F_V_txt_dob').val(data[0].DateOfBirth);
                                $('#F_V_txt_Fax').val(data[0].Fax);
                                $('#F_V_ddl_OrganizationName option[value=' + data[0].OrganizationID + ']').attr('selected', 'selected');
                                $('#F_V_txt_Title').val(data[0].Title);
                                $('#F_V_txt_Department').val(data[0].Department);
                                if (data[0].Reference == 'T') {
                                    $('#chk_Reference').prop('checked', true);
                                }
                                $('#F_V_ddl_ReportsTo option[value=' + data[0].ReportsTo + ']').attr('selected', 'selected');
                                $('#F_V_ddl_LeadSource option[value=' + data[0].LeadSourceID + ']').attr('selected', 'selected');
                                $('#F_V_ddl_AssignedTo option[value=' + data[0].AssignedTo + ']').attr('selected', 'selected');
                                $('#F_V_ddl_AssignedTo').removeClass('invalid').addClass('valid');
                                $("input[name=rad_status][value=" + data[0].CustomerStatus + "]").prop('checked', true);
                                $("input[name=rad_party][value=" + data[0].Type + "]").prop('checked', true);
                                if (data[0].DoNotCall == 'T') {
                                    $('#chk_donotcall').prop('checked', true);
                                }
                                if (data[0].NotifyOwner == 'T') {
                                    $('#chk_NotifyOwner').prop('checked', true);
                                }
                                if (data[0].EmailOptOut == 'T') {
                                    $('#chk_emailoptout').prop('checked', true);
                                }
                                $('#F_V_txt_PrimaryTwitter').val(data[0].PrimaryTwitter);

                                if (data[0].PortalUser == 'T') {
                                    $('#chk_PortalUser').prop('checked', true);
                                }

                                $('#F_V_txt_SupportStartDate').val(data[0].SupportStartDate);
                                $('#F_V_txt_SupportEndDate').val(data[0].SupportEndDate);

                                $('#txtarea_MailingStreet').val(data[0].MailingStreet);
                                $('#F_V_txt_MailingPOBox').val(data[0].MailingPOBox);
                                $('#F_V_txt_MailingCity').val(data[0].MailingCity);
                                $('#F_V_txt_MailingState').val(data[0].MailingState);
                                $('#F_V_txt_MailingZip').val(data[0].MailingZip);
                                $('#F_V_txt_MailingCountry').val(data[0].MailingCountry);
                               
                                $('#txtarea_Description').val(data[0].Description);
                                if (data[0].ImagePath != 'noimage') {
                                    var file_ = data[0].ImagePath.split('\\');
                                    //  var file_path = file_.splice(file_.length - 1, 1);
                                    var path_ = '';
                                    $("#upload1").empty();
                                    // console.log(file_)
                                    // console.log(file_path)
                                    for (var j = 0; j < file_.length - 1; j++) {
                                        path_ = path_ + file_[j] + '\\';
                                    }
                                    //   console.log(path_)
                                    var r = "<div id=" + file_[file_.length - 1].split('.')[0] + " style='width:450px;padding: 10px 5px;height: 30px;'><div style='width:420px;float: left;'><a style='text-decoration: none' class='dellink' href='../HttpHandler/Upload.ashx?filepath=" + path_ + "&file=" + file_[file_.length - 1] + "' >" + file_[file_.length - 1] + "</a></div><div style='width:20px;float:left'><a href='#' class='dellink' onclick='deleterow(\"" + file_[file_.length - 1] + "\")'><i class='fa fa-times'></i></a></div></div>";
                                    $("#upload1").append(r);
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
                    if (get_PartyID() == 0) {
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
        $(window).load(function () {
            $("#file_upload").fileUpload({
                'uploader': '../JavaScript/uploader.swf',
                'cancelImg': '../Images/cancel.png',
                'buttonText': 'Browse Files',
                'script': '../HttpHandler/attachment.ashx',
                'folder': 'uploads',
                'fileDesc': 'Image Files',
                'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
                'multi': false,
                'auto': true,
                onComplete: function (event, queueID, fileObj, response, data) {
                    att1 = [];
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
            debugger;
            obj_.Load_drpdowns('dropdown');
            obj_.get_autocode('AutoCode');
            att1.push('noimage');

            $('input[name^="V_"],select[name^="V_"]').parent().children('span').remove();
            $('input[name^="V_"],select[name^="V_"]').parent().append('<span style="color:red;margin-left:10px;">*</span>');

            // var today = new Date();
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
    </script>
</body>
</html>
