using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using System.Text;
using System.Data;
using Trident.classes;


namespace Trident
{
    public partial class SearchListTransaction1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<Dictionary<string, object>> search_(string page_name, string imode)
        {
            DataSet ds = new DataSet();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = new Dictionary<string, object>();
            try
            {
                switch (page_name)
                {
                    case "PURCHASEORDER":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_PurchaseOrder obj_bel_PurchaseOrder=new bel_PurchaseOrder();
                            dal_PurchaseOrder obj_dal_PurchaseOrder = new dal_PurchaseOrder();
                            obj_bel_PurchaseOrder._iMode = imode;
                            using (ds = obj_dal_PurchaseOrder.dal_PurchaseOrderDetail(obj_bel_PurchaseOrder))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "QUOTATION":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Quotation obj_bel_Proforma = new bel_Quotation();
                            dal_Quotation obj_dal_Proforma = new dal_Quotation();
                            obj_bel_Proforma._iMode = imode;
                            using (ds = obj_dal_Proforma.dal_ProformaDetail(obj_bel_Proforma))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "SALESORDER":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Salesorder obj_bel_DC = new bel_Salesorder();
                            dal_Salesorder obj_dal_DC = new dal_Salesorder();
                            obj_bel_DC._iMode = imode;
                            using (ds = obj_dal_DC.dal_DCDetail(obj_bel_DC))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "SALESRETURN":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Salesreturn obj_bel_DC = new bel_Salesreturn();
                            dal_Salesreturn obj_dal_DC = new dal_Salesreturn();
                            obj_bel_DC._iMode = imode;
                            using (ds = obj_dal_DC.dal_SalesReturnDetail(obj_bel_DC))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "INDENT":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Indent obj_bel_Indent = new bel_Indent();
                            dal_Indent obj_dal_Indent = new dal_Indent();
                            obj_bel_Indent._iMode = imode;
                            using (ds = obj_dal_Indent.dal_IndentDetail(obj_bel_Indent))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "GTN":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_GTN obj_bel_GTN = new bel_GTN();
                            dal_GTN obj_dal_GTN = new dal_GTN();
                            obj_bel_GTN._iMode = imode;
                            using (ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "GRN":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_GRN obj_bel_GRN = new bel_GRN();
                            dal_GRN obj_dal_GRN = new dal_GRN();
                            obj_bel_GRN._iMode = imode;
                            using (ds = obj_dal_GRN.dal_GRNDetail(obj_bel_GRN))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "ARINVOICE":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_ARInvoice obj_bel_ARInvoice = new bel_ARInvoice();
                            dal_ARinvoice obj_dal_ARInvoice = new dal_ARinvoice();
                            obj_bel_ARInvoice._iMode = imode;
                            using (ds = obj_dal_ARInvoice.dal_ARInvoiceDetail(obj_bel_ARInvoice))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;

                    case "SALESDELIVERY":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_salesdelivery obj_bel_DC = new bel_salesdelivery();
                            dal_salesdelivery obj_dal_DC = new dal_salesdelivery();
                            obj_bel_DC._iMode = imode;
                            using (ds = obj_dal_DC.dal_SalesDeliveryDetail(obj_bel_DC))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;

                    case "APPAYMENT":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_APpayment obj_bel_APpayment = new bel_APpayment();
                            dal_APpayment obj_dal_APpayment = new dal_APpayment();
                            obj_bel_APpayment._iMode = imode;
                            using (ds = obj_dal_APpayment.dal_APpaymentDetail(obj_bel_APpayment))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;

                       
                    case "ARRECEIPT":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_ARReceipt obj_bel_ARReceipt = new bel_ARReceipt();
                            dal_ARReceipt obj_dal_ARReceipt = new dal_ARReceipt();
                            obj_bel_ARReceipt._iMode = imode;
                            using (ds = obj_dal_ARReceipt.dal_APReceiptDetail(obj_bel_ARReceipt))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;

                    case "ARCREDITNOTE":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_ARCreditNote obj_bel_CreditNote = new bel_ARCreditNote();
                            dal_ARCreditNote obj_dal_CreditNote = new dal_ARCreditNote();
                            obj_bel_CreditNote._iMode = imode;
                            using (ds = obj_dal_CreditNote.dal_ARCreditNoteDetail(obj_bel_CreditNote))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;

                    case "GLENTRY":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_GLEntry obj_bel_GLEntry = new bel_GLEntry();
                            dal_GLEntry obj_dal_GLEntry = new dal_GLEntry();
                            obj_bel_GLEntry._iMode = imode;
                            using (ds = obj_dal_GLEntry.dal_GLEntryDetail(obj_bel_GLEntry))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "APVOUCHER":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_APVoucher obj_bel_APVoucher = new bel_APVoucher();
                            dal_APVoucher obj_dal_APVoucher = new dal_APVoucher();
                            obj_bel_APVoucher._iMode = imode;
                            using (ds = obj_dal_APVoucher.dal_APVoucherDetail(obj_bel_APVoucher))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "PURCHASERETURN":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_PurchaseReturn obj = new bel_PurchaseReturn();
                            dal_PurchaseReturn dal = new dal_PurchaseReturn();
                            obj._iMode = imode;
                            using (ds = dal.dal_PurchaseReturnDetail(obj))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;

                }
                row.Add("res", "No Data");
                rows.Add(row);
                return rows;
            }
            catch (Exception ex)
            {
                row.Add("res", "exception");
                rows.Add(row);
                return rows;
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<Dictionary<string, object>> Deletecall(string page_name, string id, string iMode)
        {
            DataSet ds = new DataSet();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = new Dictionary<string, object>();
            try
            {
                switch (page_name)
                {
                    case "PURCHASEORDER":
                        if (iMode == "Delete")
                        {
                            bel_PurchaseOrder obj_bel_PurchaseOrder=new bel_PurchaseOrder();
                            dal_PurchaseOrder obj_dal_PurchaseOrder = new dal_PurchaseOrder();
                            obj_bel_PurchaseOrder._iMode = "Delete";
                            obj_bel_PurchaseOrder._PurchaseOrderID = Convert.ToInt16(id);
                            using (ds = obj_dal_PurchaseOrder.dal_PurchaseOrderDetail(obj_bel_PurchaseOrder))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;

                    case "QUOTATION":
                        if (iMode == "Delete")
                        {
                            bel_Quotation obj_bel_Proforma = new bel_Quotation();
                            dal_Quotation obj_dal_Proforma = new dal_Quotation();
                            obj_bel_Proforma._iMode = "Delete";
                            obj_bel_Proforma._ProformaID = Convert.ToInt16(id);
                            using (ds = obj_dal_Proforma.dal_ProformaDetail(obj_bel_Proforma))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;
                    case "SALESORDER":
                        if (iMode == "Delete")
                        {
                            bel_Salesorder obj_bel_DC = new bel_Salesorder();
                            dal_Salesorder obj_dal_DC = new dal_Salesorder();
                            obj_bel_DC._iMode = "Delete";
                            obj_bel_DC._DCID = Convert.ToInt16(id);
                            using (ds = obj_dal_DC.dal_DCDetail(obj_bel_DC))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;
                    case "SALESRETURN":
                        if (iMode == "Delete")
                        {
                            bel_Salesreturn obj_bel_DC = new bel_Salesreturn();
                            dal_Salesreturn obj_dal_DC = new dal_Salesreturn();
                            obj_bel_DC._iMode = "Delete";
                            obj_bel_DC._SalesReturnID = Convert.ToInt16(id);
                            using (ds = obj_dal_DC.dal_SalesReturnDetail(obj_bel_DC))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;
                    case "INDENT":
                        if (iMode == "Delete")
                        {
                            bel_Indent obj_bel_Indent = new bel_Indent();
                            dal_Indent obj_dal_Indent = new dal_Indent();
                            obj_bel_Indent._iMode = "Delete";
                            obj_bel_Indent._IndentID = Convert.ToInt16(id);
                            using (ds = obj_dal_Indent.dal_IndentDetail(obj_bel_Indent))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;
                    case "GTN":
                        if (iMode == "Delete")
                        {
                            bel_GTN obj_bel_GTN = new bel_GTN();
                            dal_GTN obj_dal_GTN = new dal_GTN();
                            obj_bel_GTN._iMode = "Delete";
                            obj_bel_GTN._GTNID = Convert.ToInt16(id);
                            using (ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;
                    case "GRN":
                        if (iMode == "Delete")
                        {
                            bel_GRN obj_bel_GRN = new bel_GRN();
                            dal_GRN obj_dal_GRN = new dal_GRN();
                            obj_bel_GRN._iMode = "Delete";
                            obj_bel_GRN._GRNID = Convert.ToInt16(id);
                            using (ds = obj_dal_GRN.dal_GRNDetail(obj_bel_GRN))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;

                    case "ARINVOICE":
                        if (iMode == "Delete")
                        {
                            bel_ARInvoice obj_bel_ARInvoice = new bel_ARInvoice();
                            dal_ARinvoice obj_dal_ARInvoice = new dal_ARinvoice();
                            obj_bel_ARInvoice._iMode = "Delete";
                            obj_bel_ARInvoice._InvoiceID = Convert.ToInt16(id);
                            using (ds = obj_dal_ARInvoice.dal_ARInvoiceDetail(obj_bel_ARInvoice))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;

                    case "SALESDELIVERY":
                        if (iMode == "Delete")
                        {
                            bel_salesdelivery obj_bel_DC = new bel_salesdelivery();
                            dal_salesdelivery obj_dal_DC = new dal_salesdelivery();
                            obj_bel_DC._iMode = "Delete";
                            obj_bel_DC._SalesdeliveryID = Convert.ToInt16(id);
                            using (ds = obj_dal_DC.dal_SalesDeliveryDetail(obj_bel_DC))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;

                    case "APPAYMENT":
                        if (iMode == "Delete")
                        {
                            bel_APpayment obj_bel_APpayment = new bel_APpayment();
                            dal_APpayment obj_dal_APpayment = new dal_APpayment();
                            obj_bel_APpayment._iMode = "Delete";
                            obj_bel_APpayment._PaymentID = Convert.ToInt16(id);
                            using (ds = obj_dal_APpayment.dal_APpaymentDetail(obj_bel_APpayment))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;
                    case "ARRECEIPT":
                        if (iMode == "Delete")
                        {
                            bel_ARReceipt obj_bel_ARReceipt = new bel_ARReceipt();
                            dal_ARReceipt obj_dal_ARReceipt = new dal_ARReceipt();
                            obj_bel_ARReceipt._iMode = "Delete";
                            obj_bel_ARReceipt._ReceiptID = Convert.ToInt16(id);
                            using (ds = obj_dal_ARReceipt.dal_APReceiptDetail(obj_bel_ARReceipt))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;
                    case "ARCREDITNOTE":
                        if (iMode == "Delete")
                        {
                            bel_ARCreditNote obj_bel_CreditNote = new bel_ARCreditNote();
                            dal_ARCreditNote obj_dal_CreditNote = new dal_ARCreditNote();
                            obj_bel_CreditNote._iMode = "Delete";
                            obj_bel_CreditNote._CreditNoteID = Convert.ToInt16(id);
                            using (ds = obj_dal_CreditNote.dal_ARCreditNoteDetail(obj_bel_CreditNote))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;

                    case "GLENTRY":
                        if (iMode == "Delete")
                        {
                            bel_GLEntry obj_bel_GLEntry = new bel_GLEntry();
                            dal_GLEntry obj_dal_GLEntry = new dal_GLEntry();
                            obj_bel_GLEntry._iMode = "Delete";
                            obj_bel_GLEntry._GLEntryID = Convert.ToInt16(id);
                            using (ds = obj_dal_GLEntry.dal_GLEntryDetail(obj_bel_GLEntry))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }

                        }
                        break;
                    case "APVOUCHER":
                        if (iMode == "Delete")
                        {
                            bel_APVoucher obj_bel_APVoucher = new bel_APVoucher();
                            dal_APVoucher obj_dal_APVoucher = new dal_APVoucher();
                            obj_bel_APVoucher._iMode = "Delete";
                            obj_bel_APVoucher._VoucherID = Convert.ToInt16(id);
                            using (ds = obj_dal_APVoucher.dal_APVoucherDetail(obj_bel_APVoucher))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "PURCHASERETURN":
                        if (iMode == "Delete")
                        {
                            bel_PurchaseReturn obj = new bel_PurchaseReturn();
                            dal_PurchaseReturn dal = new dal_PurchaseReturn();
                            obj._iMode = "Delete";
                            obj._PurchaseReturnID = Convert.ToInt16(id);
                            using (ds = dal.dal_PurchaseReturnDetail(obj))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;

                }
                row.Add("res", "No Data");
                rows.Add(row);
                return rows;
            }
            catch (Exception ex)
            {
                row.Add("res", "exception");
                rows.Add(row);
                return rows;
            }
        }
    }
}