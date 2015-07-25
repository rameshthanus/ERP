using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using System.IO;
using System.ComponentModel;
using System.Drawing.Printing;

namespace Trident.Report
{
    public partial class Viewer : System.Web.UI.Page, ICallbackEventHandler
    {
        private string _reportName;
        private string _sessionPDFFileName;
        protected string iFrameURL;
        protected void Page_Load(object sender, EventArgs e)
        {
            _reportName = "ReportName";
            _sessionPDFFileName = Session.SessionID.ToString() + ".pdf";
            //Attach pdf to the iframe
            string url = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath + "Report/" + _sessionPDFFileName;
            iFrameURL = url;
            RegisterClientsCallBackReference();
            RegisterClientCallBackAfterPrint();
            if (!IsPostBack)
            {
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report/Report1.rdlc");
                Statement dsUsersInfo = new Statement();
                //UserInformation dsUsersInfo = new UserInformation();
                using (SqlConnection con = new SqlConnection("Data Source=BRENDAN;Initial Catalog=VertiasNEW;Integrated Security=false;uid=sa;pwd=ef"))
                {
                    con.Open();
                    string fd = @"select 
                    V.CompanyName,
                    V.Address1,
                    V.Address2+','+V.Address3 as Address,
                    V.City,
                    V.Country+'-'+V.PostalCode as Country,
                    P.PartyCode,
                    P.PartyName,
					P.Address1 as  PartyAddr1,
					P.Address2+','+P.Address3 as PartyAddr2,
					P.City as PartyCity,
                    I.InvoiceNo,
                    Convert(nvarchar,I.InvoiceDate,103) as InvoiceDate,
                      case 
                      when DATEDIFF(day,I.InvoiceDate,GETDATE())=0 then I.loc_amt 
                    else '0'
                     end as 'Current',
                      case  
                      when DATEDIFF(day,I.InvoiceDate,GETDATE())>0 and DATEDIFF(day,I.InvoiceDate,GETDATE())<=30 then I.loc_amt
                    else '0'
                     end as 'a30days',
                       case  
                      when DATEDIFF(day,I.InvoiceDate,GETDATE())>30 and DATEDIFF(day,I.InvoiceDate,GETDATE())<=60 then I.loc_amt
                    else '0'
                     end as 'a160days',
                        case  
                      when DATEDIFF(day,I.InvoiceDate,GETDATE())>60 and DATEDIFF(day,I.InvoiceDate,GETDATE())<=90 then I.loc_amt
                    else '0'
                     end as 'a90days',
                      case  
                      when DATEDIFF(day,I.InvoiceDate,GETDATE())>90  then I.loc_amt
                    else '0'
                     end as 'a120days',
                     I.loc_amt as DueAmt,
                    C.CurrencyName as Currency,
					B.BankName,
					B.BranchCode,
                    B.AccountNo,
                    B.SwiftCode
                     from dbo.aAR_Invoice I
                     inner join dbo.mParty P on P.PartyID=I.PartyID
                     inner join dbo.mCurrency C on C.CurrencyID=I.CurrencyID
                     inner join dbo.mCompanies V on v.CompanyID=I.CompanyID
					 inner join dbo.mBankDetail B on B.CompanyID=I.CompanyID
                      where  I.PostStatus='P' and
                       I.InvoiceID not in ( 
                    select distinct(D.InvoiceID) from dbo.aAR_Receipt_Detail D  
                    inner join dbo.aAR_Receipt R on R.ReceiptID=D.ReceiptID where R.PostStatus='P'
                     )
                    group by I.PartyID,
                    P.PartyCode,
                    P.PartyName,
                    I.InvoiceNo,
                    I.InvoiceDate,
                    I.doc_amt,
                    I.loc_amt,
                    C.CurrencyName,
                    V.CompanyName,
                    V.Address1,
                    V.Address2,
                    V.Address3,
                    V.City,
                    V.Country,
                    V.PostalCode,
					B.BankName,
					B.BranchCode,
                    B.AccountNo,
                    B.SwiftCode,
                    P.Address1,
					P.Address2,
					P.Address3,
					P.City";
                    SqlCommand cmd = new SqlCommand(fd, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dsUsersInfo, "DataTable1");
                    con.Close();
                }
                ReportDataSource datasource = new ReportDataSource("DataSet1", dsUsersInfo.Tables[1]);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
                ReportViewer1.ShowPrintButton = true;
                ReportViewer1.ShowRefreshButton = true;
                ReportViewer1.ShowZoomControl = true;
                ReportViewer1.ShowToolBar = true;
            }
        }
        protected void ShowPrintButton()
        {

            string script = "<SCRIPT LANGUAGE='JavaScript'> ";
            script += "showPrintButton()";
            script += "</SCRIPT>";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowStatus", "javascript:showPrintButton();showDatePicker();", true);

        }
        protected void rReportViewer1_ReportRefresh(object sender, CancelEventArgs e)
        {
            ShowPrintButton();
        }

