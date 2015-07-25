<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleContent.aspx.cs" Inherits="Trident.SampleContent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html><head>
         <link href="App_Themes/Blue/NewGroup.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Javascript/ProgressBar/jsUpdateProgress.js"></script>
    <link rel="stylesheet" href="App_Themes/Dasboard/css/font.css"/>
        <link href="App_Themes/Dasboard/css/bayanno.css" media="screen" rel="stylesheet" type="text/css"/>
        
        <script src="App_Themes/Dasboard/js/bayanno.js" type="text/javascript"></script>
        
                <title>Admin Dashboard | Hospital</title>
    <style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style></head>
    
    
<body>
    <link href="http://fonts.googleapis.com/css?family=Alegreya+Sans" rel="stylesheet" type="text/css">
<div class="navbar navbar-top navbar-inverse">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="brand" href="http://websiteonlinesolution.com/hospital-management-system-demo/">Hospital Management System			</a>
			<!-- the new toggle buttons -->
			<ul class="nav pull-right">
				<li class="toggle-primary-sidebar hidden-desktop" data-toggle="collapse" data-target=".nav-collapse-primary"><button type="button" class="btn btn-navbar"><i class="icon-th-list"></i></button></li>
				<li class="hidden-desktop" data-toggle="collapse" data-target=".nav-collapse-top"><button type="button" class="btn btn-navbar"><i class="icon-align-justify"></i></button></li>
			</ul>
			<div class="nav-collapse nav-collapse-top collapse">
				<ul class="nav pull-right">
					<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Account <b class="caret"></b></a>
					<!-- Account Selector -->
                    <ul class="dropdown-menu">
                    	<li class="with-image">
                        	<span>
                            Admin                            </span>
                        </li>
                    	<li class="divider"></li>
						<li><a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_profile">
                        		<i class="icon-user"></i><span>Profile</span></a></li>
						<li><a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?login/logout">
                        		<i class="icon-off"></i><span>Logout</span></a></li>
					</ul>
                	<!-- Account Selector -->
					</li>
				</ul>
				<ul class="nav pull-right">
					<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Select Language<b class="caret"></b></a>
					<!-- Language Selector -->
                        <ul class="dropdown-menu">
                                                                <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/spanish">
                                            spanish                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/arabic">
                                            arabic                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/dutch">
                                            dutch                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/russian">
                                            russian                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/chinese">
                                            chinese                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/turkish">
                                            turkish                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/portuguese">
                                            portuguese                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/hungarian">
                                            hungarian                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/french">
                                            french                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/greek">
                                            greek                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/german">
                                            german                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/italian">
                                            italian                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/thai">
                                            thai                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/urdu">
                                            urdu                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/hindi">
                                            hindi                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/latin">
                                            latin                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/indonesian">
                                            indonesian                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/japanese">
                                            japanese                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/korean">
                                            korean                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/dgfdgdf">
                                            dgfdgdf                                                                                    </a>
                                    </li>
                                                                    <li>
                                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?multilanguage/select_language/Marathi">
                                            Marathi                                                                                    </a>
                                    </li>
                                                        </ul>
                	<!-- Language Selector -->
					</li>
				</ul>
                <ul class="nav pull-right">
					<li class="dropdown">
					<a href="#"><i class="icon-user"></i>Admin Panel </a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>    <div class="sidebar-background">
	<div class="primary-sidebar-background">
	</div>
