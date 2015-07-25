<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="APPayment.aspx.cs" Inherits="Trident.Accounting.APPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AP-Payment</title>
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
            height: 150px !important;
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
                                                onclick="obj_.save('S');" />
                                        </li>
                                        <li>
                                            <input id="btn_post" class="cls_disabled btn green" type="button" value="Save & Post"
                                                onclick="Postdata();" /></li>
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
                        <i class="fa fa-gift"></i>AP-Payment
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                            class="config"></a><a href="javascript:;" class="reload"></a>
                    </div>
                </div>
                <div class="portlet-body cls_performo-header" style="height: 100%;">
                    <div class="row">
                        <div class="">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Paymt.No</label>
                                    </div>
                                    <div class="col-xs-4">
                                        <input type="text" class="form-control invalid" id="F_V_txt_sono" name="V_txt_sono" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Prft.Center</label>
                                    </div>
                                    <div class="col-xs-4">
                                        <input type="text" class="form-control invalid" id="F_V_txt_profitcenter" name="V_txt_profitcenter" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Period</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control invalid" id="F_V_txt_period" name="V_txt_period" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Party</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <select class="form-control " id="F_V_ddl_Party" name="V_ddl_Party">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Doc Date</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control date-picker" id="F_V_txt_docdate" name="txt_docdate" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Doc No</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control invalid" id="F_V_txt_docno" name="V_txt_docno" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="col-xs-12">
                                        <textarea class="form-control" id="txtarea_customerAdd" cols="30" rows="3" placeholder="Remarks"></textarea>
                                    </div>
                                </div>
                                 <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Cheque No</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control invalid" id="F_V_txt_Chequeno" name="V_txt_Chequeno" />
                                    </div>
                                </div>
                                   <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Cheq.Date</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control date-picker" id="F_V_txt_Chequedate" name="V_txt_Chequedate" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Currency</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <select class="form-control invalid" id="F_V_ddl_Currency" name="V_ddl_Currency">
                                        </select>
                                    </div>

                                </div>
                                 <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Ex-Rate</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control invalid" id="F_V_txt_exrate" name="V_txt_exrate" />
                                    </div>
                                </div>
                               
                             <%--   <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Ac Code</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <!-- <input type="text" class="form-control invalid" id="F_V_txt_accode" name="V_txt_accode" />-->
                                        <select class="form-control invalid" id="F_V_ddl_accode" name="V_ddl_Currency">
                                        </select>
                                    </div>

                                </div>--%>
                             
                            </div>
                            <div class="row">
                                  <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Ac Code</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <!-- <input type="text" class="form-control invalid" id="F_V_txt_accode" name="V_txt_accode" />-->
                                        <select class="form-control invalid" id="F_V_ddl_accode" name="V_ddl_accode">
                                        </select>
                                    </div>

                                </div>
                               
                                 <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Doc.Amt</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control " id="F_V_txt_docamt" name="txt_docamt" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Loc.Amt</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control " id="F_V_txt_locamt" name="txt_locamt" />
                                    </div>
                                </div>
                               
                            </div>
                            <div class="row">
                                  <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Doc Type</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <select class="form-control " id="F_V_ddl_doctype" name="ddl_doctype">
                                            <option value="P">PAY-SI</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Source</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control " id="F_V_txt_source" name="txt_source" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-4">
                                        <label class="control-label req">Post Ind</label>
                                    </div>
                                    <div class="col-xs-8">
                                        <input type="text" class="form-control " id="F_V_txt_postind" name="txt_postind" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                </div>

                            </div>
                            <%--<div class="row" >
                                <div class="col-sm-3 col-xs-3">
                                    <label class="control-label ">Customer Address</label>
                                </div>
                                <div class="col-xs-6">
                                    <textarea class="form-control" id="txtarea_customerAdd" cols="30" rows="3"></textarea>
                                </div>


                            </div>--%>
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
                                <span id="rpt_caption">Payment Detail</span>
                            </div>
                            <div class="tools">
                                <%--  <div>--%>
                                <button type="button" class="btn default" id="btn_AddDetail">Add Detail</button>
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
                            <hr />
                            <div class="row">
                                <div class="col-xs-4">
                                    <div class="">
                                    </div>
                                </div>
                                <div class="col-xs-8 invoice-block" style="text-align: right;">
                                   <strong>Total :<span id="grid_total" style="text-align: right;"></span></strong> 
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
                    <h4 class="modal-title">Supplier Invoice</h4>

                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">

                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet box blue-hoki">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <span>Supplier Invoice</span>
                                    </div>
                                    <div class="tools">
                                        <button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-times"></i>Close</button>
                                        <button type="button" id="add_popup" class="btn default"><i class="fa fa-plus"></i>Add</button>
                                        <button type="button" id="btn_updateExRate" class="btn default"><i class="fa fa-refresh"></i>Update Ex.Rate</button>
                                        <%-- <a href="javascript:;" data-dismiss="modal" class="btn blue" style="position: relative;">Close <i class="fa fa-times"></i>
                                        </a>--%>
                                        <%--  <a href="javascript:;" class="btn btn red" id="add_popup" style="position: relative;">Add <i class="fa fa-plus"></i>
                                        </a>--%>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <table class="table table-striped table-bordered table-hover" id="sample">
                                        <thead class="table-hover">
                                            <tr>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
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
    <%--<script src="https://twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js" type="text/javascript"></script>--%>
    <script src="../JavaScript/typehead.js"></script>
    <script src="../JavaScript/jquery.uploadify.js"></script>
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
        function get_DCID() {

            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }
        var drpdowns = [], req, old_data = 0, res, obj_tbl, pop_performa_id = '', obj_tbl_main, discountID = [], discountName = [], added_item = [], final_prod = [], final_prod_code = [], popup_data = [];
        var discount_str = '', SalesId = 0; var productcode_;
        var main_data = [], removed_data = [], org_data = [], all_data = [], org_prod = [], productcode_data = [], product_Desc = [];
        var att1, att2, att3 = '';
        var initTable5 = function (tbl) {

            var table = $('#' + tbl);

            /* Fixed header extension: http://datatables.net/extensions/scroller/ */

            //$.extend(true, $.fn.DataTable.TableTools.classes, {
            //    "container": "btn-group tabletools-dropdown-on-portlet",
            //    "buttons": {
            //        "normal": "btn btn-sm default",
            //        "disabled": "btn btn-sm default disabled"
            //    },
            //    "collection": {
            //        "container": "DTTT_dropdown dropdown-menu tabletools-dropdown-menu"
            //    }
            //});

            var oTable = table.dataTable({

                //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
                "dom": "<'row' <'col-md-12'>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // datatable layout without  horizobtal scroll
                // 'dom': 'lfrtip',
                //   "scrollY": "300",
                "deferRender": true,
                "order": [
                    [1, 'asc']
                ],
                "lengthMenu": [
                    [4, 15, 20, -1],
                    [4, 10, 15, 20, "All"] // change per page values here
                ],
                "pageLength": 20
                //, // set the initial value            

                ///  "tableTools": {
                //   "sSwfPath": "../assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
                //,
                //"aButtons": [{
                //    "sExtends": "pdf",
                //    "sButtonText": "PDF"
                //}, {
                //    "sExtends": "csv",
                //    "sButtonText": "CSV"
                //}, {
                //    "sExtends": "xls",
                //    "sButtonText": "Excel"
                //}, {
                //    "sExtends": "print",
                //    "sButtonText": "Print",
                //    "sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
                //    "sMessage": "Generated by DataTables"
                //}, {
                //    "sExtends": "copy",
                //    "sButtonText": "Copy"
                //}]
                //  }
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
            arg: function (screenname, imode, hmode, categoryid, dcid, period) {
                Args = {
                    PaymentID: dcid,
                    Payment_DetailID: 0,
                    BranchID: get_BranchID(),
                    ProductID: 0,
                    ProductCode: '',
                    JOBID: ($('#F_V_ddl_jobno').val() == null ? 0 : $('#F_V_ddl_jobno').val()),
                    ScreenName: screenname,
                    CompanyID: get_CompanyID(),
                    //  WarehouseID: ($('#F_V_ddl_Warehouse').val() == null ? 0 : $('#F_V_ddl_Warehouse').val()),
                    iMode: imode,
                    //  CategoryID: categoryid,
                    //   QuotationID: get_frm(),
                    PartyID: ($('#F_V_ddl_Party').val() == null ? 0 : $('#F_V_ddl_Party').val()),
                    Period: period,
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
            arg_header: function (total_qty, imode, hmode, status) {
                Arg_h = {
                    PaymentID: get_DCID(),
                    BranchID: get_BranchID(),
                    PaymentNo: ($('#F_V_txt_sono').val() == "" ? 0 : $('#F_V_txt_sono').val()),
                    doc_no: ($('#F_V_txt_docno').val() == null ? '' : $('#F_V_txt_docno').val()),
                    Profit_Center: ($('#F_V_txt_profitcenter').val() == null ? '' : $('#F_V_txt_profitcenter').val()),
                    PaymentDate: ($('#F_V_txt_docdate').val() == "" ? '01/01/1990' : $('#F_V_txt_docdate').val()),
                    Period: ($('#F_V_txt_period').val() == null ? 0 : $('#F_V_txt_period').val()),
                    Year: 0,
                    JOBID: ($('#F_V_ddl_jobno').val() == null ? 0 : $('#F_V_ddl_jobno').val()),
                    ac_source: ($('#F_V_txt_source').val() == null ? '' : $('#F_V_txt_source').val()),
                    ac_Code: ($('#F_V_ddl_accode').val() == null ? '' : $('#F_V_ddl_accode').val()),
                    PartyID: ($('#F_V_ddl_Party').val() == null ? 0 : $('#F_V_ddl_Party').val()),
                    doc_type: ($('#F_V_ddl_doctype').val() == null ? '' : $('#F_V_ddl_doctype').val()),
                    CurrencyID: ($('#F_V_ddl_Currency').val() == null ? 0 : $('#F_V_ddl_Currency').val()),
                    Remarks: ($('#txtarea_customerAdd').val() == null ? '' : $('#txtarea_customerAdd').val()),
                    loc_amt: ($('#F_V_txt_locamt').val() == null ? '' : $('#F_V_txt_locamt').val()),
                    doc_amt: ($('#F_V_txt_docamt').val() == null ? '' : $('#F_V_txt_docamt').val()),
                    PostStatus: status,
                    CompanyID: get_CompanyID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_dateonly(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_dateonly(),
                    iMode: imode,
                    hmode: hmode,
                    Chequeno: ($('#F_V_txt_Chequeno').val() == "" ? 0 : $('#F_V_txt_Chequeno').val()),
                    ChequeDate: ($('#F_V_txt_Chequedate').val() == "" ? 0 : $('#F_V_txt_Chequedate').val()),
                    ex_rate: ($('#F_V_txt_exrate').val() == "" ? 0 : $('#F_V_txt_exrate').val())
                    
                }

                return Arg_h;
            },
            arg_detail: function (prod_Detail, ProdID, index, hmode, imode) {
                Arg_d = {
                    Payment_DetailID: prod_Detail,
                    PaymentID: ProdID,
                    ProductCode: $('#Code_' + index).text(),
                    Description: $('#Description_' + index).val(),
                    ac_code: $('#ac_code_' + index).text(),
                    ac_type: $('#ac_type_' + index).text(),
                    ex_rate: $('#ex_rate_' + index).text(),
                    LineType: $('#LineType_' + index).text(),
                    Qty: $('#Qty_' + index).text(),
                    loc_amt: $('#loc_amt_' + index).text(),
                    doc_amt: $('#doc_amt_' + index).text(),
                    imode: imode,
                    POID: $('#PONO_' + index).text(),
                    Currency: $('#Currency_' + index).text(),
                    hmode: hmode
                }
                return Arg_d;
            },
            cur_date: function () {
                var date = new Date();
                return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            cur_dateonly: function () {
                var date = new Date();
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1; //January is 0!

                var yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                var today = dd + '/' + mm + '/' + yyyy;
                return today;
            },
            searchlist: function () {
                window.location.href = '../SearchListTransaction.aspx?pg=APPAYMENT';
            },
            clear: function () {
                Metronic.blockUI({ boxed: true, message: 'Saving...' });
                $('#F_V_txt_profitcenter,#F_V_txt_Year,.cls_cal_area input,#txtarea_customerAdd,#F_V_txt_period,#F_V_txt_docno,#F_V_txt_partycode,#F_V_ddl_doctype,#F_V_txt_source,#F_V_txt_source,#F_V_txt_postind,#F_V_txt_transind,#F_V_txt_locamt,#F_V_txt_docamt').val('').removeClass('valid').addClass('invalid');
                $('#F_V_ddl_Currency option[value=0],#F_V_ddl_Party  option[value=0],#F_V_ddl_accode option[value=0]').attr('selected', 'selected');
                $('#F_V_ddl_Currency,#F_V_ddl_Party').removeClass('valid').addClass('invalid');
                $('#F_V_txt_docdate').val(obj_.cur_dateonly());

                //Attachements_clear();

                old_data = 0; all_data = [];
                removed_data = [], main_data = [], final_prod_code = [], final_prod = [];
                if (obj_tbl_main != undefined) {
                    $('#sample_1').dataTable().fnClearTable();
                }
                Metronic.unblockUI();

                obj_.get_autocode('APPayment', 'AutoCode', 'get_autocode');
                sessionStorage.setItem('ID', 0);
            },

            exit: function () {
                window.location.href = "../HomeContentPage.aspx";
            },
            get_autocode: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0, get_DCID(), obj_.cur_dateonly()), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_txt_sono').val(data[0].Column1);
                                $('#F_V_txt_sono').removeClass('invalid').addClass('valid');
                                $('#F_V_txt_sono').css('border', '1px solid red');
                            }
                        }
                    }
                });
            },
            get_drpdowns: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0, get_DCID(), obj_.cur_dateonly()), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (get_DCID() != 0) {
                            obj_.get_product_update(get_DCID());
                        }
                        //else if (get_frm() != 0) {
                        //    obj_.get_autocode();
                        //    obj_.get_product_updateQ();
                        //}
                        drpdowns = data;
                        $('#F_V_ddl_Party,#F_V_ddl_Currency,#F_V_ddl_accode').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].PartyName != null) {
                                        $('#F_V_ddl_Party').append($('<option></option>').val(data[i].PartyID).html(data[i].PartyName));
                                    } else if (data[i].CurrencyName != null) {
                                        $('#F_V_ddl_Currency').append($('<option></option>').val(data[i].CurrencyID).html(data[i].CurrencyName));
                                    }
                                    else if (data[i].Description != null) {
                                        $('#F_V_ddl_accode').append($('<option></option>').val(data[i].CHARTID).html(data[i].Description));
                                    }
                                }
                            }
                        }
                    }
                });
            },
            get_product_update: function (dcid) {
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: this.arg(0, 'fetch', 'get_prod_update', 0, dcid, obj_.cur_dateonly()),
                    cache: false,
                    success: function (data) {
                        main_data = [];
                        if (data != null) {
                            if (data.length > 0) {
                                old_data = 0; all_data = [];
                                removed_data = [], main_data = [], final_prod_code = [], final_prod = [];
                                if (obj_tbl_main != undefined) {
                                    $('#sample_1').dataTable().fnClearTable();
                                }
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].N_PaymentID != null) {
                                        $('#F_V_txt_sono').val(data[i].N_PaymentNo).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_docno').val(data[i].N_doc_No).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_profitcenter').val(data[i].N_Profit_Center).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_docdate').datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", data[i].N_PaymentDate);
                                        $('#F_V_txt_period').val(data[i].N_Period).removeClass('invalid').addClass('valid');
                                        //  $('#F_V_txt_Year').val(data[i].N_Year).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_partycode').val(data[i].N_PartyCode).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_Chequeno').val(data[i].N_Chequeno).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_source').val(data[i].N_ac_source).removeClass('invalid').addClass('valid');
                                        //  $('#F_V_txt_accode').val(data[i].N_ac_Code).removeClass('invalid').addClass('valid');
                                        $('#F_V_ddl_accode option[value=' + data[i].N_ac_Code + ']').attr('selected', 'selected');
                                        $('#F_V_ddl_accode').removeClass('invalid').addClass('valid');
                                        $('#F_V_ddl_Party option[value=' + data[i].N_PartyID + ']').attr('selected', 'selected');
                                        $('#F_V_ddl_Party').removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_partycode').val(data[i].N_PartyCode).removeClass('invalid').addClass('valid');
                                        $('#F_V_ddl_doctype').val(data[i].N_doc_type).removeClass('invalid').addClass('valid');
                                        $('#txtarea_customerAdd').val(data[i].N_Remarks).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_postind').val(data[i].N_PostStatus).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_exrate').val(data[i].N_ExRate).removeClass('invalid').addClass('valid');
                                        $('#F_V_ddl_Currency option[value=' + data[i].N_CurrencyID + ']').attr('selected', 'selected');
                                        $('#F_V_ddl_Currency').removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_locamt').val(data[i].N_loc_amt).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_docamt').val(data[i].N_doc_amt).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_Chequedate').datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", data[i].N_ChequeDate);
                                        //  $('#F_V_txt_terms').val(data[i].N_terms).removeClass('invalid').addClass('valid');
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
            },
            get_product_updateQ: function (dcid) {
                $('#responsive').modal('hide');
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: this.arg(0, 'GRNFetch', 'get_prod_update', 0, dcid, obj_.cur_dateonly()),
                    cache: false,
                    success: function (data) {
                        main_data = [];
                        if (data != null) {
                            if (data.length > 0) {
                                old_data = 0; all_data = [];
                                removed_data = [], main_data = [], final_prod_code = [], final_prod = [];
                                if (obj_tbl_main != undefined) {
                                    $('#sample_1').dataTable().fnClearTable();
                                }
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].N_SalesID != null) {
                                        $('#F_V_txt_docno').val(data[i].N_doc_No).removeClass('invalid').addClass('valid');
                                        //  $('#F_V_txt_docdate').val(data[i].N_SalesDate).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_docdate').datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", data[i].N_PaymentDate);
                                        $('#F_V_txt_period').val(data[i].N_Period).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_Year').val(data[i].N_Year).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_source').val(data[i].N_ac_source).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_accode').val(data[i].N_ac_Code).removeClass('invalid').addClass('valid');
                                        $('#F_V_ddl_Party option[value=' + data[i].N_PartyID + ']').attr('selected', 'selected');
                                        $('#F_V_ddl_Party').removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_partycode').val(data[i].N_PartyCode).removeClass('invalid').addClass('valid');
                                        $('#F_V_ddl_doctype').val(data[i].N_doc_type).removeClass('invalid').addClass('valid');
                                        $('#txtarea_customerAdd').val(data[i].N_Remarks).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_postind').val(data[i].N_PostStatus).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_transind').val(data[i].N_TransferStatus).removeClass('invalid').addClass('valid');
                                        $('#F_V_ddl_Currency option[value=' + data[i].N_CurrencyID + ']').attr('selected', 'selected');
                                        $('#F_V_ddl_Currency').removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_exrate').val(data[i].N_ExRate).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_locamt').val(data[i].N_loc_amt).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_docamt').val(data[i].N_doc_amt).removeClass('invalid').addClass('valid');
                                        $('#F_V_txt_terms').val(data[i].N_terms).removeClass('invalid').addClass('valid');
                                    }
                                    else {

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
            },
            get_customerjob: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/SalesOrder.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0, get_DCID(), obj_.cur_dateonly()), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_ddl_customer option[value=' + data[0].PartyID + ']').attr('selected', 'selected');
                                $('#F_V_ddl_customer').removeClass('invalid').addClass('valid');


                                $('#txtarea_customerAdd').val(data[0].Address).removeClass('invalid').addClass('valid');
                            }
                        }
                    }
                });
            },

            get_customerAddress: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/SalesOrder.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0, get_DCID(), obj_.cur_dateonly()), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {

                                $('#txtarea_customerAdd').val(data[0].Address).removeClass('invalid').addClass('valid');
                            }
                        }
                    }
                });
            },
            get_AccountsPeriod: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0, get_DCID(), obj_.cur_dateonly()), this.arg_('')),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                $('#F_V_txt_period').val(data[0].Period).removeClass('invalid').addClass('valid');
                            }
                        }
                    }
                });
            },
            load_popup: function (scname, imode, hmode, category) {
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, category, get_DCID(), obj_.cur_dateonly()), this.arg_('')),
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


                            // ComponentsFormTools.init(productcode_, '#typeahead_example_1');
                            //  ComponentsFormTools.init(productname_, '#typeahead_example_2');

                            //  $('#sample_1').parent().children('span').empty();
                            //  $('#sample_1').parent().append('<input type="text" class="cls_main_code_filter" placeholder="Enter ProductCode"/>');
                            // ComponentsFormTools.init(productcode_, '.cls_main_code_filter');
                            obj_.bind_popup(0);
                            $('#responsive').modal('show');
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
                        // var sth = '';
                        var sth = '<th><input type="checkbox" class="chk_pop_all" /></th>';
                        var j = 20000;
                        $.each(popup_data[0], function (key, value) {

                            sth += '<th class="" id="' + j + '">' + key + '</th>';
                            j++;
                        });
                        var str = '', i = 19999;
                        if (categoryID == 0) {
                            $.each(popup_data, function (key, value) {
                                //  str += '<tr><td><input type="checkbox" id=' + (++i) + ' class="cls_chk_pop" /></td>';
                                //  str += '<tr>';
                                str += '<tr><td><input type="checkbox" id=' + (++i) + ' class="cls_chk_pop" /></td>';
                                $.each(value, function (key, value) {

                                    str += '<td><span id="' + key + '_' + i + '">' + value + '</span></td>';
                                });
                                str += '</tr>';
                            });

                        } else {
                            $.each(popup_data, function (key, value) {
                                if (value.N_CategoryID == categoryID) {
                                    // str += '<tr><td><input type="checkbox" id=' + (++i) + ' class="cls_chk_pop" /></td>';
                                    //  str += '<tr>';
                                    str += '<tr><td><input type="checkbox" id=' + (++i) + ' class="cls_chk_pop" /></td>';
                                    $.each(value, function (key, value) {
                                        // if (key.indexOf('N_') == -1) {
                                        str += '<td><span id="' + key + '_' + i + '">' + value + '</span></td>';
                                        // } else {
                                        //    str += '<td><span id="' + key + '_' + i + '">' + value + '</span></td>';
                                        //}
                                    });
                                    str += '</tr>';
                                }
                            });
                        }
                        $('#sample thead tr').append(sth);
                        $('#sample tbody').append(str);
                        obj_tbl = initTable5('sample');
                        //for (var k = 20000; k < j; k++) {
                        //    $('#sample tbody tr td:nth-child(' + ($('#' + k).index() + 1) + ')').addClass('hide_');
                        //}
                    }
                }
            },
            get_productdetails: function (scname, imode, hmode, prod_id) {
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0, get_DCID(), obj_.cur_dateonly()), this.arg_(prod_id)),
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
            get_currency: function (scname, imode, hmode, prod_id) {
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0, prod_id, obj_.cur_dateonly()), this.arg_(prod_id)),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                if (data[0].Col1 != 0) {
                                    $('#F_V_txt_exrate').val(data[0].ExRate);
                                    var s = parseFloat($('#F_V_txt_docamt').val()).toFixed(2) * parseFloat(data[0].ExRate).toFixed(2);
                                    $('#F_V_txt_locamt').val(s.toFixed(2));
                                }
                                else {
                                    $('#F_V_txt_docamt').val(parseFloat($('#F_V_txt_locamt').val()).toFixed(2));
                                }
                                resizeIframe();
                            }
                        }
                    }
                });
            },
            setPost: function (scname, imode, hmode) {
                var id = 0;
                if (get_DCID() != 0)
                    id = get_DCID();
                else
                    id = sessionStorage.getItem('ID');
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0, id, obj_.cur_dateonly()), this.arg_('')),
                    cache: false,
                    async: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                if (data[0].Col1 != 0) {
                                    alert('data posted successfully!')
                                }
                                else {
                                    alert('Data posted Already !')
                                }
                            }
                        }
                    }
                });
            },
            update_diff: function (scname, imode, hmode, prod_id) {
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: $.extend(this.arg(scname, imode, hmode, 0, prod_id, obj_.cur_dateonly()), this.arg_(prod_id)),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                if (data[0].Col1 != 0) {
                                    var c = data[0].ExRate;
                                    var s = parseFloat($('#F_V_txt_locamt').val()).toFixed(2) * parseFloat(c).toFixed(2);
                                    $('#F_V_txt_docamt').val(s);                                   
                                    if (parseFloat(s).toFixed(2) > parseFloat($('#grid_total').text()).toFixed(2))
                                    {
                                        var f = parseFloat(s).toFixed(2) - parseFloat($('#grid_total').text()).toFixed(2);
                                        var data = new Array();
                                        data[0] = {
                                            Code: '0',
                                            PONO: '0',
                                            Description: 'Exchange Rate Difference',
                                            ac_code: '80300',
                                            ac_type: 'DEBIT',
                                            ex_rate: '1',
                                            Qty: '1',
                                            loc_amt: f,
                                            doc_amt: f,
                                            LineType: 'GE',
                                            Currency: 'SGD'
                                        }
                                        all_data.push(data[0]);
                                        org_data.push(data[0].Code);
                                        obj_.config_maintable(data, '1');
                                    }
                                    else if (parseFloat(s).toFixed(2) < parseFloat($('#grid_total').text()).toFixed(2))
                                    {
                                        var f = parseFloat($('#grid_total').text()).toFixed(2) - parseFloat(s).toFixed(2);
                                        var data = new Array();
                                        data[0] = {
                                            Code: '0',
                                            PONO: '0',
                                            Description: 'Exchange Rate Difference',
                                            ac_code: '80300',
                                            ac_type: 'CREDIT',
                                            ex_rate: '1',
                                            Qty: '1',
                                            loc_amt: f,
                                            doc_amt: f,
                                            LineType: 'GE',
                                            Currency: 'SGD'
                                        }
                                        all_data.push(data[0]);
                                        org_data.push(data[0].Code);
                                        obj_.config_maintable(data, '1');
                                    }                                                                      
                                }
                                else {
                                    $('#F_V_txt_docamt').val(parseFloat($('#F_V_txt_locamt').val()).toFixed(2));
                                }
                                resizeIframe();
                            }
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
                            if (key == "ex_rate") {
                                sth += '<th class="hide_">' + key + '</th>';
                            }
                            else if (key == "LineType") {
                                sth += '<th class="hide_">' + key + '</th>';
                            }
                            else {
                                sth += '<th>' + key + '</th>';
                            }
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

                            //if (key.indexOf('Qty') > -1) {
                            //    str += '<td><input type="text" class="cls_qty_main" style="width:80px" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '" value="' + value + '"></input></td>';
                            //}
                            //else 
                            if (key.indexOf('Qty') > -1) {
                                str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                            else if (key.indexOf('ac_code') > -1) {
                                str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                            else if (key.indexOf('ac_type') > -1) {
                                str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                            else if (key.indexOf('ex_rate') > -1) {
                                str += '<td><span class="hide_" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                            else if (key.indexOf('loc_amt') > -1) {
                                str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                            else if (key.indexOf('doc_amt') > -1) {
                                str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                                //else if (key.indexOf('GST_Type') > -1) {
                                //    str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                                //}
                            else if (key.indexOf('Code') > -1) {
                                str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                            else if (key.indexOf('PONO') > -1) {
                                str += '<td><span id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                            else if (key.indexOf('LineType') > -1) {
                                str += '<td><span class="hide_" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                            else if (key.indexOf('Currency') > -1) {
                                str += '<td><span  id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '">' + value + '</span></td>';
                            }
                            else {
                                str += '<td> <textarea autofocus class="form-control cls_desc" style="width:200px;" id="' + $('#sample_1 thead tr th:nth-child(' + j + ')').text() + '_' + i + '" rows="3"> ' + value + '</textarea></td>';
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
                //   $('#sample_1').parent().append('<input type="text" class="cls_main_code_filter" placeholder="Enter ProductCode"/>');
                //  ComponentsFormTools.init(productcode_, '.cls_main_code_filter');
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
                        //  $('#Qty_' + i).val(all_data[i].Qty).addClass('valid').removeClass('invalid');
                        $('#ac_code_' + i).text(all_data[i].ac_code);
                        $('#ac_type_' + i).text(all_data[i].ac_type);
                        $('#loc_amt_' + i).text(all_data[i].loc_amt);
                        $('#doc_amt_' + i).text(all_data[i].doc_amt);
                        $('#ex_rate_' + i).text(all_data[i].ex_rate);
                        $('#LineType_' + i).text(all_data[i].LineType);
                        $('#Currency_' + i).text(all_data[i].Currency);
                        $('#Description_' + i).val(all_data[i].Description).addClass('valid').removeClass('invalid');
                        //  $('#Discount_' + i + ' select option[value=' + all_data[i].Discount + ']').attr('selected', 'selected').addClass('valid').removeClass('invalid');
                    }
                }
                $('#responsive').modal('hide');
                if (mode == '1' || mode == '3') {
                    var tot_amt = 0;
                    for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                        if (removed_data.indexOf(i.toString()) == -1) {
                            tot_amt += Number($('#doc_amt_' + i).text());
                        }
                    }
                 //   $('#txt_subtotal').val(tot_amt);
                 //   $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                    //   $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
                    $('#grid_total').text(tot_amt);
                }
            },
            save: function (status) {
                if (final_prod.length == 0) {
                    alert('No SO placed');
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
                        if (get_DCID() == 0 && sessionStorage.getItem('ID') == 0) {
                            obj_.save_header('insert', 'header', status);
                        } else {
                            obj_.save_header('Update', 'header', status);
                        }

                    }
                }

            },
            save_header: function (imode, hmode, status) {
                var tot_qty = 0;
                for (var i = 0; i < final_prod.length + removed_data.length; i++) {
                    if (removed_data.indexOf(i.toString()) == -1) {
                        tot_qty += Number($('#Qty_' + i).val());
                    }
                }
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: this.arg_header(tot_qty, imode, hmode, status),
                    cache: false,
                    async:false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                if (data[0].SalesNo_count == 0) {
                                    SalesId = data[0].PaymentID;
                                    res = 0;
                                    if (get_DCID() == 0) {
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
                                                obj_.save_detail(0, get_DCID(), j, 'details', 'insert');
                                            }
                                        }
                                    }
                                } else {
                                    alert('Already SO No Exist');
                                }
                            }
                        }
                    }
                });
            },
            save_detail: function (prod_Detail_id, prodid, ind, hmode, imode) {
                $.ajax({
                    url: "../HttpHandler/AP_Payment.ashx",
                    data: this.arg_detail(prod_Detail_id, prodid, ind, hmode, imode),
                    cache: false,
                    async: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                res++;
                                if (res == req) {
                                    alert('Saved successfully');
                                    obj_.get_product_update(prodid);
                                    sessionStorage.setItem('ID', prodid);
                                    if (get_DCID() == 0) {
                                        // obj_.get_autocode('SalesOrder', 'AutoCode', 'new_autocode');
                                    }
                                }
                            }
                        }
                    }
                });
            }
        }
        $(document).ready(function () {
            sessionStorage.setItem('ID', 0);
            $('.req').after('<span style="color:red;padding-left: 5px;">*</span>');
            if (get_DCID() == 0) {
                obj_.get_autocode('APPayment', 'AutoCode', 'get_autocode');
                obj_.get_AccountsPeriod('APPayment', 'Period', 'get_autocode');
                $('#F_V_txt_source').val('CREDIT');
                $('#F_V_txt_postind').val('N');
            }
            obj_.get_drpdowns('APPayment', 'ComboBind', 'get_dropdown');

            //   obj_.bind_popup(0);
            //  $('#responsive').modal('show');


            //$('#sample tbody').on('click', 'tr', function () {
            //    var name = $('td', this).eq(0).text();

            //    var tmp=$('td a', this).eq(0)[0].id.split('-');
            //    alert('You clicked on ' + tmp[1] + '\'s row');
            //});

            $('.date-picker').val(obj_.cur_dateonly().split(' ')[0]).removeClass('invalid').addClass('valid');
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd/mm/yyyy'
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


            $(document).on('click', '#btn_AddDetail', function () {
                if ($('#F_V_ddl_Party').val() != 0)
                    obj_.load_popup('APPayment', 'GridPopup', 'get_GridPopup', 0);
                else {
                    alert('Please select Party!')
                }
            });



            $(document).on('change', '#F_V_ddl_Party', function () {
                if ($('#F_V_ddl_Party').val() != 0)
                    obj_.load_popup('APPayment', 'GridPopup', 'get_GridPopup', 0);
                else {
                    alert('Please select Party!')
                }
            });
            $(document).on('change', '#F_V_ddl_Currency', function () {
                if ($('#F_V_ddl_Currency').val() != 0)
                    obj_.get_currency('APPayment', 'CheckCurrency', 'get_GridPopup', $('#F_V_ddl_Currency').val());
                else {
                    alert('Please select Currency!')
                }
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


            $(document).on('change', '#F_V_ddl_jobno', function () {
                if ($(this).val() != 0) {
                    obj_.get_customerjob('SalesOrder', 'GetCustomerJOB', 'get_customerjob');
                } else {
                    $('#F_V_ddl_customer option[value=0]').attr('selected', 'selected');
                }
            });


            $(document).on('change', '#F_V_ddl_customer', function () {
                if ($(this).val() != 0) {
                    obj_.get_customerAddress('SalesOrder', 'GetCustomerAddress', 'get_customerjob');
                }

            });
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
                obj_.get_productdetails('APPayment', 'fetch_productdetail', 'get_prod_details', pop_performa_id);
                added_item = [];
            });

            $(document).on('click', '.cls_chk_pop', function () {
                if ($(this).is(':checked')) {
                    if (final_prod_code.indexOf($('#Code_' + $(this)[0].id).text()) == -1) {
                        // /added_item.push($('#N_ProductID_' + $(this)[0].id).text());
                        added_item.push($('#GRNNo_' + $(this)[0].id).text())
                    } else {
                        alert('GRN already added');
                    }
                } else {
                    // var id = added_item.indexOf($('#N_ProductID_' + $(this)[0].id).text());
                    var id = added_item.indexOf($('#GRNNo_' + $(this)[0].id).text());

                    added_item.splice(id, 1);
                }
            });

            $(document).on('click', '.chk_pop_all', function () {
                if ($(this).is(':checked')) {
                    $('.cls_chk_pop').attr('checked', true);
                    for (var i = 0, j = 20000; i < $('#sample tbody tr').length; i++, j++) {
                        if (final_prod_code.indexOf($('#Code_' + j).text()) == -1) {
                            added_item.push($('#GRNNo_' + j).text());
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
                    obj_.get_productdetails('SalesOrder', 'fetch_productdetail', 'get_prod_details', pop_performa_id);
                } else {
                    alert('Product already added');
                }
            });
            $(document).on('click', '#Print_POP', function () {
                if (get_DCID() != 0 || sessionStorage.getItem('ID') != 0) {
                    var id = '';
                    if (get_DCID() != 0)
                        id = get_DCID();
                    if (sessionStorage.getItem('ID') != 0)
                        id = sessionStorage.getItem('ID');
                    //window.location = "Invoice/Invoice.aspx?ID=" + id + "&pg=SALESORDER";
                    window.open("../Invoice/Invoice.aspx?ID=" + id + "&pg=SALESORDER", '_blank');
                }
            });




            $(document).on('click', '#add_productname', function () {
                added_item = [];

                if (final_prod_code.indexOf(productcode_data[product_Desc.indexOf($('#typeahead_example_2').val())]) == -1) {
                    pop_performa_id = productcode_data[Number(product_Desc.indexOf($('#typeahead_example_2').val())) + 1];
                    obj_.get_productdetails('SalesOrder', 'fetch_productdetail', 'get_prod_details', pop_performa_id);
                } else {
                    alert('Product already added');
                }
            });
            $(document).on('click', '#btn_updateExRate', function () {
               // obj_.get_currency('APPayment', 'CheckCurrency', 'get_GridPopup', $('#F_V_ddl_Currency').val());
                if ($('#F_V_ddl_Currency').val() != 0)
                    obj_.update_diff('APPayment', 'CheckCurrency', 'get_GridPopup', $('#F_V_ddl_Currency').val());
                else {
                    alert('Please select Currency!')
                }
            });
            $(document).on('change', '#F_V_txt_docamt', function () {
                var ex = $('#F_V_txt_exrate').val();
                var doc = $('#F_V_txt_docamt').val();
                var c = parseFloat(ex).toFixed(3) * parseFloat(doc).toFixed(3);
                $('#F_V_txt_locamt').val(parseFloat(c).toFixed(3));
                // obj_.get_currency('APPayment', 'CheckCurrency', 'get_GridPopup', $('#F_V_ddl_Currency').val());              
            });
            $(document).on('change', '#F_V_txt_exrate', function () {
                var ex = $('#F_V_txt_exrate').val();
                var doc = $('#F_V_txt_docamt').val();
                var c = parseFloat(ex).toFixed(3) * parseFloat(doc).toFixed(3);
                $('#F_V_txt_locamt').val(parseFloat(c).toFixed(3));
                // obj_.get_currency('APPayment', 'CheckCurrency', 'get_GridPopup', $('#F_V_ddl_Currency').val());              
            });


            //$('#F_V_txt_locamt').change(function () {
            //    alert($('#F_V_txt_locamt').val());
            //    if ($('#F_V_ddl_Currency').val() != 0)
            //        obj_.update_diff('APPayment', 'CheckCurrency', 'get_GridPopup', $('#F_V_ddl_Currency').val());
            //    else {
            //        alert('Please select Currency!')
            //    }
            //});



            $(document).on('change', '#F_V_ddl_invoicetax', function () {

                var tmp = $("#F_V_ddl_invoicetax option:selected").text().split("-");
                var r = tmp[1].split('%');
                // alert(r[0]);
                $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number(r[0])).toFixed(2));
                //  $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
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
                //var tmp = $("#F_V_ddl_invoicetax option:selected").text().split("-");
                //var r = tmp[1].split('%');
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
                        tot_amt += Number($('#doc_amt_' + i).text());
                    }
                    $('#sample_1 tbody tr:nth-child(' + (i + 1) + ') td:nth-child(2)').text(j); j++;
                }

                $('#grid_total').text(tot_amt);
                //$('#txt_subtotal').val(tot_amt);
                //$('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number(r[0])).toFixed(2));
                ////  $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                //$('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
                //  $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));

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
                var tmp = $("#F_V_ddl_invoicetax option:selected").text().split("-");
                var r = tmp[1].split('%');
                $('#txt_subtotal').val(tot_amt);
                $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number(r[0])).toFixed(2));
                //  $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
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
                var tmp = $("#F_V_ddl_invoicetax option:selected").text().split("-");
                var r = tmp[1].split('%');
                $('#txt_subtotal').val(tot_amt);
                $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number(r[0])).toFixed(2));
                // $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
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
                var tmp = $("#F_V_ddl_invoicetax option:selected").text().split("-");
                var r = tmp[1].split('%');
                $('#txt_subtotal').val(tot_amt);
                $('#txt_invoicetax').val((($('#txt_subtotal').val() / 100) * Number(r[0])).toFixed(2));
                //  $('#txt_invoicetax').val(((tot_amt / 100) * Number($('#F_V_ddl_invoicetax').val())).toFixed(2));
                $('#txt_total').val((Number($('#txt_subtotal').val()) - Number($('#txt_discount').val()) + Number($('#txt_invoicetax').val()) + Number($('#F_V_txt_shippingfee').val())).toFixed(2));
            });

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
                        obj_.get_productdetails('SalesOrder', 'fetch_productdetail', 'get_prod_details', pop_performa_id);
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

        function Edit(dpl) {
            debugger;
            var tmp = dpl.id.split('-');
            //alert(tmp[1]);
            obj_.get_product_updateQ(tmp[1]);
        }
        function Postdata() {
            obj_.save('P');
            obj_.setPost('P', 'PostReceipt', 'get_GridPopup', $('#F_V_ddl_Currency').val());
        }
    </script>

</body>
</html>





