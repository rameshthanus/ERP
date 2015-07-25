<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" Inherits="Trident.Master.Notification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Css/common.css" rel="stylesheet" />
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/DateTimePicker/TimePickerCSS.min.css" rel="stylesheet" />
    <script src="../JavaScript/jquery-1.9.1.min.js"></script>
    <script src="../JavaScript/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="../Css/DateTimePicker/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript">
        var tbl_usr_grp_chked = 0, tbl_users_length = 0;
        function get_DesignID() {
            <% if (Request.QueryString["ID"] != null)
               { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }
        var pageUrl = '<%=ResolveUrl("/Master/Notification.aspx")%>', temp_Data = [];
        var obj = {
            fetdata: function (imode) {
                var args = {};
                args.imode = imode;
                $.ajax({
                    type: 'POST',
                    data: JSON.stringify(args),
                    url: pageUrl + '/Load_users',
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data != null) {
                            temp_Data = data;
                            if (data.d.length > 0) {
                                for (var i = 0; i < data.d.length; i++) {
                                    if (data.d[i].UserGroupID != 0) {
                                        $('#tbl_usergrp').append('<tr><td><input type="checkbox" id="chk' + i + '" class="cls_chk" value=' + data.d[i].UserGroupID + ' /></td><td>' + data.d[i].UserGroup + '</td></tr>');
                                    }
                                    else {
                                        break;
                                    }
                                }
                                if (get_DesignID() != 0) {
                                    obj.fetch_detail('fetch', get_DesignID());
                                }
                            }

                        }
                    }
                });
            },
            save: function () {
                var form_data = $("#" + "<%=frm_Notification.ClientID%>").serializeArray();
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
                    alert('Please fill red bordered items.')
                }
                else {
                    if (get_DesignID() != 0) {
                        sessionStorage.setItem('form_action', 'Update');
                        obj.final_save('Update');
                    } else {
                        sessionStorage.setItem('form_action', 'Insert');
                        obj.final_save('Insert');
                    }
                }
            },
            searchlist: function () {
                window.location.href = '../SearchList.aspx?pg=NOTIFICATION';
            },
            clear: function () {
                $('#fv_txt_date,#fv_txt_shrtdesc,#fv_txt_desc').val('').removeClass('valid').addClass('invalid');
                $('.cls_chk').prop('checked', false);
                for (var i = 0; i < $('#tbl_usergrp tbody tr').length; i++) {
                    $('#tbl_users tbody tr[id=' + $('#chk' + i).val() + ']').remove();
                }
            },
            final_save: function (imode, frm_action) {
                var args = {}, userid = '', usergrpid = '';
                args.imode = imode;
                tbl_usr_grp_chked = 0;
                var tbl_usr_grp = $('#tbl_usergrp tbody tr').length;
                for (var i = 0; i < tbl_usr_grp; i++) {
                    if ($('#chk' + i).is(':checked')) {
                        tbl_usr_grp_chked++;
                    }
                }
                var tbl_usr = $('#tbl_users tbody tr').length;
                var flag = 0, user_grp_name = '';
                for (var i = 0; i < tbl_usr_grp;) {
                    if ($('#chk' + i).is(':checked')) {
                        userid += '0,' + $('#chk' + i).val();
                        usergrpid += $('#chk' + i).val();
                        user_grp_name = $('#chk' + i).parent().next().html();
                        flag = 0;
                        for (var j = 1; j <= tbl_users_length ; j++) {
                            if ($('#chk_users' + j).length != 0) {
                                if ($('#chk_users' + j).parent().parent()[0].id == $('#chk' + i).val()) {
                                    if ($('#chk_users' + j).is(':checked')) {
                                        userid += ',' + $('#chk_users' + j).val();
                                        flag = 1;
                                    }
                                }
                            }
                        }
                        i++;
                        if (i < tbl_usr_grp_chked) {
                            userid += ',';
                            usergrpid += ',';
                        }
                        if (flag == 0) {
                            break;
                        }
                    } else {
                        i++;
                    }
                }
                if (flag == 0) {
                    alert('Please check atleat one user for ' + user_grp_name);
                }
                else {
                    args.userid = userid;
                    args.type = $("input[name=rad_config]:checked").val();
                    args.date = $("#fv_txt_date").val();
                    args.shrtdesc = $("#fv_txt_shrtdesc").val();
                    args.desc = $("#fv_txt_desc").val();
                    args.noticationid = get_DesignID();
                    args.usergrpid = usergrpid;
                    $.ajax({
                        type: 'POST',
                        data: JSON.stringify(args),
                        url: pageUrl + '/Save_Notifcaion',
                        cache: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data != null) {
                                if (data.d.length > 0) {
                                    alert(data.d[0].res);
                                }
                            }
                        }
                    });
                }

            },
            fetch_detail: function (imode, notificationID) {
                var args = {};
                args.imode = imode;
                args.NotificationID = notificationID;
                $.ajax({
                    type: 'POST',
                    data: JSON.stringify(args),
                    url: pageUrl + '/Fetch_Details',
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data != null) {
                            if (data.d.length > 0) {
                                $("input[name=rad_config][value=" + data.d[0].Type + "]").prop('checked', true);
                                $("#fv_txt_date").val(data.d[0].Date).addClass('valid').removeClass('invalid');
                                $("#fv_txt_shrtdesc").val(data.d[0].ShortDescription).addClass('valid').removeClass('invalid');
                                $("#fv_txt_desc").val(data.d[0].Description).addClass('valid').removeClass('invalid');

                                var user_grp_count = data.d[0].UserGroupID.split(',');
                                for (var i = 0; i < user_grp_count.length; i++) {
                                    $(".cls_chk[value=" + user_grp_count[i] + "]").prop('checked', true);

                                    $('#tbl_users tbody').append('<tr id=' + user_grp_count[i] + '><td colspan="2" class="cls_usergrp_users">' + $('#chk' + (user_grp_count[i]-1)).parent().next().html() + '</td></tr>');
                                    tbl_users_length++;

                                    for (var j = 1; j < temp_Data.d.length; j++) {
                                        if (temp_Data.d[j].GroupID == user_grp_count[i]) {
                                            $('#tbl_users tbody').append('<tr id=' + user_grp_count[i] + '><td><input type="checkbox" id="chk_users' + j + '" class="cls_users_chk" value=' + temp_Data.d[j].UserID + ' /></td><td>' + temp_Data.d[j].LoginID + '</td></tr>');
                                            tbl_users_length++;
                                        }
                                    }
                                }

                                for (var i = 1; i < data.d.length; i++) {
                                    $(".cls_users_chk[value=" + data.d[i].UserID + "]").prop('checked', true);
                                }
                            }
                        }
                    }
                });
            }
        }
        $(document).ready(function () {
            obj.fetdata('FetchUsers');
            $("#fv_txt_date").datetimepicker({
                showSecond: true,
                timeFormat: 'hh:mm:ss',
                dateFormat: 'yy-mm-dd',
                onSelect: function () {
                    $('#fv_txt_date').removeClass('invalid').addClass('valid');
                }
            });
            $(document).on('click', '.cls_chk', function () {
                var chk_val = $(this).val();
                if ($(this).is(':checked')) {
                    $('#tbl_users tbody').append('<tr id=' + chk_val + '><td colspan="2" class="cls_usergrp_users">' + $(this).parent().next().html() + '</td></tr>');
                    tbl_users_length++;
                    for (var i = 0; i < temp_Data.d.length; i++) {
                        if (temp_Data.d[i].GroupID == chk_val) {
                            $('#tbl_users tbody').append('<tr id=' + chk_val + '><td><input type="checkbox" id="chk_users' + i + '" class="cls_users_chk" value=' + temp_Data.d[i].UserID + ' /></td><td>' + temp_Data.d[i].LoginID + '</td></tr>');
                            tbl_users_length++;
                        }
                    }
                    $('tr[id=' + chk_val + '] .cls_users_chk').prop('checked', true);
                } else {
                    $('#tbl_users tbody tr[id=' + chk_val + ']').remove();
                }
            });
            $(document).on('click', '#chk_all', function () {
                if ($(this).is(':checked')) {
                    $('.cls_users_chk').prop('checked', true);
                } else {
                    $('.cls_users_chk').prop('checked', false);
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
        });

    </script>
</head>
<body>
    <form id="frm_Notification" runat="server">
        <div id="dv_bdy" class="cls_bdy">
            <div id="dv_sve" class="cls_bdy_tp">
                <table>
                    <tr>
                        <td>
                            <ul id="ul_sve">
                                <li>
                                    <input id="btn_save" class="cls_disabled btn btn-info btn-xs" type="button" value="Save -(F7)" onclick="obj.save();" /></li>
                                <li class="cls_disabled">
                                    <input class="cls_disabled btn btn-info btn-xs" type="button" value="Search -(F8)" onclick="obj.searchlist();" />
                                </li>
                                <li class="cls_disabled">
                                    <input type="button" class="cls_disabled btn btn-info btn-xs" value="Clear -(Alt+Shift+C)" onclick="obj.clear();" /></li>
                                <li class="cls_disabled">
                                    <input type="button" class="cls_disabled btn btn-info btn-xs" value="Exit -(F9)" /></li>
                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="cls_bdy_btm">
                <h5>Configuration</h5>
                <table id="tbl_configuration" class="cls_tbl_common">
                    <tr>
                        <td>Type </td>
                        <td>
                            <input type="radio" name="rad_config" value="N" checked="checked" />
                            Notification 
                            <input type="radio" name="rad_config" value="M" style="margin-left: 10px" />
                            Message
                               <input type="radio" name="rad_config" value="C" style="margin-left: 10px" />
                            Calendar
                        </td>
                    </tr>
                    <tr>
                        <td>Date </td>
                        <td>
                            <input id="fv_txt_date" name="v_txt_date" class="invalid cls_disabled" type="text" /></td>
                    </tr>
                    <tr>
                        <td>Short Description </td>
                        <td>
                            <input type="text" id="fv_txt_shrtdesc" name="v_txt_shrtdesc" class="invalid cls_disabled" /></td>
                    </tr>
                    <tr>
                        <td>Description </td>
                        <td>
                            <textarea id="fv_txt_desc" name="v_txt_desc" rows="3" cols="30" class="invalid cls_disabled"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>User Group</td>
                        <td>
                            <div id="dv_usergrp">
                                <table id="tbl_usergrp">
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Users</td>
                        <td>
                            <div id="dv_users">
                                <table id="tbl_users">
                                    <thead>
                                        <tr>
                                            <td>
                                                <input type="checkbox" id="chk_all" class="cls_users_chk" /></td>
                                            <td>Users</td>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
