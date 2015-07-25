<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConvertLead.aspx.cs" Inherits="Trident.CRM.ConvertLead" %>

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

        #tbl_listmain tbody tr td:nth-child(odd), #tbl_listddress tbody tr td:nth-child(odd), #tbl_listDescription tbody tr td:nth-child(odd), #tbl_listprofilepic tbody tr td:nth-child(odd), #tbl_listPortalDetails tbody tr td:nth-child(odd) {
            text-align: right;
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
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />

</head>
<body onload="resizeIframe()">
    <form id="form1" runat="server">
        <div id="full_bdy">
            <span id="spn_lead_type">Convert Lead</span>
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
                               <input type="checkbox" id="txt_Organization" name="txt_Organization"/> <span>Create Organization</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_Organization">
                                    <tbody>
                                        <tr>
                                            <td style="width:200px">
                                                <label>Organization Name</label>
                                            </td>
                                            <td style="width:300px">
                                                <input type="text" style="width:100%" class="form-control invalid" id="F_V_txt_OrganizationName" name="V_txt_OrganizationName" />
                                            </td>
                                            <td style="width:150px">
                                                <label>Industry</label>
                                            </td>
                                            <td>
                                                 <select class="form-control invalid" id="F_V_ddl_Industry" name="V_ddl_Industry">
                                                </select>
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
                                <input type="checkbox" id="txt_Contact" name="txt_Contact"/>  <span>Create Contact</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_Contact">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label>Last Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_LastName" name="V_txt_LastName" />
                                            </td>
                                             <td>
                                                <label>First Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_FirstName" name="V_txt_FirstName" />
                                            </td>
                                            </tr>
                                        <tr>
                                             <td>
                                                <label>Primary Email</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_PrimaryEmail" name="V_txt_PrimaryEmail" />
                                            </td>
                                            <td colspan="2"></td>
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
                                  <input type="checkbox" id="txt_Opportunity" name="txt_Opportunity"/> <span>Create Opportunity</span>
                            </div>
                            <div class="tools">
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-hover" id="tbl_Opportunity">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label>Opportunity Name</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_OpportunityName" name="V_txt_OpportunityName" />
                                            </td>
                                             <td>
                                                <label>Expected Close Date</label>
                                            </td>
                                            <td>
                                                <div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy" >
                                                    <input type="text" class="form-control" id="F_V_txt_ExpectedCloseDate" name="V_txt_ExpectedCloseDate" />
                                                    <span class="input-group-btn">
                                                        <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </td>
                                            </tr>
                                        <tr>
                                             <td>
                                                <label>Sales Stage</label>
                                            </td>
                                            <td>
                                                 <select class="form-control invalid" id="F_V_ddl_SalesStage" name="V_ddl_SalesStage">
                                                </select>
                                            </td>
                                             <td>
                                                <label>Amount</label>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control invalid" id="F_V_txt_Amount" name="V_txt_Amount" />
                                            </td>
                                        </tr>    
                                         <tr>
                                             <td>
                                                <label>Assigned To</label>
                                            </td>
                                            <td>
                                                 <select class="form-control invalid" id="F_V_ddl_AssignedTo" name="V_ddl_AssignedTo">
                                                </select>
                                            </td>
                                             <td>
                                                <label>Transfer related record to</label>
                                            </td>
                                            <td>
                                                <input type="checkbox" name="txt_TRRT" value="O" /> Organisation
                                                <input type="checkbox" name="txt_TRRT" value="C"/> Contract
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
        <asp:HiddenField ID="hdnUploadFilePath" runat="server" ClientIDMode="Static" />
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
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

    <link href="../Css/uploadify.css" rel="stylesheet" />
    <script src="../JavaScript/jquery.uploadify.js"></script>


    <script type="text/javascript">
        var drpdowns = [], att1 = [];
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
        function get_LeadID() {

            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }


        
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
        var obj_ = {
            arg: function (imode) {
                Args = {
                    OrganizationStatus: ($('#txt_Organization').prop('checked') == true ? 'T' : 'F'),
                    OrganizationName: $('#F_V_txt_OrganizationName').val(),
                    IndustryID: $('#F_V_ddl_Industry').val(),
                    ContractStatus: ($('#txt_Contact').prop('checked') == true ? 'T' : 'F'),
                    LastName: $('#F_V_txt_LastName').val(),
                    FirstName: $('#F_V_txt_FirstName').val(),
                    PrimaryEmail: $('#F_V_txt_PrimaryEmail').val(),
                    OpportunityStatus: ($('#txt_Opportunity').prop('checked') == true ? 'T' : 'F'),
                    OpportunityName: $('#F_V_txt_OpportunityName').val(),
                    ExpectedCloseDate: $('#F_V_txt_ExpectedCloseDate').val(),
                    SalesStageID: $('#F_V_ddl_SalesStage').val(),
                    Amount: $('#F_V_txt_Amount').val(),
                    AssignedTo: $('#F_V_ddl_AssignedTo').val(),
                    TRRT: $("input[name=txt_TRRT]:checked").val(),
                    CompanyID: get_CompanyID(),
                    BranchID: get_BranchID(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj_.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj_.cur_date(),
                    imode: imode,
                    ScreenName: '',
                    LeadID: get_LeadID()
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            save_: function (imode) {
                $.ajax({
                    url: "../HttpHandler/ConvertLead.ashx",
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
                    url: "../HttpHandler/ConvertLead.ashx",
                    data: this.arg(imode),
                    cache: false,
                    success: function (data) {
                       // alert(get_LeadID())
                        if (get_LeadID() != 0) {
                            obj_.fetch_details();
                        }
                        drpdowns = data;
                        $('#F_V_ddl_Industry,#F_V_ddl_SalesStage,#F_V_ddl_AssignedTo').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].IndustryID != null) {
                                        $('#F_V_ddl_Industry').append($('<option></option>').val(data[i].IndustryID).html(data[i].IndustryName));
                                    }
                                    else if (data[i].SalesStageID != null) {
                                        $('#F_V_ddl_SalesStage').append($('<option></option>').val(data[i].SalesStageID).html(data[i].SalesStageName));
                                    }
                                    else if (data[i].UserID != null) {
                                        $('#F_V_ddl_AssignedTo').append($('<option></option>').val(data[i].UserID).html(data[i].LoginID));
                                    }
                                }
                            }
                        }
                    }
                });
            },
            fetch_details: function () {
                $.ajax({
                    url: "../HttpHandler/ConvertLead.ashx",
                    data: this.arg('fetch'),
                    cache: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.length > 0) {
                               
                                $('#F_V_ddl_Industry option[value=' + data[0].IndustryID + ']').attr('selected', 'selected');
                                $('#F_V_ddl_Industry').removeClass('invalid').addClass('valid');
                                $('#F_V_txt_LastName').val(data[0].LastName).removeClass('invalid').addClass('valid');
                                $('#F_V_txt_FirstName').val(data[0].FirstName).removeClass('invalid').addClass('valid');
                                $('#F_V_txt_PrimaryEmail').val(data[0].PrimaryEmail).removeClass('invalid').addClass('valid');
                            
                                $('#F_V_ddl_AssignedTo option[value=' + data[0].AssignedTo + ']').attr('selected', 'selected');
                                $('#F_V_ddl_AssignedTo').removeClass('invalid').addClass('valid');
                              
                            }
                        }
                    }
                });
            },
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
                    
                        obj_.save_('insert');
                   

                }
            },
            cancel_: function () {
                window.history.back();
            }
        }
        $(window).load(function () {
            $("#file_upload").fileUpload({
                'uploader': '../JavaScript/uploader.swf',
                'cancelImg': '../Images/cancel.png',
                'buttonText': 'Browse Files',
                'script': '../HttpHandler/attachment.ashx',
                'folder': 'uploads',
                'fileDesc': 'Image Files',
                'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
                'multi': false,
                'auto': true,
                onComplete: function (event, queueID, fileObj, response, data) {
                    att1 = [];
                    if (event.type == "rfuComplete") {
                        var s = response.split('/');
                        var hdnid = 'new';
                        var path = $('#<%=hdnUploadFilePath.ClientID%>').val();
                        path = path.replace(/\\/g, "\\");
                        var file = path + '\\' + s[1];
                        file = file.replace(/\\\\/g, "\\");
                        att1.push(file);
                        var r = "<div id=" + s[1].split('.')[0] + " style='width:450px;padding: 10px 5px;height: 30px;'><div style='width:420px;float: left;'><a style='text-decoration: none' class='dellink' href='../HttpHandler/Upload.ashx?filepath=" + path + "&file=" + s[1] + "' >" + s[1] + "</a></div><div style='width:20px;float:left'><a href='#' class='dellink' onclick='deleterow(\"" + s[1] + "\")'><i class='fa fa-times'></i></a></div></div>";
                        $("#upload1").append(r);
                    }
                },
                onCancel: function (file) {
                    alert('The file ' + file.name + ' was cancelled.');
                },
                'onUploadSuccess': function (file, data, response) {
                    alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
                }
            });
        });
        $(document).ready(function () {
            obj_.Load_drpdowns('dropdown');
          //  att1.push('noimage');
            // var today = new Date();
            if (jQuery().datetimepicker) {
                // alert()
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "right",
                    autoclose: true,
                    format: 'yyyy/mm/dd',
                    startDate: -Infinity
                });
            }

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
        });

        function DownloadFile(file) {
            e.preventDefault();
            window.location.href = file;
        }
        function deleterow(divrow) {
            var ind = att1.indexOf(divrow);
            att1.splice(ind, 1);
            var str = divrow.split(",");
            var file = str[0];
            var path = $('#hdnUploadFilePath').val();
            if (confirm('Are you sure to delete?')) {
                $.ajax({
                    url: "../HttpHandler/attachment.ashx?path=" + path + "&file=" + file,
                    type: "GET",
                    cache: false,
                    async: true,
                    success: function (html) {
                        $('#' + divrow.split('.')[0]).remove();
                    }
                });
            }
            return false;
        }
    </script>
</body>

</html>
