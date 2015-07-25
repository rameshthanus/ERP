using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using NReco.PdfGenerator;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using System.Data;

namespace Trident.Invoice
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Pdf_Click(object sender, EventArgs e)
        {
            WriteDocument("htmlToPDF.pdf", "application/pdf", ConvertHtmlToPDF());
        }
        public string getpgurl(string pgname)
        {
            string imode = "";
            switch (pgname)
            {
                case "PURCHASEORDER":
                    imode = "purchase";
                    break;
                case "QUOTATION":
                    imode = "Quotation";
                    break;
                case "SALESORDER":
                    imode = "Sales";
                    break;

                case "SALESDELIVERY":
                    imode = "SalesDelivery";
                    break;
            }
            return imode;
        }
        public string ShowHtml()
        {
            bel_Invoice obj = new bel_Invoice();
            dal_Invoice dal = new dal_Invoice();
            obj._PID = Convert.ToInt16(Request.QueryString["ID"]);
            obj._iMode = getpgurl(Request.QueryString["pg"]);
            StringBuilder html = new StringBuilder("<table style=\"margin-bottom: 2px;margin-right: -15px;margin-left: -15px;\">");
            html.Append("<tr><td><img alt=\"\" class=\"img-responsive\" src=\"Invoice.png\" /></td><td>");
            using (DataSet ds = dal.dal_Invoicedetail(obj))
            {
                if (ds.Tables[4].Rows.Count > 0)
                {
                    html.Append("<b>" + ds.Tables[4].Rows[0]["CompanyName"].ToString() + "</b><br />");
                    html.Append(ds.Tables[4].Rows[0]["addr1"].ToString() + "<br />");
                    html.Append(ds.Tables[4].Rows[0]["addr4"].ToString() + "<br />");
                    html.Append(ds.Tables[4].Rows[0]["addr2"].ToString() + "<br />");
                    html.Append(ds.Tables[4].Rows[0]["addr3"].ToString() + "<br />");
                }
                //  html.Append("<td>Vertias Design Pte Ltd <span class=\"muted\">62 UBI ROAD 1,<br /> #08-11 OXLEY BIZHUB2,<br /> SINGAPORE 408731. </span></p></td></tr>");
                html.Append("</td></tr></tr></table><hr /><div class=\"row\">");
                html.Append("<div align=\"center\"><span id=\"title\" style=\"font-size: 23px;\">" + ds.Tables[1].Rows[0]["ScreenName"].ToString() + "</span></div>");

                html.Append("  </div><div class=\"row\"><div class=\"col-xs-5\" style=\"width:41.666667%;float:left\" class=\"col-xs-3\"><h3>To:</h3><div id=\"Address\">");
                html.Append("<ul class=\"list-unstyled\" style=\"padding-left:0px;list-style:none;\">");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int i;
                    for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        html.Append("<li>" + ds.Tables[0].Rows[i][0].ToString() + "</li>");
                        //foreach(DataColumn dc in dtRow)
                    }
                }
                html.Append("</ul> </div>");
                // <li>CASA DESIGNS PTE. LTD.</li> </ul>");
                //html.Append("  <ul class=\"list-unstyled\" style=\"padding-left:0px;list-style:none;\"> <li>170 UPPER BUKIT TIMAH ROAD #05-04</li></ul><ul style=\"padding-left:0px;list-style:none;\" class=\"list-unstyled\">");
                //html.Append(" <li>BUKIT TIMAH SHOPPING CENTRE</li> </ul> <ul  style=\"padding-left:0px;list-style:none;\"class=\"list-unstyled\" > <li>588179</li></ul> </div>");
                html.Append(" </div> <div style=\"width:25%;float:left\" class=\"col-xs-3\">&nbsp;</div>  <div style=\"width: 33.33333333%;float:left\" class=\"col-xs-4 invoice-payment\">   <h3>Details</h3>  <div id=\"info\">");
                html.Append(" <table width=\"100%\"> <tbody> <tr> <td width=\"40%\"><p class=\"lblamt\" style=\"text-align: left;font-size: 14px;\">");

                if (ds.Tables[1].Rows.Count > 0)
                {
                    int i, j,k;
                    for (i = 0; i < ds.Tables[1].Columns.Count; i++)
                    {
                        if (ds.Tables[1].Columns[i].ColumnName.ToString() != "Value" && ds.Tables[1].Columns[i].ColumnName.ToString() != "ScreenName")
                            html.Append(" <strong>" + ds.Tables[1].Columns[i].ColumnName.ToString() + "</strong><br>");
                    }
                    html.Append(" </p></td><td width=\"2%\"><p class=\"lblamt\">");
                    for (k = 0; k < ds.Tables[1].Columns.Count; k++)
                    {
                        if (ds.Tables[1].Columns[k].ColumnName.ToString() != "Value" && ds.Tables[1].Columns[k].ColumnName.ToString() != "ScreenName")
                            html.Append(":<br />");
                    }                   
                    html.Append("</p></td><td width=\"40%\"><p>");
                    for (j = 0; j < ds.Tables[1].Columns.Count; j++)
                    {
                        if (ds.Tables[1].Columns[j].ColumnName.ToString() != "Value" && ds.Tables[1].Columns[j].ColumnName.ToString() != "ScreenName")
                            html.Append(ds.Tables[1].Rows[0][j].ToString() + "</br>");
                    }
                }
                //  html.Append(" <p class=\"lblamt\" style=\"text-align: left;font-size: 14px;\"><strong>SO.No.</strong><br /><strong>Job Code</strong><br /><strong>SO Date</strong><br />");


                // html.Append("</p></td><td width=\"40%\"><p class=\"amount\">SO00006<br />VD-00013-15<br />13/05/2015<br />");
                html.Append("</p> </td></tr></tbody></table></div></div></div><br/>");
                html.Append("<div class=\"row\"><div class=\"col-xs-12\">");
                html.Append("<br/><br/><table style=\" border:1; margin: 30px 0 30px;width: 100%;background-color: transparent;font-family: \"Open Sans\", sans-serif;font-size: 13px;\" class=\"table table-striped table-hover\" id=\"details\">");
                html.Append(" <thead><tr>");
                 if (ds.Tables[2].Rows.Count > 0)
                {
                    int i, j;
                    for (i = 0; i < ds.Tables[2].Columns.Count; i++)
                    {                        
                            html.Append("<th style=\"padding: .3em;border-bottom: 1px #ccc solid;\">"+ ds.Tables[2].Columns[i].ColumnName.ToString() + "</th>");
                    }
                    html.Append(" </tr></thead><tbody><tr>");                   
                    for (j = 0; j < ds.Tables[2].Columns.Count; j++)
                    {                       
                            html.Append("<td style=\"text-align: right;\">"+ds.Tables[2].Rows[0][j].ToString() + "</td>");
                    }
                }
                //    Category </th><th  style=\"padding: .3em;border-bottom: 1px #ccc solid;\" class=\"hidden-480\">Description </th><th style=\"padding: .3em;border-bottom: 1px #ccc solid;\" class=\"hidden-480\">Qty </th><th style=\"padding: .3em;border-bottom: 1px #ccc solid;\" class=\"hidden-480\">Rate </th>");
                //html.Append("<th style=\"padding: .3em;border-bottom: 1px #ccc solid;\">Amount </th></tr></thead><tbody><tr><td>1</td>");
                //html.Append(" <td>Website</td><td class=\"hidden-480\">Website(including HTML), Deliverables: Header links, Placeholder template, Button links x323</td><td class=\"hidden-480\">1</td>");
                //html.Append("<td style=\"text-align: right;\">0</td> <td style=\"text-align: right;\">0</td></tr>");
                //html.Append("<tr><td>2</td><td>E-Commerce</td><td class=\"hidden-480\">Virtual Storefronts: online catalogs, Customer email database, Footer Fragment links, Updating all the photographs and image.</td>");
                //html.Append(" <td class=\"hidden-480\">1</td><td style=\"text-align: right;\">0</td> <td style=\"text-align: right;\">0</td></tr>");
                //html.Append("<tr><td>3</td> <td>Graphic Design</td><td class=\"hidden-480\">Header Banner, Placeholder x1 (slide up to 4),Button x3 (contact/email/portfolio), Footer Fragment x1</td>");
                //html.Append("<td class=\"hidden-480\">1</td><td style=\"text-align: right;\">10000</td><td style=\"text-align: right;\">10000</td>");
                html.Append("</tr></tbody></table></div></div>");
                html.Append("<div class=\"row\"><div class=\"col-xs-7\" style=\"float: left; width: 53.66666667%;\">&nbsp;</div>");
                html.Append("<div class=\"col-xs-5 invoice-block\" style=\"float:left;text-align: right; width: 30.66666667%;\"><div id=\"total\"> <table width=\"100%\"> <tbody> <tr><td width=\"40%\">");
                html.Append("<p class=\"lblamt\">");
                 if (ds.Tables[3].Rows.Count > 0)
                {
                    int i, j,k;
                    for (i = 0; i < ds.Tables[3].Columns.Count; i++)
                    {                     
                        if (ds.Tables[3].Columns[i].ColumnName.ToString() != "Value")
                            html.Append("<strong>"+ ds.Tables[3].Columns[i].ColumnName.ToString() + "</strong><br />");
                    }
                    html.Append("</p></td><td width=\"2%\">");
                    for (k = 0; k < ds.Tables[3].Columns.Count; k++)
                    {
                        if (ds.Tables[3].Columns[k].ColumnName.ToString() != "Value")
                            html.Append("<strong>:</strong><br />");
                    }                    
            //    html.Append("<p class=\"lblamt\"><strong>:</strong><br /><strong>:</strong><br /><strong>:</strong><br /><strong>:</strong><br /><strong>:</strong><br /><strong>:</strong><br />");
                html.Append("</p></td><td width=\"40%\">");                   
                    for (j = 0; j < ds.Tables[3].Columns.Count; j++)
                    {       
                        if (ds.Tables[3].Columns[j].ColumnName.ToString() != "Value")
                            html.Append("<strong>"+ds.Tables[3].Rows[0][j].ToString() + "</strong><br />");
                    }
                }
                   // <strong>Sub Total<strong>Discount Amount</strong><br /><strong>Invoice Tax</strong><br /><strong>Shipping Fee</strong><br /><strong>Total Amount</strong><br /><strong>Grand Total</strong><br />");
              
               // html.Append("<p class=\"amount\"><strong>10000</strong><br /><strong>0<strong>0</strong><br /><strong>0</strong><br /><strong>10000</strong><br /><strong>10000</strong><br />");
                html.Append("</p> </td></tr></tbody></table></div><br /> </div></div>");
                html.Append(" <div class=\"row\"><div class=\"col-xs-4\" style=\"float: left; width: 33%;\"><div class=\"\">");
                html.Append("<p> _______________________<br /><span>Customer Signature</span></p>");
                html.Append("</div></div> <div class=\"col-xs-8 invoice-block\" style=\"text-align:right;float: left; width: 66%;\"><div>");
                html.Append(" <p> _____________________<br /><span>Signed &amp; Issued By</span></p>");
                html.Append(" </div></div></div></div></div></div></div>");
            }
            return html.ToString();
        }

        /// <summary>
        /// Converts html into PDF using nReco dll and wkhtmltopdf.exe.
        /// </summary>        
        private byte[] ConvertHtmlToPDF()
        {
            HtmlToPdfConverter nRecohtmltoPdfObj = new HtmlToPdfConverter();
            nRecohtmltoPdfObj.Orientation = PageOrientation.Portrait;
            nRecohtmltoPdfObj.PageFooterHtml = CreatePDFFooter();
            nRecohtmltoPdfObj.CustomWkHtmlArgs = "--margin-top 35 --header-spacing 0 --margin-left 0 --margin-right 0";
            return nRecohtmltoPdfObj.GeneratePdf(CreatePDFScript() + ShowHtml() + "</body></html>");
        }
        private string CreatePDFScript()
        {
            return "<html><head><link href=\"http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all\" rel=\"stylesheet\" type=\"text/css\"><style>td,th{line-height:20px;} tr { page-break-inside: avoid } .invoice table {margin: 30px 0 30px;} .invoice .invoice-logo {margin-bottom: 2px;} .invoice .invoice-logo p { padding: 5px 0; font-size: 22px; line-height: 25px; text-align: left; } .invoice .invoice-logo p span { display: block; font-size: 13px; } .invoice .invoice-logo-space {margin-bottom: 15px;} .invoice .invoice-payment strong {margin-right: 5px;} .invoice .invoice-block {text-align: right;} .invoice .invoice-block .amounts { margin-top: 20px; font-size: 14px; }</style><script>function subst() {var vars={};var x=document.location.search.substring(1).split('&');for(var i in x) {var z=x[i].split('=',2);vars[z[0]] = unescape(z[1]);}" +
            "var x=['frompage','topage','page','webpage','section','subsection','subsubsection'];for(var i in x) {var y = document.getElementsByClassName(x[i]);" +
            "for(var j=0; j<y.length; ++j) y[j].textContent = vars[x[i]];}}</script></head><body onload=\"subst()\">";
        }
        private string CreatePDFFooter()
        {
            return "<div style='text-align:center;font-family:Tahoma; font-size:9px;'>Page <span class=\"page\"></span> of <span class=\"topage\"></span></div>";
        }
        private void WriteDocument(string fileName, string contentType, byte[] content)
        {
            HttpContext.Current.Response.Clear();
            Response.ContentType = contentType;
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.CacheControl = "No-cache";
            Response.BinaryWrite(content);
            Response.Flush();
            Response.SuppressContent = true;
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
    }
}