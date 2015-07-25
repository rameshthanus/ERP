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
    public partial class SearchList : System.Web.UI.Page
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
                    
                    case "CATEGORY":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Category obj_bel_Category = new bel_Category();
                            dal_Category obj_dal_Category = new dal_Category();
                            obj_bel_Category._iMode = imode;
                            using (ds = obj_dal_Category.dal_CategoryDetail(obj_bel_Category))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "CURRENCY":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Currency obj_bel_Currency = new bel_Currency();
                            dal_Currency obj_dal_Currency = new dal_Currency();
                            obj_bel_Currency._iMode = imode;
                            using (ds = obj_dal_Currency.dal_CurrencyDetail(obj_bel_Currency))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "PRODUCTGROUP":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_ProductGroup obj_bel_ProductGroup = new bel_ProductGroup();
                            dal_ProductGroup obj_dal_ProductGroup = new dal_ProductGroup();
                            obj_bel_ProductGroup._iMode = imode;
                            using (ds = obj_dal_ProductGroup.dal_ProductGroupDetail(obj_bel_ProductGroup))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "UOM":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_UOM obj_bel_UOM = new bel_UOM();
                            dal_UOM obj_dal_UOM = new dal_UOM();
                            obj_bel_UOM._iMode = imode;
                            using (ds = obj_dal_UOM.dal_UOMDetail(obj_bel_UOM))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "TAX":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Tax obj_bel_Tax = new bel_Tax();
                            dal_Tax obj_dal_Tax = new dal_Tax();
                            obj_bel_Tax._iMode = imode;
                            using (ds = obj_dal_Tax.dal_TAXDetail(obj_bel_Tax))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "Discount":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Discount obj_bel_Discount = new bel_Discount();
                            dal_Discount obj_dal_Discount = new dal_Discount();
                            obj_bel_Discount._iMode = imode;
                            using (ds = obj_dal_Discount.dal_DiscountDetail(obj_bel_Discount))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "BRANCH":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Branch obj_bel_Branch = new bel_Branch();
                            dal_Branch obj_dal_Branch = new dal_Branch();
                            obj_bel_Branch._iMode = imode;
                            using (ds = obj_dal_Branch.dal_Branchdetail(obj_bel_Branch))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "WAREHOUSE":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Warehouse obj_bel_Warehouse = new bel_Warehouse();
                            dal_Warehouse obj_dal_Warehouse = new dal_Warehouse();
                            obj_bel_Warehouse._iMode = imode;
                            using (ds = obj_dal_Warehouse.dal_WarehouseDetail(obj_bel_Warehouse))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;

                    case "CUSTOMER":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Customer obj_bel_Customer = new bel_Customer();
                            dal_Customer obj_dal_Customer = new dal_Customer();
                            obj_bel_Customer._iMode = imode;
                            using (ds = obj_dal_Customer.dal_Customerdetail(obj_bel_Customer))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "PRODUCT":
                        if (imode == "SEARCH" || imode == "DELETE")
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
                    case "TASK":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_Task obj_bel_Task = new bel_Task();
                            dal_Task obj_dal_Task = new dal_Task();
                            obj_bel_Task._iMode = imode;
                            using (ds = obj_dal_Task.dal_TaskDetail(obj_bel_Task))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;

                    case "JOB":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_JobCreation obj_bel_Job = new bel_JobCreation();
                            dal_JobCreation obj_dal_Job = new dal_JobCreation();
                            obj_bel_Job._iMode = imode;
                            using (ds = obj_dal_Job.dal_JobCreationDetail(obj_bel_Job))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "SUBTYPE":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_SubType obj_bel_SubType = new bel_SubType();
                            dal_SubType obj_dal_SubType = new dal_SubType();
                            obj_bel_SubType._iMode = imode;
                            using (ds = obj_dal_SubType.dal_SubTypeDetail(obj_bel_SubType))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "CHARTOFACCOUNTS":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_ChartOfAccounts obj_bel_ChartOfAccounts = new bel_ChartOfAccounts();
                            dal_ChartOfAccounts obj_dal_ChartOfAccounts = new dal_ChartOfAccounts();
                            obj_bel_ChartOfAccounts._iMode = imode;
                            using (ds = obj_dal_ChartOfAccounts.dal_ChartOfAccountsDetail(obj_bel_ChartOfAccounts))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "USERCREATION":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {
                            bel_UserCreation obj = new bel_UserCreation();
                            dal_UserCreation dal = new dal_UserCreation();
                            obj._iMode = imode;
                            using (ds = dal.dal_UserCreationdetail(obj))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;
                    case "SHIPPINGADDRESS":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {

                            bel_ShippingAddress obj_bel_shipping = new bel_ShippingAddress();
                            dal_ShippingAddress obj_dal_shipping = new dal_ShippingAddress();
                            obj_bel_shipping._iMode = imode;
                            using (ds = obj_dal_shipping.dal_ShippingDetail(obj_bel_shipping))
                            {
                                return Json.getjson_(ds.Tables[0]);
                            }
                        }
                        break;

                    case "COMPANY":
                        if (imode == "SEARCH" || imode == "DELETE")
                        {

                            bel_Company obj_bel_Company = new bel_Company();
                            dal_Company obj_dal_Company = new dal_Company();
                            obj_bel_Company._iMode = imode;
                            using (ds = obj_dal_Company.dal_Companydetail(obj_bel_Company))
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
        public static List<Dictionary<string, object>> Deletecall(string page_name, string id,string iMode)
        {
            DataSet ds = new DataSet();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = new Dictionary<string, object>();
            try
            {
                switch (page_name)
                {
                    
                    case "CATEGORY":
                        if (iMode == "Delete")
                        {
                            bel_Category obj_bel_Category = new bel_Category();
                            dal_Category obj_dal_Category = new dal_Category();
                            obj_bel_Category._iMode = "Delete";
                            obj_bel_Category._CategoryID = Convert.ToInt16(id);
                            using (ds = obj_dal_Category.dal_CategoryDetail(obj_bel_Category))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "CURRENCY":
                        if (iMode == "Delete")
                        {
                            bel_Currency obj_bel_Currency = new bel_Currency();
                            dal_Currency obj_dal_Currency = new dal_Currency();
                            obj_bel_Currency._iMode = "Delete";
                            obj_bel_Currency._CurrencyID = Convert.ToInt16(id);
                            using (ds = obj_dal_Currency.dal_CurrencyDetail(obj_bel_Currency))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "PRODUCTGROUP":
                        if (iMode == "Delete")
                        {
                            bel_ProductGroup obj_bel_ProductGroup = new bel_ProductGroup();
                            dal_ProductGroup obj_dal_ProductGroup = new dal_ProductGroup();
                            obj_bel_ProductGroup._iMode = "Delete";
                            obj_bel_ProductGroup._ProductGroupID = Convert.ToInt16(id);
                            using (ds = obj_dal_ProductGroup.dal_ProductGroupDetail(obj_bel_ProductGroup))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "UOM":
                        if (iMode == "Delete")
                        {
                            bel_UOM obj_bel_UOM = new bel_UOM();
                            dal_UOM obj_dal_UOM = new dal_UOM();
                            obj_bel_UOM._iMode = "Delete";
                            obj_bel_UOM._UOMID = Convert.ToInt32(id);
                            using (ds = obj_dal_UOM.dal_UOMDetail(obj_bel_UOM))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;

                    case "TAX":
                        if (iMode == "Delete")
                        {
                            bel_Tax obj_bel_Tax = new bel_Tax();
                            dal_Tax obj_dal_Tax = new dal_Tax();
                            obj_bel_Tax._iMode = "Delete";
                            obj_bel_Tax._TAXID = Convert.ToInt32(id);
                            using (ds = obj_dal_Tax.dal_TAXDetail(obj_bel_Tax))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;

                    case "Discount":
                        if (iMode == "Delete")
                        {
                            bel_Discount obj_bel_Discount = new bel_Discount();
                            dal_Discount obj_dal_Discount = new dal_Discount();
                            obj_bel_Discount._iMode = "Delete";
                            obj_bel_Discount._DiscountID = Convert.ToInt32(id);
                            using (ds = obj_dal_Discount.dal_DiscountDetail(obj_bel_Discount))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "BRANCH":
                        if (iMode == "Delete")
                        {
                            bel_Branch obj_bel_Branch = new bel_Branch();
                            dal_Branch obj_dal_Branch = new dal_Branch();
                            obj_bel_Branch._iMode = "Delete";
                            obj_bel_Branch._BranchID = Convert.ToInt32(id);
                            using (ds = obj_dal_Branch.dal_Branchdetail(obj_bel_Branch))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "WAREHOUSE":
                        if (iMode == "Delete")
                        {
                            bel_Warehouse obj_bel_Warehouse = new bel_Warehouse();
                            dal_Warehouse obj_dal_Warehouse = new dal_Warehouse();
                            obj_bel_Warehouse._iMode = "Delete";
                            obj_bel_Warehouse._WarehouseID = Convert.ToInt32(id);
                            using (ds = obj_dal_Warehouse.dal_WarehouseDetail(obj_bel_Warehouse))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;

                    case "CUSTOMER":
                        if (iMode == "Delete")
                        {
                            bel_Customer obj_bel_Customer = new bel_Customer();
                            dal_Customer obj_dal_Customer = new dal_Customer();
                            obj_bel_Customer._iMode = "Delete";
                            obj_bel_Customer._PartyID = Convert.ToInt32(id);
                            using (ds = obj_dal_Customer.dal_Customerdetail(obj_bel_Customer))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "PRODUCT":
                        if (iMode == "Delete")
                        {
                            bel_Product obj_bel_Product = new bel_Product();
                            dal_Product obj_dal_Product = new dal_Product();
                            obj_bel_Product._iMode = "Delete";
                            obj_bel_Product._ProductID = Convert.ToInt32(id);
                            using (ds = obj_dal_Product.dal_ProductDetail(obj_bel_Product))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;

                    case "TASK":
                        if (iMode == "Delete")
                        {
                            bel_Task obj_bel_Task = new bel_Task();
                            dal_Task obj_dal_Task = new dal_Task();
                            obj_bel_Task._iMode = "Delete";
                            obj_bel_Task._TaskListID = Convert.ToInt32(id);
                            using (ds = obj_dal_Task.dal_TaskDetail(obj_bel_Task))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "JOB":
                        if (iMode == "Delete")
                        {
                            bel_JobCreation obj_bel_Job = new bel_JobCreation();
                            dal_JobCreation obj_dal_Job = new dal_JobCreation();
                            obj_bel_Job._iMode = "Delete";
                            obj_bel_Job._JOBID = Convert.ToInt32(id);
                            using (ds = obj_dal_Job.dal_JobCreationDetail(obj_bel_Job))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "SUBTYPE":
                        if (iMode == "Delete")
                        {
                            bel_SubType obj_bel_SubType = new bel_SubType();
                            dal_SubType obj_dal_SubType = new dal_SubType();
                            obj_bel_SubType._iMode = "Delete";
                            obj_bel_SubType._SubTypeID = Convert.ToInt32(id);
                            using (ds = obj_dal_SubType.dal_SubTypeDetail(obj_bel_SubType))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;
                    case "CHARTOFACCOUNTS":
                        if (iMode == "Delete")
                        {
                            bel_ChartOfAccounts obj_bel_ChartOfAccounts = new bel_ChartOfAccounts();
                            dal_ChartOfAccounts obj_dal_ChartOfAccounts = new dal_ChartOfAccounts();
                            obj_bel_ChartOfAccounts._iMode = "Delete";
                            obj_bel_ChartOfAccounts._CHARTID = Convert.ToInt32(id);
                            using (ds = obj_dal_ChartOfAccounts.dal_ChartOfAccountsDetail(obj_bel_ChartOfAccounts))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;

                    case "USERCREATION":
                        if (iMode == "Delete")
                        {
                            bel_UserCreation obj = new bel_UserCreation();
                            dal_UserCreation dal = new dal_UserCreation();
                            obj._iMode = "Delete";
                            obj._UserID = Convert.ToInt32(id);
                            using (ds = dal.dal_UserCreationdetail(obj))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;

                    case "SHIPPINGADDRESS":
                        if (iMode == "Delete")
                        {
                            bel_ShippingAddress obj_bel_shipping = new bel_ShippingAddress();
                            dal_ShippingAddress obj_dal_shipping = new dal_ShippingAddress();
                            obj_bel_shipping._iMode = "Delete";
                            obj_bel_shipping._ShippingAddressID = Convert.ToInt32(id);
                            using (ds = obj_dal_shipping.dal_ShippingDetail(obj_bel_shipping))
                            {
                                row.Add("res", ds.Tables[0].Rows[0][0].ToString());
                                rows.Add(row);
                                return rows;
                            }
                        }
                        break;

                    case "COMPANY":
                        if (iMode == "Delete")
                        {
                            bel_Company obj = new bel_Company();
                            dal_Company dal = new dal_Company();
                            obj._iMode = "Delete";
                            obj._CompanyID = Convert.ToInt32(id);
                            using (ds = dal.dal_Companydetail(obj))
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