</div>
<div class="primary-sidebar">
	<!-- Main nav -->
    <br>
    <div style="text-align:center;">
    	<a href="http://websiteonlinesolution.com/hospital-management-system-demo/">
        	<img src="http://websiteonlinesolution.com/hospital-management-system-demo/uploads/logo.png" style="max-height:100px; max-width:100px;">
        </a>
    </div>
   	<br>
	<ul class="nav nav-collapse collapse nav-collapse-primary">
    
        
        <!------dashboard----->
		<li class="dark-nav active">
			<span class="glow"></span>
				<a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/dashboard">
					<i class="icon-desktop icon-2x"></i>
					<span>Dashboard</span>
				</a>
		</li>
        
        <!------department----->
		<li class="">
			<span class="glow"></span>
				<a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_department">
					<i class="icon-sitemap icon-2x"></i>
					<span>Department</span>
				</a>
		</li>
        
        <!------doctor----->
		<li class="">
			<span class="glow"></span>
				<a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_doctor">
					<i class="icon-user-md icon-2x"></i>
					<span>Doctor</span>
				</a>
		</li>
        
        <!------patient----->
		<li class="">
			<span class="glow"></span>
				<a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_patient">
					<i class="icon-user icon-2x"></i>
					<span>Patient</span>
				</a>
		</li>
        
        <!------nurse----->
		<li class="">
			<span class="glow"></span>
				<a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_nurse">
					<i class="icon-plus-sign-alt icon-2x"></i>
					<span>Nurse</span>
				</a>
		</li>
        
        <!------pharmacist----->
		<li class="">
			<span class="glow"></span>
				<a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_pharmacist">
					<i class="icon-medkit icon-2x"></i>
					<span>Pharmacist</span>
				</a>
		</li>
        
        <!------laboratorist----->
		<li class="">
			<span class="glow"></span>
				<a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_laboratorist">
					<i class="icon-beaker icon-2x"></i>
					<span>Laboratorist</span>
				</a>
		</li>
        
        <!------accountant----->
		<li class="">
			<span class="glow"></span>
				<a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_accountant">
					<i class="icon-money icon-2x"></i>
					<span>Accountant</span>
				</a>
		</li>
        
        
		<!------manage hospital------>
		<li class="dark-nav ">
			<span class="glow"></span>
            <a class="accordion-toggle  " data-toggle="collapse" href="#view_hospital_submenu">
                <i class="icon-screenshot icon-2x"></i>
                <span>Monitor Hospital<i class="icon-caret-down"></i></span>
            </a>
            
            <ul id="view_hospital_submenu" class="collapse ">
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_appointment">
                      <i class="icon-exchange"></i> View Appointment                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_payment">
                      <i class="icon-money"></i> View Payment                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_bed_status">
                      <i class="icon-hdd"></i> View Bed Status                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_blood_bank">
                      <i class="icon-tint"></i> View Blood Bank                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_medicine">
                      <i class="icon-medkit"></i> View Medicine                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_report/operation">
                      <i class="icon-reorder"></i> View Operation                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_report/birth">
                      <i class="icon-github-alt"></i> View Birth Report                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_report/death">
                      <i class="icon-user"></i> View Death Report                  </a>
                </li>
            </ul>
		</li>
        
        
        <!------system settings------>
		<li class="dark-nav ">
			<span class="glow"></span>
            <a class="accordion-toggle  " data-toggle="collapse" href="#settings_submenu">
                <i class="icon-wrench icon-2x"></i>
                <span>Settings<i class="icon-caret-down"></i></span>
            </a>
            
            <ul id="settings_submenu" class="collapse ">
                <!--<li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_email_template">
                      <i class="icon-envelope"></i> Manage Email Template                  </a>
                </li>-->
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_noticeboard">
                      <i class="icon-columns"></i> Manage Noticeboard                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/system_settings">
                      <i class="icon-h-sign"></i> System Settings                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_language">
                      <i class="icon-globe"></i> Manage Language                  </a>
                </li>
                <li class="">
                  <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/backup_restore">
                      <i class="icon-download-alt"></i> Backup Restore                  </a>
                </li>
            </ul>
		</li>

		<!------manage own profile--->
		<li class="">
			<span class="glow"></span>
				<a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_profile">
					<i class="icon-lock icon-2x"></i>
					<span>Profile</span>
				</a>
		</li>
		
	</ul>
	
