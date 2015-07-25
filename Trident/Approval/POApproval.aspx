<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="POApproval.aspx.cs" Inherits="Trident.Approval.POApproval1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Efrontier  | Data Tables - Advanced Datatables</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <style type="text/css">
        body {
            background: #f1f3fa !important;
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
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<body onload="resizeIframe();">
    <form id="form1" runat="server">
        <div id="full_bdy">
            <div class="portlet box blue-madison">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-globe"></i>PO Approval
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="reload"></a>
                        <a href="javascript:;" class="remove"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">

                        <div class="col-xs-3">
                            <label class="control-label">From Date</label>
                        </div>
                        <div class="col-xs-3">
                            <input type="text" value="" class="form-control invalid form-control-inline input-medium date-picker" size="16" placeholder="Date" id="F_V_txt_frmdate" name="V_txt_frmdate" />
                        </div>

                        <div class="col-xs-3">
                            <label class="control-label">To Date</label>
                        </div>
                        <div class="col-xs-3">
                            <input type="text" value="" class="form-control invalid form-control-inline input-medium date-picker" size="16" placeholder="Date" id="F_V_txt_todate" name="V_txt_todate" />
                        </div>


                        <!--/span-->
                    </div>
                    <table>
                        <tr>
                            <td style="height: 10px"></td>
                        </tr>
                    </table>
                    <div class="row">
                        <div class="col-xs-1">
                            &nbsp;
                        </div>
                        <div class="col-xs-7">
                            <div class="radio-list">
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="P" checked>Approval Pending</label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="A">Approved</label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadios" id="optionsRadios3" value="C">Cancelled</label>
                             <%--   <label class="radio-inline">
                                    <input type="radio" name="optionsRadios" id="optionsRadios4" value="G">Closing Pending</label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadios" id="optionsRadios5" value="C">Closed</label>--%>
                            </div>
                        </div>
                        <div class="col-xs-1">
                            <a class="btn purple-plum" id="btn_dialog" data-toggle="modal" href="#responsive" style="float: right; margin-bottom: 20px;">Search </a>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="sample_3">
                        <thead>
                            <tr>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
            
        </div>
        
    </form>
    <div class="modal fade in" id="basic1" tabindex="-1" role="basic" aria-hidden="false">
    </div>
    <div id="modal_remarks" class="modal fade in"  role="basic" aria-hidden="false" tabindex="-1">                
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-4">

                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet box blue-hoki">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <span id="rpt_caption_pop" style="float: left">Remarks</span>
                                       
                                    </div>
                                    <div class="tools">
                                         <div>
                                              <button type="button" class="btn btn-default" id="add_remarks">Save</button>
                                            <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>                                           
                                        </div>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <textarea class="form-control cls_desc" style="width: 310px;height:150px" id="txt_remarks">
                                  </textarea>
                                </div>
                            </div>
                            <!-- END EXAMPLE TABLE PORTLET-->
                        </div>
                    </div>
                </div>
                

            </div>
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

    <script src='../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js' type="text/javascript"></script>
    <script src="../assets/admin/pages/scripts/ui-extended-modals.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="../assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
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
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
        var pageUrl = '<%=ResolveUrl("~/Approval/POApproval.aspx")%>', temp = [];
        var obj_tbl;
        var initTable3 = function (opt) {

            var table = $('#sample_3');

            /* Formatting function for row details */
            function fnFormatDetails(oTable, nTr, id) {
                var aData = oTable.fnGetData(nTr);
                var sf = id.split("-")[1];
                var imde = '';
                var op = getStatus();
                switch (op) {
                    case 'P':
                        imde = 'PurchaseBind'; break;
                    case 'A':
                        imde = 'PurchaseBind'; break;
                    case 'C':
                        imde = 'PurchaseBind'; break;
                    //case 'G':
                    //    imde = 'PurchaseClosingHeader'; break;
                    //case 'D':
                    //    imde = 'PurchaseClosedHeader'; break;
                }
                var sout = '';
                var args = {};
                args.imode = imde;
                args.frmdate = '';
                args.todate = '';
                args.id = sf;
                $.ajax({
                    type: 'POST',
                    data: JSON.stringify(args),
                    url: pageUrl + '/search_',
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data != null) {
                            if (data.d.length > 0) {
                                var strh = '', strb = '';
                                sout += '<table><thead><tr>';
                                $.each(data.d[0], function (key, value) {
                                    sout += '<td>' + key + '</td>';
                                });
                                sout += '</tr></thead><tbody>';

                                $.each(data.d, function (key, value) {
                                    sout += '<tr>';
                                    $.each(value, function (key, value) {
                                        sout += '<td>' + value + '</td>';
                                    });
                                    sout += '</tr>';
                                });
                                sout += '</tbody></table>';
                                //$('#sample_3 thead tr').append(strh);
                                //$('#sample_3 tbody').append(strb);
                                //// obj.config_table('#sample_1');
                                ////TableAdvanced.init();
                                //obj_tbl = initTable3('sample_3');
                            }
                        }
                    }
                });
                //var sOut = '<table>';
                //sOut += '<tr><td>Platform(s):</td><td>' + aData[2] + '</td></tr>';
                //sOut += '<tr><td>Engine version:</td><td>' + aData[3] + '</td></tr>';
                //sOut += '<tr><td>CSS grade:</td><td>' + aData[4] + '</td></tr>';
                //sOut += '<tr><td>Others:</td><td>Could provide a link here</td></tr>';
                //sOut += '</table>';

                return sout;
            }

            /*
             * Insert a 'details' column to the table
             */
            if (opt == 1) {
                var nCloneTh = document.createElement('th');
                nCloneTh.className = "table-checkbox";

                var nCloneTd = document.createElement('td');
                nCloneTd.innerHTML = '<span class="row-details row-details-close"></span>';

                table.find('thead tr').each(function () {
                    this.insertBefore(nCloneTh, this.childNodes[0]);
                });

                table.find('tbody tr').each(function () {
                    this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
                });
            }
            /*
             * Initialize DataTables, with no sorting on the 'details' column
             */
            var oTable = table.dataTable({

                // Internationalisation. For more info refer to http://datatables.net/manual/i18n
                "language": {
                    "aria": {
                        "sortAscending": ": activate to sort column ascending",
                        "sortDescending": ": activate to sort column descending"
                    },
                    "emptyTable": "No data available in table",
                    "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                    "infoEmpty": "No entries found",
                    "infoFiltered": "(filtered1 from _MAX_ total entries)",
                    "lengthMenu": "Show _MENU_ entries",
                    "search": "Search:",
                    "zeroRecords": "No matching records found"
                },

                "columnDefs": [{
                    "orderable": false,
                    "targets": [0]
                }],
                //"order": [
                //    [1, 'asc']
                //],
                "lengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "pageLength": 10,
            });
            var tableWrapper = $('#sample_3_wrapper'); // datatable creates the table wrapper by adding with id {your_table_jd}_wrapper

            tableWrapper.find('.dataTables_length select').select2(); // initialize select2 dropdown

            /* Add event listener for opening and closing details
             * Note that the indicator for showing which row is open is not controlled by DataTables,
             * rather it is done here
             */  if (opt == 1) {
                 table.on('click', ' tbody td .row-details', function () {
                     if ($(this).parent().parent().children().length > 2) {
                         var nTr = $(this).parents('tr')[0];
                         if (oTable.fnIsOpen(nTr)) {
                             /* This row is already open - close it */
                             $(this).addClass("row-details-close").removeClass("row-details-open");
                             oTable.fnClose(nTr);
                         } else {
                             /* Open this row */
                             $(this).addClass("row-details-open").removeClass("row-details-close");
                             var id = $(this).parent().parent().children().last().children()[0].id;
                             oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr, id), 'details');
                             resizeIframe();
                         }
                     }
                 });
             }
            return oTable;
        }
        fetch_data = function (imode, frmdate, todate) {
            var args = {};
            args.imode = imode;
            args.frmdate = frmdate;
            args.todate = todate;
            args.id = '0';
            $.ajax({
                type: 'POST',
                data: JSON.stringify(args),
                url: pageUrl + '/search_',
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (obj_tbl != undefined) {
                        $('#sample_3').dataTable().off('click', ' tbody td .row-details');
                        $('#sample_3').dataTable().fnDestroy();
                    }
                    //else {
                    //    $('#sample_3 thead tr').empty();
                    //    $('#sample_3 tbody').empty();
                    //}
                    $('#sample_3 thead tr').empty();
                    $('#sample_3 tbody').empty();
                    if (data != null) {
                        if (data.d.length > 0) {
                            var strh = '', strb = '';
                            $.each(data.d[0], function (key, value) {
                                if (key == 'PId') {
                                    strh += '<td>Action</td>';
                                }
                                else
                                    strh += '<td>' + key + '</td>';
                            });
                            $.each(data.d, function (key, value) {
                                strb += '<tr>';
                                $.each(value, function (key, value) {
                                    if (key == 'PId') {
                                        strb += '<td><a title="Approvals" id="PID-' + value + '" onclick=Action(this,"Approval")><i class="fa fa-check"></i></a>&nbsp';
                                        strb += ' <a id="PID-' + value + '" onclick=Action(this,"Reset")><i class="fa fa-refresh"></i></a>&nbsp;';
                                        strb += ' <a  id="PID-' + value + '" onclick=Action(this,"Cancel") ><i class="fa fa-exclamation-circle"></i></a>&nbsp;';
                                       // strb += '<a  id="PID-' + value + '" onclick=Action(this,"Close")><i class="fa fa-times-circle"></i></a>&nbsp;';
                                        //strb += '<a  id="PID-' + value + '" onclick=Action(this,"CloseReset") ><i class="fa fa-dot-circle-o"></i>&nbsp;';
                                        strb += '<a  id="PID-' + value + '" onclick=Edit(this)><i class="fa fa-edit"></i></a>&nbsp;</td>';


                                    }
                                    else
                                        strb += '<td>' + value + '</td>';
                                });
                                strb += '</tr>';
                            });
                            $('#sample_3 thead tr').append(strh);
                            $('#sample_3 tbody').append(strb);
                            // obj.config_table('#sample_1');
                            //TableAdvanced.init();

                            obj_tbl = initTable3(1);
                            resizeIframe();
                            //} else {
                            //    if (obj_tbl != undefined) {
                            //        obj_tbl = initTable3('sample_3');
                            //    }
                        }
                        else {
                            $('#sample_3 thead tr').append('<td></td>');
                            $('#sample_3 tbody').append('<tr><td>No data to display</td></tr>').removeClass('row-details');
                            obj_tbl = initTable3(2);
                        }

                    }
                }
            });
        }
        $(document).ready(function () {
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
            }

        });
        function test() {
            alert($('input:radio[name=optionsRadios]:checked').val());
        }
        $(document).on('click', '#btn_dialog', function () {
            var frm = $('#F_V_txt_frmdate').val();
            var to = $('#F_V_txt_todate').val();
            var imde = '';
            var op = getStatus();
            switch (op) {
                case 'P':
                    imde = 'PurchaseBindHeader'; break;
                case 'A':
                    imde = 'PurchaseApprovedBindHeader'; break;
                case 'C':
                    imde = 'PurchaseCancledBindHeader'; break;
              //  case 'G':
                  //  imde = 'PurchaseClosingHeader'; break;
              //  case 'D':
                  //  imde = 'PurchaseClosedHeader'; break;
            }
            fetch_data(imde, frm, to);
        });


        function reset() {
            var frm = $('#F_V_txt_frmdate').val();
            var to = $('#F_V_txt_todate').val();
            var imde = '';
            var op = getStatus();
            switch (op) {
                case 'P':
                    imde = 'PurchaseBindHeader'; break;
                case 'A':
                    imde = 'PurchaseApprovedBindHeader'; break;
                case 'C':
                    imde = 'PurchaseCancledBindHeader'; break;
                case 'G':
                    imde = 'PurchaseClosingHeader'; break;
                case 'D':
                    imde = 'PurchaseClosedHeader'; break;
            }
            fetch_data(imde, frm, to);
        }
        function getStatus() {
            return $('input:radio[name=optionsRadios]:checked').val();
        }
        function Edit(dpl) {
            debugger;
            var tmp = dpl.id.split('-');
            window.location = "../Transaction/PurchaseOrder.aspx?ID" + tmp[1];
        }
        function Action(dkl, type) {
            debugger;           
            if (type == 'Cancel') {
                $('#modal_remarks').modal('show');
                $(document).on('click', '#add_remarks', function () {
                    perform_Action(dkl,type);
                });               
            }
            else
            {
                perform_Action(dkl,type);
            }           
        }
        function perform_Action(dkl,type)
        {
            var status = '', imde = '', term = '', rem = '';
            switch (type) {
                case 'Approval': status = '1'; imde = 'PurchaseStatus'; term = 'Approved'; break;
                case 'Reset': status = '0'; imde = 'PurchaseStatus'; term = 'Reset'; break;
                case 'Cancel': status = '2'; imde = 'PurchaseStatus'; term = 'Cancelled'; break;
              //  case 'Close': status = '3'; imde = 'PurchaseStatus'; term = 'Closed'; break;
                //case 'CloseReset': status = '4'; imde = 'PurchaseStatus'; term = 'Reset'; break;
            }
            if (type == 'Cancel') {
                $('#modal_remarks').modal('hide');
                rem = ($('#txt_remarks').val() == "" ? 0 : $('#txt_remarks').val());
            }
            else {
                rem = '';
            }
            var tmp = dkl.id.split('-');
            var args = {};
            args.imode = imde;
            args.status = status;
            args.remarks = rem;
            args.id = tmp[1];
            $.ajax({
                type: "POST",
                url: pageUrl + '/action_',
                data: JSON.stringify(args),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    if (data != null) {
                        if (data.d[0].res == "1") {

                            $('#basic1').append(callalert('alert', term + ' successfully', '1'));
                            //  $("#basic1").css("display", "block");
                            $('#basic1').modal('show');
                            reset();
                            // alert('Records are  deleted sucessfully');                            
                        }
                    }
                    else {

                        $('#basic1').append(callalert('alert', 'Record Used another table so, cant delete', '1'));
                        //$("#basic1").css("display", "block");
                        $('#basic1').modal('show');

                    }
                },
                failure: function (response) {
                    alert('Record Used another table so, cant delete!');
                }
            });
        }
        function callalert(title, content, type) {
            $('#basic1').empty();
            var str = '<div class="modal-dialog">';
            str += '<div class="modal-content">';
            str += '<div class="modal-header">';
            str += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>';
            str += '<h4 class="modal-title">' + title + '</h4>';
            str += '</div>';
            str += '<div class="modal-body">';
            str += ' <img src="../assets/admin/layout/img/1429184960_messagebox_warning.png" height="48px" width="48px" alt=""> ' + content;
            str += '</div>';
            str += ' <div class="modal-footer">';
            switch (type) {
                case "1":
                    str += ' <input type="button" id="btn_Cancel" class="btn blue" data-dismiss="modal" value="Close">';
                    break;
                case "2":
                    str += ' <input type="button" id="btn_OK" class="btn blue"  value="OK">';
                    str += ' <input type="button" id="btn_Cancel" class="btn blue" data-dismiss="modal" value="Close">';
            }

            str += ' </div>';
            str += ' </div>';
            str += ' </div>';
            return str;
        }
    </script>
</body>
</html>
