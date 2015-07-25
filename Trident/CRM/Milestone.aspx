<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Milestone.aspx.cs" Inherits="Trident.CRM.Milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .cls_performo-header div {
            padding: 5px 15px;
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
            height: 251px !important;
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
            float: left;
            width: 70%;
        }

        body {
            background: #f1f3fa !important;
        }

        #btn_dialog {
            float: right;
            margin-right: 7%;
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
            width: 74%;
        }

        .valid {
            border: 1px solid green !important;
        }

        .cls_cal_area label {
            font-weight: bold;
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

        #tbl_listmain tbody tr td:nth-child(odd), #tbl_listddress tbody tr td:nth-child(odd), #tbl_listDescription tbody tr td:nth-child(odd) {
            text-align: right;
        }
        #tbl_listmain tbody tr td:nth-child(1), #tbl_listmain tbody tr td:nth-child(3){
            width:200px;
        }
         #tbl_listmain tbody tr td:nth-child(2){
            width:332px;
        }
        .table-scrollable {
            border-top: 0 !important;
        }

        #spn_lead_type {
            font-size: 18px;
            font-weight: bold;
            float: left;
            width: 30%;
            padding: 10px 3px;
        }

        .portlet > .portlet-title > .caption {
            font-size: 16px !important;
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

    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-summernote/summernote.css" />
    <link href="../assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css" rel="stylesheet" />
    <link href="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="../JavaScript/jquery.timepicker.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="full_bdy">
            <span id="spn_lead_type">Creating New Project Milestone</span>
            <div id="dv_sve" class="cls_bdy_tp">
                <table>
                    <tr>
                        <td>
                            <ul id="ul_sve">
                                <li>
                                    <input id="btn_save" class=" btn btn green btn-md" type="button" value="Save" onclick="obj_.save();" /></li>
                                <li>
                                    <input id="btn_cancel" class=" btn btn green btn-md" type="button" value="Cancel" onclick="obj_.cancel_();" /></li>

                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span>Project Milestone Details</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_listmain">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label>Project Milestone Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_MilestoneName" name="V_txt_MilestoneName" />
                                            </td>
                                            <td>
                                                <label>Related to</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Relatedto" name="V_ddl_Relatedto">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Milestone Date</label>
                                            </td>
                                            <td>
                                                <%--<input type="text" class="form-control invalid" id="F_V_txt_StartDate" name="txt_StartDate" />--%>
                                                <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy" data-date-start-date="+0d">
                                                    <input type="text" class="form-control" id="F_V_txt_Milestonedate" name="txt_Milestonedate"/>
                                                    <span class="input-group-btn">
                                                        <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                             <%--   <div class="input-icon">
                                                    <i class="fa fa-clock-o"></i>
                                                    <input type="text" id="txt_starttime" class="form-control time" style="width: 120px;" />
                                                </div>--%>
                                                <%--  <div class="input-group date form_datetime" data-date="2012-12-21T15:25:00Z" style="padding: 0;width:250px">
                                                    <input type="text" size="16" class="form-control invalid" id="F_V_txt_StartDate" name="txt_StartDate"  />
                                                    <span class="input-group-btn">
                                                        <button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
                                                        <button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>--%>
                                            </td>
                                           <td>
                                                <label>Assigned To</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_AssignedTo" name="V_ddl_AssignedTo">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Type</label>
                                            </td>
                                            <td>
                                                <select class="form-control invalid" id="F_V_ddl_Type" name="ddl_Type">
                                                </select>
                                            </td>
                                            <td>
                                               
                                            </td>
                                            <td>
                                               
                                            </td>
                                        </tr>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        
                <div class="col-xs-12">
                    <div class="portlet box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <span>Description Details</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_listDescription">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label>Description</label>
                                            </td>
                                            <td>
                                                <textarea cols="100" rows="4" class="form-control invalid" id="txtarea_Description"></textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
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

    <script type="text/javascript" src="../assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script src="../assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>

    <script src="../assets/admin/pages/scripts/components-editors.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="../JavaScript/jquery.timepicker.js"></script>
    <script type="text/javascript">
        var drpdowns = [];
        function get_CompanyID() {
            <% if (Session["CompanyID"] != null)
               { %>
            return '<%= Session["CompanyID"] %>';
            
            <% } %>
            return undefined;
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
        function get_MilesstoneID() {

            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }
        function get_ID() {

            <% if (Request.QueryString["projectid"] != null)
               { %>
            return '<%= Request.QueryString["projectid"] %>';
            
            <% } %>
            return 0;
        }



        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
        var obj_ = {
            arg: function (imode, id) {
                Args = {
                    MilestoneName: $('#F_V_txt_MilestoneName').val(),
                    ProjectID: $('#F_V_ddl_Relatedto').val(),
                    MilestoneDate: $('#F_V_txt_Milestonedate').val(),
                    AssignedTo: $('#F_V_ddl_AssignedTo').val(),
                    TypeID: $('#F_V_ddl_Type').val(),
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    Description: $('#txtarea_Description').val(),
                    MilestoneID: id,
                    imode: imode
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            save_: function (imode) {
                $.ajax({
                    url: "../HttpHandler/Milestone.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                                alert(data[0].res)
                            }
                        }
                    }
                });
            },
            Load_drpdowns: function (imode) {
                $.ajax({
                    url: "../HttpHandler/Milestone.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                        //if (get_LeadID() != 0) {
                        //    obj_.fetch_details();
                        //}
                        drpdowns = data;
                        $('#F_V_ddl_Relatedto,#F_V_ddl_AssignedTo,#F_V_ddl_Type').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].JOBID != null) {
                                        $('#F_V_ddl_Relatedto').append($('<option></option>').val(data[i].JOBID).html(data[i].ProjectName));
                                    } else if (data[i].UserID != null) {
                                        $('#F_V_ddl_AssignedTo').append($('<option></option>').val(data[i].UserID).html(data[i].LoginID));
                                    }
                                    else if (data[i].TypeID != null) {
                                        $('#F_V_ddl_Type').append($('<option></option>').val(data[i].TypeID).html(data[i].TypeName));
                                    }                                   
                                }
                                var id = get_ID();
                                if (id != 0) {
                                    $('#F_V_ddl_AssignedTo option[value=' + id.split('-')[0] + ']').attr('selected', 'selected');                              
                                }
                            }
                        }
                    }
                });
            },
            
            //fetch_details: function () {
            //    $.ajax({
            //        url: "../HttpHandler/LeadsList.ashx",
            //        data: this.arg('fetch'),
            //        cache: false,
            //        success: function (data) {
            //            if (data != null) {
            //                if (data.length > 0) {
            //                    $('#F_V_txt_FirstName').val(data[0].FirstName).removeClass('invalid').addClass('valid');
            //                    //  $('#F_V_txt_FirstName').attr('disabled', 'disabled');
            //                    $('#F_V_txt_LastName').val(data[0].LastName);
            //                    $('#F_V_txt_PrimaryPhone').val(data[0].PrimaryPhone);
            //                    $('#F_V_txt_Company').val(data[0].Company);
            //                    $('#F_V_txt_MobilePhone').val(data[0].MobilePhone);
            //                    $('#F_V_txt_Designation').val(data[0].Description);
            //                    $('#F_V_txt_Fax').val(data[0].Fax);
            //                    $('#F_V_ddl_LeadSource option[value=' + data[0].LeadSource + ']').attr('selected', 'selected');
            //                    $('#F_V_txt_PrimaryEmail').val(data[0].PrimaryEmail).removeClass('invalid').addClass('valid');
            //                    // $('#F_V_txt_PrimaryEmail').attr('disabled', 'disabled');
            //                    $('#F_V_ddl_Industry option[value=' + data[0].IndustryID + ']').attr('selected', 'selected');
            //                    $('#F_V_txt_Website').val(data[0].Website);
            //                    $('#F_V_txt_AnnualRevenue').val(data[0].AnnualRevenue);
            //                    $('#F_V_ddl_LeadStatus option[value=' + data[0].LeadStatus + ']').attr('selected', 'selected');
            //                    $('#F_V_txt_noofemp').val(data[0].NumberOfEmployees);
            //                    $('#F_V_ddl_Rating option[value=' + data[0].Rating + ']').attr('selected', 'selected');
            //                    $('#F_V_txt_SecondaryEmail').val(data[0].SecondaryEmail);
            //                    $('#F_V_ddl_AssignedTo option[value=' + data[0].AssignedTo + ']').attr('selected', 'selected');
            //                    $('#F_V_ddl_AssignedTo').removeClass('invalid').addClass('valid');
            //                    $('#chk_emailoptout').prop('checked');
            //                    $('#txtarea_Street').val(data[0].Street);
            //                    $('#F_V_txt_PObox').val(data[0].POBox);
            //                    $('#F_V_txt_PostalCode').val(data[0].PostalCode);
            //                    $('#F_V_txt_City').val(data[0].City);
            //                    $('#F_V_txt_Country').val(data[0].Country);
            //                    $('#F_V_txt_State').val(data[0].State);
            //                    $('#txtarea_Description').val(data[0].Description);
            //                }
            //            }
            //        }
            //    });
            //},
            save: function () {
                var form_data = $("#" + "<%=form1.ClientID%>").serializeArray();
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
                    $('#basic').append(callalert('alert', 'Please fill red bordered items.', '1'));
                    $("#basic").css("display", "block");
                    $('#basic').modal('show');
                }
                else {
                    if (get_MilesstoneID() == 0) {
                        obj_.save_('insert');
                    } else {
                        obj_.save_('update');
                    }

                }
            },
            cancel_: function () {
                window.history.back();
            }
        }

        $(document).ready(function () {
            obj_.Load_drpdowns('dropdown');
  
            var today = new Date();
            $(".form_datetime").datetimepicker({
                isRTL: Metronic.isRTL(),
                format: "yyyy/mm/dd hh:ii",
                autoclose: true,
                todayBtn: true,
                // startDate: new Date(today.getFullYear(), today.getMonth() - 2, today.getDate()),
                // endDate: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 1),
                pickerPosition: (Metronic.isRTL() ? "bottom-right" : "bottom-left"),
                minuteStep: 3
            });
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "right",
                    autoclose: true,
                    format: 'yyyy/mm/dd'
                });
            }
            //$('#txt_starttime,#txt_endtime').timepicker();
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

            $(document).on('change', '#ddl_relatetype', function () {
                if ($(this).val() != 0) {
                    obj_.load_relateto();
                } else {
                    $('#ddl_relateto').empty();
                }
            });

            
        });
    </script>
</body>

</html>