</div>    <div class="main-content">
		        <div class="container-fluid">
            <div class="row-fluid">
                <div class="area-top clearfix">
                    <div class="pull-left header">
                        <h3 class="title">
                        <i class="icon-info-sign"></i>
                        Admin Dashboard </h3>
                    </div>
                    <ul class="inline pull-right sparkline-box">
                        <li class="sparkline-row">
                            <h4 class="green">
                                <span>Doctor</span> 
                                2                            </h4>
                        </li>
                        <li class="sparkline-row">
                            <h4 class="red">
                                <span>Patient</span> 
                                12                            </h4>
                        </li>
                        <!--<li class="sparkline-row">
                            <h4 class="blue">
                                <span>Appointment</span> 
                                40                            </h4>
                        </li>-->
                        <li class="sparkline-row">
                            <h4 class="green">
                                <span>Nurse</span> 
                                4                            </h4>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        
        <!--------FLASH MESSAGES--->
        
		<!---->
        
        
                <div class="container-fluid padded">
            <div class="container-fluid padded">
	<div class="row-fluid">
        <div class="span30">
            <!-- find me in partials/action_nav_normal -->
            <!--big normal buttons-->
            <div class="action-nav-normal">
                <div class="row-fluid">
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_doctor">
                        <i class="icon-user-md"></i>
                        <span>Doctor</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_patient">
                        <i class="icon-user"></i>
                        <span>Patient</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_nurse">
                        <i class="icon-plus-sign-alt"></i>
                        <span>Nurse</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_pharmacist">
                        <i class="icon-medkit"></i>
                        <span>Pharmacist</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_laboratorist">
                        <i class="icon-beaker"></i>
                        <span>Laboratorist</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_accountant">
                        <i class="icon-money"></i>
                        <span>Accountant</span>
                        </a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_appointment">
                        <i class="icon-exchange"></i>
                        <span>Appointment</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_payment">
                        <i class="icon-credit-card"></i>
                        <span>Payment</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_blood_bank">
                        <i class="icon-tint"></i>
                        <span>Blood Bank</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_medicine">
                        <i class="icon-medkit"></i>
                        <span>Medicine</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_report/operation">
                        <i class="icon-reorder"></i>
                        <span>Operation Report</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_report/birth">
                        <i class="icon-github-alt"></i>
                        <span>Birth Report</span>
                        </a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_report/death">
                        <i class="icon-minus-sign"></i>
                        <span>Death Report</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/view_bed_status">
                        <i class="icon-hdd"></i>
                        <span>Bed Allotment</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_noticeboard">
                        <i class="icon-columns"></i>
                        <span>Noticeboard</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/system_settings">
                        <i class="icon-h-sign"></i>
                        <span>Settings</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/manage_language">
                        <i class="icon-globe"></i>
                        <span>Language</span>
                        </a>
                    </div>
                    <div class="span2 action-nav-button">
                        <a href="http://websiteonlinesolution.com/hospital-management-system-demo/index.php?admin/backup_restore">
                        <i class="icon-download-alt"></i>
                        <span>Backup</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!---DASHBOARD MENU BAR ENDS HERE-->
    </div>
    <hr>
    <div class="row-fluid">
    
    	<!-----CALENDAR SCHEDULE STARTS-->
        <div class="span6">
            <div class="box">
                <div class="box-header">
                    <div class="title">
                        <i class="icon-calendar"></i> Calendar Schedule                    </div>
                </div>
                <div class="box-content">
                    <div id="schedule_calendar" class="fc"><table class="fc-header" style="width:100%"><tbody><tr><td class="fc-header-left"><span class="fc-button fc-button-prev fc-state-default fc-corner-left"><span class="fc-button-inner"><span class="fc-button-content">&nbsp;◄&nbsp;</span><span class="fc-button-effect"><span></span></span></span></span><span class="fc-button fc-button-next fc-state-default fc-corner-right"><span class="fc-button-inner"><span class="fc-button-content">&nbsp;►&nbsp;</span><span class="fc-button-effect"><span></span></span></span></span></td><td class="fc-header-center"><span class="fc-header-title"><h2>December 2014</h2></span></td><td class="fc-header-right"><span class="fc-button fc-button-month fc-state-default fc-corner-left fc-state-active"><span class="fc-button-inner"><span class="fc-button-content">month</span><span class="fc-button-effect"><span></span></span></span></span><span class="fc-button fc-button-agendaWeek fc-state-default"><span class="fc-button-inner"><span class="fc-button-content">week</span><span class="fc-button-effect"><span></span></span></span></span><span class="fc-button fc-button-agendaDay fc-state-default fc-corner-right"><span class="fc-button-inner"><span class="fc-button-content">day</span><span class="fc-button-effect"><span></span></span></span></span></td></tr></tbody></table><div class="fc-content" style="position: relative; min-height: 1px;"><div class="fc-view fc-view-month fc-grid" style="position: relative;" unselectable="on"><table class="fc-border-separate" style="width:100%" cellspacing="0"><thead><tr class="fc-first fc-last"><th class="fc-sun fc-widget-header fc-first" style="width: 69px;">Sun</th><th class="fc-mon fc-widget-header" style="width: 68px;">Mon</th><th class="fc-tue fc-widget-header" style="width: 68px;">Tue</th><th class="fc-wed fc-widget-header" style="width: 68px;">Wed</th><th class="fc-thu fc-widget-header" style="width: 68px;">Thu</th><th class="fc-fri fc-widget-header" style="width: 68px;">Fri</th><th class="fc-sat fc-widget-header fc-last">Sat</th></tr></thead><tbody><tr class="fc-week0 fc-first"><td class="fc-sun fc-widget-content fc-day0 fc-first fc-other-month"><div style="min-height: 54px;"><div class="fc-day-number">30</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-mon fc-widget-content fc-day1"><div><div class="fc-day-number">1</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-tue fc-widget-content fc-day2"><div><div class="fc-day-number">2</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-wed fc-widget-content fc-day3"><div><div class="fc-day-number">3</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-thu fc-widget-content fc-day4"><div><div class="fc-day-number">4</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-fri fc-widget-content fc-day5"><div><div class="fc-day-number">5</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-sat fc-widget-content fc-day6 fc-last"><div><div class="fc-day-number">6</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td></tr><tr class="fc-week1"><td class="fc-sun fc-widget-content fc-day7 fc-first"><div style="min-height: 54px;"><div class="fc-day-number">7</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-mon fc-widget-content fc-day8"><div><div class="fc-day-number">8</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-tue fc-widget-content fc-day9"><div><div class="fc-day-number">9</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-wed fc-widget-content fc-day10"><div><div class="fc-day-number">10</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-thu fc-widget-content fc-day11 fc-state-highlight fc-today"><div><div class="fc-day-number">11</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-fri fc-widget-content fc-day12"><div><div class="fc-day-number">12</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-sat fc-widget-content fc-day13 fc-last"><div><div class="fc-day-number">13</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td></tr><tr class="fc-week2"><td class="fc-sun fc-widget-content fc-day14 fc-first"><div style="min-height: 54px;"><div class="fc-day-number">14</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-mon fc-widget-content fc-day15"><div><div class="fc-day-number">15</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-tue fc-widget-content fc-day16"><div><div class="fc-day-number">16</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-wed fc-widget-content fc-day17"><div><div class="fc-day-number">17</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-thu fc-widget-content fc-day18"><div><div class="fc-day-number">18</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-fri fc-widget-content fc-day19"><div><div class="fc-day-number">19</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-sat fc-widget-content fc-day20 fc-last"><div><div class="fc-day-number">20</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td></tr><tr class="fc-week3"><td class="fc-sun fc-widget-content fc-day21 fc-first"><div style="min-height: 54px;"><div class="fc-day-number">21</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-mon fc-widget-content fc-day22"><div><div class="fc-day-number">22</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-tue fc-widget-content fc-day23"><div><div class="fc-day-number">23</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-wed fc-widget-content fc-day24"><div><div class="fc-day-number">24</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-thu fc-widget-content fc-day25"><div><div class="fc-day-number">25</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-fri fc-widget-content fc-day26"><div><div class="fc-day-number">26</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-sat fc-widget-content fc-day27 fc-last"><div><div class="fc-day-number">27</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td></tr><tr class="fc-week4"><td class="fc-sun fc-widget-content fc-day28 fc-first"><div style="min-height: 54px;"><div class="fc-day-number">28</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-mon fc-widget-content fc-day29"><div><div class="fc-day-number">29</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-tue fc-widget-content fc-day30"><div><div class="fc-day-number">30</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-wed fc-widget-content fc-day31"><div><div class="fc-day-number">31</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-thu fc-widget-content fc-day32 fc-other-month"><div><div class="fc-day-number">1</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-fri fc-widget-content fc-day33 fc-other-month"><div><div class="fc-day-number">2</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-sat fc-widget-content fc-day34 fc-last fc-other-month"><div><div class="fc-day-number">3</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td></tr><tr class="fc-week5 fc-last"><td class="fc-sun fc-widget-content fc-day35 fc-first fc-other-month"><div style="min-height: 57px;"><div class="fc-day-number">4</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-mon fc-widget-content fc-day36 fc-other-month"><div><div class="fc-day-number">5</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-tue fc-widget-content fc-day37 fc-other-month"><div><div class="fc-day-number">6</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-wed fc-widget-content fc-day38 fc-other-month"><div><div class="fc-day-number">7</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-thu fc-widget-content fc-day39 fc-other-month"><div><div class="fc-day-number">8</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-fri fc-widget-content fc-day40 fc-other-month"><div><div class="fc-day-number">9</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td><td class="fc-sat fc-widget-content fc-day41 fc-last fc-other-month"><div><div class="fc-day-number">10</div><div class="fc-day-content"><div style="position:relative">&nbsp;</div></div></div></td></tr></tbody></table><div style="position:absolute;z-index:8;top:0;left:0"></div></div></div>
                    </div>
                </div>
            </div>
        </div>
    	<!-----CALENDAR SCHEDULE ENDS-->
        
    	<!-----NOTICEBOARD LIST STARTS-->
        <div class="span6">
            <div class="box">
                <div class="box-header">
                    <span class="title">
                        <i class="icon-reorder"></i> Noticeboard                    </span>
                </div>
                <div class="box-content scrollable" style="max-height: 500px; overflow-y: auto">
                
                                        <div class="box-section news with-icons">
                        <div class="avatar blue">
                            <i class="icon-tag icon-2x"></i>
                        </div>
                        <div class="news-time">
                            <span>28</span> Nov                        </div>
                        <div class="news-content">
                            <div class="news-title">
                                today is                             </div>
                            <div class="news-text">
                                 desrygtfyg yuiuoi;                            </div>
                        </div>
                    </div>
                                        <div class="box-section news with-icons">
                        <div class="avatar blue">
                            <i class="icon-tag icon-2x"></i>
                        </div>
                        <div class="news-time">
                            <span>23</span> Nov                        </div>
                        <div class="news-content">
                            <div class="news-title">
                                pradeep                            </div>
                            <div class="news-text">
                                 chekup                            </div>
                        </div>
                    </div>
                                        <div class="box-section news with-icons">
                        <div class="avatar blue">
                            <i class="icon-tag icon-2x"></i>
                        </div>
                        <div class="news-time">
                            <span>30</span> Oct                        </div>
                        <div class="news-content">
                            <div class="news-title">
                                ad                            </div>
                            <div class="news-text">
                                 ad                            </div>
                        </div>
                    </div>
                                        <div class="box-section news with-icons">
                        <div class="avatar blue">
                            <i class="icon-tag icon-2x"></i>
                        </div>
                        <div class="news-time">
                            <span>27</span> Oct                        </div>
                        <div class="news-content">
                            <div class="news-title">
                                Hello                            </div>
                            <div class="news-text">
                                 Mohsinkhan                             </div>
                        </div>
                    </div>
                                        <div class="box-section news with-icons">
                        <div class="avatar blue">
                            <i class="icon-tag icon-2x"></i>
                        </div>
                        <div class="news-time">
                            <span>20</span> Aug                        </div>
                        <div class="news-content">
                            <div class="news-title">
                                tamrat                            </div>
                            <div class="news-text">
                                 Biyam                            </div>
                        </div>
                    </div>
                                        <div class="box-section news with-icons">
                        <div class="avatar blue">
                            <i class="icon-tag icon-2x"></i>
                        </div>
                        <div class="news-time">
                            <span>13</span> Jun                        </div>
                        <div class="news-content">
                            <div class="news-title">
                                Urgent                             </div>
                            <div class="news-text">
                                 this is a urgent notice                            </div>
                        </div>
                    </div>
                                        <div class="box-section news with-icons">
                        <div class="avatar blue">
                            <i class="icon-tag icon-2x"></i>
                        </div>
                        <div class="news-time">
                            <span>01</span> Jan                        </div>
                        <div class="news-content">
                            <div class="news-title">
                                test                            </div>
                            <div class="news-text">
                                 testing                            </div>
                        </div>
                    </div>
                                        <div class="box-section news with-icons">
                        <div class="avatar blue">
                            <i class="icon-tag icon-2x"></i>
                        </div>
                        <div class="news-time">
                            <span>01</span> Jan                        </div>
                        <div class="news-content">
                            <div class="news-title">
                                test                            </div>
                            <div class="news-text">
                                 testing                            </div>
                        </div>
                    </div>
                                        <div class="box-section news with-icons">
                        <div class="avatar blue">
                            <i class="icon-tag icon-2x"></i>
                        </div>
                        <div class="news-time">
                            <span>01</span> Jan                        </div>
                        <div class="news-content">
                            <div class="news-title">
                                imran                            </div>
                            <div class="news-text">
                                 360                            </div>
                        </div>
                    </div>
                                    </div>
            </div>
        </div>
    	<!-----NOTICEBOARD LIST ENDS-->
    </div>
