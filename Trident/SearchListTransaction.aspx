<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchListTransaction.aspx.cs" Inherits="Trident.SearchListTransaction1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--  <link href='assets/global/plugins/font-awesome/css/font-awesome.min.css' rel="stylesheet" />
    <link href='assets/global/plugins/simple-line-icons/simple-line-icons.min.css' rel="stylesheet" />
    <link href='assets/global/plugins/bootstrap/css/bootstrap.min.css' rel="stylesheet" />
    <link href='assets/global/plugins/uniform/css/uniform.default.css' rel="stylesheet" />
    <link href='assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css' rel="stylesheet" />
    <link href='Css/font.css' rel="stylesheet" />
    <link href='assets/global/plugins/select2/select2.css' rel="stylesheet" />
    
    <link href='assets/global/css/plugins.css' rel="stylesheet" />
    <link href='assets/admin/layout2/css/layout.css' rel="stylesheet" />
    <link href='assets/admin/layout2/css/themes/default.css' rel="stylesheet" />
    <link href='assets/admin/layout2/css/custom.css' rel="stylesheet" />

    <link href="assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" />

    <link href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css" />
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/jquery-multi-select/css/multi-select.css" />
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css" />
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" />--%>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="assets/admin/pages/css/invoice.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="assets/global/css/components.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="assets/admin/layout2/css/layout.css" rel="stylesheet" type="text/css" />
    <link id="style_color" href="assets/admin/layout2/css/themes/default.css" rel="stylesheet" type="text/css" />
    <link href="assets/admin/layout2/css/custom.css" rel="stylesheet" type="text/css" />
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
    <style type="text/css">
        body {
            background: #f1f3fa !important;
        }

        .cls_bdy_tp {
            float: right;
            margin: 0px;
        }

        .amount {
            list-style: none;
            text-align: right;
            font-size: 14px;
        }

        h3 {
            font-size: 21px !important;
        }

        .rgt {
            padding-left: 38px;
        }

        .lblamt {
            list-style: none;
            text-align: left;
            font-size: 14px;
        }
    </style>
    <script src="JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--    <script type="text/javascript" src="JavaScript/MasterDirect.js"></script>--%>
    <%-- <script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>--%>
    <script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
    <%--<script src="JavaScript/js-PDF/jspdf.js"></script>
    <script src="JavaScript/js-PDF/libs/Deflate/adler32cs.js"></script>
    <script src="JavaScript/js-PDF/libs/FileSaver.js/FileSaver.js"></script>
    <script src="JavaScript/js-PDF/jspdf.plugin.standard_fonts_metrics.js"></script>
    <script src="JavaScript/js-PDF/jspdf.plugin.split_text_to_size.js"></script>
    <script src="JavaScript/js-PDF/jspdf.plugin.sillysvgrenderer.js"></script>
    <script src="JavaScript/js-PDF/jspdf.plugin.javascript.js"></script>
    <script src="JavaScript/js-PDF/jspdf.plugin.ie_below_9_shim.js"></script>
    <script src="JavaScript/js-PDF/jspdf.plugin.from_html.js"></script>
    <script src="JavaScript/js-PDF/jspdf.plugin.cell.js"></script>
    <script src="JavaScript/js-PDF/jspdf.plugin.addhtml.js"></script>
    <script src="JavaScript/js-PDF/rasterize.js"></script>--%>
    <%-- <script src="JavaScript/js-PDF/jquery.media.js"></script>--%>
    <script src="assets/global/plugins/bootstrap/js/bootstrap.js"></script>
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        .cls_bdy_tp table {
            width: 100%;
        }

            .cls_bdy_tp table ul {
                list-style: none;
                float: right;
                margin: 0px;
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

        .cls_bdy_btm h5 {
            margin: 2px 0 0 0;
            padding: 7px 30px;
            border: 1px solid #CCC;
            background-image: linear-gradient(#F6F6F6, #ECECEE);
            font-weight: bold;
            color: #535353;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        iframe {
            padding: 0px;
            border: 0px none;
            height: 500px !important;
        }

        html, body {
            height: 430px;
        }

        .sorting {
            cursor: pointer;
        }

        body {
            background: #F1F3FA none repeat scroll 0% 0%;
        }

        #tbl_searchlist_wrapper {
            border: 1px solid #ccc;
            border-top: none;
        }

        #tbl_searchlist_filter {
            text-align: right;
            padding: 5px 5px 0px 0;
            font-size: 12px;
            border-bottom: 1px solid #ccc;
        }

        #tbl_searchlist_info {
            float: left;
            padding: 5px;
        }

        #tbl_searchlist_paginate {
            float: right;
            padding: 5px;
        }

            #tbl_searchlist_paginate > a {
                cursor: pointer;
                border: 1px solid rgb(204, 204, 204);
                margin-right: 5px;
                border-radius: 2px;
                padding: 2px 5px;
                text-decoration: none;
                color: rgb(82, 81, 81);
            }

            #tbl_searchlist_paginate span:nth-child(3) a {
                padding-right: 5px;
                text-decoration: none;
                color: rgb(82, 81, 81);
                cursor: pointer;
            }

        #tbl_searchlist + div {
            height: 30px;
            font-size: 12px;
            padding-top: 2px;
        }

        #tbl_searchlist_filter label input {
            border: 1px solid #ccc;
            margin-left: 5px;
        }

        #tbl_searchlist {
            width: 100%;
            /*min-height: 300px;*/
            overflow: auto;
            background-color: #FFF;
            font-size: 12px;
            text-align: center;
        }

            #tbl_searchlist thead {
                background-color: rgb(207, 235, 239);
                font-weight: bold;
            }

            #tbl_searchlist tbody tr td {
                border: 1px solid #ccc;
            }

                #tbl_searchlist tbody tr td:first-child {
                    border-left: none;
                }

            #tbl_searchlist tr td {
                padding: 5px;
            }

        .dataTables_wrapper .ui-toolbar {
            padding: 0;
        }

        .dataTables_wrapper {
            min-height: 140px;
        }

        .dataTables_length {
            display: none;
        }
    </style>
    <script src="assets/admin/pages/scripts/table-advanced.js"></script>


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
        function get_PG() {
            <% if (Request.QueryString["pg"] != null)
               { %>
            return '<%= Request.QueryString["pg"] %>';
            
            <% } %>
            return 0;
        }

        var pageUrl = '<%=ResolveUrl("~/SearchListTransaction.aspx")%>', temp = [];
        var obj_tbl;

        var initTable5 = function (tbl, cols) {
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

                "dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable

                "deferRender": true,
                "order": [
                    [0, 'asc']
                ],
                "lengthMenu": [
                    [5, 15, 20, -1],
                    [4, 10, 15, 20, "All"] // change per page values here
                ],
                "pageLength": 20, // set the initial value            

                "tableTools": {
                    "sSwfPath": "assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
                    "aButtons": [
                      {
                          "sExtends": "copy",
                          "sButtonText": "&nbsp;&nbsp;&nbsp;&nbsp;Copy&nbsp;&nbsp;&nbsp;&nbsp;",
                          "mColumns": cols
                      },
                      {
                          "sExtends": "print",
                          "sButtonText": "&nbsp;&nbsp;&nbsp;&nbsp;Print&nbsp;&nbsp;&nbsp;&nbsp;",
                          "mColumns": cols
                      },
                      {
                          "sExtends": "xls",
                          "sButtonText": "&nbsp;&nbsp;&nbsp;&nbsp;Excel&nbsp;&nbsp;&nbsp;&nbsp;",
                          "mColumns": cols
                      },
                      {
                          "sExtends": "pdf",
                          "sButtonText": "&nbsp;&nbsp;&nbsp;&nbsp;PDF&nbsp;&nbsp;&nbsp;&nbsp;",
                          "sPdfOrientation": "landscape",
                          "sPdfMessage": 'Report Type : ' + get_PG(),
                          "sTitle": 'Efrontier',
                          "sPdfSize": "legal",
                          "mColumns": cols,
                          "fnClick": function (nButton, oConfig, flash) {
                              //  obj_tbl.fnSetColumnVis(3, false);
                              //  $(window).keyup(closePrintView);
                              customName = get_PG() + ".pdf";
                              flash.setFileName(customName);
                              this.fnSetText(flash,
                                  "title:" + this.fnGetTitle(oConfig) + "\n" +
                                  "message:" + oConfig.sPdfMessage + "\n" +
                                  "colWidth:" + this.fnCalcColRatios(oConfig) + "\n" +
                                  "orientation:" + oConfig.sPdfOrientation + "\n" +
                                  "size:" + oConfig.sPdfSize + "\n" +
                                  "--/TableToolsOpts--\n" +
                                  this.fnGetTableData(oConfig)
                              );
                          }
                      }]
                }
            });


            var tableWrapper = $('#' + tbl + '_wrapper'); // datatable creates the table wrapper by adding with id {your_table_jd}_wrapper
            tableWrapper.find('.dataTables_length select').select2(); // initialize select2 dropdown

            return oTable;
        }
        var obj = {
            fetch_data: function (pg, sp_name, imode) {
                var args = {};
                args.page_name = pg;
                args.imode = imode;
                $.ajax({
                    type: 'POST',
                    data: JSON.stringify(args),
                    url: pageUrl + '/search_',
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (obj_tbl != undefined) {
                            $('#sample_1').dataTable().fnDestroy();
                        }
                        else {
                            $('#sample_1 thead tr').empty();
                            $('#sample_1 tbody').empty();
                        }
                        $('#sample_1 thead tr').empty();
                        $('#sample_1 tbody').empty();
                        if (data != null) {
                            if (data.d.length > 0) {
                                var strh = '', strb = '', col_pos = 0, cols_ = [];
                                $.each(data.d[0], function (key, value) {

                                    cols_.push(col_pos++);
                                    if (key == 'PId') {
                                        strh += '<td>Action</td>';
                                    }
                                    else {

                                        strh += '<td>' + key + '</td>';
                                    }

                                });
                                cols_.splice(1, 1);

                                $.each(data.d, function (key, value) {
                                    strb += '<tr>';
                                    $.each(value, function (key, value) {
                                        if (key == 'PId') {
                                            // strb += '<td><a  id="PID-' + value + '" onclick="Edit(this)" ><i class="fa fa-edit"></i></a>&nbsp;<a  id="PID-' + value + '" onclick="Delete(this)" ><i class="fa fa-times"></i></a> &nbsp;<a id="PID-' + value + '" onclick="Print(this)"><i class="fa fa-print"></i></a>&nbsp;</td>';
                                            if ('<%= Request.QueryString["pg"] %>' == 'QUOTATION') {
                                                strb += '<td><a  id="PID-' + value + '" onclick="Edit(this)" ><i class="fa fa-edit"></i></a>&nbsp;<a  id="PID-' + value + '" onclick="Delete(this)" ><i class="fa fa-times"></i></a> &nbsp;<a id="PID-' + value + '" onclick="Print(this)"><i class="fa fa-print"></i></a>&nbsp;<a  id="PID-' + value + '" onclick="copy(this)" title="Copy"><i class="fa fa-copy"></i></a>&nbsp;<a id="PID-' + value + '" title="Create Sales Order" onclick="Sales(this)"><i class="fa fa-exchange"></i></a>&nbsp;<a id="PID-' + value + '" title="Create Sales Delivery" onclick="SalesDelivery(this)"><i class="fa fa-exchange"></i></a>&nbsp;</td>';
                                            }
                                            else {
                                                if ('<%= Request.QueryString["pg"] %>' == 'PURCHASEORDER') {
                                                    strb += '<td><a  id="PID-' + value.split('-')[0] + '" onclick="Edit(this)" ><i class="fa fa-edit"></i></a>&nbsp;<a  id="PID-' + value.split('-')[0] + '" onclick="Delete(this)" ><i class="fa fa-times"></i></a> &nbsp;<a id="PID-' + value.split('-')[0] + '" onclick="Print(this)"><i class="fa fa-print"></i></a>&nbsp;<a id="PID-' + value.split('-')[0] + '-' + value.split('-')[1] + '" title="Create Purchase Receiving" onclick="GRN_(this)"><i class="fa fa-exchange"></i></a>&nbsp;</td>';
                                                } else {
                                                    strb += '<td><a  id="PID-' + value + '" onclick="Edit(this)" ><i class="fa fa-edit"></i></a>&nbsp;<a  id="PID-' + value + '" onclick="Delete(this)" ><i class="fa fa-times"></i></a> &nbsp;<a id="PID-' + value + '" onclick="Print(this)"><i class="fa fa-print"></i></a>&nbsp;</td>';
                                                }

                                            }
                                        }
                                        else
                                            strb += '<td>' + value + '</td>';
                                    });
                                    strb += '</tr>';
                                });
                                $('#sample_1 thead tr').append(strh);
                                $('#sample_1 tbody').append(strb);
                                // obj.config_table('#sample_1');
                                //TableAdvanced.init();
                                obj_tbl = initTable5('sample_1', cols_);
                            }
                        }
                    }
                });
            },
            get_pg_url: function (pgname) {
                switch (pgname) {
                    case 'PURCHASEORDER': return 'spu_PurchaseOrderSearch'; break;
                    case 'QUOTATION': return 'spu_ProformaSearch'; break;
                    case 'SALESORDER': return 'spu_SalesOrederSearch'; break;
                    case 'ARINVOICE': return 'spu_ARInvoiceSearch'; break;
                    case 'SALESDELIVERY': return 'spu_SalesDeliverySearch'; break;
                }
            },

            print1: function () {
                var divContents = "<table>" + $("#sample_1").html() + "</table>";
                var printWindow = window.open('', '', '');
                printWindow.document.write(divContents);
                printWindow.document.close();
                printWindow.print();
            },
            //transfer:function(){
            //    window.location.href='/Transaction/oracle.aspx';
            //},
            back: function () {

                switch ('<%= Request.QueryString["pg"] %>') {
                    case 'PURCHASEORDER':
                        window.location = "Transaction/PurchaseOrder.aspx";
                          break;
                    case 'QUOTATION':
                        window.location = "Transaction/Quotation.aspx";
                          break;
                    case 'SALESORDER':
                        window.location = "Transaction/SalesOrder.aspx";
                        break;
                    case 'SALESRETURN':
                        window.location = "Transaction/SalesReturn.aspx";
                        break;
                    case 'INDENT':
                        window.location = "Transaction/Indent.aspx"
                        break;
                    case 'GTN':
                        window.location = "Transaction/GTN.aspx"
                        break;
                    case 'GRN':
                        window.location = "Transaction/GRN.aspx"
                        break;
                    case 'ARINVOICE':
                        window.location = "Accounting/ARInvoice.aspx"
                        break;
                    case 'SALESDELIVERY':
                        window.location = "Transaction/SalesDelivery.aspx";
                        break;
                    case 'APPAYMENT':
                        window.location = "Accounting/APPayment.aspx";
                        break;
                    case 'ARRECEIPT':
                        window.location = "Accounting/ARReceipt.aspx";
                        break;
                    case 'ARCREDITNOTE':
                        window.location = "Accounting/ARCreditNote.aspx";
                        break;
                    case 'GLENTRY':
                        window.location = "Accounting/GLEntry.aspx";
                        break;
                    case 'APVOUCHER':
                        window.location = "Accounting/APVoucher.aspx";
                        break;
                    case 'PURCHASERETURN':
                        window.location = "Transaction/POReturn.aspx";
                        break;
                        
                        
                  }

              }
        }
        $(document).ready(function () {
            // $('#iframe').css('height', '500px !important');
            var pg = get_PG();
            var sp_name = obj.get_pg_url(pg);
            if (pg != 0) {
                if (pg == 'SALESORDER') {
                    $("#acctransfer").show();
                   // $("#acctransfer").hide();
                }
                else {
                    $("#acctransfer").hide();
                }
                obj.fetch_data(pg, sp_name, 'SEARCH');
            }
            $(document).on('click', "#btn_OK", function () {
                // alert(sessionStorage.getItem('ID'));
                $('#basic1').modal('hide');
                del(sessionStorage.getItem('ID'), '<%= Request.QueryString["pg"] %>');
            });
            $(document).on('click', "#btn_Cancel", function () {
                // $('#basic1').modal('hide');
                $('#basic1').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                //  $('.modal.in').modal('hide')
            });
            <%-- var pg = 'CREATE ' + '<%= Request.QueryString["pg"] %>';--%>
          var pg = 'Add New';
            $('#lblScrn').val(pg);
        });
        function Edit(dpl) {
            debugger;
            var tmp = dpl.id.split('-');
            switch ('<%= Request.QueryString["pg"] %>') {
                case 'PURCHASEORDER':
                    window.location = "Transaction/PurchaseOrder.aspx?ID=" + tmp[1];
                    break;
                case 'QUOTATION':
                    window.location = "Transaction/Quotation.aspx?ID=" + tmp[1];
                    break;
                case 'SALESORDER':
                  
                        window.location = "Transaction/SalesOrder.aspx?ID=" + tmp[1];
                        break;
                case 'SALESRETURN':

                    window.location = "Transaction/SalesReturn.aspx?ID=" + tmp[1];
                    break;
                case 'INDENT':
                    window.location = "Transaction/Indent.aspx?ID=" + tmp[1];
                    break;
                case 'GTN':
                    window.location = "Transaction/GTN.aspx?ID=" + tmp[1];
                    break;
                case 'GRN':
                    window.location = "Transaction/GRN.aspx?ID=" + tmp[1];
                    break;

                case 'ARINVOICE':
                    if (tmp[2] == 'S') {
                        window.location = "Accounting/ARInvoice.aspx?ID=" + tmp[1];
                        break;
                    }
                    else {
                        denymsg();
                        break;
                    }
                case 'APPAYMENT':
                    if (tmp[2] == 'S') {
                        window.location = "Accounting/APPayment.aspx?ID=" + tmp[1];
                        break;
                    }
                    else {
                        denymsg();
                        break;
                    }
                case 'SALESDELIVERY':
                    if (tmp[2] == 'S') {
                        window.location = "Transaction/SalesDelivery.aspx?ID=" + tmp[1];
                        break;
                    }
                    else {
                        denymsg();
                        break;
                    }
                case 'ARRECEIPT':
                    if (tmp[2] != 'P') {
                        window.location = "Accounting/ARReceipt.aspx?ID=" + tmp[1];
                        break;
                    }
                    else {
                        denymsg();
                        break;
                    }
                case 'ARCREDITNOTE':
                    if (tmp[2] != 'P') {
                        window.location = "Accounting/ARCreditNote.aspx?ID=" + tmp[1];
                        break;
                    }
                    else {
                        denymsg();
                        break;
                    }

                case 'APVOUCHER':
                    if (tmp[2] != 'P') {
                        window.location = "Accounting/APVoucher.aspx?ID=" + tmp[1];
                        break;
                    }
                    else {
                        denymsg();
                        break;
                    }
                case 'GLENTRY':
                    window.location = "Accounting/GLEntry.aspx?ID=" + tmp[1];
                    break;
                case 'PURCHASERETURN':
                    window.location = "Transaction/POReturn.aspx?ID=" + tmp[1];
                    break;
            }

        }
        function copy(dpl) {
            debugger;
            var tmp = dpl.id.split('-');
            switch ('<%= Request.QueryString["pg"] %>') {
                case 'PURCHASEORDER':
                    window.location = "Transaction/PurchaseOrder.aspx?CopyID=" + tmp[1];
                    break;
                case 'QUOTATION':
                    window.location = "Transaction/Quotation.aspx?CopyID=" + tmp[1];
                    break;
                case 'SALESORDER':                   
                        window.location = "Transaction/SalesOrder.aspx?CopyID=" + tmp[1];
                        break;
                   
                case 'SALESDELIVERY':                    
                        window.location = "Transaction/SalesDelivery.aspx?CopyID=" + tmp[1];
                        break;
                    
               
            }

        }
        function Print(dkl) {
            debugger;
            var tmp = dkl.id.split('-');
            var pg = '<%= Request.QueryString["pg"] %>';
            window.location = "Invoice/Invoice.aspx?ID=" + tmp[1] + "&pg=" + pg;
        }
        function denymsg() {
            $('#basic1').append(callalert('alert', 'Data is Posted! Editing Denied !', '1'));
            $('#basic1').modal('show');
        }
        function Sales(dpl) {
            var tmp = dpl.id.split('-');
            window.location = "Transaction/SalesOrder.aspx?QID=" + tmp[1];
        }
        function SalesDelivery(dpl) {
            var tmp = dpl.id.split('-');
            window.location = "Transaction/SalesDelivery.aspx?QID=" + tmp[1];
        }
        function GRN_(dpl) {
            var tmp = dpl.id.split('-');
            if (tmp[2] == 'C') {
                alert('PO is completed')
            } else {
                window.location = "Transaction/GRN.aspx?QID=" + tmp[1];
            }

        }
        function get_pg_url(pgname) {
            switch (pgname) {
                case 'PURCHASEORDER': return 'purchase'; break;
                case 'QUOTATION': return 'Quotation'; break;
                case 'SALESORDER': return 'Sales'; break;
                case 'INDENT': return 'Indent'; break;
                case 'GTN': return 'GTN'; break;
                case 'GRN': return 'GRN'; break;
            }
        }
        function PDF(dkl) {
            debugger;
            var tmp = dkl.id.split('-');
            var pg = '<%= Request.QueryString["pg"] %>';
            pdf_.fetch_data(tmp[1], get_pg_url(pg), 'print');
        }
        function del(id, page) {
            var args = {};
            args.page_name = page;
            args.id = id;
            args.iMode = 'Delete';
            $.ajax({
                type: "POST",
                url: '<%=ResolveUrl("~/SearchListTransaction.aspx")%>' + '/Deletecall',
                data: JSON.stringify(args),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    if (data != null) {
                        if (data.d[0].res == "1") {

                            $('#basic1').append(callalert('alert', 'Records are deleted successfully!', '1'));
                            //  $("#basic1").css("display", "block");
                            $('#basic1').modal('show');
                            // alert('Records are  deleted sucessfully');
                            obj.fetch_data(page, obj.get_pg_url(page), 'SEARCH');
                        }
                        else {

                            $('#basic1').append(callalert('alert', 'Record Used another table so, cant delete', '1'));
                            // $("#basic1").css("display", "block");
                            $('#basic1').modal('show');
                        }

                    }
                    else {

                        $('#basic1').append(callalert('alert', 'Record Used another table so, cant delete', '1'));
                        //$("#basic1").css("display", "block");
                        $('#basic1').modal('show');

                    }
                },
                failure: function (response) {
                    alert('Record Used another table so, cant delete!');
                }
            });
        }
        function Delete(dkl) {
            debugger;
            $('#basic1').append(callalert('alert', 'Do you want to delete the record?', '2'));
            $('#basic1').modal('show');
            var tmp = dkl.id.split('-');
            var page = '<%= Request.QueryString["pg"] %>';
            sessionStorage.setItem('ID', tmp[1]);
        }
        function callalert(title, content, type) {
            $('#basic1').empty();
            var str = '<div class="modal-dialog">';
            str += '<div class="modal-content">';
            str += '<div class="modal-header">';
            str += '<button type="button" class="close" aria-hidden="true"></button>';
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
</head>
<body>
    <form id="form1" runat="server">

        <div class="cls_bdy">
            
            <!-- <div class="portlet box blue-hoki">-->
            <div class="form-actions top">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <div id="Div1" class="cls_bdy_tp">
                            <table>
                                <tr>
                                    <td>
                                        <ul id="ul1">
                                            <li class="cls_disabled">
                                                <input type="button" class="cls_disabled btn green" id="lblScrn" value="Add New"
                                                    onclick="obj.back();" /></li>
                                           
                                           <%-- <li class="cls_disabled">
                                                <input type="button" class="cls_disabled btn green" id="acctransfer" value="Account Transfer" onclick="obj.transfer();" /></li>--%>
                                        </ul>
                                       
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portlet box blue-hoki">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-globe"></i>Details
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
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <div class="modal fade in" id="basic1" tabindex="-1" role="basic" aria-hidden="false">
        </div>

        <div id="editor"></div>
    </form>

</body>
</html>
