<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeContentPage.aspx.cs"
    Inherits="Trident.HomeContentPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Vertias|Home</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all"
        rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"
        type="text/css" />
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet"
        type="text/css" />
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet"
        type="text/css" />
    <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
        rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
    <link href="assets/global/plugins/gritter/css/jquery.gritter.css" rel="stylesheet"
        type="text/css" />
    <link href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"
        rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet"
        type="text/css" />
    <link href="assets/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGIN STYLES -->
    <!-- BEGIN PAGE STYLES -->
    <link href="assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="assets/global/css/components.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="assets/admin/layout2/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="assets/admin/layout2/css/themes/default.css" rel="stylesheet" type="text/css"
        id="style_color" />
    <link href="assets/admin/layout2/css/custom.css" rel="stylesheet" type="text/css" />
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />

    <link href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" />
    <link href="JavaScript/Qtip/jquery.qtip.min.css" rel="stylesheet" />
    <%--  <link href="JavaScript/chart/css/jquery.jqplot.min.css" rel="stylesheet" />--%>

       <link href="JavaScript/bootstrap-datepicker.css" rel="stylesheet" />
  
    <link href="JavaScript/jquery.timepicker.css" rel="stylesheet" />
   
    
    <style type="text/css">
        .modal {
            position: absolute;
            right: 0px;
            bottom: 0px;
            left: 0px;
            top: 50%;
        }

        .cls_calender_pop div {
            margin: 5px;
        }

        #responsive .slimScrollDiv {
            height: 345px !important;
        }

        #responsive .slimScrollDiv, #responsive .scroller {
            width: 100% !important;
        }
        .ui-timepicker-wrapper{
              width: 100px;
  /* padding: 5px 9px; */
  font-size: 15px;
  text-align: center;
  z-index:500000;
  position:relative;
        }
        .fc-agenda-slots,.fc-day{
            cursor:pointer;
        }
    </style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
