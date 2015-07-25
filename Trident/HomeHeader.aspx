<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeHeader.aspx.cs" Inherits="Trident.HomeHeader" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>Efrontier  | Admin Dashboard Template</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="assets/global/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN PAGE STYLES -->
<link href="assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout2/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout2/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="assets/admin/layout2/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
  <style type="text/css">
      .cls_notify_right{
          float:right;
      }
      .time{
          margin-right:5px;
      }
      #ul_notications_new .label.label-icon{
          padding:3px 5px !important;
      }
      .cls_close{
          z-index:1;cursor:pointer;
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
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner container">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="#">
			<img src="assets/admin/layout2/img/logo-default.png" alt="logo" class="logo-default"/>
			</a>
			<div class="menu-toggler sidebar-toggler">
				<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
			</div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN PAGE ACTIONS -->
		<!-- DOC: Remove "hide" class to enable the page header actions -->
		<div class="page-actions hide">
			<div class="btn-group">
				<button type="button" class="btn btn-circle red-pink dropdown-toggle" data-toggle="dropdown">
				<i class="icon-bar-chart"></i>&nbsp;<span class="hidden-sm hidden-xs">New&nbsp;</span>&nbsp;<i class="fa fa-angle-down"></i>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a href="#">
						<i class="icon-user"></i> New User </a>
					</li>
					<li>
						<a href="#">
						<i class="icon-present"></i> New Event <span class="badge badge-success">4</span>
						</a>
					</li>
					<li>
						<a href="#">
						<i class="icon-basket"></i> New order </a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="#">
						<i class="icon-flag"></i> Pending Orders <span class="badge badge-danger">4</span>
						</a>
					</li>
					<li>
						<a href="#">
						<i class="icon-users"></i> Pending Users <span class="badge badge-warning">12</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-circle green-haze dropdown-toggle" data-toggle="dropdown">
				<i class="icon-bell"></i>&nbsp;<span class="hidden-sm hidden-xs">Post&nbsp;</span>&nbsp;<i class="fa fa-angle-down"></i>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a href="#">
						<i class="icon-docs"></i> New Post </a>
					</li>
					<li>
						<a href="#">
						<i class="icon-tag"></i> New Comment </a>
					</li>
					<li>
						<a href="#">
						<i class="icon-share"></i> Share </a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="#">
						<i class="icon-flag"></i> Comments <span class="badge badge-success">4</span>
						</a>
					</li>
					<li>
						<a href="#">
						<i class="icon-users"></i> Feedbacks <span class="badge badge-danger">2</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- END PAGE ACTIONS -->
		<!-- BEGIN PAGE TOP -->
		<div class="page-top">
			<!-- BEGIN HEADER SEARCH BOX -->
			<!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
			<form class="search-form search-form-expanded" action="#" method="GET">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search..." name="query">
					<span class="input-group-btn">
					<a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
					</span>
				</div>
			</form>
			<!-- END HEADER SEARCH BOX -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN NOTIFICATION DROPDOWN -->
					<li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<i class="icon-bell"></i>
						<span class="badge badge-danger spn_notication_count" id="spn_notfication_count_top">
						0 </span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<p id="p_notication_count">
									 You have <span id="spn_notication_count" class="spn_notication_count"> 0 </span> new notifications
								</p>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller" style="height: 250px;" id="ul_notications_new">
									<%--<li>
										<a href="#">
										<span class="label label-sm label-icon label-success">
										<i class="fa fa-plus"></i>
										</span>
										New user registered. <span class="time">
										Just now </span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="label label-sm label-icon label-danger">
										<i class="fa fa-bolt"></i>
										</span>
										Server #12 overloaded. <span class="time">
										15 mins </span>
										</a>
									</li>--%>
									
									
									
									
								</ul>
							</li>
							<li class="external">
								<a href="#">
								See all notifications <i class="icon-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN INBOX DROPDOWN -->
					<%--<li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<i class="icon-envelope-open"></i>
						<span class="badge badge-primary">
						2 </span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<p>
									 You have 2 new messages
								</p>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller" style="height: 250px;">
									<li>
										<a href="#">
										<span class="photo">
									<img src="assets/admin/layout2/img/avatar2.jpg" alt=""/>
										</span>
										<span class="subject">
										<span class="from">
										Eddie Tan </span>
										<span class="time">
										Just Now </span>
										</span>
										<span class="message">
										Please check the PO... </span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="photo">
									<img src="assets/admin/layout2/img/avatar3.jpg" alt=""/>
										</span>
										<span class="subject">
										<span class="from">
										Bren </span>
										<span class="time">
										16 mins </span>
										</span>
										<span class="message">
										 Discount Calculation Missing...</span>
										</a>
									</li>
									
									
									
								</ul>
							</li>
							<li class="external">
								<a href="#">
								See all messages <i class="icon-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>--%>
					<!-- END INBOX DROPDOWN -->
					<!-- BEGIN TODO DROPDOWN -->
					<%--<li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<i class="icon-calendar"></i>
						<span class="badge badge-success">
						3 </span>
						</a>
						<ul class="dropdown-menu extended tasks">
							<li>
								<p>
									 You have 3 pending tasks
								</p>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller" style="height: 250px;">
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">
										New release v1.2 </span>
										<span class="percent">
										30% </span>
										</span>
										<div class="progress">
											<div style="width: 40%;" class="progress-bar progress-bar-success" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
												<div class="sr-only">
													 40% Complete
												</div>
											</div>
										</div>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">
										Application deployment </span>
										<span class="percent">
										65% </span>
										</span>
										<div class="progress progress-striped">
											<div style="width: 65%;" class="progress-bar progress-bar-danger" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">
												<div class="sr-only">
													 65% Complete
												</div>
											</div>
										</div>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">
										Mobile app release </span>
										<span class="percent">
										98% </span>
										</span>
										<div class="progress">
											<div style="width: 98%;" class="progress-bar progress-bar-success" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100">
												<div class="sr-only">
													 98% Complete
												</div>
											</div>
										</div>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">
										Database migration </span>
										<span class="percent">
										10% </span>
										</span>
										<div class="progress progress-striped">
											<div style="width: 10%;" class="progress-bar progress-bar-warning" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
												<div class="sr-only">
													 10% Complete
												</div>
											</div>
										</div>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">
										Web server upgrade </span>
										<span class="percent">
										58% </span>
										</span>
										<div class="progress progress-striped">
											<div style="width: 58%;" class="progress-bar progress-bar-info" aria-valuenow="58" aria-valuemin="0" aria-valuemax="100">
												<div class="sr-only">
													 58% Complete
												</div>
											</div>
										</div>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">
										Mobile development </span>
										<span class="percent">
										85% </span>
										</span>
										<div class="progress progress-striped">
											<div style="width: 85%;" class="progress-bar progress-bar-success" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
												<div class="sr-only">
													 85% Complete
												</div>
											</div>
										</div>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">
										New UI release </span>
										<span class="percent">
										18% </span>
										</span>
										<div class="progress progress-striped">
											<div style="width: 18%;" class="progress-bar progress-bar-important" aria-valuenow="18" aria-valuemin="0" aria-valuemax="100">
												<div class="sr-only">
													 18% Complete
												</div>
											</div>
										</div>
										</a>
									</li>
								</ul>
							</li>
							<li class="external">
								<a href="#">
								See all tasks <i class="icon-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>--%>
					<!-- END TODO DROPDOWN -->
					<!-- BEGIN QUICK SIDEBAR TOGGLER -->
					<li class="dropdown dropdown-quick-sidebar-toggler hide">
						<a href="javascript:;" class="dropdown-toggle">
						<i class="icon-logout"></i>
						</a>
					</li>
					<!-- END QUICK SIDEBAR TOGGLER -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown dropdown-user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<%--<img alt="" class="img-circle hide1" src="assets/admin/layout/img/avatar3_small.jpg"/>--%>
                            <i class="icon icon-user icon-lg" style="margin-right:5px"></i>
						<span class="username username-hide-on-mobile" id="label" runat="server">
						</span>
						<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<%--<li>
								<a href="#">
								<i class="icon-user"></i> My Profile </a>
							</li>
							<li>
								<a href="#">
								<i class="icon-calendar"></i> My Calendar </a>
							</li>--%>
							<%--<li>
								<a href="#">
								<i class="icon-envelope-open"></i> My Inbox <span class="badge badge-danger">
								3 </span>
								</a>
							</li>
							<li>
								<a href="#">
								<i class="icon-rocket"></i> My Tasks <span class="badge badge-success">
								7 </span>
								</a>
							</li>--%>
							<%--<li class="divider">
							</li>--%>
							<%--<li>
								<a href="#">
								<i class="icon-lock"></i> Lock Screen </a>
							</li>--%>
							<li>
								<a href="SignIn.aspx">
								<i class="icon-key"></i> Log Out </a>
							</li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END PAGE TOP -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="container">
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<asp:Label ID="lblMenu" runat="server"></asp:Label>
            <div id="lblmen"></div>
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
				<div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
								<h4 class="modal-title">Modal title</h4>
							</div>
							<div class="modal-body">
								 Widget settings form goes here
							</div>
							<div class="modal-footer">
								<button type="button" class="btn blue">Save changes</button>
								<button type="button" class="btn default" data-dismiss="modal">Close</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
				<!-- BEGIN STYLE CUSTOMIZER -->
				<%--<div class="theme-panel">
					<div class="toggler tooltips" data-container="body" data-placement="left" data-html="true" data-original-title="Click to open advance theme customizer panel">
						<i class="icon-settings"></i>
					</div>
					<div class="toggler-close">
						<i class="icon-close"></i>
					</div>
					<div class="theme-options">
						<div class="theme-option theme-colors clearfix">
							<span>
							THEME COLOR </span>
							<ul>
								<li class="color-default current tooltips" data-style="default" data-container="body" data-original-title="Default">
								</li>
								<li class="color-grey tooltips" data-style="grey" data-container="body" data-original-title="Grey">
								</li>
								<li class="color-blue tooltips" data-style="blue" data-container="body" data-original-title="Blue">
								</li>
								<li class="color-dark tooltips" data-style="dark" data-container="body" data-original-title="Dark">
								</li>
								<li class="color-light tooltips" data-style="light" data-container="body" data-original-title="Light">
								</li>
							</ul>
						</div>
						<div class="theme-option">
							<span>
							Layout </span>
							<select class="layout-option form-control input-small">
								<option value="fluid" selected="selected">Fluid</option>
								<option value="boxed">Boxed</option>
							</select>
						</div>
						<div class="theme-option">
							<span>
							Header </span>
							<select class="page-header-option form-control input-small">
								<option value="fixed" selected="selected">Fixed</option>
								<option value="default">Default</option>
							</select>
						</div>
						<div class="theme-option">
							<span>
							Sidebar Mode</span>
							<select class="sidebar-option form-control input-small">
								<option value="fixed">Fixed</option>
								<option value="default" selected="selected">Default</option>
							</select>
						</div>
						<div class="theme-option">
							<span>
							Sidebar Style</span>
							<select class="sidebar-style-option form-control input-small">
								<option value="default" selected="selected">Default</option>
								<option value="compact">Compact</option>
							</select>
						</div>
						<div class="theme-option">
							<span>
							Sidebar Menu </span>
							<select class="sidebar-menu-option form-control input-small">
								<option value="accordion" selected="selected">Accordion</option>
								<option value="hover">Hover</option>
							</select>
						</div>
						<div class="theme-option">
							<span>
							Sidebar Position </span>
							<select class="sidebar-pos-option form-control input-small">
								<option value="left" selected="selected">Left</option>
								<option value="right">Right</option>
							</select>
						</div>
						<div class="theme-option">
							<span>
							Footer </span>
							<select class="page-footer-option form-control input-small">
								<option value="fixed">Fixed</option>
								<option value="default" selected="selected">Default</option>
							</select>
						</div>
						<div class="theme-option">
							<a href="{RTL_LTR_URL}" target="_blank" class="btn red-sunglo btn-block"><i class="icon-link"></i> Full RTL Version!</a></a>
						</div>
					</div>
				</div>--%>
				<!-- END STYLE CUSTOMIZER -->
				<!-- BEGIN PAGE HEADER-->
				<%--<h3 class="page-title">
				Dashboard</h3>
				<div class="page-bar">
					<ul class="page-breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="index.html">Home</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">Dashboard</a>
						</li>
					</ul>
					<div class="page-toolbar">
						<div id="dashboard-report-range" class="tooltips btn btn-fit-height btn-sm green-haze btn-dashboard-daterange" data-container="body" data-placement="left" data-original-title="Change dashboard date range">
							<i class="icon-calendar"></i>
							&nbsp;&nbsp; <i class="fa fa-angle-down"></i>
							<!-- uncomment this to display selected daterange in the button 
&nbsp; <span class="thin uppercase visible-lg-inline-block"></span>&nbsp;
<i class="fa fa-angle-down"></i>
 -->
						</div>
					</div>
				</div>--%>

                <div>
                <iframe id="_view" name="_view" onload="iframeLoaded()" src="HomeContentPage.aspx"
                                                    marginwidth="0" marginheight="0" width="100%" frameborder="0" scrolling="no"
                                                    style="border-width: 0; padding: 0; border: 0;">
                                                    <p>
                                                        Your browser does not support iframes.</p>
                                                </iframe>
                                                <script type="text/javascript">
                                                    function iframeLoaded() {
                                                        var iFrameID = document.getElementById('_view');

                                                        if (iFrameID) {
                                                            // here you can meke the height, I delete it first, then I make it again

                                                            iFrameID.height = "";
                                                            //                    iFrameID.height = iFrameID.contentWindow.document.body.scrollHeight + "px";
                                                            iFrameID.height = (parseInt(iFrameID.contentWindow.document.body.offsetHeight + 100)) + 'px';

                                                        }
                                                    }
</script> 
                </div>

				<!-- END PAGE HEADER-->
				<!-- BEGIN DASHBOARD STATS -->
				
			</div>
		</div>
		<!-- END CONTENT -->
		<!-- BEGIN QUICK SIDEBAR -->
		<!--Cooming Soon...-->
		<!-- END QUICK SIDEBAR -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="page-footer">
		<div class="page-footer-inner">
			 2014 &copy; <label id="lblcompanyName" runat="server"></label>
		</div>
		<div class="scroll-to-top">
			<i class="icon-arrow-up"></i>
		</div>
	</div>
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
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
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
<script src="assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
<script src="assets/global/plugins/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
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
<script type="text/javascript">
    var Mainmenu = [], childmenu = [], finalstr = '';
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
         return undefined;
     }
     function get_USERID() {
            <% if (Session["UserID"] != null)
               { %>
            return '<%= Session["UserID"] %>';
            
            <% } %>
            return 0;
        }
        jQuery(document).ready(function () {
            Metronic.init(); // init metronic core componets
            Layout.init(); // init layout
            Demo.init(); // init demo features 
            Index.init();
            Index.initDashboardDaterange();
            Index.initJQVMAP(); // init index page's custom scripts
            Index.initCalendar(); // init index page's custom scripts
            Index.initCharts(); // init index page's custom scripts
            Index.initChat();
            Index.initMiniCharts();
            // Index.initIntro();
            Tasks.initDashboardWidget();
            LoadNotification();
            $(document).on('click', '.cls_close', function () {
                alert('closing opetaion under development');
            });
            debugger;
            loadmenu();
           // $('#lblcompanyName').Text(get_CompanyName() + ' ' + '(' + get_BranchName() + ')');
        });
        var pageUrl = '<%=ResolveUrl("HomeHeader.aspx")%>';
    var temp_data = [];
    function LoadNotification() {
        $.ajax({
            type: 'POST',
            data: {},
            url: pageUrl + '/get_notification',
            cache: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data != null) {
                    if (data.d.length > 0) {
                        temp_data = data;
                        $('.spn_notication_count').text(data.d[0].notication_count);
                        for (var i = 1; i < data.d.length; i++) {
                            $('#ul_notications_new').append('<li><a href="#"><span class="label label-sm label-icon label-danger"><i class="fa">U</i></span><span id="spn_not_desc' + i + '">' + data.d[i].ShortDescription + '</span><span class="cls_notify_right"> <span class="time">' + data.d[i].Time + '</span><span class="label label-sm label-icon label-info cls_close"><i class="fa fa-remove">X</i></span></span></a></li>');
                        }
                    }
                }
            }
        });
    }

    var arg = {

        iMode: 'MenuBind',
        hmode: 'search',
        UserID: get_USERID(),
        BranchID: get_BranchID(),
        CompanyID: get_CompanyID(),
        UserGroupID: 0
    }
    function loadmenu() {
        debugger;
        $.ajax({
            url: "HttpHandler/Login.ashx",
            data: arg,
            cache: false,
            success: function (data) {
                Mainmenu = [], childmenu = [], finalstr = '';
                var dashname = ''; $('#lblmen').empty();
                if (data != null) {
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].ModulesGroupName != null) {
                                if (data[i].ModulesGroupID == 2) {
                                    dashname = data[i].ModulesGroupName;
                                }
                                Mainmenu.push(data[i]);
                            } else {
                                childmenu.push(data[i]);
                            }
                        }
                        finalstr = "<div class=\"page-sidebar navbar-collapse collapse\"><ul class=\"page-sidebar-menu page-sidebar-menu-hover-submenu\" data-auto-scroll=\"true\" data-slide-speed=\"200\">";
                        finalstr += " <li class=\"start active \">";
                        finalstr += "<a href=\"HomeHeader.aspx\"> <i class=\"icon-home\"></i>";
                        finalstr += " <span class=\"title\">" + "Dashboard" + " </span>";
                        finalstr += " <span class=\"selected\"></span>";
                        finalstr += " </a></li>";
                        for (var i = 0; i < Mainmenu.length; i++) {
                            if (Mainmenu[i].ModulesGroupID != 1) {
                                finalstr += "<li>";
                                finalstr += "<a href=\"javascript:;\">";
                                finalstr += "<i class=" + Mainmenu[i].icon + "></i>";
                                finalstr += "<span class=\"title\">" + Mainmenu[i].ModulesGroupName + "</span>";
                                finalstr += "<span class=\"arrow\"></span>";
                                finalstr += "</a>";
                                finalstr += "<ul class=\"sub-menu\">";
                                for (var j = 0; j < childmenu.length; j++) {
                                    if (childmenu[j].ModulesGroupID == Mainmenu[i].ModulesGroupID) {
                                        finalstr += "<li>";
                                        finalstr += "<a href=" + childmenu[j].Link + " target=\"_view\">";
                                        finalstr += "<i class=" + childmenu[j].Icon + "></i>" + " " + childmenu[j].ModulesName + "";
                                        finalstr += "</a></li>";
                                    }
                                }
                                finalstr += "</ul>";
                            }
                        }
                        finalstr += "</ul>";
                        finalstr += "</div>";
                        $('#lblmen').append(finalstr);
                    }
                }
            }
        });
    }
    </script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
