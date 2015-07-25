<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" ValidateRequest="false" Inherits="Trident.Invoice.Invoice" %>

<!DOCTYPE html>

<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Efrontier  | Invoice</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../assets/admin/pages/css/invoice.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="../assets/global/css/components.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../assets/admin/layout2/css/layout.css" rel="stylesheet" type="text/css" />
    <link id="style_color" href="../assets/admin/layout2/css/themes/default.css" rel="stylesheet" type="text/css" />
    <link href="../assets/admin/layout2/css/custom.css" rel="stylesheet" type="text/css" />
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
    <style type="text/css">
        body {
            background: #f1f3fa !important;
        }

        .cls_bdy_tp {
            float: right;
            margin: 0px;
        }

        .amount {
            list-style: none;
            text-align: right;
            font-size: 14px;
        }

        h3 {
            font-size: 21px !important;
            
        }
        .rgt
        {
            padding-left: 38px;
        }
        .lblamt {
            list-style: none;
            text-align: left;
            font-size: 14px;
        }
    </style>
      <script src='../JavaScript/jquery-1.9.1.min.js' type="text/javascript"></script>
   <%-- <script src="../JavaScript/ExportToPDF.js"></script>
     <script type="text/javascript">
         $(document).on('click', '#btnPrint', function () {
             ExportToPDF($('#divtoPrint'), [], '', PDFPageType.Portrait);
         });
         function PDFgenerate()
         {
             ExportToPDF($('#divtoPrint'), [], '', PDFPageType.Portrait);
         }
    </script>--%>
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
<body onload="resizeIframe();">
    <!-- BEGIN HEADER -->

    <!-- END HEADER -->


    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <!-- /.modal -->
    <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <!-- BEGIN STYLE CUSTOMIZER -->

    <!-- END STYLE CUSTOMIZER -->
    <!-- BEGIN PAGE HEADER-->

    <form id="invoice" runat="server">
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        
        <div id="full_bdy">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <div class="cls_bdy_tp">
                        <a class="btn btn-lg blue hidden-print margin-bottom-5" onclick="javascript:window.print();">Print <i class="fa fa-print"></i>
                        </a>
                        <br />
                       <%--  <a class="btn btn-lg blue hidden-print margin-bottom-5" onclick="PDFgenerate();">PDF <i class="fa-file-pdf-o"></i>
                        </a>--%>
                        <asp:Button ID="btn_Pdf" runat="server" Text="PDF" OnClick="btn_Pdf_Click" />
                         <asp:Button ID="btnSave" runat="server" Text="image"  />
                       
                       
                    </div>
                </div>
            </div>
            <div class="portlet light">
                <div class="portlet-body">
                    <div id="divtoPrint" class="invoice">
                        <div class="row invoice-logo">
                            <div style="width: 10.66666667%; float: left;">
                                <img src="Invoice.png" class="img-responsive" alt="" />
                            </div>
                            <div class="col-xs-6">
                                <p style="line-height: 22px;">
                                 <%--   Vertias Design Pte Ltd <span class="muted">62 UBI ROAD 1,<br />
                                        #08-11 OXLEY BIZHUB2,<br />
                                        SINGAPORE 408731.  </span>--%>
                                    <div id="cmp"></div>
                                </p>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div align="center"><span id="title" style="font-size: 23px"></span></div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                              <h3>To:</h3>
                                <div id="Address">
                                </div>

                            </div>
                            <div class="col-xs-3">
                                <%--<h3>About:</h3>
                                <ul class="list-unstyled">
                                    <li>Drem psum dolor sit amet
                                    </li>
                                    <li>Laoreet dolore magna
                                    </li>
                                    <li>Consectetuer adipiscing elit
                                    </li>
                                    <li>Magna aliquam tincidunt erat volutpat
                                    </li>
                                    <li>Olor sit amet adipiscing eli
                                    </li>
                                    <li>Laoreet dolore magna
                                    </li>
                                </ul>--%>
                            </div>
                            <div class="col-xs-4 invoice-payment">
                                <%--<h3>Payment Details:</h3>--%>
                                 <h3>Details</h3>
                                <div id="info">
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <table id="details" class="table table-striped table-hover">
                                    <%-- <thead>
                                        <tr>
                                            <th>#
                                            </th>
                                            <th>Item
                                            </th>
                                            <th class="hidden-480">Description
                                            </th>
                                            <th class="hidden-480">Quantity
                                            </th>
                                            <th class="hidden-480">Unit Cost
                                            </th>
                                            <th>Total
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1
                                            </td>
                                            <td>Hardware
                                            </td>
                                            <td class="hidden-480">Server hardware purchase
                                            </td>
                                            <td class="hidden-480">32
                                            </td>
                                            <td class="hidden-480">$75
                                            </td>
                                            <td>$2152
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2
                                            </td>
                                            <td>Furniture
                                            </td>
                                            <td class="hidden-480">Office furniture purchase
                                            </td>
                                            <td class="hidden-480">15
                                            </td>
                                            <td class="hidden-480">$169
                                            </td>
                                            <td>$4169
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3
                                            </td>
                                            <td>Foods
                                            </td>
                                            <td class="hidden-480">Company Anual Dinner Catering
                                            </td>
                                            <td class="hidden-480">69
                                            </td>
                                            <td class="hidden-480">$49
                                            </td>
                                            <td>$1260
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3
                                            </td>
                                            <td>Software
                                            </td>
                                            <td class="hidden-480">Payment for Jan 2013
                                            </td>
                                            <td class="hidden-480">149
                                            </td>
                                            <td class="hidden-480">$12
                                            </td>
                                            <td>$866
                                            </td>
                                        </tr>
                                    </tbody>--%>

                                    <thead>
                                        <tr>
                                            <th>#
                                            </th>
                                            <th>Category
                                            </th>
                                            <th class="hidden-480">Description
                                            </th>
                                            <th class="hidden-480">Qty
                                            </th>
                                            <th class="hidden-480">Rate
                                            </th>
                                            <th>Amount
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7">
                                <div class="">
                                    <address>
                                    </address>
                                    <address>
                                    </address>
                                </div>
                            </div>
                            <div class="col-xs-5 invoice-block">
                                <div id="total">
                                </div>
                                <br />

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="">
                                    <p>
                                        _______________________<br />
                                        <span>Customer Signature</span>
                                    </p>
                                </div>
                            </div>
                            <div class="col-xs-8 invoice-block">
                                <div>
                                    <p>
                                        _____________________<br />
                                        <span>Signed & Issued By</span>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
            
        <!-- END FOOTER -->
        <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
        <!-- BEGIN CORE PLUGINS -->
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
        <script src="../assets/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
        <!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
        <script src="../assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <script src="../assets/global/scripts/metronic.js" type="text/javascript"></script>
        <script src="../assets/admin/layout2/scripts/layout.js" type="text/javascript"></script>
        <script src="../assets/admin/layout2/scripts/demo.js" type="text/javascript"></script>
        <script src="../JavaScript/html2canvas.js"></script>
        <script src="../JavaScript/canvas2image.js"></script>
        <script src="../JavaScript/base64.js"></script>
        <!-- END JAVASCRIPTS -->
    </form>
    <script type="text/javascript">
        function get_PID() {
            //return 17;
         <% if (Request.QueryString["ID"] != null)
            { %>
            return '<%= Request.QueryString["ID"] %>';
            
            <% } %>
            return 0;
        }
       


        $(function () {
            debugger;
            $("#btnSave").click(function () {
                html2canvas($("#full_bdy"), {
                    onrendered: function (canvas) {
                        //theCanvas = canvas;
                       // document.body.appendChild(canvas);

                        // Convert and download as image 
                       Canvas2Image.saveAsPNG(canvas);
                        var myImage = canvas.toDataURL("image/png");
                       // window.open(myImage);
                      
                        $('body').append('<img src="' + myImage + '"/>');
                       //var oImgPNG = Canvas2Image.saveAsPNG(canvas, true);
                       //oImgPNG.outerHTML
                        // Clean up 
                        //document.body.removeChild(canvas);
                    }
                });
            });
        });
        function get_PG() {
            <% if (Request.QueryString["pg"] != null)
               { %>
            return '<%= Request.QueryString["pg"] %>';
            
            <% } %>
            return 0;
        }
        function resizeIframe() {
            var iframe = window.parent.document.getElementById("_view");
            var container = document.getElementById('full_bdy');
            iframe.style.height = container.offsetHeight + 200 + 'px';
        }
        var obj = {
            arg: function (id, imode) {
                Args = {
                    pid: get_PID(),
                    imode: obj.get_pg_url(get_PG()),
                    handler_mode: 'print'
                }
                return Args;
            },
            fetch_data: function (id, imode) {
                $.ajax({
                    url: "../HttpHandler/frm_invoice.ashx",
                    data: this.arg(id, imode),
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        //$('#sample_1 thead tr').empty();
                        //$('#sample_1 tbody').empty();
                        if (data != null) {
                            //  if (data.d.length > 0) {                            
                            $('#details tbody').empty();
                            for (var i = 0; i < data.length; i++) {
                               
                                    if(data[i].item!=null && data[i]!="")
                                    {
                                        var addr = '';
                                        addr += '<ul class="list-unstyled">';
                                        $.each(data[i], function (key, value) {
                                            if (value != null && key != "Value" && key != "ScreenName")
                                                addr += '<li>' + value + '</li>';
                                        });
                                        addr += '</ul>';

                                        $('#Address').append(addr);
                                    }
                                
                                                             
                                 if (data[i].Value == 'No') {
                                    var no = '', ky = '', dt = '',pt='';
                                    
                                    no += '<table width="100%"><tr><td width="40%">';
                                    ky += '<p class="lblamt">';
                                    dt += '<p class="amount">';
                                    pt += '<p class="lblamt">';
                                    $.each(data[i], function (key, value) {
                                        if (value != null && key != "Value" && key != "ScreenName")
                                            {
                                            //   no += '<li><strong>' + key + '</strong>:' + value + '</li>';
                                            ky += '<strong>' + key + '</strong></br>';
                                            dt += '' + value + '</br>';
                                            pt += ':</br>';
                                        }
                                    });
                                    //  no += '</ul>';
                                    no += ky + '</p></td><td width="2%">' + pt + '</p></td><td width="40%" >' + dt + '</p></td></tr></table>'
                                    $('#info').append(no);
                                    $('#title').text(data[i].ScreenName);
                                 }
                                
                                
                                else if (data[i].Value == 'Total') {
                                    var tot = '', ky = '', amt = '', pt = '';
                                    //tot += '<ul class="list-unstyled amounts">';
                                    tot += '<table width="100%"><tr><td width="40%">'
                                    ky += '<p class="lblamt">';
                                    amt += '<p class="amount">';
                                    pt += '<p class="lblamt">';
                                    $.each(data[i], function (key, value) {
                                        if (value != null && key != "Value") {
                                            
                                            ky += '<strong>' + key + '</strong></br>';
                                            amt += '<strong>' + value + '</strong></br>';
                                            pt += '<strong>:</strong></br>';
                                          

                                        }
                                    });
                                    tot += ky + '</p></td><td width="2%">' + pt + '</p></td><td width="40%">' + amt + '</p></td></tr></table>'
                                    // tot += '</ul>';
                                    $('#total').append(tot);
                                }
                                else if (data[i].Value == 'Company') {
                                    var c = '', a = '';

                                    $.each(data[i], function (key, value) {
                                        if (value != null && key != "Value") {
                                            if (key == 'CompanyName') {
                                                a += '<span style="font-size:23px;" >'+value + '</span></br>';
                                            }
                                            else
                                            { a += value + '</br>'; }
                                           
                                        }
                                    });
                                    $('#cmp').append(a);
                                }
                                else if(data[i].item==null) {

                                    var strb = '';
                                    strb += '<tr>';
                                    $.each(data[i], function (key, value) {
                                        if (value != null) {
                                            if (key == "Description" || key == "Qty" )
                                                strb += '<td class="hidden-480" >' + value + '</td>';

                                            else {
                                                if (key == "Amount" || key == "Rate") {
                                                    strb += '<td style="text-align: right;">' + value + '</td>';
                                                }
                                                else
                                                strb += '<td>' + value + '</td>';
                                            }
                                        }
                                    });
                                    strb += '</tr>';
                                    $('#details tbody').append(strb);
                                    $('#details tbody tr td:nth-child(' + ($('hidden-480').index() + 1) + ')').addClass('hidden-480');
                                    // obj.config_table('#sample_1');
                                    //TableAdvanced.init();                               
                                }
                            }
                            // }
                            resizeIframe();
                        }
                    }
                });
            },
            get_pg_url: function (pgname) {
                switch (pgname) {
                    case 'PURCHASEORDER': return 'purchase'; break;
                    case 'QUOTATION': return 'Quotation'; break;
                    case 'SALESORDER': return 'Sales'; break;
                    case 'SALESDELIVERY': return 'SalesDelivery'; break;
                }
            },
            back: function () {
                window.location.href = document.referrer;
            }
        }
        $(document).ready(function () {
            var pg = get_PG();
            var sp_name = obj.get_pg_url(pg);
            var id = get_PID();
            if (pg != 0) {
                obj.fetch_data(id, sp_name);
            }
        });
    </script>
</body>
<!-- END BODY -->
</html>
