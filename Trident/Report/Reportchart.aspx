<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportchart.aspx.cs" Inherits="Trident.Report.Reportchart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/global/css/components.css" rel="stylesheet" />
    <link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <link href="../assets/global/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />


    <script src="../JavaScript/jquery-1.9.1.min.js"></script>
    <script src="../JavaScript/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="../JavaScript/highcharts.js"></script>
    <script src="../JavaScript/highcharts-3d.js"></script>
    <script src="../JavaScript/exporting.js"></script>
    <script src="../assets/global/scripts/metronic.js"></script>
    <script src="../assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <style type="text/css">
        .highcharts-tooltip + text {
            display: none;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="portlet box blue-hoki">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-gift"></i>Search Criteria
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body cls_performo-header">
                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <label class="control-label " style="float: left;">Start Date</label>
                            <div style="padding: 0px; width: 70%; float: left; margin-left: 10px;">
                                <input type="text" size="16" class="form-control invalid date-picker" id="F_V_txt_startdate" name="V_txt_startdate" />
                            </div>
                        </div>
                        <div class="col-sm-4 col-xs-12">
                            <label class="control-label " style="float: left;">End Date</label>
                            <div style="padding: 0px; width: 70%; float: left; margin-left: 10px;">
                                <input type="text" size="16" class="form-control invalid date-picker" id="F_V_txt_enddate" name="V_txt_enddate" />
                            </div>
                        </div>
                        <div class="col-sm-2 col-xs-12">
                            <button type="button" data-dismiss="modal" class="btn blue" id="btn_Generate">Generate</button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="container" style="min-width: 310px; height: 500px; margin: 0 auto"></div>

            <div id="container1" style="min-width: 310px; height: 500px; margin: 0 auto"></div>
        </div>
    </form>
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
        var categories = [], sales = [], purchase = [], profit = [], sales_tot = 0, purchase_tot = 0, profit_tot = 0;
        var salesname = [], amount = [],final_Array=[];
        var obj_ = {
            arg: function (imode) {
                Args = {
                    iMode: imode,
                    StartDate: ($('#F_V_txt_startdate').val() == "" ? obj_.from_date() : $('#F_V_txt_startdate').val()),
                    EndDate: ($('#F_V_txt_enddate').val() == "" ? obj_.cur_date() : $('#F_V_txt_enddate').val()),
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID()
                }
                return Args;
            },
            cur_date: function () {
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
            from_date: function () {
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
            //cur_date: function () {
            //    var date = new Date();
            //    return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
            //},
            //from_date: function () {
            //    var date = new Date();
            //    date.setMonth(date.getMonth() - 6);
            //    return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
            //},
            get_chart_detail: function (imode) {
                $.ajax({
                    url: "../HttpHandler/ReportChart.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                        final_Array = [];
                        if (data != null) {
                          
                            categories = [], sales = [], purchase = [], profit = [], sales_tot = 0, purchase_tot = 0, profit_tot = 0;
                            for (var i = 0; i < data.length; i++) {
                                if (data[i].Month != null) {
                                    categories.push(data[i].Month);
                                    sales.push(data[i].Sales);
                                    sales_tot += data[i].Sales;
                                    profit_tot += data[i].Profit;
                                    purchase_tot += data[i].Purchase;
                                    purchase.push(data[i].Purchase);
                                    profit.push(data[i].Profit);
                                } else {
                                    var ar = new Array(2);
                                    ar[0] = data[i].ProductCode;
                                    ar[1] = data[i].Total;
                                    final_Array.push(ar);
                                    
                                }                                
                            }
                            obj_.Load_chart(categories, sales, purchase, profit);
                        }
                    }
                });
            },
            Load_chart: function (categories, sales, purchase, profit) {
                $('#container').highcharts({
                    title: {
                        text: 'Summary Overview'
                    },
                    xAxis: {
                        categories: categories,
                        title: {
                            text: 'Period',
                            style: {
                                color: Highcharts.getOptions().colors[1]
                            }
                        }
                    },
                    yAxis: [{ // Primary yAxis
                        title: {
                            text: 'Amount',
                            style: {
                                color: Highcharts.getOptions().colors[1]
                            }
                        }
                    }
                    ],
                    labels: {
                        items: [{
                            html: 'Months overview',
                            style: {
                                left: '100px',
                                top: '-40px',
                                color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                            }
                        }]
                    },
                    series: [{
                        type: 'column',
                        name: 'Sales',
                        data: sales,
                        // color: Highcharts.getOptions().colors[0]
                    }, {
                        type: 'column',
                        name: 'Purchase',
                        data: purchase,
                        color: Highcharts.getOptions().colors[2]
                    }, {
                        type: 'spline',
                        name: 'Profit',
                        data: profit,
                        marker: {
                            lineWidth: 2,
                            lineColor: Highcharts.getOptions().colors[1],
                            fillColor: 'white'
                        }
                    }, {
                        type: 'pie',
                        name: 'Months Overview',
                        data: [{
                            name: 'Sales',
                            y: sales_tot,
                            color: Highcharts.getOptions().colors[0] // Jane's color
                        }, {
                            name: 'Purchase',
                            y: purchase_tot,
                            color: Highcharts.getOptions().colors[2] // John's color
                        }, {
                            name: 'Profit',
                            y: profit_tot,
                            color: Highcharts.getOptions().colors[1] // Joe's color
                        }],
                        center: ['20%', 0],
                        size: 70,
                        showInLegend: false,
                        dataLabels: {
                            distance: 10,
                            enabled: true,
                            format: '{point.name}: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            },
                            connectorColor: 'silver'
                        }
                    }]
                });                
                $('#container1').highcharts({
                    chart: {
                        type: 'pie',
                        options3d: {
                            enabled: true,
                            alpha: 45
                        }
                    },
                    title: {
                        text: 'Top Selling Product'
                    },
                    subtitle: {
                       // text: '3D donut in Highcharts'
                    },
                    plotOptions: {
                        pie: {
                            innerSize: 100,
                            depth: 85
                        }
                    },
                    series: [{
                        name: 'Delivered amount',
                        data:final_Array
                    }]
                });
            }
        }
        $(document).ready(function () {

            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd/mm/yyyy'
                });
            }
            obj_.get_chart_detail('get_chart');

            $(document).on('click', '#btn_Generate', function () {
                obj_.get_chart_detail('get_chart');
            });
        });
    </script>
</body>
</html>
