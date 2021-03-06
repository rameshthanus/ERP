﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proforma.aspx.cs" Inherits="Trident.Transaction.Proforma1" %>

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
        .note-editable{height:251px !important;}
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
        .cls_cal_area label{
            font-weight:bold;
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

    <%--<script src="../assets/global/plugins/bootbox/bootbox.mi.js" type="text/javascript"></script>--%>
</head>
<body onload="resizeIframe();">
    <form runat="server" id="frm_performo">
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
                                            <input type="button" id="btn_exit" class="cls_disabled btn green" value="Exit -(F9)" onclick="obj_.exit();" /></li>
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
                        <i class="fa fa-gift"></i>Quotation
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                            class="config"></a><a href="javascript:;" class="reload"></a>
                    </div>
                </div>
                <div class="portlet-body cls_performo-header" style="height: 223px;">
                    <div class="row">
                        <div class="col-sm-2 col-xs-3">
                            <label class="control-label req">Quotation No.</label>
                        </div>
                        <div class="col-xs-3">
                            <input type="text" class="form-control invalid" id="F_V_txt_proformono" name="V_txt_proformono" />
                        </div>
                        <div class="col-sm-2 col-xs-3">
                            <label class="control-label req">Job No</label>
                        </div>
                        <div class="col-xs-3">
                            <select class="form-control invalid" id="F_V_ddl_jobno" name="V_ddl_jobno">
                                <option value="0"></option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 col-xs-3">
                            <label class="control-label req">Customer</label>
                        </div>
                        <div class="col-xs-3">
                            <select class="form-control invalid" id="F_V_ddl_customer" name="V_ddl_customer">
                            </select>
                        </div>
                        <div class="col-sm-2 col-xs-3">
                            <label class="control-label req">Date</label>
                        </div>
                        <div class="col-xs-3">
                            <input type="text" class="form-control invalid date-picker" id="F_V_txt_date" name="V_txt_date" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 col-xs-3">
                            <label class="control-label ">Invoice Tax</label>
                        </div>
                        <div class="col-xs-3">
                            <select class="form-control " id="F_V_ddl_invoicetax" name="ddl_invoicetax">
                            </select>
                        </div>
                        <div class="col-sm-2 col-xs-3">
                            <label class="control-label req">Delivery Date</label>
                        </div>
                        <div class="col-xs-3">
                            <input type="text" class="form-control invalid date-picker" id="F_V_txt_deliverydate" name="V_txt_deliverydate" />

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-10 col-xs-12">
                            <a class="btn btn-success" id="btn_dialog" data-toggle="modal" href="#responsive" style="float: right; margin-bottom: 20px;">Choose Products </a>
                            </div>
                    </div>
                </div>
            </div>
            <%-- <div class="row">
                <div class="col-lg-2 col-xs-12">
                    <a class="btn btn-success" id="btn_dialog" data-toggle="modal" href="#responsive" style="float: right; margin-bottom: 20px;">Choose Products </a>
                </div>
            </div>--%>
            <div class="row" id="dv_main_prod">
                <div class="col-xs-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span id="rpt_caption">Quotation Detail</span>
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
                            <div class="row">
                                <div class="col-sm-7 col-xs-12">
                                    <div class="col-xs-12">
                                        <div class="portlet box blue-hoki">
                                            <div class="portlet-title">
                                                <div class="caption">
                                                    <i class="fa fa-gift"></i>Note
                                                </div>
                                                <div class="tools">
                                                    <a href="javascript:;" class="collapse"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <ul class="nav nav-pills">
                                                    <li class="active">
                                                        <a href="#tab_2_1" data-toggle="tab">Internal Note </a>
                                                    </li>
                                                    <li>
                                                        <a href="#tab_2_2" data-toggle="tab">Invoice Note </a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane fade active in" id="tab_2_1">
                                                        <div class="">
                                                            <div class="portlet-body form">
                                                                <div class="form-body" style="background-color: #fff; height: 337px; padding: 0">
                                                                    <div class="form-group">
                                                                        <div class="col-md-12" style="padding: 0">
                                                                            <div name="summernote" id="txt_internalnote">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="tab_2_2">
                                                        <div class="">
                                                            <div class="portlet-body form">
                                                                <div class="form-body" style="background-color: #fff; height: 337px; padding: 0">
                                                                    <div class="form-group">
                                                                        <div class="col-md-12" style="padding: 0">
                                                                            <div name="summernote" id="txt_invoicenote">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-xs-12 cls_cal_area" >
                                    <div class="col-xs-12">
                                        <label class="control-label cls_lbl col-xs-4">Sub Total</label>
                                        <input type="text" id="txt_subtotal" value="0" class="form-control cls_txt col-xs-6" disabled="disabled" />
                                    </div>
                                    <div class="col-xs-12">
                                        <label class="control-label cls_lbl col-xs-4">Discount</label>
                                        <input type="text" id="txt_discount" value="0" class="form-control cls_txt col-xs-6" disabled="disabled" />
                                    </div>
                                    <div class="col-xs-12">
                                        <label class="control-label cls_lbl col-xs-4">Invoice Tax</label>
                                        <input type="text" id="txt_invoicetax" value="0" class="form-control cls_txt col-xs-6" disabled="disabled" />
                                    </div>
                                    <div class="col-xs-12">
                                        <label class="control-label cls_lbl col-xs-4">Shipping Fee</label>
                                        <input type="text" id="F_V_txt_shippingfee" value="0" class="form-control cls_txt col-xs-6" />
                                    </div>
                                    <div class="col-xs-12">
                                        <label class="control-label cls_lbl col-xs-4">Total</label>
                                        <input type="text" id="txt_total" class="form-control cls_txt col-xs-6" disabled="disabled" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>

            <div id="responsive" class="modal fade" tabindex="-1" data-width="800">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Quotation</h4>

                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">

                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet box blue-hoki">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <span id="rpt_caption_pop" style="float: left">Performo</span>
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
            return undefined;
        }
        function get_BranchID() {
            <% if (Session["BranchID"] != null)
               { %>
            return '<%= Session["BranchID"] %>';
            
            <% } %>
            return undefined;
        }
        function get_FinancialYear() {
            <% if (Session["FinancialYear"] != null)
               { %>
            return '<%= Session["FinancialYear"] %>';
            
            <% } %>
            return undefined;
        }

        function get_PerformoID() {
            //return 17;
         <% if (Request.QueryString["ID"] != null)
            { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }
        var drpdowns = [], req, old_data = 0, res, obj_tbl, pop_performa_id = '', obj_tbl_main, discountID = [], discountName = [], added_item_id = [], final_prod = [], final_pro_ind = [], pop_data = [];
        var discount_str = '', proformaId = 0;
        var main_data = [], removed_data = [], org_data = [], all_data = [], org_prod = [];
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
        var obj_ = {
            arg: function (screenname, imode, hmode) {
                Args = {
                    QuotationID: get_PerformoID(),
                    QuotationDetailID: 0,
                    BranchID: 0,
                    ProductID: 0,
                    JOBID: $('#F_V_ddl_jobno').val(),
                    ScreenName: screenname,
                    CompanyID: get_CompanyID(),
                    iMode: imode,
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
                // alert(get_PerformoID())
                Arg_h = {
                    BranchID: get_BranchID(),
                    QuotationID: get_PerformoID(),
                    QuotationNo: ($('#F_V_txt_proformono').val() == "" ? 0 : $('#F_V_txt_proformono').val()),
                    QuotationDate: ($('#F_V_txt_date').val() == "" ? '1990/01/01' : $('#F_V_txt_date').val()),
                    JOBID: ($('#F_V_ddl_jobno').val() == null ? 0 : $('#F_V_ddl_jobno').val()),
                    TAXID: ($('#F_V_ddl_invoicetax').val() == null ? 0 : $('#F_V_ddl_invoicetax').val()),
                    DeliveryDate: ($('#F_V_txt_deliverydate').val() == "" ? '1990/01/01' : $('#F_V_txt_deliverydate').val()),
                    Status: 'A',
                    InternalNote: $('#txt_internalnote').parent().children('.note-editor').children('.note-editable').text(),
                    InvoiceNote: $('#txt_invoicenote').parent().children('.note-editor').children('.note-editable').text(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    TotalQty: (total_qty == "" ? 0 : total_qty),
                    SubTotal: ($('#txt_subtotal').val() == "" ? 0 : $('#txt_subtotal').val()),
                    DiscountAmount: ($('#txt_discount').val() == "" ? 0 : $('#txt_discount').val()),
                    TaxAmount: ($('#txt_invoicetax').val() == "" ? 0 : $('#txt_invoicetax').val()),
                    ShippingFee: ($('#F_V_txt_shippingfee').val() == "" ? 0 : $('#F_V_txt_shippingfee').val()),
                    TotalAmount: ($('#txt_total').val() == "" ? 0 : $('#txt_total').val()),
                    CompanyID: get_CompanyID(),
                    iMode: imode,
                    hmode: hmode
                }
                return Arg_h;
            },
            arg_detail: function (prod_Detail, ProdID, index, hmode, imode) {
                Arg_d = {
                    QuotationDetailID: prod_Detail,
                    QuotationID: ProdID,
                    ProductCode: $('#Code_' + index).text(),
                    Description: $('#Description_' + index).val(),
                    Qty: $('#Qty_' + index).val(),
                    DiscountAmount: "0.0",
                    Discount: $('#Discount_' + index + ' select').val(),
                    Rate: $('#Rate_' + index).val(),
                    Amount: $('#Amount_' + index).text(),
                    imode: imode,
                    hmode: hmode
                }
                return Arg_d;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            searchlist: function () {
                window.location.href = '../SearchListTransaction.aspx?pg=QUOTATION';
            },
            clear: function () {
                $('#F_V_txt_date,#F_V_txt_deliverydate,.cls_cal_area input').val('').removeClass('valid').addClass('invalid');
                $('#F_V_ddl_jobno option[value=0],#F_V_ddl_customer option[value=0],#F_V_ddl_invoicetax option[value=0]').attr('selected', 'selected');
                $('#F_V_ddl_jobno,#F_V_ddl_customer,#F_V_ddl_invoicetax').removeClass('valid').addClass('invalid')
                $('#txt_internalnote').parent().children('.note-editor').children('.note-editable').text('').removeClass('valid').addClass('invalid');;
                $('#txt_invoicenote').parent().children('.note-editor').children('.note-editable').text('').removeClass('valid').addClass('invalid');;

                old_data = 0; all_data = [];
                removed_data = [], main_data = [], final_pro_ind = [], final_prod = [];
                if (obj_tbl_main != undefined) {
                    $('#sample_1').dataTable().fnClearTable();
                }
            },
            exit: function () {
                window.location.href = "../HomeContentPage.aspx";
            },
            get_autocode: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/performo.ashx",
                    data: $.extend(this.arg(scname, imode, hmode), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_txt_proformono').val(data[0].Column1);
                                $('#F_V_txt_proformono').removeClass('invalid').addClass('valid');
                            }
                        }
                    }
                });
            },
            get_drpdowns: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/performo.ashx",
                    data: $.extend(this.arg(scname, imode, hmode), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (get_PerformoID() != 0) {
                            obj_.get_product_update();
                        }
                        drpdowns = data;
                        $('#F_V_ddl_jobno,#F_V_ddl_customer,#F_V_ddl_invoicetax').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].PartyName != null) {
                                        $('#F_V_ddl_customer').append($('<option></option>').val(data[i].PartyID).html(data[i].PartyName));
                                    } else {
                                        if (data[i].JOBCode != null) {
                                            $('#F_V_ddl_jobno').append($('<option></option>').val(data[i].JOBID).html(data[i].JOBCode));
                                        } else {
                                            if (data[i].TAXID != null) {
                                                $('#F_V_ddl_invoicetax').append($('<option></option>').val(data[i].TAXID).html(data[i].TaxName));
                                            } else {
                                                discountID.push(data[i].DiscountValue);
                                                discountName.push(data[i].DiscountName);
                                            }
                                        }
                                    }

                                }
                                for (var i = 0; i < discountName.length; i++) {
                                    discount_str += '<option value=' + discountID[i] + '>' + discountName[i] + '</option>';
                                }
                                discount_str = '<select class="cls_main_discount">' + discount_str + '</select>';

                            }
                        }
                    }
                });
            },
            get_customerjob: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/performo.ashx",
                    data: $.extend(this.arg(scname, imode, hmode), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_ddl_customer option[value=' + data[0].PartyID + ']').attr('selected', 'selected');
                                $('#F_V_ddl_customer').removeClass('invalid').addClass('valid');
                                $('#F_V_ddl_customer').css('border', '1px solid red');
                            }
                        }
                    }
                });
            },
            load_popup: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/performo.ashx",
                    data: $.extend(this.arg(scname, imode, hmode), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        pop_data = data;
                        added_item_id = [];
                        if (data != null) {
                            if (data.length > 0) {
                                if (obj_tbl != undefined) {
                                    $('#sample').dataTable().fnDestroy();
                                }
                                $('#sample thead tr').empty();
                                $('#sample tbody').empty();
                                var sth = '<th><input type="checkbox" class="chk_pop_all" /></th>';
                                $.each(data[0], function (key, value) {
                                    if (key.indexOf('ProductID') == -1) {
                                        sth += '<th>' + key + '</th>';
                                    } else {
                                        sth += '<th class="hide_">' + key + '</th>';
                                    }

                                });
                                var str = '', i = 0;
                                $.each(data, function (key, value) {
                                    str += '<tr><td><input type="checkbox" id=' + (i++) + ' class="cls_chk_pop" /></td>';
                                    $.each(value, function (key, value) {
                                        if (key.indexOf('ProductID') == -1) {
                                            str += '<td>' + value + '</td>';
                                        } else {
                                            str += '<td>' + value + '</td>';
                                        }
                                    });
                                    str += '</tr>';
                                });
                                $('#sample thead tr').append(sth);
                                $('#sample tbody').append(str);
                                obj_tbl = initTable5('sample');
                                $('#sample tbody tr td:nth-child(' + ($('.hide_').index() + 1) + ')').addClass('hide_');
                            }
                        }
                    }
                });
            },
            get_productdetails: function (scname, imode, hmode, prod_id) {
                $.ajax({
                    url: "../HttpHandler/performo.ashx",
                    data: $.extend(this.arg(scname, imode, hmode), this.arg_(prod_id)),
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
                    $.each(data[0], function (key, value) {
                        if (key.indexOf('N_') == 0) {
                        } else { sth += '<th>' + key + '</th>'; }
                    });
                    $('#sample_1 thead tr').append(sth);
                }
                var str = '', i = final_prod.length + removed_data.length, j = 3, slno = final_pro_ind.length;
                $.each(data, function (key, value) {
                    str += '<tr><td><span id=' + i + ' class="cls_chk_remove" ><I class="fa fa-minus-circle"></span></td><td>' + (slno + 1) + '</td>';
                    j = 3;
                    $.each(value, function (key, value) {
                        if (key.indexOf('N_') == 0) {

                        } else {
                            if (key.indexOf('Qty') > -1) {
                                str += '<td><input type="text" class="cls_qty_main" style="width:80px" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '" value="' + value + '"></input></td>';
                            } else {
                                if (key.indexOf('Rate') > -1) {
                                    str += '<td><input type="text" class="cls_rate_main" style="width:90px" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '" value="' + value + '"></input></td>';
                                }
                                else {
                                    if (key.indexOf('Discount') > -1) {
                                        str += '<td><div id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + discount_str + '</div></td>';
                                    } else {
                                        if (key.indexOf('Description') > -1) {
                                            str += '<td> <textarea class="form-control cls_desc" style="width:370px;" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '" rows="3"> ' + value + '</textarea></td>';
                                        } else {
                                            str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                                        }
                                    }
                                }
                            }
                            j++;
                        }
                    });
                    i = i + 1;
                    slno = slno + 1;
                    str += '</tr>';
                });

                $('#sample_1 tbody').append(str);
                obj_tbl_main = initTable5('sample_1');

                for (var i = 0; i < data.length; i++) {
                    final_prod.push(data[i]);
                    final_pro_ind.push(data[i].Code);
                }
                for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        $('#Qty_' + i).val(all_data[i].Qty).addClass('valid').removeClass('invalid');
                        $('#Rate_' + i).val(all_data[i].Rate).addClass('valid').removeClass('invalid');
                        $('#Description_' + i).val(all_data[i].Description).addClass('valid').removeClass('invalid');
                        $('#Discount_' + i + ' select option[value=' + all_data[i].Discount + ']').attr('selected', 'selected').addClass('valid').removeClass('invalid');
                    }
                }
                $('#responsive').modal('hide');
                if (mode == '1') {
                    var tot_amt = 0;
                    for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                        if (removed_data.indexOf(i.toString()) == -1) {
                            tot_amt += Number($('#Amount_' + i).text());
                        }
                    }
                    $('#txt_subtotal').val(tot_amt);
                    $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                    $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
                }
            },
            save: function () {
                if (final_prod.length == 0) {
                    alert('No performo placed');
                } else {
                    var form_data = $("#" + "<%=frm_performo.ClientID%>").serializeArray();
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
                        if (get_PerformoID() == 0) {
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
                    url: "../HttpHandler/performo.ashx",
                    data: this.arg_header(tot_qty, imode, hmode),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                               // alert(data[0].QuotationNo_count)
                                if (data[0].QuotationNo_count == 0) {
                                    proformaId = data[0].Column1;
                                    res = 0;
                                    if (get_PerformoID() == 0) {
                                        req = final_prod.length;
                                        for (var j = 0; j < all_data.length; j++) {
                                            if (removed_data.indexOf(j.toString()) == -1) {
                                                obj_.save_detail(0, proformaId, j, 'details', 'insert');
                                            }
                                        }
                                    }
                                    else {
                                        req = final_pro_ind.length;
                                        //for (var j = 0; j < old_data; j++) {
                                        //    if (removed_data.indexOf(j.toString()) == -1) {
                                        //        obj_.save_detail(main_data[j.toString()].N_QuotationDetailID, get_PerformoID(), j, 'details', 'update');
                                        //    }
                                        //}
                                        for (var j = 0; j < all_data.length; j++) {
                                            if (removed_data.indexOf(j.toString()) == -1) {
                                                obj_.save_detail(0, get_PerformoID(), j, 'details', 'insert');
                                            }
                                        }
                                    }
                                } else {
                                    alert('Already Quatation No Exist');
                                }
                            }
                        }
                    }
                });
            },
            save_detail: function (prod_Detail_id, prodid, ind, hmode, imode) {
                $.ajax({
                    url: "../HttpHandler/performo.ashx",
                    data: this.arg_detail(prod_Detail_id, prodid, ind, hmode, imode),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                res++;
                                if (res == req) {
                                    alert('Saved successfully');
                                    if (get_PerformoID() == 0) {
                                        obj_.get_autocode('Proforma', 'AutoCode', 'new_autocode');
                                    }
                                }
                                
                            }
                        }
                    }
                });
            },
            get_product_update: function () {
                $.ajax({
                    url: "../HttpHandler/performo.ashx",
                    data: this.arg_header(0, 'fetch', 'get_prod_update'),
                    cache: false,
                    success: function (data) {
                        main_data = [];
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].N_QuotationNo != null) {
                                        $('#F_V_txt_proformono').val(data[i].N_QuotationNo).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_date').val(data[i].N_QuotationDate).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_deliverydate').val(data[i].N_DeliveryDate).removeClass('invalid').addClass('valid');

                                        $('#txt_internalnote').parent().children('.note-editor').children('.note-editable').text(data[i].N_InternalNote);
                                        $('#txt_invoicenote').parent().children('.note-editor').children('.note-editable').text(data[i].N_InvoiceNote);

                                        //$('#txt_internalnote').val(data[i].N_InternalNote).removeClass('invalid').addClass('valid');
                                        //$('#txt_invoicenote').val(data[i].N_InvoiceNote).removeClass('invalid').addClass('valid');
                                        $('#txt_subtotal').val(data[i].N_SubTotal);
                                        $('#txt_discount').val(data[i].N_DiscountAmount);
                                        $('#txt_invoicetax').val(data[i].N_TaxAmount);
                                        $('#F_V_txt_shippingfee').val(data[i].N_ShippingFee);
                                        $('#txt_total').val(data[i].N_TotalAmount);

                                        $('#F_V_ddl_jobno option[value=' + data[i].N_JOBID + ']').attr('selected', 'selected');
                                        $('#F_V_ddl_jobno').removeClass('invalid').addClass('valid');
                                        $('#F_V_ddl_customer option[value=' + data[i].N_PartyID + ']').attr('selected', 'selected');
                                        $('#F_V_ddl_customer').removeClass('invalid').addClass('valid');
                                        $('#F_V_ddl_invoicetax option[value=' + data[i].N_TAXID + ']').attr('selected', 'selected');
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
                            for (var i = 0; i < main_data.length; i++) {
                                $('#Discount_' + i + ' select option[value=' + main_data[i].Discount + ']').attr('selected', 'selected');
                            }
                            resizeIframe();
                        }
                    }
                });
            }
        }
        $(document).ready(function () {
            $('.req').after('<span style="color:red;padding-left: 5px;">*</span>');
            obj_.get_drpdowns('Proforma', 'ComboBind', 'get_dropdown');
            if (get_PerformoID() == 0) {
                $('#btn_dialog').css('display', 'none');
                obj_.get_autocode('Proforma', 'AutoCode', 'get_autocode');
            }
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd/MM/yyyy'
                });
            }
            ComponentsEditors.init('#txt_internalnote');
            ComponentsEditors.init('#txt_invoicenote');

            $('.date-picker').val(obj_.cur_date().split(' ')[0]).removeClass('invalid').addClass('valid');
            $(document).on('change', '#F_V_ddl_jobno', function () {
                if ($(this).val() != 0) {
                    obj_.get_customerjob('Proforma', 'GetCustomerJOB', 'get_customerjob');
                    $('#btn_dialog').css('display', 'block');
                } else {
                    $('#F_V_ddl_customer option[value=0]').attr('selected', 'selected');
                    $('#btn_dialog').css('display', 'none');
                }
            });
            $(document).on('click', '#btn_dialog', function () {
                obj_.load_popup('Proforma', 'GridPopup', 'get_GridPopup')
            });
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
            $(document).on('click', '#add_popup', function () {
                pop_performa_id = '';
                // console.log(added_item_id)
                for (var i = 0; i < added_item_id.length; i++) {
                    if (added_item_id[i] != undefined) {
                        if (added_item_id[i].length != 0) {
                            pop_performa_id += pop_data[added_item_id[i]].ProductID + ',';
                        }
                    }
                }
                pop_performa_id = pop_performa_id.slice(0, -1);
                //  console.log(pop_performa_id);
                obj_.get_productdetails('Proforma', 'fetch_productdetail', 'get_prod_details', pop_performa_id);
            });
            $(document).on('click', '.cls_chk_pop', function () {
                if ($(this).is(':checked')) {
                    if (final_pro_ind.indexOf(pop_data[$(this)[0].id].Code) == -1) {
                        added_item_id.push($(this)[0].id);
                    } else {
                        alert('Product already added');
                    }
                } else {
                    added_item_id[$(this)[0].id] = [];
                }
            });
            $(document).on('click', '.chk_pop_all', function () {
                if ($(this).is(':checked')) {
                    $('.cls_chk_pop').attr('checked', true);
                    for (var i = 0; i < pop_data.length; i++) {
                        if (final_pro_ind.indexOf(pop_data[i].Code) == -1) {
                            added_item_id.push(i);
                        }
                    }
                } else {
                    $('.cls_chk_pop').attr('checked', false);
                    added_item_id = [];
                }
            });

            $(document).on('change', '#F_V_ddl_invoicetax', function () {
                $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
            });

            $(document).on('change', '.cls_main_discount', function () {
                all_data[$(this).parent()[0].id.split('_')[1]].Discount = $(this).val();
                var discount_amt = 0;
                for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        discount_amt = Number(discount_amt) + (Number($('#Amount_' + i).text()) / 100) * $('#Discount_' + i + ' select').val();
                    }
                }

                $('#txt_discount').val(discount_amt);
                $('#txt_total').val(Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val()));
            });



            $(document).on('click', '.cls_chk_remove', function () {
                var ind_ = final_pro_ind.indexOf($('#Code_' + $(this)[0].id).text());
                if (org_prod.indexOf($('#Code_' + $(this)[0].id).text()) > -1) {
                    old_data = old_data - 1;
                }
                removed_data.push($(this)[0].id);
                main_data.splice(ind_);
                final_pro_ind.splice(ind_, 1);
                final_prod.splice(ind_, 1);
                var table = $('#sample_1').DataTable();
                table.row($(this).parents('tr')).remove().draw();
                var tot_amt = 0;
                for (var i = 0, j = 1; i < all_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        tot_amt += Number($('#Amount_' + i).text());
                    }
                    $('#sample_1 tbody tr:nth-child(' + (i+1) + ') td:nth-child(2)').text(j); j++;
                }
                $('#txt_subtotal').val(tot_amt);
                $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
                $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
            });
            $(document).on('click', '.cls_chk_remove_all', function () {
                old_data = 0; all_data = [];
                removed_data = [], main_data = [], final_pro_ind = [], final_prod = [];
                $('#sample_1').dataTable().fnClearTable();
               // $('#sample_1').dataTable().fnDestroy();
                //$('#sample_1 thead tr').empty();
                //$('#sample_1 tbody').empty();
                //$('#sample_1 tbody').append('<tr><td>No Data</td></tr>')
              //  obj_tbl = initTable5('sample_1');
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
                $('#txt_subtotal').val(tot_amt);
                $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
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
                $('#txt_subtotal').val(tot_amt);
                $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
            });
            $(document).on('keyup', '#F_V_txt_shippingfee', function () {
                $('#Amount_' + $(this)[0].id.split('_')[1]).text($(this).val() * Number($('#Qty_' + $(this)[0].id.split('_')[1]).val()).toFixed(2));
                var tot_amt = 0;
                for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        tot_amt += Number($('#Amount_' + i).text());
                    }
                }
                $('#txt_subtotal').val(tot_amt);
                $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
            });
        });
    </script>
</body>
</html>
