<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportViewer.aspx.cs" EnableEventValidation="false" Inherits="Trident.Report.ReportViewer" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
    <title>View Report</title>
    <style type="text/css">
        html, body, form {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
            font-family: Verdana, Tahoma, Arial;
            font-size: small;
        }

        .spinner {
            position: fixed;
            top: 50%;
            left: 50%;
            margin-left: -50px; /* half width of the spinner gif */
            margin-top: -50px; /* half height of the spinner gif */
            text-align: center;
            z-index: 1234;
            overflow: auto;
            width: 150px; /* width of the spinner gif */
            height: 62px; /*height of the spinner gif +2px to fix IE8 issue */
            background-color: #E1E1D7;
            border: 1px solid black;
        }

        .HighlightDiv img {
            background-color: transparent;
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-color: transparent;
            border-right-color: transparent;
            border-bottom-color: transparent;
            border-left-color: transparent;
            border-top-style: solid;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            cursor: default;
        }

        .HighlightDiv:hover img {
            background-color: #DDEEF7;
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-color: #336699;
            border-right-color: #336699;
            border-bottom-color: #336699;
            border-left-color: #336699;
            border-top-style: solid;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            cursor: pointer;
        }
    </style>
</head>
<body onload="showPrintButton()">
    <form id="form1" runat="server">       
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="divMain">
            <rsweb:ReportViewer ID="ReportViewer1" AsyncRendering="false" ZoomMode="PageWidth"  SizeToReportContent="true" runat="server" Width="800px" Height="800px">
            </rsweb:ReportViewer>          
            <iframe id="frmPrint" name="frmPrint" runat="server" style="display: none"></iframe>
        </div>
        <div id="spinner" class="spinner" style="display: none;">
            <table align="center" valign="middle" style="height: 100%; width: 100%">
                <tr>
                    <td>
                        <img id="img-spinner" src="../Report/Images/ajax-loader.gif" alt="Printing" /></td>
                    <td><span style="font-family: Verdana; font-weight: bold; font-size: 10pt; width: 86px;">Printing...</span></td>
                </tr>
            </table>
        </div>
    </form>    
    <script language="javascript" type="text/javascript">



        $(document).ready(function () {
            $("#spinner").bind("ajaxSend", function () {
                $(this).show();
            }).bind("ajaxStop", function () {
                $(this).hide();
            }).bind("ajaxError", function () {
                $(this).hide();
            });
            $(function () {
                showDatePicker();
            });
        });

        function showDatePicker() {

            var parameterRow = $("#ParametersRowrvREXReport");
            var innerTable = $(parameterRow).find("table").find("table");
            var span = innerTable.find("span:contains('From Date (dd/mm/yyyy):')");
            if (span) {
                var innerRow = $(span).parent().parent();
                var innerCell = innerRow.find("td").eq(1);
                var textFrom = innerCell.find("input[type=text]");
                innerCell = innerRow.find("td").eq(4);
                var textTo = innerCell.find("input[type=text]");

                $(textFrom).datepicker({
                    defaultDate: "+1w",
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    numberOfMonths: 1,
                    onClose: function (selectedDate) {
                        $(textTo).datepicker("option", "minDate", selectedDate);
                    }
                });
                $(textFrom).focus(function (e) {
                    e.preventDefault();
                    $(textFrom).datepicker("show");
                });
                $(textTo).datepicker({
                    defaultDate: "+1w",
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    numberOfMonths: 1,
                    onClose: function (selectedDate) {
                        $(textFrom).datepicker("option", "maxDate", selectedDate);
                    }
                });
                $(textTo).focus(function () {
                    $(textTo).datepicker("show");
                });
            }
        }

        //Function that is called on Successful AJAX method call.  These are referenced in the "CallServerMethodBeforePrint" function that is created from code behind and will exist in the final rendering of the page.
        function ServerCallSucceeded(result, context) {
            var iFrameURL = "<%=iFrameURL%>";
            window.frames['frmPrint'].document.location.href = iFrameURL;
            window.frames['frmPrint'].focus();
            var timeout = window.setTimeout("window.frames[\"frmPrint\"].focus();window.frames[\"frmPrint\"].print();", 500);
            window.setTimeout("ServerCallAfterPrint(this)", 2000);
        }

        function ServerCallSucceededAfterPrint(result, context) {
        }

        //Function that is called on failure or error in AJAX method call. These are referenced in the "CallServerMethodBeforePrint" function that is created from code behind and will exist in the final rendering of the page.
        function ServerCallFailed(result, context) {
        }

        function ServerCallBeforePrint(btn) {
            $('#spinner').show();
            var context = new Object();
            //example of passing multiple args
            context.flag = new Array('Today', 'Tomorrow');
            //This "CallServerMethodBeforePrint" function is created from code behind and will exist in the final rendering of the page
            CallServerMethodBeforePrint(context.flag, context);
        }

        function ServerCallAfterPrint(btn) {
            var context = new Object();
            //example of passing multiple args
            context.flag = new Array('Today', 'Tomorrow');
            //This "CallServerAfterPrint" function is created from code behind and will exist in the final rendering of the page
            CallServerAfterPrint(context.flag, context);
            $('#spinner').hide();
        }

        function printPDF(btn) {
            ServerCallBeforePrint(btn);
        }

        function showPrintButton() {
            var table = $("table[title='Refresh']");
            var parentTable = $(table).parents('table');
            var parentDiv = $(parentTable).parents('div').parents('div').first();
            var btnPrint = $("<input type='button' id='btnPrint' name='btnPrint' value='Print' style=\"font-family:Verdana;font-size:8pt;width:86px\"/>");
            var btnClose = $("<input type='button' id='btnClose' name='btnClose'value='Close' style=\"font-family:Verdana;font-size:8pt;width:86px\"/>");
            btnPrint.click(function () {
                printPDF(this);
            });
            btnClose.click(function () {
                window.close();
            });
            if (parentDiv.find("input[value='Print']").length == 0) {
                parentDiv.append('<table cellpadding="0" cellspacing="0" toolbarspacer="true" style="display:inline-block;width:6px;"><tbody><tr><td></td></tr></tbody></table>');
                parentDiv.append('<div id="customDiv" class=" " style="display:inline-block;font-family:Verdana;font-size:8pt;vertical-align:inherit;"><table cellpadding="0" cellspacing="0"><tbody><tr><td><span style="cursor:pointer;" class="HighlightDiv" onclick="javascript:printPDF(this);" ><img src="../Images/Buttons/printer_blue_small.png" alt="Print Report" title="Print Report" width="18px" height="18px" style="margin-top:4px"/></span></td></tr></tbody></table></div>');
                parentDiv.append('<table cellpadding="0" cellspacing="0" toolbarspacer="true" style="display:inline-block;width:10px;"><tbody><tr><td></td></tr></tbody></table>');
                parentDiv.append('<div id="customDiv" class=" " style="display:inline-block;font-family:Verdana;font-size:8pt;vertical-align:inherit;"><table cellpadding="0" cellspacing="0" style="display:inline;"><tbody><tr><td><span style="cursor:pointer;" class="HighlightDiv" onclick="javascript:window.close();"><img src="../Images/cross-circle-frame.png" alt="Close Report" title="Close Report" width="18px" height="18px" style="margin-top:4px"/></span></td></tr></tbody></table></div>');
            }
        }
        function cfnReportsViewer_ViewReport(selectedTreeKeyGuidValue, ReportName, VenueExamCounter) {
            var windowWidth = 1000;
            var windowHeight = 800;
            var left = (screen.width / 2) - (windowWidth / 2);
            var top = (screen.height / 2) - (windowHeight / 2);
            var myForm = document.getElementById("form1");
            if (myForm) {
                myForm.target = "PopupReport";
            }
            $("#hfAccessObjectGuid").val(selectedTreeKeyGuidValue);
            $("#hfReportName").val(ReportName);
            $("#hfVenueExamCounter").val(VenueExamCounter);
            var thePopup = window.open("about:blank", "PopupReport", 'scrollbars=yes,status=yes,toolbar=yes,menubar=no,location=no,resizable=no,fullscreen=yes, width=' + windowWidth + ', height=' + windowHeight + ', top=' + top + ', left=' + left);
            window.setTimeout(document.getElementById("form1").submit(), 500);
            return false;
        }
</script>
</body>
</html>