        protected void SavePDF()
        {
            try
            {
                //string _reportPath = ConfigurationManager.AppSettings["ReportPath"];
                string _reportPath = Server.MapPath("~/Report/");
                Warning[] warnings;
                string[] streamids;
                string mimeType;
                string encoding;
                string extension;
                //ReportViewer1.LocalReport.ReportPath = _reportPath + _reportName;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report/Report1.rdlc");
                //ReportViewer1.ServerReport.ReportPath = Server.MapPath("~/Report.rdlc");
                byte[] bytes = ReportViewer1.LocalReport.Render("PDF", "", out mimeType, out encoding, out extension, out streamids, out warnings);
                //save the pdf byte to the folder
                if (!File.Exists(Server.MapPath("~/Report/" + _sessionPDFFileName)))
                {
                    using (StreamWriter sw = new StreamWriter(File.Create(Server.MapPath("~/Report/" + _sessionPDFFileName))))
                    {
                        sw.Write("");
                    }
                }
                FileStream fs = new FileStream(Server.MapPath("~/Report/" + _sessionPDFFileName), FileMode.Open);
                byte[] data = new byte[fs.Length];
                fs.Write(bytes, 0, bytes.Length);
                fs.Close();
            }
            catch (Exception lk)
            {

            }
        }
        public string AjaxCall(string name)
        {
            //var ajaxcall = Request.Form["ajaxcall"];
            if (name != null)
            {
                if (File.Exists(Server.MapPath("~/Report/" + _sessionPDFFileName)))
                {
                    frmPrint.Attributes["src"] = "";
                    File.Delete(Server.MapPath("~/Report/" + _sessionPDFFileName));
                }
                else
                {
                    SavePDF();
                }
            }
            return name;
        }

        string returnValue;

        string ICallbackEventHandler.GetCallbackResult()
        {
            return returnValue;
        }

        void ICallbackEventHandler.RaiseCallbackEvent(string eventArgument)
        {
            returnValue = AjaxCall(eventArgument);
        }

        private void RegisterClientsCallBackReference()
        {

            String myClientsCallBack = Page.ClientScript.GetCallbackEventReference(this, "arg", "ServerCallSucceeded", "context", "ServerCallFailed", true);
            //Could also call this wtihout the callback succeeded or failed methods:
            String myCompleteClientFunction = @"function CallServerMethodBeforePrint(arg, context)
                                      { " +
                                            myClientsCallBack + @"; 
                                      }";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "TheScriptToCallServer", myCompleteClientFunction, true);

        }

        private void RegisterClientCallBackAfterPrint()
        {
            String myClientAfterPrintCallBack = Page.ClientScript.GetCallbackEventReference(this, "arg", "ServerCallSucceededAfterPrint", "context", "ServerCallFailed", true);

            String myAfterPrintCompleteClientFunction = @"function CallServerAfterPrint(arg, context)
                                      { " +
                                            myClientAfterPrintCallBack + @"; 
                                      }";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "TheScriptToCallServerAfterPrint", myAfterPrintCompleteClientFunction, true);
        }
    }
}