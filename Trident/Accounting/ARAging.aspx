<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ARAging.aspx.cs" Inherits="Trident.Accounting.ARAging" %>

<!DOCTYPE html>

<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Efrontier  | Aging</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="../assets/global/css/components.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../assets/admin/layout2/css/layout.css" rel="stylesheet" type="text/css" />
    <link id="style_color" href="../assets/admin/layout2/css/themes/default.css" rel="stylesheet" type="text/css" />
    <link href="../assets/admin/layout2/css/custom.css" rel="stylesheet" type="text/css" />
    <link href="../assets/admin/pages/css/invoice.css" rel="stylesheet" type="text/css" />
    
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
    <style type="text/css">
        html, body {
            background-color: #F1F3FA;
            background-color: #F9F9F9 !important;
        }

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
</head>
<body onload="resizeIframe()">
    <!-- BEGIN HEADER -->
    <div id="full_bdy">
        <!-- END HEADER -->
        <form runat="server">
            <div class="row">
                <div class="col-md-6 ">
                    <div class="">
                        <div class="portlet-body form">
                            <form role="form" class="form-horizontal">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row ">
                <div class="col-md-12">
                    <!-- BEGIN SAMPLE FORM PORTLET-->
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>Search Criteria
                            </div>
                            <div class="tools">                             
                                  <button type="button" id="bnt_det" class="btn default"><i class="fa fa-plus"></i>Aging Detail</button>
                                  <button type="button" id="bnt_create" class="btn default"><i class="fa fa-plus"></i>Aging Summary</button>                                  
                            </div>
                        </div>
                        <div class="portlet-body">                            
                            <form class="form-inline" role="form">
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputEmail2">Start Date</label>
                                    <input type="text" class="form-control invalid date-picker" id="startdate" placeholder="Start Date">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputPassword2">End Date</label>
                                    <input type="text" class="form-control invalid date-picker" id="enddate" placeholder="End Date">
                                </div>
                               <%-- <a href="javascript:;" id="bnt_det" class="btn blue"> <i class="fa fa-plus"></i>
                                </a>                                
                                <a href="javascript:;" id="bnt_create" class="btn blue"> <i class="fa fa-plus"></i>
                                </a>--%>
                                <a href="javascript:;" id="btn_Clear" class="btn blue">Clear <i class="fa fa-plus"></i>
                                </a>
                            </form>                          
                        </div>
                    </div>
                    <!-- END SAMPLE FORM PORTLET-->
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>Aging
                            </div>
                            <div class="tools">
                                <button type="button" id="btn_print" class="btn default"><i class="fa fa-print" onclick="printContent('divtoPrint')"></i>Print</button>
                               <%-- <button type="button" id="btnSave" class="btn default"><i class="fa fa-plus"></i>Save</button>--%>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="portlet light">
                                <div id="divtoPrint" class="invoice">
                                    <div class="row invoice-logo">
                                        <%--   <div style="width: 10.66666667%; float: left;">
                                            <img src="Invoice.png" class="img-responsive" alt="" />
                                        </div>--%>
                                        <div class="col-xs-6">
                                            <p style="line-height: 22px;">
                                                <div style="font-size: 23px" id="cmp"></div>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div align="center"><span id="title" style="font-size: 23px"></span></div>
                                         <div align="center"><span id="range" style="font-size: 15px"></span></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <table id="details" class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                                <tfoot>
                                                    <tr>                                                       
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
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
    <script src="../JavaScript/jQuery.print.js"></script>
   
    <script>
        function get_CompanyID() {
            <% if (Session["CompanyID"] != null)
               { %>
            return '<%= Session["CompanyID"] %>';
            
            <% } %>
            return 0;
        }
        function get_BranchID() {
            <% if (Session["BranchID"] != null)
               { %>
             return '<%= Session["BranchID"] %>';
            
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

        <%--function get_company() {
            <% if (Session["CompanyName"] != null)
               { %>
            return '<%= Session["CompanyName"] %>';
            
            <% } %>
            return 0;
        }--%>
        var fd = '', ed = '', tbl = '';
        
        $('#enddate').val(cur_date().split(' ')[0]).removeClass('invalid').addClass('valid');
     //   $('.date-picker').val(cur_date().split(' ')[0]).removeClass('invalid').addClass('valid');
        if (jQuery().datepicker) {
            $('.date-picker').datepicker({
                rtl: Metronic.isRTL(),
                orientation: "left",
                autoclose: true,
                //format: 'yyyy.mm.dd'
                format: 'dd/mm/yyyy',
                onSelect: function () {
                    $('#datepicker').val($(this).datepicker({
                        dateFormat: 'dd/mm/yyyy'
                    }).val());
                }
            });
        }
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
        function cur_date() {
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
            //return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        }
        function get_Type() {
            if ($('#startdate').val() == null || $('#startdate').val() == "" || $('#startdate').val() == undefined)
                return 1;
            else
                return 2;
        }
        function clear() {
            $('#details thead tr').empty();
            $('#details tbody').empty();
            $('#details tfoot tr').empty();
         
        }
        function SummaryClear()
        {
            $('#tot_30').empty();
            $('#tot_60').empty();
            $('#tot_90').empty();
            $('#tot_120').empty();
            $('#tot_current').empty();
            $('#tot_due').empty();
        }
        function printContent(el) {
           // $("#divtoPrint").print();
            //  return (false);            
            var l = $("#divtoPrint");
            var popupWin = window.open('', '_blank', 'width=300,height=300');
            popupWin.document.open();
            popupWin.document.write('<html><body onload="window.print()">' + l.innerHTML + '</html>');
            popupWin.document.close();
            //var restorepage = document.body.innerHTML;
            //var printcontent = document.getElementById(l).innerHTML;
            //document.body.innerHTML = printcontent;
            //window.print();
            //document.body.innerHTML = restorepage;
        }
        function sum() {
            var tds = document.getElementById('details').getElementsByTagName('td');
            var sum30 = 0, sum60 = 0, sum90 = 0, sum120 = 0, cur = 0, amt = 0;
            for (var i = 0; i < tds.length; i++) {
                if (tds[i].className == 'count-me') {
                    sum30 += isNaN(tds[i].innerHTML) ? 0 : parseInt(tds[i].innerHTML);
                }
                else if (tds[i].className == 'cur') {
                    cur += isNaN(tds[i].innerHTML) ? 0 : parseInt(tds[i].innerHTML);
                }
                else if (tds[i].className == 'cls_60') {
                    sum60 += isNaN(tds[i].innerHTML) ? 0 : parseInt(tds[i].innerHTML);
                }
                else if (tds[i].className == 'cls_90') {
                    sum90 += isNaN(tds[i].innerHTML) ? 0 : parseInt(tds[i].innerHTML);
                }
                else if (tds[i].className == 'cls_120') {
                    sum120 += isNaN(tds[i].innerHTML) ? 0 : parseInt(tds[i].innerHTML);
                }
                else if (tds[i].className == 'cls_due') {
                    amt += isNaN(tds[i].innerHTML) ? 0 : parseInt(tds[i].innerHTML);
                }
            }
            $('#tot_30').append(sum30);
            $('#tot_60').append(sum60);
            $('#tot_90').append(sum90);
            $('#tot_120').append(sum120);
            $('#tot_current').append(cur);
            $('#tot_due').append(amt);
        }
        $(document).ready(function () {
            $(document).on('click', '#bnt_create', function () {

                if ($('#enddate').val() != "") {
                    $('#title').text('AR Summary Report');
                    $('#cmp').empty();
                    $('#cmp').append('Efrontier accounting');
                    $('#range').text('From -' + ($('#startdate').val() == "" ? '01/01/1990' : $('#startdate').val()) + ' To -' + $('#enddate').val());
                    var obj = {
                        Fromdate: ($('#startdate').val() == "" ? '01/01/1990' : $('#startdate').val()),
                        Todate: $('#enddate').val(),
                        Type: get_Type(),
                        iMode: 'AgingSummary',
                        CompanyID: get_CompanyID(),
                        BranchID: get_BranchID()
                    }
                    $.ajax({
                        url: "../HttpHandler/ARAging.ashx",
                        data: obj,
                        success: function (data) {
                            if (data != null) {
                                var sth = '';
                                var str = '';
                                clear();
                                $.each(data[0], function (key, value) {
                                    sth += '<th>' + key + '</th>';
                                });
                                $.each(data, function (key, value) {
                                    str += '<tr>';
                                    $.each(value, function (key, value) {
                                        if (key == "30days")
                                            str += '<td class="count-me">' + value + '</td>';
                                        else if (key == "Current")
                                            str += '<td class="cur">' + value + '</td>';
                                        else if (key == "60days")
                                            str += '<td class="cls_60">' + value + '</td>';
                                        else if (key == "90days")
                                            str += '<td class="cls_90">' + value + '</td>';
                                        else if (key == "120days")
                                            str += '<td class="cls_120">' + value + '</td>';
                                        else if (key == "DueAmt")
                                            str += '<td class="cls_due">' + value + '</td>';
                                        else
                                            str += '<td>' + value + '</td>';
                                    });
                                    str += '</tr>';
                                });
                                $('#details thead tr').append(sth);
                                $('#details tbody').append(str);
                                var stf = ' <td>Total:</td><td></td><td><div id="tot_current"></div></td><td><div id="tot_30"></div></td><td><div id="tot_60"></div></td><td><div id="tot_90"></div></td><td><div id="tot_120"></div></td><td><div id="tot_due"></div></td>';
                                SummaryClear();
                                $('#details tfoot tr').append(stf);
                            }
                            resizeIframe();
                            sum();
                        }
                    });
                }
                else
                    alert('Please Select End Date!');

            });

            $(document).on('click', '#bnt_det', function () {

                if ($('#enddate').val() != "") {
                    $('#cmp').empty();
                    $('#title').text('Aging Detail Report');
                    $('#cmp').append('Efrontier accounting');
                    $('#range').text('From -'+($('#startdate').val() == "" ? '01/01/1990' : $('#startdate').val())+' To -'+$('#enddate').val());
                    var obj = {
                        Fromdate: ($('#startdate').val() == "" ? '01/01/1990' : $('#startdate').val()),
                        Todate: $('#enddate').val(),
                        Type: get_Type(),
                        iMode: 'AgingDetail',
                        CompanyID: get_CompanyID(),
                        BranchID: get_BranchID()
                    }
                    $.ajax({
                        url: "../HttpHandler/ARAging.ashx",
                        data: obj,
                        success: function (data) {
                            if (data != null) {
                                var sth = '';
                                var str = '';
                                clear();
                                $.each(data[0], function (key, value) {
                                    sth += '<th>' + key + '</th>';
                                });
                                $.each(data, function (key, value) {
                                    str += '<tr>';
                                    $.each(value, function (key, value) {
                                        if (key == "30days")
                                            str += '<td class="count-me">' + value + '</td>';
                                        else if (key == "Current")
                                            str += '<td class="cur">' + value + '</td>';
                                        else if (key == "60days")
                                            str += '<td class="cls_60">' + value + '</td>';
                                        else if (key == "90days")
                                            str += '<td class="cls_90">' + value + '</td>';
                                        else if (key == "120days")
                                            str += '<td class="cls_120">' + value + '</td>';
                                        else if (key == "DueAmt")
                                            str += '<td class="cls_due">' + value + '</td>';
                                        else
                                            str += '<td>' + value + '</td>';
                                    });
                                    str += '</tr>';
                                });
                                $('#details thead tr').append(sth);
                                $('#details tbody').append(str);
                                var stf = '<td>Total:</td><td></td><td></td><td></td><td><div id="tot_current"></div></td><td><div id="tot_30"></div></td><td><div id="tot_60"></div></td><td><div id="tot_90"></div></td><td><div id="tot_120"></div></td><td><div id="tot_due"></div></td>';
                                SummaryClear();
                                $('#details tfoot tr').append(stf);
                            }
                            resizeIframe();
                            sum();
                        }
                    });
                }
                else
                    alert('Please Select End Date!');
            });
            $(document).on('click', '#btn_Clear', function () {
                // $('#tbl_out').empty();
                clear();
                $('#startdate').val("");
                $('#enddate').val("");
                resizeIframe();
            });
        });

    </script>
    <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>

