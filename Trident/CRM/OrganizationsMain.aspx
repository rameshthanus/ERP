<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizationsMain.aspx.cs" Inherits="Trident.CRM.OrganizationsMain" %>

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
</head>
<body onload="resizeIframe()">
    <form id="form1" runat="server">
        <div id="full_bdy">
            <span id="spn_lead_type">Creating New Organizations</span>
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
                                <span>Organizations Details</span>
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
                                                <label>Organization Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_OrganizationName" name="V_txt_OrganizationName" />
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
                                                <label>Website</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Website" name="txt_Website" />
                                            </td>
                                            <td>
                                                <label>Primary Phone</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_PrimaryPhone" name="txt_PrimaryPhone" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Employees</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Employees" name="txt_Employees" />
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
                                                <label>Annual Revenue</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_AnnualRevenue" name="txt_AnnualRevenue" />
                                            </td>
                                            <td>
                                                <label>Fax</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Fax" name="txt_Fax" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Member Of</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_MemberOf" name="txt_MemberOf" />
                                            </td>
                                            <td>
                                                <label>Ownership</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Ownership" name="txt_Ownership" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Type</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Type" name="ddl_Type">
                                                </select>
                                            </td>
                                            <td>
                                                <label>Ticker Symbol</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_TickerSymbol" name="txt_TickerSymbol" />
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
                                                <label>Rating</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Rating" name="ddl_Rating">
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>

                                            <td>
                                                <label>Notify Owner</label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="chk_NotifyOwner" />
                                            </td>
                                            <td>
                                                <label>Email Opt Out</label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="chk_emailoptout" />
                                            </td>
                                        </tr>


                                        <tr>

                                            <td>
                                                <label>SIC Code</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_SICCode" name="txt_SICCode" />
                                            </td>
                                            <td>
                                                <label>Primary Twitter</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_PrimaryTwitter" name="txt_PrimaryTwitter" />
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
                                                <label>Billing Address</label>
                                            </td>
                                            <td>
                                                <textarea cols="20" rows="3" class="form-control invalid" id="txtarea_BillingAddress"></textarea>
                                            </td>
                                            <td>
                                                <label>Shipping Address</label>
                                            </td>
                                            <td>
                                                <textarea cols="20" rows="3" class="form-control invalid" id="txtarea_ShippingAddress"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Billing PO Box</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_BillingPOBox" name="txt_BillingPOBox" />
                                            </td>
                                            <td>
                                                <label>Shipping PO Box</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_ShippingPOBox" name="txt_ShippingPOBox" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Billing City</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_BillingCity" name="txt_BillingCity" />
                                            </td>
                                            <td>
                                                <label>Shipping City</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_ShippingCity" name="txt_ShippingCity" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Billing State</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_BillingState" name="txt_BillingState" />
                                            </td>
                                            <td>
                                                <label>Shipping State</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_ShippingState" name="txt_ShippingState" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Billing Postal Code</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_BillingPostalCode" name="txt_BillingPostalCode" />
                                            </td>
                                            <td>
                                                <label>Shipping Postal Code</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_ShippingPostalCode" name="txt_ShippingPostalCode" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Billing Country</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_BillingCountry" name="txt_BillingCountry" />
                                            </td>
                                            <td>
                                                <label>Shipping Country</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_ShippingCountry" name="txt_ShippingCountry" />
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
                                                <label>Organization Image</label>
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
        <asp:HiddenField ID="hdnUploadFilePath" runat="server" ClientIDMode="Static" /><div class="modal fade in" id="basic" tabindex="-1" role="basic" aria-hidden="false">
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
        function get_OrganizationID() {

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
                    OrganizationName: $('#F_V_txt_OrganizationName').val(),
                    PrimaryEmail: $('#F_V_txt_PrimaryEmail').val(),
                    Website: $('#F_V_txt_Website').val(),
                    PrimaryPhone: $('#F_V_txt_PrimaryPhone').val(),
                    Employees: $('#F_V_txt_Employees').val(),
                    IndustryID: $('#F_V_ddl_Industry').val(),
                    AnnualRevenue: $('#F_V_txt_AnnualRevenue').val(),
                    Fax: $('#F_V_txt_Fax').val(),
                    MemberOf: $('#F_V_txt_MemberOf').val(),
                    Ownership: $('#F_V_txt_Ownership').val(),
                    TypeID: $('#F_V_ddl_Type').val(),
                    TickerSymbol: $('#F_V_txt_TickerSymbol').val(),
                    AssignedTo: $('#F_V_ddl_AssignedTo').val(),
                    RatingID: $('#F_V_ddl_Rating').val(),
                    NotifyOwner: ($('#chk_NotifyOwner').prop('checked') == true ? 'T' : 'F'),
                    EmailOptOut: ($('#chk_emailoptout').prop('checked') == true ? 'T' : 'F'),
                    SICCode: $('#F_V_txt_SICCode').val(),
                    PrimaryTwitter: $('#F_V_txt_PrimaryTwitter').val(),
                    BillingAddress: $('#txtarea_BillingAddress').val(),
                    BillingPOBox: $('#F_V_txt_BillingPOBox').val(),
                    BillingCity: $('#F_V_txt_BillingCity').val(),
                    BillingState: $('#F_V_txt_BillingState').val(),
                    BillingPostalCode: $('#F_V_txt_BillingPostalCode').val(),
                    BillingCountry: $('#F_V_txt_BillingCountry').val(),
                    ShippingAddress: $('#txtarea_ShippingAddress').val(),
                    ShippingPOBox: $('#F_V_txt_ShippingPOBox').val(),
                    ShippingCity: $('#F_V_txt_ShippingCity').val(),
                    ShippingState: $('#F_V_txt_ShippingState').val(),
                    ShippingPostalCode: $('#F_V_txt_ShippingPostalCode').val(),
                    ShippingCountry: $('#F_V_txt_ShippingCountry').val(),
                    Descriptions: $('#txtarea_Description').val(),
                    ImagePath: att1[0],
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    imode: imode,
                    ScreenName: '',
                    OrganizationID: get_OrganizationID()
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            save_: function (imode) {
                $.ajax({
                    url: "../HttpHandler/OrganizationList.ashx",
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
                    url: "../HttpHandler/OrganizationList.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                        if (get_OrganizationID() != 0) {
                            obj_.fetch_details();
                        }
                        drpdowns = data;
                        $('#F_V_ddl_Type,#F_V_ddl_Industry,#F_V_ddl_Rating,#F_V_ddl_AssignedTo').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].IndustryID != null) {
                                        $('#F_V_ddl_Industry').append($('<option></option>').val(data[i].IndustryID).html(data[i].IndustryName));
                                    }
                                    else if (data[i].TypeID != null) {
                                        $('#F_V_ddl_Type').append($('<option></option>').val(data[i].TypeID).html(data[i].TypeName));
                                    }
                                    else if (data[i].RatingID != null) {
                                        $('#F_V_ddl_Rating').append($('<option></option>').val(data[i].RatingID).html(data[i].Rating));
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
            fetch_details: function () {
                $.ajax({
                    url: "../HttpHandler/OrganizationList.ashx",
                    data: this.arg('fetch'),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_txt_OrganizationName').val(data[0].OrganizationName).removeClass('invalid').addClass('valid');
                                $('#F_V_txt_PrimaryEmail').val(data[0].PrimaryEmail);
                                $('#F_V_txt_Website').val(data[0].Website);
                                $('#F_V_txt_PrimaryPhone').val(data[0].PrimaryPhone);
                                $('#F_V_txt_Employees').val(data[0].Employees);
                                $('#F_V_ddl_Industry option[value=' + data[0].IndustryID + ']').attr('selected', 'selected');

                                $('#F_V_txt_AnnualRevenue').val(data[0].AnnualRevenue);
                                $('#F_V_ddl_Industry option[value=' + data[0].IndustryID + ']').attr('selected', 'selected');
                                $('#F_V_txt_Fax').val(data[0].Fax);
                                $('#F_V_txt_MemberOf').val(data[0].MemberOf);
                                $('#F_V_txt_Ownership').val(data[0].Ownership);

                                $('#F_V_ddl_Type option[value=' + data[0].TypeID + ']').attr('selected', 'selected');
                                $('#F_V_txt_TickerSymbol').val(data[0].TickerSymbol);
                                $('#F_V_ddl_AssignedTo option[value=' + data[0].AssignedTo + ']').attr('selected', 'selected');
                                $('#F_V_ddl_AssignedTo').removeClass('invalid').addClass('valid');
                                $('#F_V_ddl_Rating option[value=' + data[0].RatingID + ']').attr('selected', 'selected');

                                if (data[0].NotifyOwner == 'T') {
                                    $('#chk_NotifyOwner').prop('checked',true);
                                }
                                if (data[0].EmailOptOut == 'T') {
                                    $('#chk_emailoptout').prop('checked', true);
                                }

                                $('#F_V_txt_SICCode').val(data[0].SICCode);
                                $('#F_V_txt_PrimaryTwitter').val(data[0].PrimaryTwitter);

                                $('#txtarea_BillingAddress').val(data[0].BillingAddress);
                                $('#F_V_txt_BillingPOBox').val(data[0].BillingPOBox);
                                $('#F_V_txt_BillingCity').val(data[0].BillingCity);
                                $('#F_V_txt_BillingState').val(data[0].BillingState);
                                $('#F_V_txt_BillingPostalCode').val(data[0].BillingPostalCode);
                                $('#F_V_txt_BillingCountry').val(data[0].BillingCountry);

                                $('#txtarea_ShippingAddress').val(data[0].ShippingAddress);
                                $('#F_V_txt_ShippingPOBox').val(data[0].ShippingPOBox);
                                $('#F_V_txt_ShippingCity').val(data[0].ShippingCity);
                                $('#F_V_txt_ShippingState').val(data[0].ShippingState);
                                $('#F_V_txt_ShippingPostalCode').val(data[0].ShippingPostalCode);
                                $('#F_V_txt_ShippingCountry').val(data[0].ShippingCountry);

                                $('#txtarea_Description').val(data[0].Descriptions);
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
                    if (get_OrganizationID() == 0) {
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
            obj_.Load_drpdowns('dropdown');
            att1.push('noimage');

            $('input[name^="V_"],select[name^="V_"]').parent().children('span').remove();
            $('input[name^="V_"],select[name^="V_"]').parent().append('<span style="color:red;margin-left:10px;">*</span>');

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
