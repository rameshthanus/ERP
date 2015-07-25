<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Trident.Invoice.Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/select2/select2.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" />
    <script src="../JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
 <%--   <script type="text/javascript" src="../JavaScript/Master.js"></script>--%>
    <script type="text/javascript" src="../assets/global/plugins/select2/select2.min.js"></script>
    <script  type="text/javascript" src="../assets/global/plugins/datatables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
    <script src="../assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
    

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
    <script src="../assets/admin/pages/scripts/table-advanced.js"></script>
    
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
        var pageUrl = '<%=ResolveUrl("~/Invoice/Report.aspx")%>', temp = [];
        var obj_tbl;
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
                        "sMessage": "REPORT"
                    }, {
                        "sExtends": "copy",
                        "sButtonText": "Copy"
                    }]
                }
            });


            var tableWrapper = $('#' + tbl + '_wrapper'); // datatable creates the table wrapper by adding with id {your_table_jd}_wrapper
            tableWrapper.find('.dataTables_length select').select2(); // initialize select2 dropdown

            return oTable;
        }
        var obj = {
            fetch_data: function (pg, imode) {
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
                                var strh = '', strb = '';
                                $.each(data.d[0], function (key, value) {
                                    if (key == 'PId') {
                                     //   strh += '<td>Action</td>';
                                    }
                                    else
                                        strh += '<td>' + key + '</td>';
                                });
                                $.each(data.d, function (key, value) {
                                    strb += '<tr>';
                                    $.each(value, function (key, value) {
                                        if (key == 'PId') {
                                            //strb += '<td><a  id="PID-' + value + '" onclick="Edit(this)" ><i class="fa fa-edit"></i></a>&nbsp;<a  id="PID-' + value + '" onclick="Delete(this)" ><i class="fa fa-times"></i></a> &nbsp;<a id="PID-' + value + '" onclick="Print(this)"><i class="fa fa-print"></i></a></td>';
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
                                obj_tbl = initTable5('sample_1');
                                resizeIframe();
                            }
                        }
                    }
                });
            },
            get_pg_url: function (pgname) {
                switch (pgname) {
                    case 'PURCHASEORDER': return 'spu_PurchaseOrderSearch'; break;
                    case 'PROFORMA': return 'spu_ProformaSearch'; break;
                    case 'SALESORDER': return 'spu_SalesOrederSearch'; break;
                }
            },

            print: function () {
                var divContents = "<table>" + $("#sample_1").html() + "</table>";
                var printWindow = window.open('', '', '');
                printWindow.document.write(divContents);
                printWindow.document.close();
                printWindow.print();
            },
            back: function () {
                window.location.href = document.referrer;
            }
        }
        $(document).ready(function () {            
            var pg = get_PG();
            $('#lbl_span').text(pg);
            if (pg != 0) {
                obj.fetch_data(pg, 'PRINT');
            }
        });       
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }

    </script>
</head>
<body onload="resizeIframe();">
    <form id="form1" runat="server">
        <div id="full_bdy" class="cls_bdy">

            <div class="portlet box blue-hoki">
                <%--<div class="form-actions top">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <div id="Div1" class="cls_bdy_tp">
                                <table>
                                    <tr>
                                        <td>
                                            <ul id="ul1">
                                                <li class="cls_disabled">
                                                    <input type="button" class="cls_disabled btn green" value="Back"
                                                        onclick="obj.back();" /></li>
                                                <li class="cls_disabled">
                                                    <input type="button" class="cls_disabled btn green" value="Print" onclick="obj.print();" /></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-globe"></i><span id="lbl_span"></span>
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


        <div class="modal fade in" id="basic1" tabindex="-1" role="basic" aria-hidden="false" >          
        </div>
    </form>

</body>
</html>
