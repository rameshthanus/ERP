<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PtoductSearch.aspx.cs" Inherits="Trident.Master.PtoductSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Css/Purchase_Order.css" rel="stylesheet" />
    <link href="../Css/demo_table_jui.min.css" rel="stylesheet" />
    <link href="../Css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css" />
    <style type="text/css">
        .ui-dialog .ui-dialog-buttonpane .ui-dialog-buttonset {
            margin-bottom: 0px;
        }

        .ui-dialog .ui-dialog-buttonpane button {
            margin-bottom: 0px;
        }

        .dataTables_info {
            width: 60%;
        }

        .ui-widget-header {
            background: none;
            border: none;
        }

        .dataTables_wrapper {
            overflow: auto;
        }

        table.display thead th {
            padding: 0px;
        }

        #tbl_grd_paginate, #tbl_in_pop_paginate, #tbl_in_pop_info {
            display: none;
        }

        div.dataTables_wrapper .ui-widget-header {
            height: 100%;
        }

        /*@media screen and (max-width:1080px) {           
            #dv_bdy_tp, #dv_rmrks, #dv_grd,#dv_bdy_btm {
                width: 96%;
            }
            #dv_rmrks {
                margin-left: 2%;
            }
        }

        @media screen and (max-width:1250px) {
            #tbl_prch {
                width: 100%;
            }
        }*/
    </style>
    <script type="text/javascript" src="../JavaScript/jquery-1.9.1.min.js"></script>
    <script  type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script   type="text/javascript" src="../JavaScript/jquery_New/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            function renderTable(result) {
                var dtData = [];
                // Data tables requires all data to be stuffed into a generic jagged array, so loop through our
                // typed object and create one.
                $.each(result, function () {
                    dtData.push([
                           this.SNo,
                           this.ProductCode,
                           this.Description
                        ]);
                });

                $('#grid').dataTable({
                    'aaData': dtData,
                    "bJQueryUI": true
                });
            }

            // Make an AJAX call to the PageMethod in the codebehind
            $.ajax({
                url: 'PtoductSearch.aspx/GetData',
                data: '{}',
                type: 'GET',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {
                    // Call the renderTable method that both fills the aaData array with data and initializes the DataTable.
                    renderTable(result.d);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + ": " + textStatus + ": " + errorThrown);
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table id="grid" width="100%">
        <thead>
            <tr>
                <th>SNo</th>
                <th>ProductCode</th>
                <th>Description</th>
            </tr>
              
        </thead>

        <tbody>
            <tr>
                <td colspan="5" class="dataTables_empty">Loading data from server</td>
            </tr>
        </tbody>
    </table>
    </div>
    </form>
</body>
</html>
