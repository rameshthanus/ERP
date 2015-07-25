<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Branch.aspx.cs" Inherits="Trident.Master.Branch1" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Branch</title>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <style type="text/css">
        .cls_bdy_tp table ul {
            list-style: outside none none;
            float: right;
            margin: 0px;
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
            padding: 5px 0;
        }

        .cls_bdy_btm h5 {
            margin: 0;
            padding: 10px 30px;
            border: 1px solid #CCC;
            background-image: linear-gradient(#F6F6F6, #ECECEE);
            font-weight: bold;
        }

        #tbl_design {
            width: 100%;
            border: 1px solid #CCC;
            border-top: none;
        }

            #tbl_design tr td {
                padding: 7px 5px;
            }

                #tbl_design tr td:first-child {
                    padding-left: 30px;width:18%;
                }

        .invalid {
            border: 1px solid red;
        }

        .valid {
            border: 1px solid green !important;
        }

        .cls_bdy_btm h5 {
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
        html,body{
            background-color:#F1F3FA;
        }
        @media screen and (max-width:500px){
              #tbl_design tr td:first-child {
                    padding-left: 15px;
                    width:30%;
                }
            .cls_bdy_btm h5 {
            padding: 5px 15px;
            }
        }
    </style>
    <%--<script src="../JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../JavaScript/comman_Validation.js" type="text/javascript"></script>--%>
     <script src="../JavaScript/jquery-1.9.1.min.js" type="text/javascript"></script>
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
            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }
        var req = 0, res = 0, flag = 0;
        var obj = {
            arg: function (scrn_name, imode, hmode) {
                Args = {
                    BranchID: get_BranchID(),
                    BranchCode: ($('#txt_code').val() == null ? '0' : $('#txt_code').val()),
                    BranchName: ($('#fv_txt_Branch').val() == null ? '' : $('#fv_txt_Branch').val()),
                    Address1: ($('#fv_txt_Address1').val() == null ? '' : $('#fv_txt_Address1').val()),
                    Address2: ($('#fv_txt_Address2').val() == null ? '' : $('#fv_txt_Address2').val()),
                    Address3: ($('#fv_txt_Address3').val() == null ? '' : $('#fv_txt_Address3').val()),
                    City: ($('#fv_txt_City').val() == null ? '' : $('#fv_txt_City').val()),
                    State: ($('#fv_txt_State').val() == null ? '' : $('#fv_txt_State').val()),
                    Country: ($('#F_V_ddl_Country').val() == null ? '' : $('#F_V_ddl_Country').val()),
                    PostalCode: ($('#fv_txt_PostalCode').val() == null ? '' : $('#fv_txt_PostalCode').val()),
                    PhoneNumber: ($('#fv_txt_PhoneNumber').val() == null ? '' : $('#fv_txt_PhoneNumber').val()),
                    EMail: ($('#fv_txt_Email').val() == null ? '' : $('#fv_txt_Email').val()),
                    ContactPerson: ($('#fv_txt_ContactPerson').val() == null ? '' : $('#fv_txt_ContactPerson').val()),
                    BranchStatus: $("input[name=rad_status]:checked").val(),
                    CreatedBy: get_UserID(),
                    CreatedOn: obj.cur_date(),
                    ModifiedBy: get_UserID(),
                    ModifiedOn: obj.cur_date(),
                    iMode: imode,
                    ScreenName: scrn_name,
                    CompanyID: get_CompanyID(),
                    handler_mode: hmode
                }
                return Args;
            },
            cur_date: function () {
                var date = new Date();
                return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            },
            get_drpdowns: function (scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/Branch_autocode.ashx",
                    data: this.arg(scname, imode, hmode),
                    cache: false,
                    async:false,
                    success: function (data) {                        
                        drpdowns = data;
                        $('#F_V_ddl_Country').empty();
                        if (data != null) {
                            if (data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].Country != null) {
                                        $('#F_V_ddl_Country').append($('<option></option>').val(data[i].CountryID).html(data[i].Country));
                                    } 

                                }                               

                            }
                        }
                    }
                });
            },
            autocode: function (hndler, scname, imode, hmode) {
                $.ajax({
                    url: "../HttpHandler/" + hndler + ".ashx",
                    data: this.arg(scname, imode, hmode),
                    cache: false,
                    success: function (data) {
                        res++;
                        if (data != null) {
                            if (data.length > 0) {
                                if (sessionStorage.getItem('form_action') == "get_autocode") {
                                    $.each(data[0], function (key, value) {
                                        $('#txt_code').val(value);
                                    });
                                    obj.clear();
                                    sessionStorage.setItem('form_action', 'Insert_start');
                                }
                                else {
                                    if (sessionStorage.getItem('form_action') == "new_autocode") {
                                        $.each(data[0], function (key, value) {
                                            $('#txt_code').val(value);
                                        });
                                        sessionStorage.setItem('form_action', 'Insert_start');
                                    } else {
                                        if (sessionStorage.getItem('form_action') == "fetch_Branch") {
                                            $('#txt_code').val(data[0].BranchCode);
                                            $('#fv_txt_Branch').val(data[0].BranchName).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_Address1').val(data[0].Address1).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_Address2').val(data[0].Address2).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_Address3').val(data[0].Address3).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_City').val(data[0].City).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_State').val(data[0].State).removeClass('invalid').addClass('valid');                                            
                                            $('#F_V_ddl_Country option[value=' + data[0].Country + ']').attr('selected', 'selected');
                                            $('#F_V_ddl_Country').removeClass('invalid').addClass('valid');
                                            $('#fv_txt_PostalCode').val(data[0].PostalCode).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_PhoneNumber').val(data[0].PhoneNumber).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_Email').val(data[0].Email).removeClass('invalid').addClass('valid');
                                            $('#fv_txt_ContactPerson').val(data[0].ContactPerson).removeClass('invalid').addClass('valid');
                                            $("input[name=rad_status][value=" + data[0].BranchStatus + "]").prop('checked', true);
                                        } else {
                                            if (sessionStorage.getItem('form_action') == "update_Branch") {
                                                if (data[0].Branch_count != undefined) {
                                                    //alert('Item already exist');

                                                    $('#basic1').append(callalert('alert', 'Item already exist', '1'));                                                    
                                                    $('#basic1').modal('show');
                                                } else {
                                                    //alert('updated successfully');

                                                    $('#basic1').append(callalert('alert', 'updated successfully', '1'));                                                    
                                                    $('#basic1').modal('show');
                                                    obj.clear();
                                                }
                                            }
                                            else {
                                                if (flag == 0) {
                                                    req = 1; res = 0, flag = -1;
                                                    if (data[0].color_count != undefined) {
                                                        //alert('Item already exist');

                                                        $('#basic1').append(callalert('alert', 'Item already exist', '1'));                                                      
                                                        $('#basic1').modal('show');
                                                    } else {
                                                        obj.autocode('Branch_autocode', 'Branch', 'Insert', 'update_autocode');
                                                    }
                                                }
                                                else {
                                                    if (flag == -1) {
                                                        // alert('saved successfully');

                                                        $('#basic1').append(callalert('alert', 'Saved Successfully', '1'));                                                     
                                                        $('#basic1').modal('show');
                                                        req++;
                                                        sessionStorage.setItem('form_action', 'get_autocode');
                                                        obj.autocode('Branch_autocode', 'Branch', 'AutoCode', 'get_autocode');
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                });
            },
            save: function () {
                var form_data = $("#" + "<%=frm_Branch.ClientID%>").serializeArray();
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
                    //alert('Please fill red bordered items.')

                    $('#basic1').append(callalert('alert', 'Please fill red bordered items.', '1'));                 
                    $('#basic1').modal('show');
                }
                else {
                    if (sessionStorage.getItem('form_action') == "Insert_start") {
                        req += 1, flag = 0;
                        obj.autocode('Branch_autocode', 'Branch', 'Insert', 'save_Branch');
                    }
                    else {
                        sessionStorage.setItem('form_action', 'update_Branch');
                        obj.autocode('Branch_autocode', 'Branch', 'Update', 'update_Branch');
                    }
                }
            },
            searchlist: function () {
                window.location.href = '../SearchList.aspx?pg=BRANCH';
            },
            clear: function () {
                $('#fv_txt_Branch').val('').removeClass('valid').addClass('invalid');
             //   $('#fv_txt_Branch').val('').removeClass('invalid').addClass('valid');
                $('#fv_txt_Address1').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_Address2').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_Address3').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_City').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_State').val('').removeClass('valid').addClass('invalid');
                $('#F_V_ddl_Country option[value=0]').attr('selected', 'selected');
                $('#F_V_ddl_Country').removeClass('valid').addClass('invalid');
                $('#fv_txt_PostalCode').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_PhoneNumber').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_Email').val('').removeClass('valid').addClass('invalid');
                $('#fv_txt_ContactPerson').val('').removeClass('valid').addClass('invalid');
                $("input[name=rad_status][value=A]").prop('checked', true);
                if (sessionStorage.getItem('form_action') != "get_autocode") {
                    sessionStorage.setItem('form_action', 'new_autocode');
                    obj.autocode('Branch_autocode', 'Branch', 'AutoCode', 'get_autocode');
                }
            }
        }
        $(document).ready(function () {
            req++;
            obj.get_drpdowns('Branch', 'ComboBind', 'get_dropdown');
            if (get_BranchID() == 0) {
                sessionStorage.setItem('form_action', 'get_autocode');
                obj.autocode('Branch_autocode', 'Branch', 'AutoCode', 'get_autocode');
            } else {
                sessionStorage.setItem('form_action', 'fetch_Branch');
                obj.autocode('Branch_autocode', 'Branch', 'Fetch', 'fetch_Branch');
            }
            $(document).on('keyup', 'input', function () {
                if ($(this).val() == '') {
                    $(this).removeClass("valid").addClass("invalid");
                }
                else {
                    $(this).removeClass("invalid").addClass("valid");
                }
            });
            $(document).keydown(function (e) {
                executeCode(e)
            });
        });
        function executeCode(evt) {
            if (evt == null) {
                evt = window.event;
            }
            var theKey = parseInt(evt.keyCode, 10);
            switch (theKey) {
                case 118:  // F7
                    obj.save();
                    break;
                case 119:  // F8
                    obj.searchlist();
                    break;
                case 120:  // F9
                    window.location.href = '../HomeHeader.aspx';
                    break;
            }
            evt.returnValue = false;
            return false;
        }
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
    </script>
   
    <script type="text/javascript" src="../JavaScript/Master.js"></script>
</head>
<body onload="resizeIframe();">
    <form id="frm_Branch" runat="server">
         <div id="full_bdy">
        <div class="portlet box blue-hoki">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>Branch
            </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                    class="config"></a><a href="javascript:;" class="reload"></a>
            </div>
        </div>
        <div class="portlet-body form">
            <form action="#" class="form-horizontal">
            <div class="form-actions top">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <div id="Div1" class="cls_bdy_tp">
                            <table>
                                <tr>
                                    <td>
                                        <ul id="ul1">
                                            <li>
                                                <input id="btn_save" class="cls_disabled btn green" type="button" value="Save -(F7)"
                                                    onclick="obj.save();" /></li>
                                            <li class="cls_disabled">
                                                <input class="cls_disabled btn green" type="button" value="Search -(F8)" onclick="obj.searchlist();" />
                                            </li>
                                            <li class="cls_disabled">
                                                <input type="button" class="cls_disabled btn green" value="Clear -(Alt+Shift+C)"
                                                    onclick="obj.clear();" /></li>
                                            <li class="cls_disabled">
                                                <input type="button" class="cls_disabled btn green" value="Exit -(F9)" /></li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-body">
                <div class="form-group">
                <table style="width:100%">
                <tr>
                <td style="width:100%">
                <label class="col-md-3 control-label">
                        Code</label>
                    <div class="col-md-4">
                    <input type="text" id="txt_code" disabled="disabled" name="txt_code" class="invalid form-control" />
                       
                        
                    </div>
                    </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Branch<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_Branch" name="v_txt_Branch" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Address1<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_Address1" name="v_txt_Address1" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                    <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Address2
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_Address2" name="txt_Address2" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                    <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Address3
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_Address3" name="txt_Address3" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                     <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        City
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_City" name="txt_City" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                    <tr>
                <td style="height:15px">
                </td>
                </tr>
                     <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        State
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_State" name="txt_State" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Country
                    </label>    
                    <div class="col-md-4">                
                        <select class="invalid form-control " id="F_V_ddl_Country" name="ddl_Country">
                            </select>
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Postal Code<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_PostalCode" name="v_txt_PostalCode" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Phone Number<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_PhoneNumber" name="v_txt_PhoneNumber" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                    <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Email
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_Email" name="txt_Email" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                     <tr>
                <td style="width:100%">
                 <label class="col-md-3 control-label">
                        Contact Person<span class="required">
											* </span>
                    </label>    
                    <div class="col-md-4">                
                        <input type="text" id="fv_txt_ContactPerson" name="v_txt_ContactPerson" class="invalid form-control" />
                    </div>
                </td>
                </tr>
                <tr>
                <td style="height:15px">
                </td>
                </tr>
                <tr>
                <td style="width:100%">
                <label class="col-md-3 control-label">
                        Status
                    </label>    
                    <div class="col-md-4">                
                        <input type="radio" name="rad_status" value="A" checked="checked" class="radio-list" />
                        Active
                        <input type="radio" name="rad_status" value="I" class="radio-list" />
                        Inactive
                    </div>
                </td>
                </tr>
                </table>
                    
                   
                </div>
            </div>
        </form>
    </div>
    </div>
        <div class="modal fade in" id="basic1" tabindex="-1" role="basic" aria-hidden="false" >          
        </div>
       <!-- BEGIN PAGE CONTENT-->
				
				<!-- END PAGE CONTENT-->
               
               
        </div>
    </form>
      
  
    
</body>
    
</html>