</div>

  
  
  <script>
      $(document).ready(function () {

          // page is now ready, initialize the calendar...

          $("#schedule_calendar").fullCalendar({
              header: {
                  left: "prev,next",
                  center: "title",
                  right: "month,agendaWeek,agendaDay"
              },
              editable: 0,
              droppable: 0,
              events: [
										{
										    title: "tamrat",
										    start: new Date(2014, 7, 20),
										    end: new Date(2014, 7, 20)
										},
										{
										    title: "Urgent ",
										    start: new Date(2014, 5, 13),
										    end: new Date(2014, 5, 13)
										},
										{
										    title: "ad",
										    start: new Date(2014, 9, 30),
										    end: new Date(2014, 9, 30)
										},
										{
										    title: "Hello",
										    start: new Date(2014, 9, 27),
										    end: new Date(2014, 9, 27)
										},
										{
										    title: "today is ",
										    start: new Date(2014, 10, 28),
										    end: new Date(2014, 10, 28)
										},
										{
										    title: "pradeep",
										    start: new Date(2014, 10, 23),
										    end: new Date(2014, 10, 23)
										},
										{
										    title: "test",
										    start: new Date(1970, 0, 01),
										    end: new Date(1970, 0, 01)
										},
										{
										    title: "test",
										    start: new Date(1970, 0, 01),
										    end: new Date(1970, 0, 01)
										},
										{
										    title: "imran",
										    start: new Date(1970, 0, 01),
										    end: new Date(1970, 0, 01)
										},
										]
          })

      });
  </script>        </div>        
	    <div style="clear:both;color:#aaa; padding:20px;">
    	<hr><center>© 2013 <a target="_blank" href="http://www.websiteonlinesolution.com/">Hospital Management System - <br>Developed &amp; Design by <br>Website Online Solution</a></center>
    </div>    </div>
    

<div class="ex-tooltip"></div><div id="galleryOverlay" style="display: none;"><div id="gallerySlider"></div><a id="prevArrow"><i class="icon-angle-left icon-4x"></i></a><a id="nextArrow"><i class="icon-angle-right icon-4x"></i></a></div></body></html>