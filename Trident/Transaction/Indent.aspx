<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Indent.aspx.cs" Inherits="Trident.Transaction.Indent1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
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

        .cls_main_code_filter {
            width: 200px !important;
            border: 3px solid #67809f;
            margin: 10px;
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
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/select2/select2.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/jquery-multi-select/css/multi-select.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-summernote/summernote.css" />
    <link href="../assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css" rel="stylesheet" />
    <link href="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="../assets/global/plugins/typeahead/typeahead.css" rel="stylesheet" />
    <link href="../assets/global/css/components.css" rel="stylesheet" />


</head>
<body onload="resizeIframe();">
    <form runat="server" id="frm_so">
        <div id="full_bdy">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <div id="Div1" class="cls_bdy_tp">
                        <table>
                            <tr>
                                <td>
                                    <ul id="ul1">
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
                        <i class="fa fa-gift"></i>Stock Check
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                            class="config"></a><a href="javascript:;" class="reload"></a>
                    </div>
                </div>
                <div class="portlet-body cls_performo-header" style="height: 246px;">
                    <div class="row">
                        <div class="col-sm-8 col-xs-12">
                            <div class="row">
                                <div class="col-xs-3">
                                    <label class="control-label req">Indent No</label>
                                </div>
                                <div class="col-xs-3">
                                    <input type="text" class="form-control invalid" id="F_V_txt_indentno" name="V_txt_indentno" />
                                </div>
                                <div class="col-xs-3">
                                    <label class="control-label req">Job No</label>
                                </div>
                                <div class="col-xs-3">
                                    <select class="form-control invalid" id="F_V_ddl_jobno" name="V_ddl_jobno">
                                        <option value="0"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3">
                                    <label class="control-label req">Date</label>
                                </div>
                                <div class="col-xs-3">
                                    <input type="text" class="form-control invalid date-picker" id="F_V_txt_date" name="V_txt_date" />
                                </div>
                            </div>
                            <%-- <div class="row">
                                <div class="col-xs-3">
                                    <label class="control-label ">Invoice Tax</label>
                                </div>
                                <div class="col-xs-3">
                                    <select class="form-control " id="F_V_ddl_invoicetax" name="ddl_invoicetax">
                                    </select>
                                </div>
                                <div class="col-xs-3">
                                    <label class="control-label req">Delivery Date</label>
                                </div>
                                <div class="col-sm-3  col-xs-3">
                                    <input type="text" class="form-control invalid date-picker" id="F_V_txt_deliverydate" name="V_txt_deliverydate" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 col-xs-3">
                                    <label class="control-label ">WareHouse</label>
                                </div>
                                <div class="col-xs-3">
                                    <select class="form-control " id="F_V_ddl_Warehouse" name="V_ddl_Warehouse">
                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    <textarea class="form-control" id="txtarea_customerAdd" cols="30" rows="3" placeholder="Customer Address"></textarea>
                                </div>

                            </div>--%>
                            <%--<div class="row" >
                                <div class="col-sm-3 col-xs-3">
                                    <label class="control-label ">Customer Address</label>
                                </div>
                                <div class="col-xs-6">
                                    <textarea class="form-control" id="txtarea_customerAdd" cols="30" rows="3"></textarea>
                                </div>


                            </div>--%>
                        </div>
                        <div class="col-sm-4 col-xs-12 cls_options">
                            <div class="portlet box blue-hoki">
                                <div class="portlet-title" style="background-color: rgb(140, 144, 148);">
                                    <div class="caption">
                                        <i class="fa fa-gift"></i>Draggable
                                    </div>
                                </div>
                                <div class="portlet-body" style="height: 185px;">
                                    <div class="col-xs-12" style="padding: 0;">
                                        <a class="btn purple-plum col-xs-6" id="btn_barcodescanner" data-toggle="modal">Barcode Scanner</a>
                                        <a class="btn purple-plum col-xs-6 cls_cat" id="btn_category" data-toggle="modal" style="width: 151px;">Category</a>
                                    </div>
                                    <div class="col-xs-12" style="padding: 0;">
                                        <a class="btn cls_prd col-xs-6" id="btn_productcode" data-toggle="modal">Product Code</a>
                                        <a class="btn purple-plum cls_prd" id="btn_Productname" data-toggle="modal" style="width: 151px;">Product Name </a>
                                    </div>
                                    <div class="col-xs-12" style="padding: 0;">
                                        <a class="btn purple-plum col-xs-6" id="btn_uploadfile" data-toggle="modal">Upload File</a>
                                        <a class="btn purple-plum" id="btn_dialog" data-toggle="modal" href="#" style="width: 151px;">Choose Products </a>
                                    </div>
                                    <div class="col-xs-12 cls_productcode" style="padding: 0;">
                                        <div class="input-group" style="padding: 15px 0; float: left;">
                                            <input type="text" id="typeahead_example_1" name="typeahead_example_1" class="form-control" />
                                        </div>
                                        <button type="button" class="btn blue" id="add_productcode" style="position: relative; top: 15px; background-color: gray;">
                                            Add</button>
                                    </div>
                                    <div class="col-xs-12 cls_productname" style="padding: 0; display: none">
                                        <div class="input-group" style="padding: 15px 0; float: left;">
                                            <input type="text" id="typeahead_example_2" name="typeahead_example_2" class="form-control" />
                                        </div>
                                        <button type="button" class="btn blue" id="add_productname" style="position: relative; top: 15px; background-color: gray;">Add</button>
                                    </div>
                                    <div class="col-xs-12 cls_category" style="padding: 0; display: none">
                                        <div class="input-group" style="padding: 15px 0; float: left;">
                                            <select class="form-control invalid" id="ddl_category_filter" style="width: 200px">
                                            </select>
                                        </div>
                                        <a class="btn purple-plum" id="btn_category_" data-toggle="modal" href="#" style="width: 103px; margin-top: 15px;">Add </a>
                                    </div>
                                    <div class="col-xs-12 cls_excel" style="padding: 0; display: none">
                                        <div id="drop" style="border: 1px dotted gray; margin-top: 10px; height: 43px; width: 68%; float: left; margin-right: 1%;">Drop an XLSX</div>
                                        <a class="btn" title="Sample Excel File" style="padding: 1px 4px; position: relative; top: 17px; /* left: 28px; *" href="../Excel/Book6.xlsx" target="_self"><i class="fa fa-download"></i></a>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

            <div class="row" id="dv_main_prod">
                <div class="col-xs-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span id="rpt_caption">Stock Check Detail</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover" id="sample_1">
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
                    <h4 class="modal-title">Stock Check</h4>

                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">

                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet box blue-hoki">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <span id="rpt_caption_pop" style="float: left">Products</span>
                                        <div style="float: left; position: relative; top: 54px; left: 86px; z-index: 3">
                                            <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
                                            <button type="button" class="btn blue" id="add_popup">Add</button>
                                        </div>
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
                </div>

            </div>
            <div class="row">

                <div class="col-xs-12">
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>Remarks
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                                <a href="#portlet-config" data-toggle="modal" class="config"></a>
                            </div>
                        </div>
                        <div class="portlet-body" style="height: 400px;">
                            <div class="col-sm-6 col-xs-12">
                                <ul class="nav nav-pills">
                                    <li class="active">
                                        <a href="#tab_2_1" data-toggle="tab">Remarks </a>
                                    </li>
                                    <%--<li>
                                        <a href="#tab_2_2" data-toggle="tab">Invoice Note </a>
                                    </li>--%>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="tab_2_1">
                                        <div name="summernote" id="txt_internalnote">
                                        </div>
                                    </div>
                                    <%--<div class="tab-pane fade" id="tab_2_2">
                                        <div name="summernote" id="txt_invoicenote">
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-12 cls_cal_area">
                                <%-- <div class="col-xs-12">
                                    <label class="control-label cls_lbl col-xs-6">Sub Total</label>
                                    <input type="text" id="txt_subtotal" class="form-control cls_txt col-xs-6" disabled="disabled" />
                                </div>
                                <div class="col-xs-12">
                                    <label class="control-label cls_lbl col-xs-6">Discount</label>
                                    <input type="text" id="txt_discount" class="form-control cls_txt col-xs-6" disabled="disabled" />
                                </div>
                                <div class="col-xs-12">
                                    <label class="control-label cls_lbl col-xs-6">Invoice Tax</label>
                                    <input type="text" id="txt_invoicetax" class="form-control cls_txt col-xs-6" disabled="disabled" />
                                </div>
                                <div class="col-xs-12">
                                    <label class="control-label cls_lbl col-xs-6">Shipping Fee</label>
                                    <input type="text" id="F_V_txt_shippingfee" name="'V_txt_shippingfee', " class="form-control cls_txt col-xs-6" />
                                </div>--%>
                                <div class="col-xs-12">
                                    <label class="control-label cls_lbl col-xs-6">Total</label>
                                    <input type="text" id="txt_total" class="form-control cls_txt col-xs-6" disabled="disabled" />
                                </div>

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
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script src="../assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>
    <script src="../assets/admin/pages/scripts/components-form-tools.js"></script>
    <%--<script src="https://twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js" type="text/javascript"></script>--%>
    <script src="../JavaScript/typehead.js"></script>
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
        function get_IndentID() {

            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }
        function get_frm() {

            <% if (Request.QueryString["IID"] != null)
               { %>
            return '<%= Request.QueryString["IID"] %>';
            
            <% } %>
            return 0;
        }
        var drpdowns = [], req, old_data = 0, res, obj_tbl, pop_performa_id = '', obj_tbl_main, discountID = [], discountName = [], added_item = [], final_prod = [], final_prod_code = [], popup_data = [];
        var discount_str = '', SalesId = 0; var productcode_;
        var main_data = [], removed_data = [], org_data = [], all_data = [], org_prod = [], productcode_data = [], product_Desc = [];
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
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
        var obj_ = {
            arg: function (screenname, imode, hmode, categoryid) {
                Args = {
                    IndentID: get_IndentID(),
                    IndentDetailID: 0,
                    BranchID: get_BranchID,
                    ProductID: 0,
                    ProductCode: '',
                    JOBID: ($('#F_V_ddl_jobno').val() == null ? 0 : $('#F_V_ddl_jobno').val()),
                    ScreenName: screenname,
                    CompanyID: get_CompanyID(),
                    iMode: imode,
                    CategoryID: categoryid,
                    QuotationID: get_frm(),
                    hmode: hmode
                }
                return Args;
            },
            arg_: function (prodcode) {
                Args_ = {
                    ProductCode: prodcode
                }
                return Args_;
            },
            arg_header: function (total_qty, imode, hmode) {
                Arg_h = {
                    IndentID: get_IndentID(),
                    BranchID: get_BranchID(),
                    IndentNo: ($('#F_V_txt_indentno').val() == "" ? 0 : $('#F_V_txt_indentno').val()),
                    IndentDate: ($('#F_V_txt_date').val() == "" ? '1990/01/01' : $('#F_V_txt_date').val()),
                    JOBID: ($('#F_V_ddl_jobno').val() == null ? 0 : $('#F_V_ddl_jobno').val()),
                    Status: 'A',
                    Through: '',
                    TotalQty: (total_qty == "" ? 0 : total_qty),
                    TotalAmount: ($('#txt_total').val() == "" ? 0 : $('#txt_total').val()),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    CompanyID: get_CompanyID(),
                    Remarks: $('#txt_internalnote').parent().children('.note-editor').children('.note-editable').text(),
                    iMode: imode,
                    hmode: hmode
                }
                return Arg_h;
            },
            arg_detail: function (prod_Detail, ProdID, index, hmode, imode) {
                Arg_d = {
                    IndentDetailID: prod_Detail,
                    IndentID: ProdID,
                    ProductCode: $('#Code_' + index).text(),
                    Description: $('#Description_' + index).val(),
                    Qty: $('#Qty_' + index).val(),
                    Rate: $('#Rate_' + index).val(),
                    Amount: $('#Amount_' + index).text(),
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
                window.location.href = '../SearchListTransaction.aspx?pg=INDENT';
            },
            clear: function () {
                $('#F_V_txt_date,#F_V_txt_deliverydate,.cls_cal_area input,#txtarea_customerAdd').val('').removeClass('valid').addClass('invalid');
                $('#F_V_ddl_jobno option[value=0],#F_V_ddl_Warehouse option[value=0],#F_V_ddl_customer option[value=0],#F_V_ddl_invoicetax option[value=0]').attr('selected', 'selected');
                $('#F_V_ddl_jobno,#F_V_ddl_Warehouse,#F_V_ddl_customer,#F_V_ddl_invoicetax').removeClass('valid').addClass('invalid');
                $('#txt_internalnote').parent().children('.note-editor').children('.note-editable').text('').removeClass('valid').addClass('invalid');;
                //   $('#txt_invoicenote').parent().children('.note-editor').children('.note-editable').text('').removeClass('valid').addClass('invalid');;
                obj_.get_autocode();
                old_data = 0; all_data = [];
                removed_data = [], main_data = [], final_prod_code = [], final_prod = [];
                if (obj_tbl_main != undefined) {
                    $('#sample_1').dataTable().fnClearTable();
                }
            },
            exit: function () {
                window.location.href = "../HomeContentPage.aspx";
            },
            get_autocode: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/Indent_handler.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_txt_indentno').val(data[0].Column1);
                                $('#F_V_txt_indentno').removeClass('invalid').addClass('valid');
                                $('#F_V_txt_indentno').css('border', '1px solid red');
                            }
                        }
                    }
                });
            },
            get_drpdowns: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/Indent_handler.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (get_IndentID() != 0) {
                            obj_.get_product_update();
                        }
                        else if (get_frm() != 0) {
                            obj_.get_autocode();
                            obj_.get_product_updateQ();
                        }
                        drpdowns = data;
                        $('#F_V_ddl_jobno,#ddl_category_filter').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    //if (data[i].PartyName != null) {
                                    //    $('#F_V_ddl_customer').append($('<option></option>').val(data[i].PartyID).html(data[i].PartyName));
                                    //}
                                    if (data[i].JOBCode != null) {
                                        $('#F_V_ddl_jobno').append($('<option></option>').val(data[i].JOBID).html(data[i].JOBCode));
                                    }
                                        //else if (data[i].WarehouseName != null) {
                                        //    $('#F_V_ddl_Warehouse').append($('<option></option>').val(data[i].WarehouseID).html(data[i].WarehouseName));
                                        //}
                                        //else if (data[i].TaxName != null) {
                                        //    $('#F_V_ddl_invoicetax').append($('<option></option>').val(data[i].TAXID).html(data[i].TaxName));
                                        //}
                                    else if (data[i].CategoryName != null) {
                                        $('#ddl_category_filter').append($('<option></option>').val(data[i].CategoryID).html(data[i].CategoryName));
                                    }
                                    //else if (data[i].DiscountName != null) {
                                    //    discountID.push(data[i].DiscountValue);
                                    //    discountName.push(data[i].DiscountName);
                                    //}
                                }
                                //for (var i = 0; i < discountName.length; i++) {
                                //    discount_str += '<option value=' + discountID[i] + '>' + discountName[i] + '</option>';
                                //}
                                //discount_str = '<select class="cls_main_discount">' + discount_str + '</select>';
                            }
                        }
                    }
                });
            },
            get_product_update: function () {
                $.ajax({
                    url: "../HttpHandler/Indent_handler.ashx",
                    data: this.arg(0, 'fetch', 'get_prod_update', 0),
                    cache: false,
                    success: function (data) {
                        main_data = [];
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].N_IndentNo != null) {
                                        $('#F_V_txt_indentno').val(data[i].N_IndentNo).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_date').val(data[i].N_IndentDate).removeClass('invalid').addClass('valid');
                                        //$('#F_V_txt_deliverydate').val(data[i].N_DeliveryDate).removeClass('invalid').addClass('valid');

                                        $('#txt_internalnote').parent().children('.note-editor').children('.note-editable').text(data[i].N_Remarks);
                                        //  $('#txt_invoicenote').parent().children('.note-editor').children('.note-editable').text(data[i].N_InvoiceNote);

                                        //$('#txtarea_customerAdd').val(data[i].N_CustomerAddress).removeClass('invalid').addClass('valid');

                                        // $('#txt_subtotal').val(data[i].N_SubTotal);
                                        // $('#txt_discount').val(data[i].N_DiscountAmount);
                                        // $('#txt_invoicetax').val(data[i].N_TaxAmount);
                                        // $('#F_V_txt_shippingfee').val(data[i].N_ShippingFee);
                                        $('#txt_total').val(data[i].N_TotalAmount);

                                        $('#F_V_ddl_jobno option[value=' + data[i].N_JOBID + ']').attr('selected', 'selected');
                                        $('#F_V_ddl_jobno').removeClass('invalid').addClass('valid');
                                        //  $('#F_V_ddl_customer option[value=' + data[i].N_PartyID + ']').attr('selected', 'selected');
                                        // $('#F_V_ddl_customer').removeClass('invalid').addClass('valid');
                                        //  $('#F_V_ddl_Warehouse option[value=' + data[i].N_WarehouseID + ']').attr('selected', 'selected');
                                        // $('#F_V_ddl_Warehouse').removeClass('invalid').addClass('valid');
                                        // $('#F_V_ddl_invoicetax option[value=' + data[i].N_TAXID + ']').attr('selected', 'selected');
                                        // $('#F_V_ddl_invoicetax').removeClass('invalid').addClass('valid');
                                    } else {
                                        main_data.push(data[i]);
                                        all_data.push(data[i]);
                                        org_data.push(data[i].Code);
                                        org_prod.push(data[i].Code);
                                    }
                                }
                            }
                            // org_data = main_data;
                            old_data = main_data.length;
                            obj_.config_maintable(main_data, 2);
                            //for (var i = 0; i < main_data.length; i++) {
                            //    $('#Discount_' + i + ' select option[value=' + main_data[i].Discount + ']').attr('selected', 'selected');
                            //}
                            resizeIframe();
                        }
                    }
                });
            },
            get_product_updateQ: function () {
                $.ajax({
                    url: "../HttpHandler/Indent_handler.ashx",
                    data: this.arg(0, 'Quotation_Fetch', 'get_prod_update', 0),
                    cache: false,
                    success: function (data) {
                        main_data = [];
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].N_JOBID != null) {
                                        //  $('#F_V_txt_indentno').val(data[i].N_IndentNo).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_date').val(data[i].N_IndentDate).removeClass('invalid').addClass('valid');
                                        //$('#F_V_txt_deliverydate').val(data[i].N_DeliveryDate).removeClass('invalid').addClass('valid');

                                        $('#txt_internalnote').parent().children('.note-editor').children('.note-editable').text(data[i].N_Remarks);
                                        //  $('#txt_invoicenote').parent().children('.note-editor').children('.note-editable').text(data[i].N_InvoiceNote);

                                        //$('#txtarea_customerAdd').val(data[i].N_CustomerAddress).removeClass('invalid').addClass('valid');

                                        // $('#txt_subtotal').val(data[i].N_SubTotal);
                                        // $('#txt_discount').val(data[i].N_DiscountAmount);
                                        // $('#txt_invoicetax').val(data[i].N_TaxAmount);
                                        // $('#F_V_txt_shippingfee').val(data[i].N_ShippingFee);
                                        $('#txt_total').val(data[i].N_TotalAmount);

                                        $('#F_V_ddl_jobno option[value=' + data[i].N_JOBID + ']').attr('selected', 'selected');
                                        $('#F_V_ddl_jobno').removeClass('invalid').addClass('valid');
                                        //  $('#F_V_ddl_customer option[value=' + data[i].N_PartyID + ']').attr('selected', 'selected');
                                        // $('#F_V_ddl_customer').removeClass('invalid').addClass('valid');
                                        //  $('#F_V_ddl_Warehouse option[value=' + data[i].N_WarehouseID + ']').attr('selected', 'selected');
                                        // $('#F_V_ddl_Warehouse').removeClass('invalid').addClass('valid');
                                        // $('#F_V_ddl_invoicetax option[value=' + data[i].N_TAXID + ']').attr('selected', 'selected');
                                        // $('#F_V_ddl_invoicetax').removeClass('invalid').addClass('valid');
                                    } else {
                                        main_data.push(data[i]);
                                        all_data.push(data[i]);
                                        org_data.push(data[i].Code);
                                        org_prod.push(data[i].Code);
                                    }
                                }
                            }
                            // org_data = main_data;
                            old_data = main_data.length;
                            obj_.config_maintable(main_data, 2);
                            //for (var i = 0; i < main_data.length; i++) {
                            //    $('#Discount_' + i + ' select option[value=' + main_data[i].Discount + ']').attr('selected', 'selected');
                            //}
                            resizeIframe();
                        }
                    }
                });
            },
            get_customerjob: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/Indent_handler.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_ddl_customer option[value=' + data[0].PartyID + ']').attr('selected', 'selected');
                                $('#F_V_ddl_customer').removeClass('invalid').addClass('valid');
                                $('#F_V_ddl_customer').css('border', '1px solid red');

                                $('#txtarea_customerAdd').val(data[0].Address).removeClass('invalid').addClass('valid');
                            }
                        }
                    }
                });
            },
            load_popup: function (scname, imode, hmode, category) {
                $.ajax({
                    url: "../HttpHandler/Indent_handler.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, category), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        popup_data = data;
                        added_item = [];

                        if (data != null) {
                            var productcode = {};
                            productcode_ = new Array(1);
                            productcode_[0] = new Array();

                            var productname = {};
                            var productname_ = new Array(1);
                            productname_[0] = new Array();

                            for (var i = 0; i < data.length; i++) {
                                productcode = {};
                                productcode.num = data[i].Code;
                                productcode_data.push(data[i].Code);
                                productcode_data.push(data[i].N_ProductID);
                                productcode_[0].push(productcode);

                                productname = {};
                                productname.num = data[i].Description;
                                product_Desc.push(data[i].Description);
                                product_Desc.push('--');
                                productname_[0].push(productname);
                            }


                            ComponentsFormTools.init(productcode_, '#typeahead_example_1');
                            ComponentsFormTools.init(productname_, '#typeahead_example_2');

                            $('#sample_1').parent().children('span').empty();
                            $('#sample_1').parent().append('<input type="text" class="cls_main_code_filter" placeholder="Enter ProductCode"/>');
                            ComponentsFormTools.init(productcode_, '.cls_main_code_filter');
                        }
                    }
                });
            },
            bind_popup: function (categoryID) {
                if (popup_data != null) {
                    if (popup_data.length > 0) {
                        if (obj_tbl != undefined) {
                            $('#sample').dataTable().fnDestroy();
                        }
                        $('#sample thead tr').empty();
                        $('#sample tbody').empty();
                        var sth = '<th><input type="checkbox" class="chk_pop_all" /></th>';
                        var j = 20000;
                        $.each(popup_data[0], function (key, value) {
                            if (key.indexOf('N_') == -1) {
                                sth += '<th>' + key + '</th>';
                            } else {
                                sth += '<th class="hide_" id="' + j + '">' + key + '</th>';
                                j++;
                            }
                        });
                        var str = '', i = 19999;
                        if (categoryID == 0) {
                            $.each(popup_data, function (key, value) {
                                str += '<tr><td><input type="checkbox" id=' + (++i) + ' class="cls_chk_pop" /></td>';
                                $.each(value, function (key, value) {
                                    if (key.indexOf('N_') == -1) {
                                        str += '<td><span id="' + key + '_' + i + '">' + value + '</span></td>';
                                    } else {
                                        str += '<td><span id="' + key + '_' + i + '">' + value + '</span></td>';
                                    }
                                });
                                str += '</tr>';
                            });

                        } else {
                            $.each(popup_data, function (key, value) {
                                if (value.N_CategoryID == categoryID) {
                                    str += '<tr><td><input type="checkbox" id=' + (++i) + ' class="cls_chk_pop" /></td>';
                                    $.each(value, function (key, value) {
                                        if (key.indexOf('N_') == -1) {
                                            str += '<td><span id="' + key + '_' + i + '">' + value + '</span></td>';
                                        } else {
                                            str += '<td><span id="' + key + '_' + i + '">' + value + '</span></td>';
                                        }
                                    });
                                    str += '</tr>';
                                }
                            });
                        }
                        $('#sample thead tr').append(sth);
                        $('#sample tbody').append(str);
                        obj_tbl = initTable5('sample');
                        for (var k = 20000; k < j; k++) {
                            $('#sample tbody tr td:nth-child(' + ($('#' + k).index() + 1) + ')').addClass('hide_');
                        }
                    }
                }
            },
            get_productdetails: function (scname, imode, hmode, prod_id) {
                $.ajax({
                    url: "../HttpHandler/Indent_handler.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0), this.arg_(prod_id)),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    all_data.push(data[i]);
                                    org_data.push(data[i].Code);
                                }
                                obj_.config_maintable(data, '1');
                                resizeIframe();
                            } else {
                                $('#responsive').modal('hide');
                            }
                        } else {
                            $('#responsive').modal('hide');
                        }
                    }
                });
            },
            config_maintable: function (data, mode) {
                var sth = '<th><span class="cls_chk_remove_all" ><I class="fa fa-minus-circle"></span></th><th>#</th>';
                if (obj_tbl_main != undefined) {
                    $('#sample_1').dataTable().fnDestroy();
                }
                else {
                    $('#sample_1 thead tr').empty();
                    $('#sample_1 tbody').empty();
                    // var j = 30000;
                    $.each(data[0], function (key, value) {
                        if (key.indexOf('N_') == 0) {

                        } else {

                            sth += '<th>' + key + '</th>';

                        }
                    });
                    $('#sample_1 thead tr').append(sth);
                }
                var str = '', i = final_prod.length + removed_data.length, j = 3, slno = final_prod_code.length;
                $.each(data, function (key, value) {
                    str += '<tr><td><span id=' + i + ' class="cls_chk_remove" ><I class="fa fa-minus-circle"></span></td><td>' + (slno + 1) + '</td>';
                    j = 3;
                    $.each(value, function (key, value) {
                        if (key.indexOf('N_') == 0) {
                            //  str += '<td><span class="hide_" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                        } else {

                            if (key.indexOf('Qty') > -1) {
                                str += '<td><input type="text" class="cls_qty_main" style="width:80px" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '" value="' + value + '"></input></td>';
                            } else {
                                if (key.indexOf('Rate') > -1) {
                                    str += '<td><input type="text" class="cls_rate_main" style="width:90px" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '" value="' + value + '"></input></td>';
                                }
                                else {
                                    //if (key.indexOf('Discount') > -1) {
                                    //    str += '<td><div id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + discount_str + '</div></td>';
                                    //} else {
                                    if (key.indexOf('Description') > -1) {
                                        str += '<td> <textarea autofocus class="form-control cls_desc" style="width:370px;" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '" rows="3"> ' + value + '</textarea></td>';
                                    } else {
                                        str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                                    }
                                    //}
                                }
                            }
                            j++;
                        }

                    });
                    //  str += '<td><span><button type="button" class="btn blue cls_main_add" id="main_add_'+i+'">Add</button></span></td>';
                    i = i + 1;
                    slno = slno + 1;
                    str += '</tr>';
                });

                $('#sample_1 tbody').append(str);

                obj_tbl_main = initTable5('sample_1');

                $('#sample_1 tbody tr .hide_').parent().addClass('hide_');
                setTimeout(function () {
                    if (obj_tbl_main != undefined) {
                        obj_tbl_main.fnPageChange(0)
                        $('#Qty_' + (i - 1)).focus();
                    }
                }, 200);
                $('#Qty_' + (i - 1)).focus();
                $('#sample_1_wrapper').next('span').empty();
                $('#sample_1').parent().children('span').empty();
                $('#sample_1').parent().append('<input type="text" class="cls_main_code_filter" placeholder="Enter ProductCode"/>');
                ComponentsFormTools.init(productcode_, '.cls_main_code_filter');
                if (mode == 3) {
                    for (var i = 0; i < data.length; i++) {
                        final_prod.push(data[i]);
                        all_data.push(data[i]);
                        final_prod_code.push(data[i].Code);
                    }
                } else {
                    for (var i = 0; i < data.length; i++) {
                        final_prod.push(data[i]);
                        final_prod_code.push(data[i].Code);
                    }
                }
                for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        $('#Qty_' + i).val(all_data[i].Qty).addClass('valid').removeClass('invalid');
                        $('#Rate_' + i).val(all_data[i].Rate).addClass('valid').removeClass('invalid');
                        $('#Description_' + i).val(all_data[i].Description).addClass('valid').removeClass('invalid');
                        //    $('#Discount_' + i + ' select option[value=' + all_data[i].Discount + ']').attr('selected', 'selected').addClass('valid').removeClass('invalid');
                    }
                }
                $('#responsive').modal('hide');
                if (mode == '1' || mode == '3') {
                    var tot_amt = 0;
                    for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                        if (removed_data.indexOf(i.toString()) == -1) {
                            tot_amt += Number($('#Amount_' + i).text());
                        }
                    }
                    $('#txt_total').val(tot_amt);
                    //   $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                    //  $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
                }
            },
            save: function () {
                if (final_prod.length == 0) {
                    alert('No Stock Check placed');
                } else {
                    var form_data = $("#" + "<%=frm_so.ClientID%>").serializeArray();
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
                        alert('Please fill red bordered items.')
                    }
                    else {
                        if (get_IndentID() == 0) {
                            obj_.save_header('insert', 'header');
                        } else {
                            obj_.save_header('Update', 'header');
                        }

                    }
                }

            },
            save_header: function (imode, hmode) {
                var tot_qty = 0;
                for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        tot_qty += Number($('#Qty_' + i).val());
                    }
                }
                $.ajax({
                    url: "../HttpHandler/Indent_handler.ashx",
                    data: this.arg_header(tot_qty, imode, hmode),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                if (data[0].IndentNo_count == 0) {
                                    SalesId = data[0].IndentID;
                                    res = 0;
                                    if (get_IndentID() == 0) {
                                        req = final_prod.length;
                                        for (var j = 0; j < all_data.length; j++) {
                                            if (removed_data.indexOf(j.toString()) == -1) {
                                                obj_.save_detail(0, SalesId, j, 'details', 'insert');
                                            }
                                        }
                                    }
                                    else {
                                        req = final_prod_code.length;
                                        for (var j = 0; j < all_data.length; j++) {
                                            if (removed_data.indexOf(j.toString()) == -1) {
                                                obj_.save_detail(0, get_IndentID(), j, 'details', 'insert');
                                            }
                                        }
                                    }
                                } else {
                                    alert('Already Stock Check No Exist');
                                }
                            }
                        }
                    }
                });
            },
            save_detail: function (prod_Detail_id, prodid, ind, hmode, imode) {
                $.ajax({
                    url: "../HttpHandler/Indent_handler.ashx",
                    data: this.arg_detail(prod_Detail_id, prodid, ind, hmode, imode),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                res++;
                                if (res == req) {
                                    alert('Saved successfully');
                                    obj_.get_autocode();
                                    if (get_IndentID() == 0) {
                                        //obj_.get_autocode('Indent', 'AutoCode', 'new_autocode');
                                    }
                                }
                            }
                        }
                    }
                });
            }
        }
        $(document).ready(function () {
            $('.req').after('<span style="color:red;padding-left: 5px;">*</span>');
            $('#txt_internalnote').summernote({ height: 150, width: 630 });
            $('#txt_invoicenote').summernote({ height: 150, width: 630 });
            $('.cls_options').draggable();
            if (get_IndentID() == 0) {
                obj_.get_autocode('Indent', 'AutoCode', 'get_autocode');
            }
            obj_.get_drpdowns('Indent', 'ComboBind', 'get_dropdown');
            obj_.load_popup('Indent', 'GridPopup', 'get_GridPopup', 0);

            $('.date-picker').val(obj_.cur_date().split(' ')[0]).removeClass('invalid').addClass('valid');
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy.mm.dd'
                });
            }
            UIExtendedModals.init();

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


            $(document).on('click', '#btn_category_', function () {
                obj_.bind_popup($('#ddl_category_filter').val());
                $('#responsive').modal('show');
                $('.cls_chk_pop,.chk_pop_all').attr('checked', false);
                setTimeout(function () {
                    if (obj_tbl != undefined) {
                        obj_tbl.fnPageChange(0)
                    }
                }, 200);
            });
            $(document).on('click', '#btn_dialog', function () {
                obj_.bind_popup(0);
                $('#responsive').modal('show');
                $('.cls_chk_pop,.chk_pop_all').attr('checked', false);
                setTimeout(function () {
                    if (obj_tbl != undefined) {
                        obj_tbl.fnPageChange(0)
                    }
                }, 200);
            });


            //$(document).on('change', '#F_V_ddl_jobno', function () {
            //    if ($(this).val() != 0) {
            //        obj_.get_customerjob('Indent_handler', 'GetCustomerJOB', 'get_customerjob');
            //    } else {
            //        $('#F_V_ddl_customer option[value=0]').attr('selected', 'selected');
            //    }
            //});
            $(document).on('click', '#add_popup', function () {
                pop_performa_id = '';
                for (var i = 0; i < added_item.length; i++) {
                    // if (added_item[i] != undefined) {
                    // if (added_item[i].length != 0) {
                    pop_performa_id += added_item[i] + ',';
                    //}
                    // }
                }
                pop_performa_id = pop_performa_id.slice(0, -1);
                obj_.get_productdetails('Indent_handler', 'fetch_productdetail', 'get_prod_details', pop_performa_id);
                added_item = [];
            });

            $(document).on('click', '.cls_chk_pop', function () {
                if ($(this).is(':checked')) {
                    if (final_prod_code.indexOf($('#Code_' + $(this)[0].id).text()) == -1) {
                        added_item.push($('#N_ProductID_' + $(this)[0].id).text());
                    } else {
                        alert('Product already added');
                    }
                } else {
                    var id = added_item.indexOf($('#N_ProductID_' + $(this)[0].id).text());
                    added_item.splice(id, 1);
                }
            });

            $(document).on('click', '.chk_pop_all', function () {
                if ($(this).is(':checked')) {
                    $('.cls_chk_pop').attr('checked', true);
                    for (var i = 0, j = 20000; i < $('#sample tbody tr').length; i++, j++) {
                        if (final_prod_code.indexOf($('#Code_' + j).text()) == -1) {
                            added_item.push($('#N_ProductID_' + j).text());
                        }
                    }
                } else {
                    $('.cls_chk_pop').attr('checked', false);
                    added_item = [];
                }
            });


            $(document).on('click', '#add_productcode', function () {
                added_item = [];

                if (final_prod_code.indexOf($('#typeahead_example_1').val()) == -1) {
                    pop_performa_id = productcode_data[Number(productcode_data.indexOf($('#typeahead_example_1').val())) + 1];
                    obj_.get_productdetails('Indent_handler', 'fetch_productdetail', 'get_prod_details', pop_performa_id);
                } else {
                    alert('Product already added');
                }
            });

            $(document).on('click', '#add_productname', function () {
                added_item = [];

                if (final_prod_code.indexOf(productcode_data[product_Desc.indexOf($('#typeahead_example_2').val())]) == -1) {
                    pop_performa_id = productcode_data[Number(product_Desc.indexOf($('#typeahead_example_2').val())) + 1];
                    obj_.get_productdetails('Indent_handler', 'fetch_productdetail', 'get_prod_details', pop_performa_id);
                } else {
                    alert('Product already added');
                }
            });



            //$(document).on('change', '#F_V_ddl_invoicetax', function () {
            //    $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
            //    $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
            //});

            //$(document).on('change', '.cls_main_discount', function () {
            //    all_data[$(this).parent()[0].id.split('_')[1]].Discount = $(this).val();
            //    var discount_amt = 0;
            //    for (var i = 0; i < final_prod.length + removed_data.length; i++) {
            //        if (removed_data.indexOf(i.toString()) == -1) {
            //            discount_amt = Number(discount_amt) + (Number($('#Amount_' + i).text()) / 100) * $('#Discount_' + i + ' select').val();
            //        }
            //    }

            //    $('#txt_discount').val(discount_amt);
            //    $('#txt_total').val(Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val()));
            //});



            $(document).on('click', '.cls_chk_remove', function () {
                var ind_ = final_prod_code.indexOf($('#Code_' + $(this)[0].id).text());
                if (org_prod.indexOf($('#Code_' + $(this)[0].id).text()) > -1) {
                    old_data = old_data - 1;
                }
                removed_data.push($(this)[0].id);
                main_data.splice(ind_);
                final_prod_code.splice(ind_, 1);
                final_prod.splice(ind_, 1);
                var table = $('#sample_1').DataTable();
                table.row($(this).parents('tr')).remove().draw();
                var tot_amt = 0;
                for (var i = 0, j = 1; i < all_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        tot_amt += Number($('#Amount_' + i).text());
                    }
                    $('#sample_1 tbody tr:nth-child(' + (i + 1) + ') td:nth-child(2)').text(j); j++;
                }
                $('#txt_subtotal').val(tot_amt);
                $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
                $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
            });
            $(document).on('click', '.cls_chk_remove_all', function () {
                old_data = 0; all_data = [];
                removed_data = [], main_data = [], final_prod_code = [], final_prod = [];
                $('#sample_1').dataTable().fnClearTable();

            });

            $(document).on('keypress', '.cls_qty_main', function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $(document).on('keyup', '.cls_qty_main', function () {
                $('#Amount_' + $(this)[0].id.split('_')[1]).text($(this).val() * Number($('#Rate_' + $(this)[0].id.split('_')[1]).val()).toFixed(2));
                all_data[$(this)[0].id.split('_')[1]].Qty = $(this).val();
                all_data[$(this)[0].id.split('_')[1]].Amount = Number($(this).val()) * Number($('#Rate_' + $(this)[0].id.split('_')[1]).val());
                var tot_amt = 0;
                for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        tot_amt += Number($('#Amount_' + i).text());
                    }
                }
                $('#txt_total').val(tot_amt);
                //  $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                // $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
            });

            $(document).on('keyup', '.cls_desc', function () {
                all_data[$(this)[0].id.split('_')[1]].Description = $(this).val();
            });
            $(document).on('keypress', '.cls_rate_main,#F_V_txt_shippingfee', function (e) {
                if ((e.which != 46 || $(this).val().indexOf('.') != -1) && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $(document).on('keyup', '.cls_rate_main', function () {
                $('#Amount_' + $(this)[0].id.split('_')[1]).text($(this).val() * Number($('#Qty_' + $(this)[0].id.split('_')[1]).val()).toFixed(2));
                all_data[$(this)[0].id.split('_')[1]].Rate = $(this).val();
                var tot_amt = 0;
                for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        tot_amt += Number($('#Amount_' + i).text());
                    }
                }
                $('#txt_total').val(tot_amt);
                //  $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                //   $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
            });
            //$(document).on('keyup', '#F_V_txt_shippingfee', function () {
            //    $('#Amount_' + $(this)[0].id.split('_')[1]).text($(this).val() * Number($('#Qty_' + $(this)[0].id.split('_')[1]).val()).toFixed(2));
            //    var tot_amt = 0;
            //    for (var i = 0; i < final_prod.length + removed_data.length; i++) {
            //        if (removed_data.indexOf(i.toString()) == -1) {
            //            tot_amt += Number($('#Amount_' + i).text());
            //        }
            //    }
            //    $('#txt_subtotal').val(tot_amt);
            //    $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
            //    $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
            //});

            $(document).on('click', '.cls_prd', function () {
                $('.cls_options .portlet-body div a').addClass('purple-plum');
                $(this).addClass('cls_white').removeClass('purple-plum');
                $('.cls_category,.cls_excel').css('display', 'none');
                if ($(this)[0].id == "btn_Productname") {
                    $('.cls_productname').css('display', 'block');
                    $('.cls_productcode').css('display', 'none');
                } else {
                    $('.cls_productname').css('display', 'none');
                    $('.cls_productcode').css('display', 'block');
                }
            });
            $(document).on('click', '.cls_cat', function () {
                $('.cls_options .portlet-body div a').addClass('purple-plum');
                $(this).addClass('cls_white').removeClass('purple-plum');
                $('.cls_productname,.cls_productcode,.cls_excel').css('display', 'none');
                $('.cls_category').css('display', 'block');
            });
            $(document).on('click', '#btn_uploadfile', function () {
                $('.cls_options .portlet-body div a').addClass('purple-plum');
                $(this).addClass('cls_white').removeClass('purple-plum');
                $('.cls_productname,.cls_category,.cls_productcode').css('display', 'none');
                $('.cls_excel').css('display', 'block');

            });
            $(document).on('click', '#btn_barcodescanner', function () {
                $('.cls_options .portlet-body div a').addClass('purple-plum');
                $(this).addClass('cls_white').removeClass('purple-plum');
                $('.cls_productname,.cls_category,.cls_excel').css('display', 'none');
                $('.cls_productcode').css('display', 'block');
            });

            $(document).on('keydown', '.cls_rate_main', function (e) {
                if (e.keyCode == 13) {
                    $('#sample_1').parent().children('span').empty();
                    $('#sample_1').parent().append('<input type="text" class="cls_main_code_filter"/>');
                    ComponentsFormTools.init(productcode_, '.cls_main_code_filter');
                }
            });
            $(document).on('keydown', '.cls_main_code_filter,#typeahead_example_1', function (e) {
                if (e.keyCode == 13) {
                    added_item = [];

                    if (final_prod_code.indexOf($(this).val()) == -1) {
                        pop_performa_id = productcode_data[Number(productcode_data.indexOf($(this).val())) + 1];
                        obj_.get_productdetails('Indent_handler', 'fetch_productdetail', 'get_prod_details', pop_performa_id);
                    } else {
                        alert('Product already added');
                    }
                }
            });
            $(document).on('keydown', '#typeahead_example_2', function (e) {
                if (e.keyCode == 13) {
                    $('#add_productname').click();
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
            // alert(output);
            var final = [];
            for (var i = 0; i < output[0].length; i++) {
                if (final_prod_code.indexOf(output[0][i].Code) == -1) {
                    final.push(output[0][i]);
                }
            }
            obj_.config_maintable(final, 3);
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

