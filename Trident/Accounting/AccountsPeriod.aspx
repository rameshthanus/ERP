<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountsPeriod.aspx.cs" Inherits="Trident.Accounting.AccountsPeriod" %>

<!DOCTYPE html>

<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Efrontier  | Accounts Period</title>
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
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
    <style type="text/css">
        html, body {
            background-color: #F1F3FA;
            background-color: #F9F9F9 !important;
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
                                <i class="fa fa-gift"></i>Accounts Period
                            </div>
                            <div class="tools">
                                <a href="" class="collapse"></a>
                                <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                <a href="" class="reload"></a>
                                <a href="" class="remove"></a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <h4>Create Period</h4>
                            <form class="form-inline" role="form">
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputEmail2">Start Date</label>
                                    <input type="text" class="form-control invalid date-picker" id="startdate" placeholder="Start Date">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputPassword2">End Date</label>
                                    <input type="text" class="form-control invalid date-picker" id="enddate" placeholder="End Date">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputPassword2">Year</label>
                                    <input type="text" class="form-control" id="year" placeholder="Year">
                                </div>
                                <a href="javascript:;" id="bnt_create" class="btn blue">Create <i class="fa fa-plus"></i>
                                </a>

                                <a href="javascript:;" id="bnt_retrieve" class="btn blue">Retrieve <i class="fa fa-search"></i>
                                </a>

                                <a href="javascript:;" id="bnt_delete" class="btn blue">Delete <i class="fa fa-times"></i>
                                </a>

                                <%--<button type="button" class="btn btn-default" id="bnt_retrieve">Retrieve</button>--%>
                                <%--button type="button" class="btn btn-default" id="bnt_delete">Delete</button>--%>
                            </form>
                            <hr>
                            <%--<form class="form-inline" role="form">
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputPassword2">Year</label>
                                    <input type="text" class="form-control" id="ret_year" placeholder="Year">
                                </div>
                                <%--<button type="button" class="btn btn-default" id="bnt_retrieve">Retrieve</button>
                                <button type="button" class="btn btn-default" id="bnt_delete">Delete</button>
                            </form>
                            <hr>--%>
                            <h4>Periods:</h4>
                            <div class="row">
                                <div class="col-md-6">
                                    <div id="tbl_out">
                                        <table class="table table-hover" id="sample_1">
                                            <thead>
                                                <tr>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <form role="form">
                                <div class="row">
                                    <div class="col-md-2">
                                        <button type="button" id="btn_Add" class="btn green">Add</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" id="btn_Clear" class="btn green">Clear</button>
                                    </div>
                                    <div class="col-md-4">
                                        <button type="button" id="btn_Save" class="btn green">Save</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- END SAMPLE FORM PORTLET-->
                </div>
            </div>
        </form>
    </div>
    <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
    <!-- BEGIN CORE PLUGINS -->
    <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
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
    <script>
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
        var fd = '', ed = '', tbl = '';
        $('.date-picker').val(cur_date().split(' ')[0]).removeClass('invalid').addClass('valid');
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
        function get_Imode(dk) {
            if (dk == "0")
                return "Insert";
            else
                return "Update";
        }
        function get_Period(j,count)
        {
            if (j + 1 == count)
                return 13;
            else
                return j+1;
        }
        $(document).ready(function () {
            $(document).on('click', '#bnt_create', function () {
                var obj = {
                    AccountsPeriodID: 0,
                    Year: $('#year').val(),
                    Period: 0,
                    StartDate: cur_date(),
                    EndDate: cur_date(),
                    CloseStatus: 'N',
                    CreatedBy: get_UserID(),
                    CreatedOn: cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: cur_date(),
                    iMode: 'Count',
                    CompanyID: get_CompanyID(),
                }
                $.ajax({
                    url: "../HttpHandler/AccPeriod.ashx",
                    data: obj,
                    success: function (data) {
                        if (data != null) {
                            if (data[0].Col1 == "FAIL") {
                                var st = ($('#startdate').val()).split('/');
                                var ef = ($('#enddate').val()).split('/');
                                //var sDate = $('#startdate').val((nd.getMonth() + 1) + "/" + nd.getDate() + "/" + nd.getFullYear());
                                //var nDate =  $('#enddate').val((nd.getMonth() + 1) + "/" + nd.getDate() + "/" + nd.getFullYear())                               
                                var startdate = new Date(st[1] + "/" + st[0] + "/" + st[2]);
                                var enddate = new Date(ef[1] + "/" + ef[0] + "/" + ef[2]);
                                // $('#tbl_out').empty();
                                $('#sample_1').empty();
                                tbl = '', fd = '', ed = '';
                                // enddate.setDate(enddate.getDate() - startdate.getDate());
                                //  alert(monthDiff(startdate, enddate));
                                GeneratePeriods(startdate, enddate);
                            }
                            else
                                alert('Periods are already found for the year, Delete the periods to recreate !');
                            resizeIframe();
                        }
                    }
                });

            });
            $(document).on('click', '#btn_Add', function () {
                //  $('#tbl_out').empty();
                if ($('#year').val() != "" && $('#year').val() != null) {
                    $('#sample_1').empty();
                    tbl = '', fd = '', ed = '';
                    var startdate = new Date();
                    var enddate = new Date();
                    //    tbl += '<table class=\"table table-hover\"><thead><tr><td>Period</td><td>Start Date</td><td>End Date</td></tr>';
                    AddGridGeneral(startdate, enddate);
                    //   $('#tbl_out').append(tbl);
                    $('#sample_1').append(tbl);
                    SetValuesGeneral();
                    resizeIframe();
                }
                else {
                    alert('Please Enter Year!')
                }
            });

            $(document).on('click', '#btn_Clear', function () {
                // $('#tbl_out').empty();
                $('#sample_1').empty();
                tbl = '', fd = '', ed = '';
                resizeIframe();
            });
            $(document).on('click', '#btn_Save', function () {
                // $('#tbl_out').empty();              
                save();
            });
            $(document).on('click', '#bnt_retrieve', function () {
                // $('#tbl_out').empty();    
                if ($('#year').val() != "" && $('#year').val() != null) {
                    retrieve();
                }
                else
                    alert('Enter Year to Retrieve!');
            });
            $(document).on('click', '#bnt_delete', function () {
                // $('#tbl_out').empty();    
                if ($('#year').val() != "" && $('#year').val() != null) {
                    Delete();
                }
                else
                    alert('Enter Year to Retrieve!');
            });


        });
        function Delete() {
            var obj = {
                AccountsPeriodID: 0,
                Year: $('#year').val(),
                Period: 0,
                StartDate: cur_date(),
                EndDate: cur_date(),
                CloseStatus: 'N',
                CreatedBy: get_UserID(),
                CreatedOn: cur_date(),
                ModifiedBy: get_UserID(),
                ModifiedOn: cur_date(),
                iMode: 'Delete',
                CompanyID: get_CompanyID(),
            }
            $.ajax({
                url: "../HttpHandler/AccPeriod.ashx",
                data: obj,
                success: function (data) {
                    if (data != null) {
                        $('#sample_1').empty();
                        if (data[0].Col1 == "FAIL")
                            alert('No records found for this period!');
                        else
                            alert('Deleted Successfully!');
                        resizeIframe();
                    }
                }
            });
        }
        function retrieve() {
            var obj = {
                AccountsPeriodID: 0,
                Year: $('#year').val(),
                Period: 0,
                StartDate: cur_date(),
                EndDate: cur_date(),
                CloseStatus: 'N',
                CreatedBy: get_UserID(),
                CreatedOn: cur_date(),
                ModifiedBy: get_UserID(),
                ModifiedOn: cur_date(),
                iMode: 'Fetch',
                CompanyID: get_CompanyID(),
            }
            $.ajax({
                url: "../HttpHandler/AccPeriod.ashx",
                data: obj,
                success: function (data) {
                    if (data != null) {
                        $('#sample_1').empty();
                        if (data.length > 0) {
                            var firstday = '', endday = '', pid = '', tbl = '';
                            for (var i = 0; i < data.length; i++) {
                                //fd = '', ed = '';                          
                                if (i != 12) {
                                    firstday += 'startdate-' + i + ',';
                                    endday += 'enddate-' + i + ',';
                                    pid += 'pid-' + i + ',';
                                }
                                else {
                                    firstday += 'startdate-' + i;
                                    endday += 'enddate-' + i
                                    pid += 'pid-' + i;
                                }
                            }
                            var f = firstday.split(',');
                            var j = endday.split(',');
                            var p = pid.split(',');
                            for (var l = 0; l < data.length; l++) {
                                tbl += "<tr><td><span id=" + p[l] + " style='display:none'>" + data[l].AccountsPeriodID + "</span></td><td>" + data[l].Period + "</td><td><input type=\"text\" class=\"form-control invalid date-picker\" id='" + f[l] + "' placeholder=\"Start Date\"></td>";
                                tbl += "<td><input type=\"text\" class=\"form-control invalid date-picker\" id='" + j[l] + "' placeholder=\"End Date\"></td></tr>";
                            }
                        }
                        $('#sample_1').append(tbl);
                        for (var u = 0; u < data.length; u++) {
                            $("#startdate-" + u).datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", data[u].StartDate);
                            $("#enddate-" + u).datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", data[u].EndDate);
                        }
                        resizeIframe();
                    }
                }
            });
        }
        function GeneratePeriods(startdate, enddate) {
            //  tbl += '<table class=\"table table-hover\"><thead><tr><td>Period</td><td>Start Date</td><td>End Date</td></tr>';
            var d = (enddate.getYear() - startdate.getYear()) * 12 + enddate.getMonth() - startdate.getMonth() + 1;
            var k = d - 1;
            if (k < 12) {

                AddGrid(startdate, enddate, d - 1);
                var ff = fd.split(',');
                var jj = ed.split(',');
                // $('#tbl_out').append(tbl);
                $('#sample_1').append(tbl);
                SetValues(k, ff, jj);
                resizeIframe();
            }
            else {
                alert('Please Select less than equal to 12 months!')
            }
        }
        function save() {
            var count = $('#sample_1 tr').length;
            var r = 0;
            Metronic.blockUI({ boxed: true, message: 'Saving...' });
            for (var i = 0; i < count; i++) {
                var obj = {
                    AccountsPeriodID: $('#pid-' + i).text(),
                    Year: $('#year').val(),
                    Period: get_Period(i, count),
                    StartDate: $('#startdate-' + i).val(),
                    EndDate: $('#enddate-' + i).val(),
                    CloseStatus: 'N',
                    CreatedBy: get_UserID(),
                    CreatedOn: cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: cur_date(),
                    iMode: get_Imode($('#pid-' + i).text()),
                    CompanyID: get_CompanyID(),
                }
                $.ajax({
                    url: "../HttpHandler/AccPeriod.ashx",
                    data: obj,
                    success: function (data) {
                        if (data != null) {
                            r = r + 1;
                            if (r == count) {
                                alert('Saved Successfully');
                                Metronic.unblockUI();
                                $('#sample_1').empty();
                                tbl = '', fd = '', ed = '';
                            }
                        }
                    }
                });
            }
            //alert(r);
            //if (r + 1 == count) {
            //    alert('Saved Successfully');
            //    $('#sample_1').empty();
            //    tbl = '', fd = '', ed = '';
            //}


        }
        function SetValues(k, ff, jj) {
            for (var u = 0; u <= k + 1; u++) {
                if (u == k + 1) {
                    $("#startdate-" + u).datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", new Date());
                    $("#enddate-" + u).datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", new Date());
                }
                else {
                    $("#startdate-" + u).datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", new Date(ff[u]));
                    $("#enddate-" + u).datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", new Date(jj[u]));
                }
            }
            //$("#startdate-13").datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", new Date());
            //$("#enddate-13").datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", new Date());
        }
        function SetValuesGeneral() {
            for (var u = 0; u <= 12; u++) {
                $("#startdate-" + u).datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", new Date());
                $("#enddate-" + u).datepicker({ dateFormat: 'dd/mm/yyyy' }).datepicker("setDate", new Date());
            }
        }
        function AddGrid(startdate, enddate, k) {
            var firstday = '', endday = '', pid = '';
            for (var l = 0; l <= k + 1; l++) {
                if (l != k+1) {
                    firstday += 'startdate-' + l + ',';
                    fd += new Date(startdate.getFullYear(), startdate.getMonth() + l) + ',';
                    endday += 'enddate-' + l + ',';
                    pid += 'pid-' + l + ',';
                    ed += new Date(startdate.getFullYear(), startdate.getMonth() + 1 + l, 0) + ',';
                }
                else {
                    firstday += 'startdate-' + l;
                    fd += new Date(startdate.getFullYear(), startdate.getMonth() + l);
                    endday += 'enddate-' + l;
                    pid += 'pid-' + l;
                    ed += new Date(startdate.getFullYear(), startdate.getMonth() + 1 + l, 0);
                }
            }
            var f = firstday.split(',');
            var j = endday.split(',');
            var p = pid.split(',');
            for (var l = 0; l <= k + 1; l++) {
                if (l == k + 1) {
                    tbl += "<tr><td><span id=" + p[l] + " style='display:none'>0</span></td><td>" + 13 + "</td><td><input type=\"text\" class=\"form-control invalid date-picker\" id='" + f[l] + "' placeholder=\"Start Date\"></td>";
                    tbl += "<td><input type=\"text\" class=\"form-control invalid date-picker\" id='" + j[l] + "' placeholder=\"End Date\"></td></tr>";
                }
                else {
                    tbl += "<tr><td><span id=" + p[l] + " style='display:none'>0</span></td><td>" + (l + 1) + "</td><td><input type=\"text\" class=\"form-control invalid date-picker\" id='" + f[l] + "' placeholder=\"Start Date\"></td>";
                    tbl += "<td><input type=\"text\" class=\"form-control invalid date-picker\" id='" + j[l] + "' placeholder=\"End Date\"></td></tr>";
                }
            }
            //tbl += "<tr><td><span id='pid-13' style='display:none'>0</span></td><td>" + 13 + "</td><td><input type=\"text\" class=\"form-control invalid date-picker\" id='startdate-13' placeholder=\"Start Date\"></td>";
            //tbl += "<td><input type=\"text\" class=\"form-control invalid date-picker\" id='enddate-13' placeholder=\"End Date\"></td></tr>";
        }
        function AddGridGeneral(startdate, enddate) {
            var firstday = '', endday = '', pid = '';
            //fd = '', ed = '';
            for (var l = 0; l <= 12; l++) {
                if (l != 12) {
                    firstday += 'startdate-' + l + ',';
                    endday += 'enddate-' + l + ',';
                    pid += 'pid-' + l + ',';
                }
                else {
                    firstday += 'startdate-' + l;
                    endday += 'enddate-' + l;
                    pid += 'pid-' + l;
                }
            }
            var f = firstday.split(',');
            var j = endday.split(',');
            var p = pid.split(',');
            for (var l = 0; l <= 12; l++) {
                tbl += "<tr><td><span id=" + p[l] + " style='display:none'>0</span></td><td>" + (l + 1) + "</td><td><input type=\"text\" class=\"form-control invalid date-picker\" id='" + f[l] + "' placeholder=\"Start Date\"></td>";
                tbl += "<td><input type=\"text\" class=\"form-control invalid date-picker\" id='" + j[l] + "' placeholder=\"End Date\"></td></tr>";
            }
        }
        // }      
        //$('.datepicker').datepicker({
        //    changeMonth: true,
        //    changeYear: true,
        //    yearRange: '1900:+0',
        //    defaultDate: '01 JAN 1900',            
        //    dateFormat: 'dd/mm/yy',
        //    onSelect: function () {
        //        $('#datepicker').val($(this).datepicker({
        //            dateFormat: 'dd/mm/yy'
        //        }).val());
        //    }
        //});

    </script>
    <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>



