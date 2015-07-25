<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calender.aspx.cs" Inherits="Trident.Master.Calender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        html{
              background-color: #f1f3fa;
        } .cls_calender_pop div {
              margin: 7px 10px;
        }
           .cls_bdy_tp table ul {
            list-style: outside none none;
            float: right;
            margin: 0px;
        }
            .invalid {
            border: 1px solid red;
        }

        .valid {
            border: 1px solid green !important;
        }
        .cls_bdy_tp table {
            width: 100%;
        }
        #tbl_design{background-color:white;}
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
            padding: 5px 0; background-color: #f1f3fa;
        }  .ui-timepicker-wrapper{
              width: 100px;
  /* padding: 5px 9px; */
  font-size: 15px;
  text-align: center;

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
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/select2/select2.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/jquery-multi-select/css/multi-select.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-summernote/summernote.css" />
    <link href="../assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css" rel="stylesheet" />
    <link href="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" rel="stylesheet" />   
    <link href="../assets/global/css/components.css" rel="stylesheet" />


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


     <link href="../JavaScript/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="../JavaScript/bootstrap-datepicker.js"></script>
    <link href="../JavaScript/jquery.timepicker.css" rel="stylesheet" />
    <script src="../JavaScript/jquery.timepicker.js"></script>
    


    <script type="text/javascript">

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
        function get_Id() {
            <% if (Request.QueryString["id"] != null)
               { %>
            return '<%= Request.QueryString["id"] %>';
            
            <% } %>
            return 0;
        }
       
       
        $(document).ready(function () {
            window.scrollTo(0, 0);
            $('#fv_calender_starttime').timepicker();
            $('#fv_calender_endtime').timepicker();
          

            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy.mm.dd'
                });
            }
            $.ajax({
                url: "../HttpHandler/Dashboard.ashx",
                data: { imode: 'shared_edit', sptype: 'fetch',CalenderID:get_Id(), companyId: get_CompanyID(), branchId: get_BranchID() },
                cache: false,
                success: function (data) {
                    if (data != null) {
                        if (data.length > 0) {
                            $('#fv_calender_title').val(data[0].Title).removeClass("invalid").addClass("valid");
                            $('#txt_Desc').val(data[0].Descriptions);
                            $("input[name='optionsRadios'][value="+data[0].Type+"]").click();
                            
                            $('#fv_calender_startdate').val(data[0].StartDate).removeClass("invalid").addClass("valid");
                            $('#fv_calender_enddate').val(data[0].EndDate).removeClass("invalid").addClass("valid");

                            $('#fv_calender_starttime').val(data[0].StartTime).removeClass("invalid").addClass("valid");
                            $('#fv_calender_endtime').val(data[0].EndTime).removeClass("invalid").addClass("valid");
                        } 
                    }
                }
            });
            $(document).on('keyup', 'input,textarea', function () {
                if ($(this).val() == '') {
                    $(this).removeClass("valid").addClass("invalid");
                }
                else {
                    $(this).removeClass("invalid").addClass("valid");
                }
            });
            $(document).on('change', 'input,textarea', function () {
                if ($(this).val() == '') {
                    $(this).removeClass("valid").addClass("invalid");
                }
                else {
                    $(this).removeClass("invalid").addClass("valid");
                }
            });
        });
        var obj = {
            arg: function () {
                Args = {
                    imode: 'update',
                    sptype: '',
                    title: $('#fv_calender_title').val(),
                    type: $("input[name=optionsRadios]:checked").val(),
                    start: $('#fv_calender_startdate').val(),
                    end: $('#fv_calender_enddate').val(),
                    starttime: $('#fv_calender_starttime').val(),
                    endtime: $('#fv_calender_endtime').val(),
                    companyId: get_CompanyID(),
                    branchId: get_BranchID(),
                    CalenderID: get_Id(),
                    Desc: $('#txt_Desc').val()
                }
                return Args;
            },
           save: function () {
                var form_data = $("#" + "<%=form1.ClientID%>").serializeArray();
                var error_free = true;
                for (var input in form_data) {
                    if (form_data[input]['name'].indexOf('v_') == 0) {
                        var element = $("#f" + form_data[input]['name']);
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
                    $.ajax({
                        url: "../HttpHandler/Dashboard.ashx",
                        data: this.arg(),
                        cache: false,
                        success: function (data) {
                            window.history.back();
                        }
                    });
                }
            },            
            clear: function () {
                $('#fv_calender_title,#fv_calender_startdate,#fv_calender_enddate,#fv_calender_starttime,#fv_calender_endtime,#txt_Desc').val('').removeClass('valid').addClass('invalid');                                                                                                                  
            },
            back: function () {
                window.history.back();
            },
            delete_: function () {                
                $.ajax({
                    url: "../HttpHandler/Dashboard.ashx",
                    data: { imode: 'delete', sptype: 'insert', companyId: get_CompanyID(), branchId: get_BranchID(), CalenderID: get_Id() },
                    cache: false,
                    success: function (data) {
                        window.history.back();
                    }
                });
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server"><div id="dv_sve" class="cls_bdy_tp">
                <table>
                    <tr>
                        <td>
                            <ul id="ul_sve">
                                <li>
                                    <input id="btn_save" class=" btn btn green btn-md" type="button" value="Save -(F7)" onclick="obj.save();" /></li>
                               
                                <li>
                                    <input type="button" class=" btn btn green btn-md" value="Delete" onclick="obj.delete_();" /></li>
                                <li>
                                    <input id="btn_back" type="button" class=" btn btn green btn-md" value="Back"  onclick="obj.back();"/></li>
                            </ul>
                        </td>
                    </tr>
                </table>

            </div>
        <div class="portlet box blue-hoki">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>Calender
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                        class="config"></a><a href="javascript:;" class="reload"></a>
                </div>
            </div>
            <div class="portlet-body form" style="height: 418px">
                <div class="form-actions top">
                    <div class="row cls_calender_pop">                       
                        <div class="col-xs-12 cls_title_new">
                            <span style="float: left; width: 100px">Title</span>
                            <span style="margin: 0 20px; float: left;">
                                <input type="text" class="form-control invalid" id="fv_calender_title" name="v_calender_title" style="width: 280px" /></span>
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
                                <input type="text" class="form-control date-picker invalid" id="fv_calender_startdate" name="v_calender_startdate" style="width: 212px;" /></span>
                        </div>
                        <div class="col-xs-12">
                            <span style="float: left; width: 95px">End Date</span>
                            <span style="margin: 0 25px; float: left;">
                                <input type="text" class="form-control date-picker invalid" id="fv_calender_enddate" name="v_calender_enddate" style="width: 212px;" /></span>
                        </div>
                        <div class=" col-xs-12 form-group cls_calender_starttime">
                            <span style="float: left; width: 102px">Start Time</span>
                            <span style="margin: 0px 18px; float: left;">
                                <span class="input-icon">
                                    <i class="fa fa-clock-o"></i>
                                    <input type="text" id="fv_calender_starttime" name="v_calender_starttime" class="form-control time invalid" style="width: 212px;" />
                                </span>
                            </span>
                        </div>
                        <div class=" col-xs-12 form-group cls_calender_endtime">
                            <span style="float: left; width: 96px">End Time</span>
                            <span style="margin: 0px 24px; float: left;">
                                <span class="input-icon">
                                    <i class="fa fa-clock-o"></i>
                                    <input type="text" id="fv_calender_endtime" name="v_calender_endtime" class="form-control time invalid" style="width: 212px;" />
                                </span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
