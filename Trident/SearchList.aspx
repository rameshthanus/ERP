<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchList.aspx.cs" Inherits="Trident.SearchList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link href='assets/global/plugins/font-awesome/css/font-awesome.min.css' rel="stylesheet" />
    <link href='assets/global/plugins/simple-line-icons/simple-line-icons.min.css' rel="stylesheet" />
    <link href='assets/global/plugins/bootstrap/css/bootstrap.min.css' rel="stylesheet" />
    <link href='assets/global/plugins/uniform/css/uniform.default.css' rel="stylesheet" />
    <link href='assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css' rel="stylesheet" />
    <link href='Css/font.css' rel="stylesheet" />
    <link href='assets/global/plugins/select2/select2.css' rel="stylesheet" />
    <link href='assets/global/css/components.css' rel="stylesheet" />
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
    <script src="JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
  <%-- <script type="text/javascript" src="JavaScript/MasterDirect.js"></script>--%>
       <script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<%--      <script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
    <script  type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
    <script src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
    <script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>--%>
    
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
    <%--<script src="assets/admin/pages/scripts/table-advanced.js"></script>--%>
    
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
        var pageUrl = '<%=ResolveUrl("~/SearchList.aspx")%>', temp = [];
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
                    "sSwfPath": "assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
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
                }
            });


          //  var tableWrapper = $('#' + tbl + '_wrapper'); // datatable creates the table wrapper by adding with id {your_table_jd}_wrapper
          //  tableWrapper.find('.dataTables_length select').select2(); // initialize select2 dropdown

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
                                var strh = '', strb = '';
                                $.each(data.d[0], function (key, value) {
                                    if (key == 'PId') {
                                        strh += '<td>Action</td>';                                        
                                    }
                                    else
                                        strh += '<td>' + key + '</td>';
                                });
                                $.each(data.d, function (key, value) {
                                    strb += '<tr>';
                                    $.each(value, function (key, value) {
                                        if (key == 'PId') {
                                            strb += '<td><a  id="PID-' + value + '" onclick="Edit(this)" ><i class="fa fa-edit"></i></a>&nbsp;<a  id="PID-' + value + '" onclick="Delete(this)" ><i class="fa fa-times"></i></a></td>';                                            
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
                            }
                        }
                    }
                });
            },
            get_pg_url: function (pgname) {
                switch (pgname) {
                   
                    case 'CATRGORY': return 'spu_Category'; break;
                    case 'CURRENCY': return 'spu_Currency'; break;
                    case 'PRODUCTGROUP': return 'spu_ProductGroup'; break;
                    case 'UOM': return 'spu_UOM'; break;
                    case 'TAX': return 'spu_TAX'; break;
                    case 'Discount': return 'spu_Discount'; break;
                    case 'BRANCH': return 'spu_Branch'; break;
                    case 'WAREHOUSE': return 'spu_Warehouse'; break;
                    case 'CUSTOMER': return 'spu_Party'; break;
                    case 'PRODUCT': return 'spu_Product'; break;
                    case 'TASKLIST': return 'spu_TaskListSearch'; break;
                    case 'JOB': return 'spu_JOBCreation'; break;
                    case 'SUBTYPE': return 'spu_SubType'; break;
                    case 'CHARTOFACCOUNTS': return 'spu_ChartOfAccounts'; break;
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
                switch ('<%= Request.QueryString["pg"] %>') {
                   
                    case 'CATEGORY':
                        window.location = "Master/Category.aspx";
                        break;
                    case 'CURRENCY':
                        window.location = "Master/Currency.aspx";
                        break;
                    case 'PRODUCTGROUP':
                        window.location = "Master/ProductGroup.aspx";
                        break;
                    case 'UOM':
                        window.location = "Master/UOM.aspx";
                        break;
                    case 'TAX':
                        window.location = "Master/TAX.aspx";
                        break;
                    case 'Discount':
                        window.location = "Master/Discount.aspx";
                        break;
                    case 'BRANCH':
                        window.location = "Master/Branch.aspx";
                        break;
                    case 'WAREHOUSE':
                        window.location = "Master/Warehouse.aspx";
                        break;
                    case 'CUSTOMER':
                        window.location = "Master/Customer.aspx";
                        break;
                    case 'PRODUCT':
                        window.location = "Master/Product.aspx";
                        break;
                    case 'TASK':
                        window.location = "Master/Task.aspx";
                        break;
                    case 'JOB':
                        window.location = "Transaction/JOBCreation.aspx";
                        break;
                    case 'SUBTYPE':
                        window.location = "Master/SubType.aspx";
                        break;
                    case 'CHARTOFACCOUNTS':
                        window.location = "Accounting/ChartOfAccounts.aspx";
                        break;
                    case 'USERCREATION':
                        window.location = 'Security/UserCreation.aspx';
                        break;
                    case 'SHIPPINGADDRESS':
                        window.location = "Master/ShippingAddress.aspx";
                        break;
                    case 'COMPANY':
                        window.location = "Master/Company.aspx";
                        break;
                        
                }
            }
        }
        $(document).ready(function () {
            $('#iframe').css('height', '500px !important');
            var pg = get_PG();
            var sp_name = obj.get_pg_url(pg);
            if (pg != 0) {
                obj.fetch_data(pg, sp_name, 'SEARCH');
            }

            $(document).on('click', "#btn_OK", function () {
                // alert(sessionStorage.getItem('ID'));
                $('#basic1').modal('hide');
               // $('#basic1').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                del(sessionStorage.getItem('ID'), '<%= Request.QueryString["pg"] %>');
             });
            $(document).on('click', "#btn_Cancel", function () {
                // $('#basic1').modal('hide');
                $('#basic1').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                //  $('.modal.in').modal('hide')
            });
            var pg = 'Add New';
            $('#lblScrn').val(pg);
        });      
        function Edit(dpl) {
            debugger;
            var tmp = dpl.id.split('-');
            switch ('<%= Request.QueryString["pg"] %>') {
                
                case 'CATEGORY':
                    window.location = "Master/Category.aspx?ID=" + tmp[1];
                    break;
                case 'CURRENCY':
                    window.location = "Master/Currency.aspx?ID=" + tmp[1];
                    break;
                case 'PRODUCTGROUP':
                    window.location = "Master/ProductGroup.aspx?ID=" + tmp[1];
                    break;
                case 'UOM':
                    window.location = "Master/UOM.aspx?ID=" + tmp[1];
                    break;
                case 'TAX':
                    window.location = "Master/TAX.aspx?ID=" + tmp[1];
                    break;
                case 'Discount':
                    window.location = "Master/Discount.aspx?ID=" + tmp[1];
                    break;
                case 'BRANCH':
                    window.location = "Master/Branch.aspx?ID=" + tmp[1];
                    break;
                case 'WAREHOUSE':
                    window.location = "Master/Warehouse.aspx?ID=" + tmp[1];
                    break;
                case 'CUSTOMER':
                    window.location = "Master/Customer.aspx?ID=" + tmp[1];
                    break;
                case 'PRODUCT':
                    window.location = "Master/Product.aspx?ID=" + tmp[1];
                    break;
                case 'TASK':
                    window.location = "Master/Task.aspx?ID=" + tmp[1];
                    break;
                case 'JOB':
                    window.location = "Transaction/JOBCreation.aspx?ID=" + tmp[1];
                    break;
                case 'SUBTYPE':
                    window.location = "Master/SubType.aspx?ID=" + tmp[1];
                    break;
                case 'CHARTOFACCOUNTS':
                    window.location = 'Accounting/ChartOfAccounts.aspx?ID=' + tmp[1];
                    break;
                case 'USERCREATION':
                    window.location = 'Security/UserCreation.aspx?ID=' + tmp[1];
                    break;

                case 'SHIPPINGADDRESS':
                    window.location = 'Master/ShippingAddress.aspx?ID=' + tmp[1];
                   
                    break;

                case 'COMPANY':
                    window.location = 'Master/Company.aspx?ID=' + tmp[1];
                    break;
                    
            }

        }


        function del(id, page) {
            var args = {};
            args.page_name = page;
            args.id = id;
            args.iMode = 'Delete';
            $.ajax({
                type: "POST",
                url: '<%=ResolveUrl("~/SearchList.aspx")%>' + '/Deletecall',
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
            str += ' <img src="assets/admin/layout/img/1429184960_messagebox_warning.png" height="48px" width="48px" alt=""> ' + content;
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
        <%--function Delete(dkl) {
            debugger;
            var tmp = dkl.id.split('-');
            var page = '<%= Request.QueryString["pg"] %>';
            var args = {};
            args.page_name = page;
            args.id = tmp[1];
            args.iMode = 'Delete';
            $.ajax({
                type: "POST",
                url: '<%=ResolveUrl("~/SearchList.aspx")%>' + '/DeleteCall',
                data: JSON.stringify(args),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    if (data != null) {
                        if (data.d[0].res == "1") {
                           
                            $('#basic1').append(callalert('alert', 'Records are  deleted sucessfully', '1'));
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
                    else
                    {
                       
                        $('#basic1').append(callalert('alert', 'Record Used another table so, cant delete', '1'));
                        //$("#basic1").css("display", "block");
                        $('#basic1').modal('show');
                        
                    }                    
                },
                failure: function (response) {
                    alert('Record Used another table so, cant delete!');
                }
            });
        }--%>
      
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cls_bdy">

          
                <div class="form-actions top">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <div id="Div1" class="cls_bdy_tp">
                                <table>
                                    <tr>
                                        <td>
                                            <ul id="ul1">
                                                <li class="cls_disabled">
                                                    <input type="button" id="lblScrn"  class="cls_disabled btn green" value="Back"
                                                        onclick="obj.back();" /></li>
                                              <%--  <li class="cls_disabled">
                                                    <input type="button" class="cls_disabled btn green" value="Print" onclick="obj.print();" /></li>--%>
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
            <div class="modal fade in" id="basic1" tabindex="-1" role="basic" aria-hidden="false" >          
        </div>
        </div>


        
    </form>

</body>
</html>