<!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->
<body class="page-boxed page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-sidebar-closed-hide-logo">
    <!-- BEGIN HEADER -->
    <!-- END HEADER -->
    <div class="clearfix">
    </div>
    <!-- BEGIN CONTAINER -->
    <div class="" id="full_bdy">
        <div class="">
            <!-- BEGIN SIDEBAR -->
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="">
                <div class="page-content">
                    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                    <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    </button>
                                    <h4 class="modal-title">Modal title</h4>
                                </div>
                                <div class="modal-body">
                                    Widget settings form goes here
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn blue">
                                        Save changes</button>
                                    <button type="button" class="btn default" data-dismiss="modal">
                                        Close</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                    <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                    <!-- BEGIN STYLE CUSTOMIZER -->
                    <!-- END STYLE CUSTOMIZER -->
                    <!-- BEGIN PAGE HEADER-->
                    <!-- END PAGE HEADER-->
                    <!-- BEGIN DASHBOARD STATS -->
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <a class="dashboard-stat dashboard-stat-light blue-soft" href="Approval/POApproval.aspx">
                                <div class="visual">
                                    <i class="fa fa-comments"></i>
                                </div>
                                <div class="details">
                                    <table width::"100%">
                                        <tr>

                                            <td style="width:49%; padding-right:20px;">
                                                <div class="number">
                                                    <asp:Label ID="lblPurcaseOrderApproval" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <div class="desc" style="font-size: 10pt;">
                                                  PO Approval
                                                </div>
                                            </td>
                                            <td style="width:2%">


                                            </td>
                                             <td style="width:49%">
                                                 <div class="number">
                                                    <asp:Label ID="lblPurcaseOrderCount" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <div class="desc" style="font-size: 10pt;">
                                                   PO Count
                                                </div>

                                             </td>
                                        </tr>

                                    </table>


                                </div>
                            </a>
                        </div>
                         <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <a class="dashboard-stat dashboard-stat-light green-soft" href="Approval/StockCheck.aspx">
                                <div class="visual">
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                                <div class="details">
                                    <table width::"100%">
                                        <tr>

                                            <td style="width:49%; padding-right:20px;">
                                                <div class="number">
                                                    <asp:Label ID="lblIndentApproval" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <div class="desc" style="font-size: 10pt;">
                                                  Stock Approval
                                                </div>
                                            </td>
                                            <td style="width:2%">


                                            </td>
                                             <td style="width:49%">
                                                 <div class="number">
                                                    <asp:Label ID="lblIndentCount" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <div class="desc" style="font-size: 10pt;">
                                                   Stock Count
                                                </div>

                                             </td>
                                        </tr>

                                    </table>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <a class="dashboard-stat dashboard-stat-light blue-soft" href="#">
                                <div class="visual">
                                    <i class="fa fa-comments"></i>
                                </div>
                                <div class="details">
                                    <table width::"100%">
                                        <tr>

                                            <td style="width:49%; padding-right:20px;">
                                                <div class="number">
                                                    <asp:Label ID="lblQuotation" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <div class="desc" style="font-size: 9pt;">
                                                  Quotation Count
                                                </div>
                                            </td>
                                            <td style="width:2%">


                                            </td>
                                             <td style="width:49%">
                                                 <div class="number">
                                                    <asp:Label ID="lblDelivery" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <div class="desc" style="font-size: 9pt;">
                                                   Delivery Count
                                                </div>

                                             </td>
                                        </tr>

                                    </table>


                                </div>
                            </a>
                        </div>
                       
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <a class="dashboard-stat dashboard-stat-light purple-soft" href="#">
                                <div class="visual">
                                    <i class="fa fa-globe"></i>
                                </div>
                                <div class="details">
                                    <div class="number">
                                        <asp:Label ID="lblSOcount" runat="server" Text="0"></asp:Label>
                                    </div>
                                    <div class="desc" style="font-size: 10pt;">
                                        Sales Order
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- END DASHBOARD STATS -->


                    <div class="clearfix">
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet light ">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-bar-chart font-green-sharp hide"></i><span class="caption-subject font-green-sharp bold uppercase">Purchase</span> <span class="caption-helper">Monthly stats...</span>
                                    </div>
                                    <%-- <div class="actions">
                                        <div class="btn-group btn-group-devided" data-toggle="buttons">
                                            <label class="btn btn-transparent grey-salsa btn-circle btn-sm active">
                                                <input type="radio" name="options" class="toggle" id="option1">New</label>
                                            <label class="btn btn-transparent grey-salsa btn-circle btn-sm">
                                                <input type="radio" name="options" class="toggle" id="option2">Returning</label>
                                        </div>
                                    </div>--%>
                                </div>
                                <div class="portlet-body">
                                    <div id="site_statistics_loading">
                                        <img src="assets/admin/layout/img/loading.gif" alt="loading" />
                                    </div>
                                    <div id="site_statistics_content" class="display-none">
                                        <div id="site_statistics" class="chart">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet light ">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-share font-red-sunglo hide"></i><span class="caption-subject font-red-sunglo bold uppercase">Sales</span> <span class="caption-helper">Monthly stats...</span>
                                    </div>
                                    <%--    <div class="actions">
                                        <div class="btn-group">
                                            <a href="" class="btn grey-salsa btn-circle btn-sm dropdown-toggle" data-toggle="dropdown"
                                                data-hover="dropdown" data-close-others="true">Filter Range&nbsp;<span class="fa fa-angle-down">
                                                </span></a>
                                            <ul class="dropdown-menu pull-right">
                                                <li><a href="javascript:;">Q1 2014 <span class="label label-sm label-default">past </span>
                                                </a></li>
                                                <li><a href="javascript:;">Q2 2014 <span class="label label-sm label-default">past </span>
                                                </a></li>
                                                <li class="active"><a href="javascript:;">Q3 2014 <span class="label label-sm label-success">
                                                    current </span></a></li>
                                                <li><a href="javascript:;">Q4 2014 <span class="label label-sm label-warning">upcoming
                                                </span></a></li>
                                            </ul>
                                        </div>
                                    </div>--%>
                                </div>
                                <div class="portlet-body">
                                    <div id="site_activities_loading">
                                        <img src="assets/admin/layout/img/loading.gif" alt="loading" />
                                    </div>
                                    <div id="site_activities_content" class="display-none">
                                        <div id="site_activities" style="height: 281px;">
                                        </div>
                                    </div>
                                    <div style="margin: 20px 0 10px 30px">
                                        <%-- <div class="row">
                                            <div class="col-md-3 col-sm-3 col-xs-6 text-stat">
                                                <span class="label label-sm label-success">Revenue: </span>
                                                <h3>
                                                    $13,234</h3>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-6 text-stat">
                                                <span class="label label-sm label-danger">Shipment: </span>
                                                <h3>
                                                    $1,134</h3>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-6 text-stat">
                                                <span class="label label-sm label-primary">Orders: </span>
                                                <h3>
                                                    2350</h3>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                    <div class="row" style="display: none;">
                        <div class="col-md-6 col-sm-6">
                            <div class="portlet light ">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-share font-blue-steel hide"></i><span class="caption-subject font-blue-steel bold uppercase">Recent Activities</span>
                                    </div>
                                    <%--  <div class="actions">
                                        <div class="btn-group">
                                            <a class="btn btn-sm btn-default btn-circle" href="#" data-toggle="dropdown" data-hover="dropdown"
                                                data-close-others="true">Filter By <i class="fa fa-angle-down"></i></a>
                                            <div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
                                                <label>
                                                    <input type="checkbox" />
                                                    Finance</label>
                                                <label>
                                                    <input type="checkbox" checked="" />
                                                    Membership</label>
                                                <label>
                                                    <input type="checkbox" />
                                                    Customer Support</label>
                                                <label>
                                                    <input type="checkbox" checked="" />
                                                    HR</label>
                                                <label>
                                                    <input type="checkbox" />
                                                    System</label>
                                            </div>
                                        </div>
                                    </div>--%>
                                </div>
                                <div class="portlet-body">
                                    <div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible="0">
                                        <ul class="feeds">
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-info">
                                                                <i class="fa fa-check"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">
                                                                You have 4 pending tasks.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">
                                                        Just now
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-info">
                                                                <i class="fa fa-check"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">
                                                                Finance Report for year 2015 has been released.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">
                                                        10 mins
                                                    </div>
                                                </div>
                                            </li>

                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-info">
                                                                <i class="fa fa-check"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">
                                                                You have 5 pending membership that requires a quick review.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">
                                                        24 mins
                                                    </div>
                                                </div>
                                            </li>








                                        </ul>
                                    </div>
                                    <div class="scroller-footer">
                                        <div class="btn-arrow-link pull-right">
                                            <a href="#">See All Records</a> <i class="icon-arrow-right"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <div class="portlet light tasks-widget">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-share font-green-haze hide"></i><span class="caption-subject font-green-haze bold uppercase">Tasks</span> <span class="caption-helper">tasks summary...</span>
                                    </div>
                                    <%--<div class="actions">
                                        <div class="btn-group">
                                            <a class="btn green-haze btn-circle btn-sm" href="#" data-toggle="dropdown" data-hover="dropdown"
                                                data-close-others="true">More <i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown-menu pull-right">
                                                <li><a href="#"><i class="i"></i>All Project </a></li>
                                                <li class="divider"></li>
                                                <li><a href="#">AirAsia </a></li>
                                                <li><a href="#">Cruise </a></li>
                                                <li><a href="#">HSBC </a></li>
                                                <li class="divider"></li>
                                                <li><a href="#">Pending <span class="badge badge-danger">4 </span></a></li>
                                                <li><a href="#">Completed <span class="badge badge-success">12 </span></a></li>
                                                <li><a href="#">Overdue <span class="badge badge-warning">9 </span></a></li>
                                            </ul>
                                        </div>
                                    </div>--%>
                                </div>
                                <div class="portlet-body">
                                    <div class="task-content">
                                        <div class="scroller" style="height: 305px;" data-always-visible="1" data-rail-visible1="1">
                                            <!-- START TASK LIST -->
                                            <ul class="task-list">
                                                <li>
                                                    <div class="task-checkbox">
                                                        <input type="checkbox" class="liChild" value="" />
                                                    </div>
                                                    <div class="task-title">
                                                        <span class="task-title-sp">Present 2015 Year IPO Statistics at Board Meeting </span>

                                                    </div>
                                                    <div class="task-config">
                                                        <div class="task-config-btn btn-group">
                                                            <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown"
                                                                data-close-others="true"><i class="fa fa-cog"></i><i class="fa fa-angle-down"></i>
                                                            </a>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="#"><i class="fa fa-check"></i>Complete </a></li>
                                                                <li><a href="#"><i class="fa fa-pencil"></i>Edit </a></li>
                                                                <li><a href="#"><i class="fa fa-trash-o"></i>Cancel </a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="task-checkbox">
                                                        <input type="checkbox" class="liChild" value="" />
                                                    </div>
                                                    <div class="task-title">
                                                        <span class="task-title-sp">Hold An Interview for Marketing Manager Position </span>

                                                    </div>
                                                    <div class="task-config">
                                                        <div class="task-config-btn btn-group">
                                                            <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown"
                                                                data-close-others="true"><i class="fa fa-cog"></i><i class="fa fa-angle-down"></i>
                                                            </a>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="#"><i class="fa fa-check"></i>Complete </a></li>
                                                                <li><a href="#"><i class="fa fa-pencil"></i>Edit </a></li>
                                                                <li><a href="#"><i class="fa fa-trash-o"></i>Cancel </a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="task-checkbox">
                                                        <input type="checkbox" class="liChild" value="" />
                                                    </div>
                                                    <div class="task-title">
                                                        <span class="task-title-sp">Project Internal Meeting </span>

                                                    </div>
                                                    <div class="task-config">
                                                        <div class="task-config-btn btn-group">
                                                            <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown"
                                                                data-close-others="true"><i class="fa fa-cog"></i><i class="fa fa-angle-down"></i>
                                                            </a>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="#"><i class="fa fa-check"></i>Complete </a></li>
                                                                <li><a href="#"><i class="fa fa-pencil"></i>Edit </a></li>
                                                                <li><a href="#"><i class="fa fa-trash-o"></i>Cancel </a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="task-checkbox">
                                                        <input type="checkbox" class="liChild" value="" />
                                                    </div>
                                                    <div class="task-title">
                                                        <span class="task-title-sp">Technical Management Meeting </span>
                                                    </div>
                                                    <div class="task-config">
                                                        <div class="task-config-btn btn-group">
                                                            <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown"
                                                                data-close-others="true"><i class="fa fa-cog"></i><i class="fa fa-angle-down"></i>
                                                            </a>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="#"><i class="fa fa-check"></i>Complete </a></li>
                                                                <li><a href="#"><i class="fa fa-pencil"></i>Edit </a></li>
                                                                <li><a href="#"><i class="fa fa-trash-o"></i>Cancel </a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </li>





                                            </ul>
                                            <!-- END START TASK LIST -->
                                        </div>
                                    </div>
                                    <div class="task-footer">
                                        <div class="btn-arrow-link pull-right">
                                            <a href="#">See All Records</a> <i class="icon-arrow-right"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix">
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet light calendar ">
                                <div class="portlet-title ">
                                    <div class="caption">
                                        <i class="icon-calendar font-green-sharp"></i><span class="caption-subject font-green-sharp bold uppercase">Calendar</span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="calendar">
                                    </div>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                        <%-- <div class="col-md-6 col-sm-6" style="display:none;">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet light ">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-bubble font-red-sunglo"></i><span class="caption-subject font-red-sunglo bold uppercase">Chats</span>
                                    </div>
                                    <div class="actions">
                                        <div class="portlet-input input-inline">
                                            <div class="input-icon right">
                                                <i class="icon-magnifier"></i>
                                                <input type="text" class="form-control input-circle" placeholder="search...">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="portlet-body" id="chats">
                                    <div class="scroller" style="height: 385px;" data-always-visible="1" data-rail-visible1="1">
                                        <ul class="chats">
                                            <li class="in">

                                                <div class="message">
                                                    <span class="arrow"></span><a href="#" class="name">Kelvin </a><span class="datetime">at 20:09 </span><span class="body">Hi.. </span>
                                                </div>
                                            </li>






                                        </ul>
                                    </div>
                                    <div class="chat-form">
                                        <div class="input-cont">
                                            <input class="form-control" type="text" placeholder="Type a message here..." />
                                        </div>
                                        <div class="btn-cont">
                                           <span class="arrow"></span><a href="" class="btn blue icn-only"><i class="fa fa-check icon-white">
                                            </i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>--%>
                    </div>
                    <table>
                        <tr>
                            <td style="height: 900px;"></td>
                        </tr>
                    </table>
                    <div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">Events</h4>
                                    <button type="button" id="cal_new" class="btn blue" style="float: right; position: relative; top: -27px; left: -32px;display:none">New</button>
                                    <button type="button" id="cal_edit" class="btn blue" style="float: right; position: relative; top: -27px; left: -32px;display:none">Edit</button>
                                    <button type="button" id="cal_delete" class="btn blue" style="float: right; position: relative; top: -27px; left: -32px;display:none">Delete</button>

                                </div>
                                <div class="modal-body">
                                    <div class="scroller" style="height: 340px" data-always-visible="1" data-rail-visible1="1">
                                        <div class="row cls_calender_pop">
                                            <div class="col-xs-12 cls_title_edit">
                                                <span style="float: left; width: 100px">Existing Event</span>
                                                <span style="margin: 0 20px; float: left;">
                                                    <select id="ddl_title" class="form-control" style="min-width: 210px"></select></span>
                                            </div>
                                            <div class="col-xs-12 cls_title_new">
                                                <span style="float: left; width: 100px">Title</span>
                                                <span style="margin: 0 20px; float: left;">
                                                    <input type="text" class="form-control" id="calender_title" style="width: 280px" /></span>
                                            </div>
                                            <div class="col-xs-12">
                                                <span style="float: left; width: 100px">Description</span>
                                                <span style="margin: 0 20px; float: left;">
                                                    <textarea id="txt_Desc" cols="32" rows="3" class="form-control"></textarea>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 form-group">
                                                <label style="width: 95px; float: left;">Event Type</label>
                                                <div class="col-xs-12 radio-list" style="width: 80%">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="Short" />
                                                        Short
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="AllDay" />
                                                        All Day
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="optionsRadios" id="optionsRadios3" value="Long" />
                                                        Long
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <span style="float: left; width: 100px">Start Date</span>
                                                <span style="margin: 0 20px; float: left;">
                                                    <input type="text" class="form-control date-picker" id="calender_startdate" style="width: 212px;" /></span>
                                            </div>
                                            <div class="col-xs-12">
                                                <span style="float: left; width: 95px">End Date</span>
                                                <span style="margin: 0 25px; float: left;">
                                                    <input type="text" class="form-control date-picker" id="calender_enddate" style="width: 212px;" /></span>
                                            </div>
                                            <div class=" col-xs-12 form-group cls_calender_starttime">
                                                <span style="float: left; width: 102px">Start Time</span>
                                                <span style="margin: 0px 18px; float: left;">
                                                    <span class="input-icon">
                                                        <i class="fa fa-clock-o"></i>
                                                        <input type="text" id="calender_starttime" class="form-control time" style="width: 212px;" />
                                                    </span>
                                                </span>
                                            </div>
                                            <div class=" col-xs-12 form-group cls_calender_endtime">
                                                <span style="float: left; width: 96px">End Time</span>
                                                <span style="margin: 0px 24px; float: left;">
                                                    <span class="input-icon">
                                                        <i class="fa fa-clock-o"></i>
                                                        <input type="text" id="calender_endtime" class="form-control time" style="width: 212px;" />
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" data-dismiss="modal" class="btn default">Close</button>
                                    <button type="button" id="btn_event_save" class="btn green">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTENT -->
            <!-- BEGIN QUICK SIDEBAR -->
            <!--Cooming Soon...-->
            <!-- END QUICK SIDEBAR -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <%--<div class="page-footer">
            <div class="page-footer-inner">
                2015 &copy; VERTIAS.
            </div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>--%>
        <!-- END FOOTER -->
    </div>
    <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
    <!-- BEGIN CORE PLUGINS -->
    <!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
    <script src="assets/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
    <script src="assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="assets/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js"
        type="text/javascript"></script>
    <script src="assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js"
        type="text/javascript"></script>
    <!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
    <script src="assets/global/plugins/fullcalendar/fullcalendar/fullcalendar.min.js"
        type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js"
        type="text/javascript"></script>
    <script src="assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
    <script src="assets/admin/layout2/scripts/layout.js" type="text/javascript"></script>
    <script src="assets/admin/layout2/scripts/demo.js" type="text/javascript"></script>
    <script src="assets/admin/pages/scripts/index.js" type="text/javascript"></script>
    <script src="assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->

    <script src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
    <%--   <script src="JavaScript/chart/js/jquery.jqplot.min.js" type="text/javascript"></script>
    <script src="JavaScript/chart/js/jqplot.dateAxisRenderer.min.js" type="text/javascript"></script>
    <script src="JavaScript/chart/js/jqplot.cursor.min.js" type="text/javascript"></script>
    <script src="JavaScript/chart/js/jqplot.highlighter.min.js" type="text/javascript"></script>--%>
    <script src="JavaScript/Qtip/jquery.qtip.min.js" type="text/javascript"></script>

       <script src="JavaScript/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="JavaScript/jquery.timepicker.js" type="text/javascript"></script>
    <script src="JavaScript/date.js" type="text/javascript"></script>
    <script type="text/javascript">
        function get_CompanyID() {
            <% if (Session["CompanyID"] != null)
               { %>
            return '<%= Session["CompanyID"] %>';
            
            <% } %>
            return 0;
        } function get_BranchID() {
            <% if (Session["BranchID"] != null)
               { %>
            return '<%= Session["BranchID"] %>';
            
            <% } %>
            return undefined;
        }
        var mode = 'insert'; var calenderId = [], Edit_data = [], date, calenderid = 0;
        jQuery(document).ready(function () {
            Metronic.init(); // init metronic core componets
            Layout.init(); // init layout
            Demo.init(); // init demo features 
            Index.init();
            Index.initDashboardDaterange();
            //  Index.initJQVMAP(); // init index page's custom scripts
            // Index.initCalendar(); // init index page's custom scripts

            //Index.initChat();
            // Index.initMiniCharts();
            // Index.initIntro();
            Tasks.initDashboardWidget();

            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy.mm.dd'
                });
            }
            //if (jQuery().timepicker) {
            //    $('.timepicker-default').timepicker({
            //        autoclose: true,
            //        showSeconds: true,
            //        minuteStep: 1
            //    });
            //}
            $('#calender_starttime').timepicker();
            $('#calender_endtime').timepicker();


            $.ajax({
                url: "HttpHandler/Dashboard.ashx",
                data: { imode: 'sales_purchase_graph', sptype: 'fetch', companyId: get_CompanyID(), branchId: get_BranchID() },
                cache: false,
                success: function (data) {
                    if (data != null) {
                        if (data.length > 0) {
                            var data_sales = new Array();
                            var data_purchase = new Array();

                            var sales_tooltip = [], purchase_tooltip = [];
                            for (var i = 0; i < data.length; i++) {
                                if (data[i].SalesDate != null) {
                                    var sales = new Array(2);
                                    sales[0] = data[i].SalesDate;
                                    sales[1] = data[i].Amount;
                                    sales_tooltip.push(data[i].tooltip);
                                    data_sales.push(sales);
                                } else {
                                    var purchase = new Array(2);
                                    purchase[0] = data[i].PurchaseOrderDate;
                                    purchase[1] = data[i].Amount;
                                    purchase_tooltip.push(data[i].tooltip);
                                    data_purchase.push(purchase);
                                }

                            }
                            //  draw(data_);
                            Index.initCharts(data_purchase, purchase_tooltip, '#site_statistics', 'purchase');
                            Index.initCharts(data_sales, sales_tooltip, '#site_activities', 'sales');
                        }
                    }
                }
            });
            $.ajax({
                url: "HttpHandler/Dashboard.ashx",
                data: { imode: 'shared', sptype: 'fetch', companyId: get_CompanyID(), branchId: get_BranchID() },
                cache: false,
                success: function (data) {
                    if (data != null) {
                        if (data.length > 0) {
                            var data_shared = new Array();
                            for (var i = 0; i < data.length; i++) {
                                var shared = {};
                                if (data[i].Type == 'Short' || data[i].Type == 'AllDay') {
                                    shared.allDay = false;
                                }
                                shared.className = ' cls_custom cls_' + data[i].CalenderID;
                                shared.title = data[i].Title;
                                shared.start = data[i].StartDate;
                                shared.description = '<div><span style="padding:3px"><b>Title :</b>' + data[i].Title + '</span><br/><span style="padding:3px"><b>Description :</b>' + data[i].Descriptions + '</span><br/><span style="padding:3px"><b>StartDate :</b>' + data[i].StartDate + '</span><br/><span style="padding:3px"><b>EndDate :</b>' + data[i].EndDate + '</span></div>';
                                shared.end = data[i].EndDate;
                                shared.backgroundColor = Metronic.getBrandColor(data[i].Backgroundcolor);
                                data_shared.push(shared);
                            }
                            Index.initCalendar(data_shared);
                        } else {
                            Index.initCalendar();
                        }
                    }
                }
            });

            $(document).on('click', '.fc-border-separate tbody tr .fc-day', function () {
                date = $(this)[0].dataset.date;
                $('#ddl_title').empty();
                $('#calender_title').focus();
                $('#calender_title,#txt_Desc').val('');
                $('#calender_startdate').val(date);
                $('#calender_enddate').val(date);
                $("input[name='optionsRadios'][value='Short']").click();
                $("input[name='optionsRadios'][value='Short']").click();
                $('.cls_title_edit').hide();
                $('#responsive').modal('show');
            });
            $(document).on('click', '.fc-agenda-slots tbody tr .fc-widget-content', function () {
                var time_;               
                if ($(this).parent().hasClass('fc-minor')) {
                    time_ = $(this).parent().prev().find('.fc-agenda-axis').html();
                } else {
                    time_ = $(this).parent().find('.fc-agenda-axis').html();                    
                }              
                $('#calender_starttime').val(time_);
                $('#ddl_title').empty(); $('#calender_title,#txt_Desc').val('');
                $('#calender_title').focus();
                var dat_ = '';
                //console.log($('.fc-header span .fc-header-title').text().split(' ')[4])
                //console.log($('.fc-agenda-days .fc-widget-header').text())
                //console.log($('.fc-agenda-days .fc-widget-header').text().split('/')[0])
                //if ($('.fc-header span.fc-header-title').text().indexOf('—') == -1) {
                //    dat_ = new Date($('.fc-header span.fc-header-title').text())

                //}
                if (sessionStorage.getItem('date_') != undefined && sessionStorage.getItem('date_') != '') {
                    dat_ =  new Date(sessionStorage.getItem('date_'));
                    sessionStorage.getItem('date_') == '';
                }
                
                //console.log(dat_)
                if (dat_!='') {
                    $('#calender_startdate').val(d_(dat_));
                    $('#calender_enddate').val(d_(dat_));
                }
                else {
                    $('#calender_startdate').val('');
                    $('#calender_enddate').val('');
                }
                $('#calender_endtime').val('');
                $("input[name='optionsRadios'][value='Short']").click();
                $("input[name='optionsRadios'][value='Short']").click();
                $('.cls_title_edit').hide();
                $('#responsive').modal('show');
            });
            $(document).on('click', '#cal_new', function () {
                $('.cls_title_edit').hide();
                mode = 'insert'; calenderid = 0;
            });

            $(document).on('click', '#cal_delete', function () {
                if ($('#ddl_title').val() != '-1') {
                    mode = 'delete', calenderid = Number($('#ddl_title').val());
                    $.ajax({
                        url: "HttpHandler/Dashboard.ashx",
                        data: { imode: mode, sptype: 'insert', companyId: get_CompanyID(), branchId: get_BranchID(), CalenderID: calenderid },
                        cache: false,
                        success: function (data) {
                            $('#cal_edit').click();
                            if (data != null) {
                                if (data.length > 0) {
                                    if (data[0].res == 'saved') {
                                        var data_shared = new Array();
                                        for (var i = 0; i < data.length; i++) {
                                            var shared = {};
                                            if (data[i].Type == 'Short') {
                                                shared.allDay = false;
                                            }
                                            shared.className = ' cls_custom cls_' + data[i].CalenderID;
                                            shared.title = data[i].Title;
                                            shared.description = '<div><span style="padding:3px"><b>Title :</b>' + data[i].Title + '</span><br/><span style="padding:3px"><b>Description :</b>' + data[i].Descriptions + '</span><br/><span style="padding:3px"><b>StartDate :</b>' + data[i].StartDate + '</span><br/><span style="padding:3px"><b>EndDate :</b>' + data[i].EndDate + '</span></div>';
                                            shared.start = data[i].StartDate;
                                            shared.end = data[i].EndDate;
                                            shared.backgroundColor = Metronic.getBrandColor(data[i].Backgroundcolor);
                                            data_shared.push(shared);
                                        }
                                        Index.initCalendar(data_shared);
                                    }
                                }
                            }
                        }
                    });
                }
            });
            $(document).on('click', '#cal_edit', function () {
                $('.cls_title_edit').show();
                mode = 'update';
                $.ajax({
                    url: "HttpHandler/Dashboard.ashx",
                    data: { imode: 'Edit', sptype: 'fetch', companyId: get_CompanyID(), branchId: get_BranchID(), start: date },
                    cache: false,
                    success: function (data) {
                        Edit_data = [], calenderId = [];
                        $('#ddl_title').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                $('#ddl_title').append($('<option></option>').val('-1').html('--select--'));
                                Edit_data = data;
                                for (var i = 0; i < data.length; i++) {
                                    calenderId.push(data[i].CalenderID);
                                    $('#ddl_title').append($('<option></option>').val(data[i].CalenderID).html(data[i].Title));
                                }
                                $("input[name='optionsRadios'][value='Short']").click();
                                $("input[name='optionsRadios'][value='Short']").click();
                                $('#calender_startdate,#calender_title,#calender_endtime,#calender_starttime,#calender_enddate').val('');
                            }
                        }
                    }
                });
            });
            $(document).on('change', '#ddl_title', function () {
                var ind = calenderId.indexOf(Number($(this).val()));
                calenderid = Number($(this).val());
                if ($(this).val() != '-1') {
                    $('#calender_title').val(Edit_data[ind].Title);
                    //setTimeout(function () {
                    $('input[name=optionsRadios][value=' + Edit_data[ind].Type + ']').click();
                    $('input[name=optionsRadios][value=' + Edit_data[ind].Type + ']').click();
                    // }, 10);                    
                    $('#calender_startdate').val(Edit_data[ind].StartDate);
                    $('#calender_enddate').val(Edit_data[ind].EndDate);
                    $('#calender_starttime').val(Edit_data[ind].StartTime);
                    $('#calender_endtime').val(Edit_data[ind].EndTime);
                    $('#txt_Desc').val(Edit_data[ind].Descriptions);
                } else {
                    //setTimeout(function () {
                    $("input[name='optionsRadios'][value='Short']").click();
                    $("input[name='optionsRadios'][value='Short']").click();
                    //}, 10);
                    $('#calender_startdate,#calender_title,#calender_endtime,#calender_starttime,#calender_enddate,#txt_Desc').val('');
                }
            });
            resizeIframe();
            
            $(document).on('click', '.fc-event-inner', function () {
                //console.log($(this).find('.fc-event-time').text())
                //console.log($(this).find('.fc-event-title').text())
                var a_=$(this).parent().attr('class').split(' ');
                var ind_=a_.indexOf('cls_custom');
                // console.log(a_[ind_ + 1].split('_')[1]);
                var e_ = a_[ind_ + 1].split('_')[1];
                location.href = 'Master/Calender.aspx?id='+e_;

            });
            $(document).on('click', '#btn_event_save', function () {
                var arg = {
                    title: $('#calender_title').val(),
                    type: $("input[type='radio'][name='optionsRadios']:checked").val(),
                    start: $('#calender_startdate').val(),
                    end: $('#calender_enddate').val(),
                    starttime: ($("input[type='radio'][name='optionsRadios']:checked").val() == 'Short' ? $('#calender_starttime').val() : '00:00:00'),
                    endtime: ($("input[type='radio'][name='optionsRadios']:checked").val() == 'Short' ? $('#calender_endtime').val() : '00:00:00'),
                    Desc: $('#txt_Desc').val()
                }
                $.ajax({
                    url: "HttpHandler/Dashboard.ashx",
                    data: $.extend(arg, { imode: mode, sptype: 'insert', companyId: get_CompanyID(), branchId: get_BranchID(), CalenderID: calenderid }),
                    cache: false,
                    success: function (data) {
                        $('#responsive').modal('hide');

                        if (data != null) {
                            if (data.length > 0) {
                                if (data[0].res == 'saved') {
                                    var data_shared = new Array();
                                    for (var i = 0; i < data.length; i++) {
                                        var shared = {};
                                        if (data[i].Type == 'Short') {
                                            shared.allDay = false;
                                        }
                                        shared.className = ' cls_custom cls_' + data[i].CalenderID;
                                        shared.title = data[i].Title;
                                        shared.start = data[i].StartDate;
                                        shared.description = '<div><span style="padding:3px"><b>Title :</b>' + data[i].Title + '</span><br/><span style="padding:3px"><b>Description :</b>' + data[i].Descriptions + '</span><br/><span style="padding:3px"><b>StartDate :</b>' + data[i].StartDate + '</span><br/><span style="padding:3px"><b>EndDate :</b>' + data[i].EndDate + '</span></div>';
                                        shared.end = data[i].EndDate;
                                        shared.backgroundColor = Metronic.getBrandColor(data[i].Backgroundcolor);
                                        data_shared.push(shared);
                                    }
                                    Index.initCalendar(data_shared);
                                }

                            }
                        }
                    }
                });

            });
        });
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 250 + 'px';
        }
        function d_(d) {
            var curr_date = d.getDate();
            var curr_month = d.getMonth() + 1; //Months are zero based
            var curr_year = d.getFullYear();
            return curr_year + '-' + curr_month + '-' + curr_date
        }
        function t_(d) {
            var curr_hr = d.getHours();
            var curr_mm = d.getMinutes(); 
            var curr_s = d.getSeconds();
            return curr_hr + ':' + curr_mm + ':' + curr_s
        }
    </script>

    <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
