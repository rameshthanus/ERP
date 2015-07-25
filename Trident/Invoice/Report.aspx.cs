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

namespace Trident.Invoice
{
    public partial class Report : System.Web.UI.Page
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
                        if (imode == "PRINT")
                        {
                            bel_PurchaseOrder obj_bel_PurchaseOrder = new bel_PurchaseOrder();
                            dal_PurchaseOrder obj_dal_PurchaseOrder = new dal_PurchaseOrder();
                            obj_bel_PurchaseOrder._iMode = imode;
                            using (ds = obj_dal_PurchaseOrder.dal_PurchaseOrderDetail(obj_bel_PurchaseOrder))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "QUOTATION":
                        if (imode == "PRINT")
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
                        if (imode == "PRINT")
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
                    case "PRODUCT":
                        if (imode == "PRINT")
                        {
                            bel_Product obj_bel_Product = new bel_Product();
                            dal_Product obj_dal_Product = new dal_Product();
                            obj_bel_Product._iMode = imode;
                            using (ds = obj_dal_Product.dal_ProductDetail(obj_bel_Product))
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
    }
}