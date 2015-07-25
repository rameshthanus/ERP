using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using System.Data;
using System.IO;


namespace Trident.Transaction
{
    public partial class GDN : System.Web.UI.Page
    {
        public decimal totalAmount = 0;
        public decimal totalFooterQty = 0;

        bel_GDN obj_bel_Gdn = new bel_GDN();
        dal_GDN obj_dal_Gdn = new dal_GDN();


        //public static DataTable Item_dt = new DataTable();
       // public static DataTable dt_pop = new DataTable();

        //int Row_Count = 0;
       // public static int row_index = 0;
        Common.CommonFunction obj_Common = new Common.CommonFunction();
        DataSet dsfetch = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Convert.ToInt32(Session["UserID"]) == 0)
                {
                    Response.Redirect("../SessionTimeout.aspx");
                }

                else
                {

                    if (!IsPostBack)
                    {
                        obj_Common.functionCheckActhorization("Delivery", "AssignAuthorization");
                        if (Common.CommonVariablesandmsg.ViewOnlyRights == "Y")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "calling", "cal_Readonly();", true);
                        }
                        if (Common.CommonVariablesandmsg.ViewRights == "N")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view this screen');", true);
                            Response.Redirect("../HomeContentPage.aspx");
                        }
                        else
                        {

                            termpopup.Show();
                            txtSearch.Attributes.Add("onkeypress", "return handleEnter('" + btnSearchPOP.ClientID + "', event)");
                            txtProductCode.Attributes.Add("onkeypress", "return handleEnter('" + Button1.ClientID + "', event)");
                            txtquantity.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                             txtRate.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                             txtWeight.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");

                             txtWeight.Text = "0";

                             txtGDNdate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");


                             btn_Supplier.Focus();
                           
                            functionbindcombo();
                            funGetAutoCode();
                            DataTable dt_pop = new DataTable();
                            dt_pop.Clear();
                            searchResult.DataSource = dt_pop;
                            searchResult.DataBind();
                            DataTable Item_dt = new DataTable();
                            Item_dt.Clear();
                            hfldid.Value = Request.QueryString["ID"];
                            if (hfldid.Value == string.Empty)
                            {
                                hfldid.Value = "0";
                            }
                            if (Item_dt.Columns.Count > 1)
                            {
                                

                            }

                            else
                            {
                                Item_dt.Columns.Add(new DataColumn("SNo", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ProductID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ProductCode", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("Description", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("ProductGroupID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("CategoryID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("CategoryName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("QualityID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DesignID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DesignName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("ColorID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ColorName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("SizeName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("SizeID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("UOMID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("UOMName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("Qty", typeof(decimal)));                              
                                Item_dt.Columns.Add(new DataColumn("Rate", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("Amount", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("Weight", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("GDNDetailID", typeof(Int32)));
                                
                              
                                Session["GDNItem_dt"] = Item_dt;
                                gridGDN.DataSource = Session["GDNItem_dt"] as DataTable;
                                gridGDN.DataBind();



                            }
                            if (hfldid.Value != "0" && hfldid.Value != string.Empty)
                            {
                                termpopup.Hide();

                                obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value);
                                functionfetcdata(obj_bel_Gdn);
                            }
                            else if (hfldid.Value == string.Empty)
                            {
                                hfldid.Value = "0";
                            }


                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        public static string GetImage(string value)
        {

            if (value == "N")
            {
                return "../Images/Pending3.png";
            }
            else
            {
                return "../Images/Completed.png";

            }


        }
        void funGetAutoCode()
        {
            try
            {

                string Year = string.Empty;
                string FromYear = string.Empty;
                string ToYear = string.Empty;
                string FromDate = string.Empty;
                string Todate = string.Empty;
                Year = Convert.ToString(Session["Year"]);
                string[] financialyear = Year.Split('-');
                FromYear = financialyear[0].Trim();
                ToYear = financialyear[1].Trim();
                FromDate = "04/01/" + FromYear;
                Todate = "03/31/" + ToYear;
                obj_bel_Gdn._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Gdn._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_Gdn._ScreenName = "GDN";
                obj_bel_Gdn._iMode = "AutoCode";
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            txtGDNNo.Text = ds.Tables[0].Rows[0][0].ToString();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funSupplierSelectedPOPUP()
        {
            try
            {
                obj_bel_Gdn._iMode = "SupplierSelectedIndex";
                obj_bel_Gdn._OrderID = Convert.ToInt32(DropOrder.SelectedValue.Trim());
                obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            // DropParty.SelectedValue = ds.Tables[0].Rows[0]["PartyID"].ToString();
                            // DropJobNo.SelectedValue = ds.Tables[0].Rows[0]["JOBID"].ToString();
                        }
                        if (ds.Tables[1].Rows.Count > 0)
                        {

                           
                            Session["GDNdt_pop"] = ds.Tables[1];
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();


                        }
                        else
                        {
                            DataTable dt = new DataTable();
                            Session["GDNdt_pop"] = dt;
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funSupplierSelectedPOPUP", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funProcessorSelectedPOPUP()
        {
            try
            {
                obj_bel_Gdn._iMode = "ProcessorSelectedIndex";
                obj_bel_Gdn._OrderID = Convert.ToInt32(DropOrder.SelectedValue.Trim());
                obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            // DropParty.SelectedValue = ds.Tables[0].Rows[0]["PartyID"].ToString();
                            //DropJobNo.SelectedValue = ds.Tables[0].Rows[0]["JOBID"].ToString();
                        }
                        if (ds.Tables[1].Rows.Count > 0)
                        {

                            
                            Session["GDNdt_pop"] = ds.Tables[1];
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();


                        }
                        else
                        {
                            DataTable dt = new DataTable();
                            Session["GDNdt_pop"] = dt;
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funProcessorSelectedPOPUP", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionfetcdata(bel_GDN obj_bel_Gdn)  //selected item will sow the corresponding text box
        {
            try
            {

                obj_bel_Gdn._iMode = "Fetch";
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["GDNID"] != null)
                            {
                                hfldid.Value = ds.Tables[0].Rows[0]["GDNID"].ToString();
                            }
                            if (ds.Tables[0].Rows[0]["GDNNo"] != null)
                            {

                                txtGDNNo.Text = ds.Tables[0].Rows[0]["GDNNo"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["GDNDate"] != null)
                            {

                                DateTime date = System.DateTime.Now;
                                date = Convert.ToDateTime(ds.Tables[0].Rows[0]["GDNDate"]);

                                txtGDNdate.Text = date.ToString("dd-MMM-yyyy");
                                

                            }

                            if (ds.Tables[0].Rows[0]["Type"] != null)
                            {


                                Session["GDNType"] = ds.Tables[0].Rows[0]["Type"].ToString();
                                funGDNTYPE();

                            }
                            if (ds.Tables[0].Rows[0]["PartyID"] != null)
                            {

                                DropParty.SelectedValue = ds.Tables[0].Rows[0]["PartyID"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["JOBID"] != null)
                            {

                                DropJobNo.SelectedValue = ds.Tables[0].Rows[0]["JOBID"].ToString();

                            }
                            

                           

                            if (ds.Tables[0].Rows[0]["OrderID"] != null)
                            {


                                DropOrder.SelectedValue = ds.Tables[0].Rows[0]["OrderID"].ToString();

                            }
                         

                            if (ds.Tables[0].Rows[0]["Status"] != null)
                            {


                              //  rblPaymenttype.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["FromWareHouseID"] != null)
                            {

                                
                                DropFromWarehouse.SelectedValue = ds.Tables[0].Rows[0]["FromWareHouseID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["WareHouseID"] != null)
                            {


                                DropWareHouse.SelectedValue = ds.Tables[0].Rows[0]["WareHouseID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["Through"] != null)
                            {


                                txtThrough.Text = ds.Tables[0].Rows[0]["Through"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["Remarks"] != null)
                            {


                                txtRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["ToBranchID"] != null)
                            {


                                HTOBranchID.Value = ds.Tables[0].Rows[0]["ToBranchID"].ToString();

                            }

                            
                            




                        }
                        if (ds.Tables[1].Rows.Count > 0)
                        {
                            
                     

                            Session["GDNItem_dt"] = ds.Tables[1];
                            gridGDN.DataSource = Session["GDNItem_dt"] as DataTable;
                            gridGDN.DataBind();

                            if (HGDNTYPE.Value == "S")
                            {
                                funSupplierSelectedPOPUP();
                            }
                            else if (HGDNTYPE.Value == "P")
                            {
                                funProcessorSelectedPOPUP();
                            }
                            else if (HGDNTYPE.Value == "G")
                            {
                               functionGeneralbindReceived();
                            }
                            else if (HGDNTYPE.Value == "D")
                            {
                                funDepartmentBind();
                            }

                        }

                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionfetcdata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionbindcombo()
        {
            try
            {


                obj_bel_Gdn._iMode = "ComboBind";
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {
                        
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            DropJobNo.DataValueField = "JOBID";
                            DropJobNo.DataTextField = "JOBCode";
                            DropJobNo.DataSource = ds.Tables[0];
                            DropJobNo.DataBind();
                            DropJobNo.SelectedIndex = 0;
                        }
                        if (ds.Tables[1].Rows.Count > 0)
                        {

                            DropDesign.DataValueField = "DesignID";
                            DropDesign.DataTextField = "DesignName";
                            DropDesign.DataSource = ds.Tables[1];
                            DropDesign.DataBind();
                            DropDesign.SelectedIndex = 0;
                        }

                        if (ds.Tables[2].Rows.Count > 0)
                        {
                            Dropcolour.DataValueField = "ColorID";
                            Dropcolour.DataTextField = "ColorName";
                            Dropcolour.DataSource = ds.Tables[2];
                            Dropcolour.DataBind();
                            Dropcolour.SelectedIndex = 0;
                        }
                        if (ds.Tables[3].Rows.Count > 0)
                        {

                            Dropsize.DataValueField = "SizeID";
                            Dropsize.DataTextField = "SizeName";
                            Dropsize.DataSource = ds.Tables[3];
                            Dropsize.DataBind();
                            Dropsize.SelectedIndex = 0;
                        }

                        if (ds.Tables[4].Rows.Count > 0)
                        {

                            DropUOM.DataValueField = "UOMID";
                            DropUOM.DataTextField = "UOMName";
                            DropUOM.DataSource = ds.Tables[4];
                            DropUOM.DataBind();
                            DropUOM.SelectedIndex = 0;
                        }
                        if (ds.Tables[5].Rows.Count > 0)
                        {

                            DropCategory.DataValueField = "CategoryID";
                            DropCategory.DataTextField = "CategoryName";
                            DropCategory.DataSource = ds.Tables[5];
                            DropCategory.DataBind();
                            DropCategory.SelectedIndex = 0;
                        }

                        if (ds.Tables[6].Rows.Count > 0)
                        {

                            DropWareHouse.DataValueField = "WarehouseID";
                            DropWareHouse.DataTextField = "WarehouseName";
                            DropWareHouse.DataSource = ds.Tables[6];
                            DropWareHouse.DataBind();
                            DropWareHouse.SelectedIndex = 0;  
                           
                        }
                        if (ds.Tables[7].Rows.Count > 0)
                        {


                            DropFromWarehouse.DataValueField = "WarehouseID";
                            DropFromWarehouse.DataTextField = "WarehouseName";
                            DropFromWarehouse.DataSource = ds.Tables[7];
                            DropFromWarehouse.DataBind();
                            DropFromWarehouse.SelectedIndex = 0;
                        }
                       

                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionbindcombo", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }


        void funBindValue(string ProductCode)
        {
            try
            {


                obj_bel_Gdn._ProductCode = ProductCode;
                obj_bel_Gdn._iMode = "ProductCode";
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {

                        if (ds.Tables[0].Rows.Count == 0)
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Inactive Item.');", true);
                            txtProductCode.Focus();

                        }
                        else if (ds.Tables[0].Rows[0][0].ToString() == "Exists")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Product Code Does not Exists.');", true);
                            txtProductCode.Focus();

                        }

                        else if (ds.Tables[0].Rows[0][1].ToString() != string.Empty)
                        {

                            hItemID.Value = ds.Tables[0].Rows[0]["ProductID"].ToString();
                            if (Convert.ToString(ds.Tables[0].Rows[0]["Description"].ToString()) != string.Empty)
                            {

                                txtDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["ProductCode"].ToString()) != string.Empty)
                            {

                                txtProductCode.Text = ds.Tables[0].Rows[0]["ProductCode"].ToString();
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["ProductGroupID"].ToString()) != string.Empty)
                            {

                                HProductGroupID.Value = ds.Tables[0].Rows[0]["ProductGroupID"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["CategoryID"].ToString()) != string.Empty)
                            {

                                DropCategory.SelectedValue = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["QualityID"].ToString()) != string.Empty)
                            {

                                HQualityID.Value = ds.Tables[0].Rows[0]["QualityID"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["DesignID"].ToString()) != string.Empty)
                            {

                                DropDesign.SelectedValue = ds.Tables[0].Rows[0]["DesignID"].ToString();
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["ColorID"].ToString()) != string.Empty)
                            {

                                Dropcolour.SelectedValue = ds.Tables[0].Rows[0]["ColorID"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["SizeID"].ToString()) != string.Empty)
                            {

                                Dropsize.SelectedValue = ds.Tables[0].Rows[0]["SizeID"].ToString();
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["UOMID"].ToString()) != string.Empty)
                            {

                                DropUOM.SelectedValue = ds.Tables[0].Rows[0]["UOMID"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["SalePrice"].ToString()) != string.Empty)
                            {

                                txtRate.Text = ds.Tables[0].Rows[0]["SalePrice"].ToString();

                            }
                            



                        }
                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funBindValue", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        void funAdditemtodatatable(int row)
        {
            try
            {
                DataTable Item_dt = Session["GDNItem_dt"] as DataTable;
                // CommonVariablesandmsg.Item_dt =(DataTable) Session["datatable_item"];

                int Row_Count = Convert.ToInt32(Session["GDNRow_Count"]);
                int row_index = Convert.ToInt32(Session["GDNrow_index"]);
                if (Item_dt.Rows.Count == 1)
                {

                    if (Convert.ToString(Item_dt.Rows[Row_Count]["ProductID"]) == string.Empty
                        && Convert.ToString(Item_dt.Rows[Row_Count]["DesignID"]) == string.Empty
                        && Convert.ToString(Item_dt.Rows[Row_Count]["UOMID"]) == string.Empty)
                    {
                        Item_dt.Rows[0].Delete();
                    }

                }

                if (Convert.ToString(hUpdateID.Value) == "0")
                {
                    DataRow dr;
                    dr = Item_dt.NewRow();
                    Item_dt.Rows.Add(dr);
                    Row_Count = Item_dt.Rows.Count - 1;
                    Item_dt.Rows[Row_Count]["ProductID"] = Convert.ToInt32(hItemID.Value);
                    Item_dt.Rows[Row_Count]["ProductCode"] = Convert.ToString(txtProductCode.Text);
                    Item_dt.Rows[Row_Count]["Description"] = Convert.ToString(txtDescription.Text);
                    Item_dt.Rows[Row_Count]["ProductGroupID"] = Convert.ToInt32(HProductGroupID.Value);
                    Item_dt.Rows[Row_Count]["CategoryID"] = Convert.ToInt32(DropCategory.SelectedValue);
                    Item_dt.Rows[Row_Count]["CategoryName"] = Convert.ToString(DropCategory.SelectedItem);
                    Item_dt.Rows[Row_Count]["QualityID"] = Convert.ToInt32(HQualityID.Value);
                    Item_dt.Rows[Row_Count]["DesignID"] = Convert.ToInt32(DropDesign.SelectedValue);
                    Item_dt.Rows[Row_Count]["DesignName"] = Convert.ToString(DropDesign.SelectedItem);
                    Item_dt.Rows[Row_Count]["ColorID"] = Convert.ToInt32(Dropcolour.SelectedValue);
                    Item_dt.Rows[Row_Count]["ColorName"] = Convert.ToString(Dropcolour.SelectedItem);
                    Item_dt.Rows[Row_Count]["SizeName"] = Convert.ToString(Dropsize.SelectedItem);
                    Item_dt.Rows[Row_Count]["SizeID"] = Convert.ToInt32(Dropsize.SelectedValue);
                    Item_dt.Rows[Row_Count]["UOMName"] = Convert.ToString(DropUOM.SelectedItem);
                    Item_dt.Rows[Row_Count]["UOMID"] = Convert.ToInt32(DropUOM.SelectedValue);
                    Item_dt.Rows[Row_Count]["Qty"] = Convert.ToDecimal(txtquantity.Text);
                    Item_dt.Rows[Row_Count]["Rate"] = Convert.ToDecimal(txtRate.Text);
                    Item_dt.Rows[Row_Count]["Weight"] = Convert.ToDecimal(txtWeight.Text);
                    Item_dt.Rows[Row_Count]["Amount"] = Convert.ToDecimal(Amt.Value);

                    Item_dt.Rows[Row_Count]["GDNDetailID"] = "0";

                    for (int i = 0; i <= Item_dt.Rows.Count - 1; i++)
                    {
                        Item_dt.Rows[i]["SNo"] = i + 1;

                    }

                    Session["GDNItem_dt"] = Item_dt;
                    gridGDN.DataSource = Session["GDNItem_dt"] as DataTable;
                    gridGDN.DataBind();

                }
                else if (Convert.ToString(hUpdateID.Value) == "1")
                {

                    Item_dt.Rows[row_index]["ProductID"] = Convert.ToInt32(hItemID.Value);
                    Item_dt.Rows[row_index]["ProductCode"] = Convert.ToString(txtProductCode.Text);
                    Item_dt.Rows[row_index]["Description"] = Convert.ToString(txtDescription.Text);
                    Item_dt.Rows[row_index]["ProductGroupID"] = Convert.ToInt32(HProductGroupID.Value);
                    Item_dt.Rows[row_index]["CategoryID"] = Convert.ToInt32(DropCategory.SelectedValue);
                    Item_dt.Rows[row_index]["CategoryName"] = Convert.ToString(DropCategory.SelectedItem);
                    Item_dt.Rows[row_index]["QualityID"] = Convert.ToInt32(HQualityID.Value);
                    Item_dt.Rows[row_index]["DesignID"] = Convert.ToInt32(DropDesign.SelectedValue);
                    Item_dt.Rows[row_index]["DesignName"] = Convert.ToString(DropDesign.SelectedItem);
                    Item_dt.Rows[row_index]["ColorID"] = Convert.ToInt32(Dropcolour.SelectedValue);
                    Item_dt.Rows[row_index]["ColorName"] = Convert.ToString(Dropcolour.SelectedItem);
                    Item_dt.Rows[row_index]["SizeName"] = Convert.ToString(Dropsize.SelectedItem);
                    Item_dt.Rows[row_index]["SizeID"] = Convert.ToInt32(Dropsize.SelectedValue);
                    Item_dt.Rows[row_index]["UOMName"] = Convert.ToString(DropUOM.SelectedItem);
                    Item_dt.Rows[row_index]["UOMID"] = Convert.ToInt32(DropUOM.SelectedValue);
                    Item_dt.Rows[row_index]["Qty"] = Convert.ToDecimal(txtquantity.Text);
                    Item_dt.Rows[row_index]["Rate"] = Convert.ToDecimal(txtRate.Text);
                    Item_dt.Rows[row_index]["Weight"] = Convert.ToDecimal(txtWeight.Text);
                    Item_dt.Rows[row_index]["Amount"] = Convert.ToDecimal(Amt.Value);
                    

                    hUpdateID.Value = "0";

                    Session["GDNItem_dt"] = Item_dt;
                    gridGDN.DataSource = Session["GDNItem_dt"] as DataTable;
                    gridGDN.DataBind();

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funAdditemtodatatable", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        public void functioncleardata()
        {
            try
            {

                hfldid.Value = "0";
                hItemID.Value = "0";
                Session["HeaderID"] = "0";
                HProductGroupID.Value = "0";
                HQualityID.Value = "0";
                txtGDNNo.Text = string.Empty;
                txtWeight.Text = "0";
                txtGDNdate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");
                DropJobNo.SelectedIndex = 0;
                DropFromWarehouse.SelectedIndex = 0;
                DropWareHouse.SelectedIndex = 0;
                             
                txtProductCode.Text = string.Empty;
                DropDesign.SelectedIndex = 0;
                Dropsize.SelectedIndex = 0;
                DropCategory.SelectedIndex = 0;
                txtquantity.Text = string.Empty;                
                txtAmount.Text = string.Empty;               
                txtDescription.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropUOM.SelectedIndex = 0;
                txtWeight.Text = string.Empty;
                txtRate.Text = string.Empty;
                txtRemarks.Text = string.Empty;
                txtThrough.Text = string.Empty;
                HTotalQty.Value = "0";
                HTotalAmount.Value = "0";

                DataTable dt = new DataTable();
                Session["GDNdt_pop"] = dt;
                searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                searchResult.DataBind();

                funInitialDataTable();

                funGetAutoCode();
                txtProductCode.Focus();

                if (Session["GDNType"].ToString() == "S" || Session["GDNType"].ToString() == "P")
                {
                    DropOrder.SelectedIndex = 0;
                    DropParty.SelectedIndex = 0;
                }
                else if (Session["GDNType"].ToString() == "G")
                {
                    functionGeneralbindReceived();
                    DropParty.SelectedIndex = 0;
                }
                else if (Session["GDNType"].ToString() == "D")
                {
                    funDepartmentBind();
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functioncleardata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funInitialDataTable()
        {
            DataTable Item_dt = new DataTable();



            if (Item_dt.Columns.Count > 1)
            {


            }

            else
            {
                Item_dt.Columns.Add(new DataColumn("SNo", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ProductID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ProductCode", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("Description", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("ProductGroupID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("CategoryID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("CategoryName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("QualityID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DesignID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DesignName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("ColorID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ColorName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("SizeName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("SizeID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("UOMID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("UOMName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("Qty", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("Rate", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("Amount", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("Weight", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("GDNDetailID", typeof(Int32)));


                Session["GDNItem_dt"] = Item_dt;
                gridGDN.DataSource = Session["GDNItem_dt"] as DataTable;
                gridGDN.DataBind();



            }
        }
        void funItemSaveClearData()
        {
            try
            {

                txtProductCode.Text = string.Empty;
                DropDesign.SelectedIndex = 0;
                Dropsize.SelectedIndex = 0;
                txtquantity.Text = string.Empty;
                
                txtAmount.Text = string.Empty;
                
                txtDescription.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropUOM.SelectedIndex = 0;
                DropCategory.SelectedIndex = 0;
                txtRate.Text = string.Empty;
                txtWeight.Text = "0";
                txtquantity.Text = string.Empty;

                hItemID.Value = "0";
                
                HProductGroupID.Value = "0";
                HQualityID.Value = "0";
                txtProductCode.Focus();

            }
            catch (Exception ex)
            {

            }
        }
        string funGetAutoCodeDuplicate()
        {
            try
            {

                string Year = string.Empty;
                string FromYear = string.Empty;
                string ToYear = string.Empty;
                string FromDate = string.Empty;
                string Todate = string.Empty;
                Year = Convert.ToString(Session["Year"]);
                string[] financialyear = Year.Split('-');
                FromYear = financialyear[0].Trim();
                ToYear = financialyear[1].Trim();
                FromDate = "04/01/" + FromYear;
                Todate = "03/31/" + ToYear;
                obj_bel_Gdn._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Gdn._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_Gdn._ScreenName = "GDN";
                obj_bel_Gdn._iMode = "AutoCode";
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                          return ds.Tables[0].Rows[0][0].ToString();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
            return "0";
        }

        Boolean CheckDuplicatecustomer()
        {


            obj_bel_Gdn._GDNNo = funGetAutoCodeDuplicate();
            obj_bel_Gdn._iMode = "Duplicate";
            obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value);


            using (DataSet dsUom = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
            {
               
                if (dsUom.Tables[0].Rows[0][0].ToString() == "0")
                {
                    if (gridGDN.Rows.Count > 0)
                    {
                        return false;
                    }
                    
                }
                
            }
            return true;
        }




        void functionSaverecord() //Save the record to the table
        {
            try
            {
                if (CheckDuplicatecustomer() == false)
                {
                    if (hfldid.Value == "0")
                    {
                        obj_bel_Gdn._iMode = "Insert";

                        funAutoGentration();
                    }
                    else
                    {
                        obj_bel_Gdn._iMode = "Update";


                    }


                    obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value);
                    obj_bel_Gdn._Type = Session["GDNType"].ToString();
                    


                    if (DropParty.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._PartyID = Convert.ToInt32(DropParty.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Gdn._PartyID = 0;
                    }


                    if (txtGDNdate.Text.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._GDNDate = Convert.ToDateTime(txtGDNdate.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Gdn._GDNDate = System.DateTime.Now;
                    }


                    if (DropJobNo.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Gdn._JOBID = 0;
                    }




                    if (DropWareHouse.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._WareHouseID = Convert.ToInt32(DropWareHouse.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Gdn._WareHouseID = 0;
                    }


                    if (DropFromWarehouse.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Gdn._FromWareHouseID = 0;
                    }


                    if (DropOrder.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._OrderID = Convert.ToInt32(DropOrder.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Gdn._OrderID = 0;
                    }

                   

                    if (txtThrough.Text.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._Through = Convert.ToString(txtThrough.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Gdn._Through = string.Empty;
                    }


                    if (txtRemarks.Text.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._Remarks = Convert.ToString(txtRemarks.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Gdn._Remarks = string.Empty;
                    }
                    

                    if (HTotalAmount.Value.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._TotalAmount = Convert.ToDecimal(HTotalAmount.Value);
                    }
                    else
                    {
                        obj_bel_Gdn._TotalAmount = 0;
                    }

                    if (HTotalQty.Value.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._TotalQty = Convert.ToDecimal(HTotalQty.Value);
                    }
                    else
                    {
                        obj_bel_Gdn._TotalQty = 0;
                    }
                    if (HTOBranchID.Value.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._ToBranchID = Convert.ToInt32(HTOBranchID.Value);
                    }
                    else
                    {
                        obj_bel_Gdn._ToBranchID = 0;
                    }

                    if (txtGDNNo.Text.Trim() != string.Empty)
                    {


                        obj_bel_Gdn._GDNNo = Convert.ToString(txtGDNNo.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Gdn._GDNNo = string.Empty;
                    }
                    int result = 0;
                    obj_bel_Gdn._Status ="P";
                   // DataTable dt_new = new DataTable();
                    Session["GDNItem_dt"] = funcSUMDuplicateValue();
                    result = obj_dal_Gdn.dal_GDNInsert(obj_bel_Gdn, Session["GDNItem_dt"] as DataTable);


                    if (result.ToString() == "1" || result.ToString() == "2" || result.ToString() == "3" || result.ToString() == "4")
                    {

                        //functioncleardata();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Saved Successfully');", true);

                        hfldid.Value = Convert.ToString(Session["HeaderID"]);
                        obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value);
                        functioncleardata();
                        functionfetcdata(obj_bel_Gdn);
                        
                    }
                }

                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('GDN Number Already Exists or Please enter the atleast one item.');", true);
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionSaverecord", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        public DataTable funcSUMDuplicateValue()
        {
            DataTable dt = new DataTable();
            try
            {

                DataTable Item_dt = Session["GDNItem_dt"] as DataTable;

                var result = Item_dt.AsEnumerable()
                            .GroupBy(r => new
                            {

                                ProductID = r.Field<Int32>("ProductID"),
                                ProductCode = r.Field<String>("ProductCode"),                          
                                
                               
                                ProductGroupID = r.Field<Int32>("ProductGroupID"),
                                CategoryID = r.Field<Int32>("CategoryID"),
                                QualityID = r.Field<Int32>("QualityID"),
                                DesignID = r.Field<Int32>("DesignID"),
                                ColorID = r.Field<Int32>("ColorID"),
                                SizeID = r.Field<Int32>("SizeID"),
                                Rate = r.Field<decimal>("Rate"),


                            })
                            .Select(g =>
                            {
                                var row = g.First();
                                row.SetField("Qty", g.Sum(r => r.Field<decimal>("Qty")));
                                row.SetField("Weight", g.Sum(r => r.Field<decimal>("Weight")));
                                row.SetField("Amount", g.Sum(r => r.Field<decimal>("Amount")));
                                return row;
                            }).CopyToDataTable();

                dt = result;

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funcSUMDuplicateValue", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
            return dt;
        }
        void funAutoGentration()
        {
            try
            {

                string Year = string.Empty;
                string FromYear = string.Empty;
                string ToYear = string.Empty;
                string FromDate = string.Empty;
                string Todate = string.Empty;
                Year = Year = Convert.ToString(Session["Year"]);
                string[] financialyear = Year.Split('-');
                FromYear = financialyear[0].Trim();
                ToYear = financialyear[1].Trim();
                FromDate = "04/01/" + FromYear;
                Todate = "03/31/" + ToYear;
                obj_bel_Gdn._ScreenName = "GDN";
                obj_bel_Gdn._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Gdn._BillToDate = Convert.ToDateTime(Todate);
                using (DataSet ds = obj_dal_Gdn.dal_AutoGen(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0][0].ToString() == "Error" || ds.Tables[0].Rows[0][0].ToString() == "Date Error")
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please verify your system date or Financial year in login page');", true);

                            }
                            else
                            {

                                txtGDNNo.Text = ds.Tables[0].Rows[0][0].ToString();

                            }

                        }
                    }

                }

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funGentrateAutogen", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void gridGDN_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                DataTable Item_dt = Session["GDNItem_dt"] as DataTable;

                if (e.CommandName.ToUpper() == "DELETEROW")
                {
                    
                        //get the row index then only you get selected row id
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;

                        if (Convert.ToString(gridGDN.DataKeys[row.RowIndex]["GDNDetailID"].ToString()) != "0")
                        {

                            if (Common.CommonVariablesandmsg.DeleteRigts == "Y")
                            {

                            obj_bel_Gdn._GDNDetailID = Convert.ToInt32(gridGDN.DataKeys[row.RowIndex]["GDNDetailID"].ToString());
                            obj_bel_Gdn._iMode = "ItemDelete";
                            using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                            {


                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        if (ds.Tables[0].Rows[0][0].ToString() == "1")
                                        {
                                            Item_dt.Rows[d].Delete();
                                            Item_dt.AcceptChanges();
                                            Session["GDNItem_dt"] = Item_dt;
                                            gridGDN.DataSource = Session["GDNItem_dt"] as DataTable;
                                            gridGDN.DataBind();
                                            
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Deleted Successfully');", true);
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Delete this screen');", true);


                        }
                        }

                        else
                        {
                            Item_dt.Rows[d].Delete();
                            Item_dt.AcceptChanges();
                            if (Item_dt.Rows.Count == 0)
                            {
                                Item_dt.Clear();
                                DataRow dr;
                                dr = Item_dt.NewRow();
                                Item_dt.Rows.Add(dr);
                                Session["GDNItem_dt"] = Item_dt;
                                gridGDN.DataSource = Session["GDNItem_dt"] as DataTable;
                                gridGDN.DataBind();

                            }
                            else
                            {
                                Session["GDNItem_dt"] = Item_dt;
                                gridGDN.DataSource = Session["GDNItem_dt"] as DataTable;
                                gridGDN.DataBind();

                            }

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Deleted Successfully');", true);
                        }
                   

                }
                if (e.CommandName.ToUpper() == "EDITROW")
                {
                   
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;
                        if (Convert.ToString(gridGDN.DataKeys[row.RowIndex]["GDNDetailID"].ToString()) != "0")
                        {
                            if (Common.CommonVariablesandmsg.EditRigts == "Y")
                            {

                            obj_bel_Gdn._GDNDetailID = Convert.ToInt32(Convert.ToInt32(gridGDN.DataKeys[row.RowIndex]["GDNDetailID"].ToString()));
                            obj_bel_Gdn._ProductID = Convert.ToInt32(Item_dt.Rows[d]["ProductID"].ToString());
                            obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value);
                            if (Convert.ToString(DropOrder.SelectedValue) != "0" && Convert.ToString(DropOrder.SelectedValue) != string.Empty)
                            {
                                obj_bel_Gdn._OrderID = Convert.ToInt32(DropOrder.SelectedValue);
                            }
                            if (Convert.ToString(DropFromWarehouse.SelectedValue) != "0" && Convert.ToString(DropFromWarehouse.SelectedValue) != string.Empty)
                            {
                                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);
                            }
                            obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                            if (Convert.ToString(HGDNTYPE.Value) == "S")
                            {
                                obj_bel_Gdn._iMode = "GetAvailableQty";
                                funGetAvailableQty(obj_bel_Gdn);
                            }
                            else if (Convert.ToString(HGDNTYPE.Value) == "P")
                            {
                                obj_bel_Gdn._iMode = "GetAvailableQtyProcessor";
                                funGetAvailableQty(obj_bel_Gdn);
                            }
                            else if (Convert.ToString(HGDNTYPE.Value) == "G")
                            {
                                obj_bel_Gdn._iMode = "GetAvailableQtyGentral";
                                funGetAvailableQty(obj_bel_Gdn);
                            }
                            else if (Convert.ToString(HGDNTYPE.Value) == "D")
                            {
                                obj_bel_Gdn._iMode = "GetAvailableQtyTransfer";
                                funGetAvailableQty(obj_bel_Gdn);
                            }                            

                            txtProductCode.Text = Item_dt.Rows[d]["ProductCode"].ToString();
                            hItemID.Value = Item_dt.Rows[d]["ProductID"].ToString();
                            txtDescription.Text = Convert.ToString(Item_dt.Rows[d]["Description"]);
                            HProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["ProductGroupID"]);
                            HQualityID.Value = Convert.ToString(Item_dt.Rows[d]["QualityID"]);
                            DropCategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["CategoryID"]);
                            DropDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DesignID"]);
                            Dropcolour.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ColorID"]);
                            DropUOM.SelectedValue = Convert.ToString(Item_dt.Rows[d]["UOMID"]);
                            Dropsize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["SizeID"]);
                            txtquantity.Text = Convert.ToString(Item_dt.Rows[d]["Qty"]);
                            
                            txtRate.Text = Convert.ToString(Item_dt.Rows[d]["Rate"]);
                            txtAmount.Text = Convert.ToString(Item_dt.Rows[d]["Amount"]);
                            txtWeight.Text = Convert.ToString(Item_dt.Rows[d]["Weight"]);
                            
                            Amt.Value = Convert.ToString(Item_dt.Rows[d]["Amount"]);

                            hUpdateID.Value = "1";
                            Session["GDNrow_index"] = d;
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);

                        }
                        }
                        else
                        {
                            obj_bel_Gdn._ProductID = Convert.ToInt32(Item_dt.Rows[d]["ProductID"].ToString());
                            obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value);
                            if (Convert.ToString(DropOrder.SelectedValue) != "0" && Convert.ToString(DropOrder.SelectedValue) != string.Empty)
                            {
                                obj_bel_Gdn._OrderID = Convert.ToInt32(DropOrder.SelectedValue);
                            }
                            if (Convert.ToString(DropFromWarehouse.SelectedValue) != "0" && Convert.ToString(DropFromWarehouse.SelectedValue) != string.Empty)
                            {
                                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);
                            }
                            obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                            if (Convert.ToString(HGDNTYPE.Value) == "S")
                            {
                                obj_bel_Gdn._iMode = "GetAvailableQty";
                                funGetAvailableQty(obj_bel_Gdn);
                            }
                            else if (Convert.ToString(HGDNTYPE.Value) == "P")
                            {
                                obj_bel_Gdn._iMode = "GetAvailableQtyProcessor";
                                 funGetAvailableQty(obj_bel_Gdn);
                            }
                            else if (Convert.ToString(HGDNTYPE.Value) == "G")
                            {
                                obj_bel_Gdn._iMode = "GetAvailableQtyGentral";
                                funGetAvailableQty(obj_bel_Gdn);
                            }
                            else if (Convert.ToString(HGDNTYPE.Value) == "D")
                            {
                                obj_bel_Gdn._iMode = "GetAvailableQtyTransfer";
                                funGetAvailableQty(obj_bel_Gdn);
                            }
                            txtProductCode.Text = Item_dt.Rows[d]["ProductCode"].ToString();
                            hItemID.Value = Item_dt.Rows[d]["ProductID"].ToString();
                            txtDescription.Text = Convert.ToString(Item_dt.Rows[d]["Description"]);
                            HProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["ProductGroupID"]);
                            HQualityID.Value = Convert.ToString(Item_dt.Rows[d]["QualityID"]);
                            DropCategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["CategoryID"]);
                            DropDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DesignID"]);
                            Dropcolour.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ColorID"]);
                            DropUOM.SelectedValue = Convert.ToString(Item_dt.Rows[d]["UOMID"]);
                            Dropsize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["SizeID"]);
                            txtquantity.Text = Convert.ToString(Item_dt.Rows[d]["Qty"]);
                          
                            txtRate.Text = Convert.ToString(Item_dt.Rows[d]["Rate"]);
                            txtWeight.Text = Convert.ToString(Item_dt.Rows[d]["Weight"]);
                            txtAmount.Text = Convert.ToString(Item_dt.Rows[d]["Amount"]);
                            Amt.Value = Convert.ToString(Item_dt.Rows[d]["Amount"]);
                            hUpdateID.Value = "1";
                            Session["GDNrow_index"] = d;


                        }


                    
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:gridGDN_RowCommand", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funGetAvailableQty(bel_GDN obj_bel_Gdn)
        {
            try
            {
                decimal AviQty = 0;
                decimal Qty = 0;
                decimal TotalAviQty = 0;

                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    

                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            AviQty = Convert.ToDecimal(ds.Tables[0].Rows[0]["AviQty"].ToString());
                        }
                        if (ds.Tables[1].Rows.Count > 0)
                        {
                            Qty = Convert.ToDecimal(ds.Tables[1].Rows[0]["Qty"].ToString());
                        }

                        TotalAviQty = AviQty + Qty;
                        HAvilableQty.Value = Convert.ToString(TotalAviQty);
                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funGetAvailableQty", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        public decimal GetTotalAmount()
        {
            HTotalAmount.Value = Convert.ToString(totalAmount);
            return totalAmount;
        }
        public decimal GetTotalQty()
        {
            HTotalQty.Value = Convert.ToString(totalFooterQty);
            return totalFooterQty;
        }


        protected void gridGDN_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Separator)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                decimal salary = (decimal)rowView["Amount"];
                decimal fqty = (decimal)rowView["Qty"];
                totalAmount += salary;
                totalFooterQty += fqty;
            }
        }
      
       
        protected void btnLoad_Click(object sender, EventArgs e)
        {
            try
            {

                string ProductCode = string.Empty;

                ProductCode = txtProductCode.Text.Trim();
                txtProductCode.Focus();
                funBindValue(ProductCode);
                txtProductCode.Focus();

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:btnLoad_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void ItemSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Common.CommonVariablesandmsg.SaveRigts == "Y")
                {

                    int i = 0;

                    funAdditemtodatatable(i);
                    funItemSaveClearData();
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Save this screen');", true);


                }




            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:ItemSave_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (hfldid.Value == "0")
                {
                    if (Common.CommonVariablesandmsg.SaveRigts == "Y")
                    {

                        obj_bel_Gdn._iMode = "Insert";
                        functionSaverecord();
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Save this screen');", true);


                    }
                }
                else
                {
                    if (Common.CommonVariablesandmsg.EditRigts == "Y")
                    {
                        obj_bel_Gdn._iMode = "Update";
                        functionSaverecord();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);


                    }


                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:Save_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {
                if (Common.CommonVariablesandmsg.ViewRights == "Y")
                {
                    Response.Redirect("../SearchListTransaction.aspx?pg=GDN");
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view this screen');", true);


                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:Search_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            functioncleardata();
            funItemSaveClearData();
        }

        protected void Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HomeContentPage.aspx");
        }




        void funBindGridPopup(string ProductCode, string iMode)
        {
            try
            {


                obj_bel_Gdn._ProductCode = ProductCode;
                obj_bel_Gdn._iMode = iMode;
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {

                        if (ds.Tables[0].Rows.Count == 0)
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Inactive Item.');", true);
                            txtProductCode.Focus();


                        }
                        else if (ds.Tables[0].Rows[0][0].ToString() == "Exists")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('There is no stock.');", true);
                            txtProductCode.Focus();

                        }

                        else if (ds.Tables[0].Rows[0][1].ToString() != string.Empty)
                        {
                            Session["GDNdt_pop"] = ds.Tables[0];
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();

                        }
                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funBindGridPopup", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                string ItemCode = string.Empty;
                string Barcode = string.Empty;
                if (Convert.ToString(txtProductCode.Text) != string.Empty)
                {
                    ItemCode = Convert.ToString(txtProductCode.Text);
                }
                //funBindGridPopup(ItemCode, "GridPopup");
                txtSearch.Text = txtProductCode.Text.Trim();
                funFilterProductCode();
              
                mpe.Show();
               




            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:Button1_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

       

        protected void searchResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToUpper() == "EDITROW")
                {

                    string ProductCode = string.Empty;

                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResult.DataKeys[row.RowIndex]["ProductCode"].ToString()) != "0")
                    {
                        ProductCode = Convert.ToString(searchResult.DataKeys[row.RowIndex]["ProductCode"].ToString());

                        Label chkIslblQty = (Label)(searchResult.Rows[row.RowIndex].FindControl("lblQty"));
                        HAvilableQty.Value = Convert.ToString(chkIslblQty.Text);

                        txtProductCode.Text = ProductCode;
                        funBindValue(ProductCode);
                        mpe.Hide();
                        txtquantity.Focus();
                        








                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:searchResult_RowCommand", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        protected void btnSearchPOP_Click(object sender, EventArgs e)
        {
            funFilterProductCode();
        }
        void funFilterProductCode()
        {
            try
            {
                DataTable dt_pop = Session["GDNdt_pop"] as DataTable;
                if (dt_pop != null && dt_pop.Rows.Count > 0)
                {
                    DataTable dataTable = dt_pop;
                    DataTable dt = new DataTable();
                    var result = from row in dataTable.AsEnumerable()
                                 where row.Field<string>("ProductCode").ToLower().Contains(txtSearch.Text.ToLower())

                                 select row;

                    try
                    {
                        dt = result.CopyToDataTable();
                       // Session["GDNdt_pop"] = dt;
                        searchResult.DataSource = dt;
                        searchResult.DataBind();
                    }
                    catch (Exception ex)
                    {
                        //Debug.WriteLine(ex.Message);
                    }
                }


                txtSearch.Focus();
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funFilterProductCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionSupplierbindcombo()
        {
            try
            {


                obj_bel_Gdn._iMode = "SupplierComboBind";
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {

                        
                            if (ds.Tables[0].Rows.Count > 0)
                            {

                                DropParty.DataValueField = "PartyID";
                                DropParty.DataTextField = "PartyName";
                                DropParty.DataSource = ds.Tables[0];
                                DropParty.DataBind();
                                DropParty.SelectedIndex = 0;
                            }

                            if (ds.Tables[1].Rows.Count > 0)
                            {


                                DropOrder.DataValueField = "PurchaseOrderID";
                                DropOrder.DataTextField = "PurchaseOrderNo";
                                DropOrder.DataSource = ds.Tables[1];
                                DropOrder.DataBind();
                                DropOrder.SelectedIndex = 0;
                            }
                        
                    }
                }
            }
            catch(Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionSupplierbindcombo", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        void functionProcessorbindcombo()
        {
            try
            {


                obj_bel_Gdn._iMode = "ProcessorComboBind";
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            DropParty.DataValueField = "PartyID";
                            DropParty.DataTextField = "PartyName";
                            DropParty.DataSource = ds.Tables[0];
                            DropParty.DataBind();
                            DropParty.SelectedIndex = 0;
                        }

                        if (ds.Tables[1].Rows.Count > 0)
                        {


                            DropOrder.DataValueField = "WorkOrderID";
                            DropOrder.DataTextField = "WorkOrderNo";
                            DropOrder.DataSource = ds.Tables[1];
                            DropOrder.DataBind();
                            DropOrder.SelectedIndex = 0;
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionProcessorbindcombo", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funDepartmentBind()
        {
            try
            {
                obj_bel_Gdn._iMode = "GridPopup";
                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);
                obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            Session["GDNdt_pop"] = ds.Tables[0];
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();


                        }
                        else
                        {
                            DataTable dt=new DataTable();
                            Session["GDNdt_pop"] = dt;
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();

                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funDepartmentBind", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionGeneralbindcombo()
        {
            try
            {


                obj_bel_Gdn._iMode = "GeneralComboBind";
                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);//Received WarehouseID
                obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            DropParty.DataValueField = "PartyID";
                            DropParty.DataTextField = "PartyName";
                            DropParty.DataSource = ds.Tables[0];
                            DropParty.DataBind();
                            DropParty.SelectedIndex = 0;
                        }

                        if (ds.Tables[1].Rows.Count > 0)
                        {

                            Session["GDNdt_pop"] = ds.Tables[1];
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();

                        }

                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionGeneralbindcombo", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funGDNTYPE()
        {
            try
            {
                switch (Session["GDNType"].ToString())
                {
                    case "S":
                        {
                            HGDNTYPE.Value = "S";
                            lblParty1.Visible = true;
                            DropParty.Visible = true;
                            //DropParty.Enabled = false;
                            //DropParty.CssClass = "top-inputReadonly";
                           // DropJobNo.Enabled = false;
                           // DropJobNo.CssClass = "top-inputReadonly";
                            lblNo1.Visible = true;
                            DropOrder.Visible = true;
                            functionSupplierbindcombo();
                            DropOrder.Focus();
                            break;

                        }

                    case "P":
                        {
                            HGDNTYPE.Value = "P";
                            lblParty2.Visible = true;
                            DropParty.Visible = true;
                            lblNo.Visible = true;
                            DropOrder.Visible = true;
                            //DropParty.Enabled = false;
                            //DropParty.CssClass = "top-inputReadonly";
                           // DropJobNo.Enabled = false;
                           // DropJobNo.CssClass = "top-inputReadonly";
                            functionProcessorbindcombo();
                            DropOrder.Focus();
                            break;

                        }
                    case "D":
                        {
                            HGDNTYPE.Value = "D";
                            lblWareouse.Visible = true;
                            DropWareHouse.Visible = true;
                            funDepartmentBind();
                            DropWareHouse.Focus();
                            break;

                        }
                    case "G":
                        {
                            HGDNTYPE.Value = "G";
                            lblParty.Visible = true;
                            DropParty.Visible = true;
                            functionGeneralbindcombo();
                            DropParty.Focus();
                            break;

                        }
                }
            }

            catch(Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funGDNTYPE", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        protected void btn_Supplier_Click(object sender, EventArgs e)
        {
            Session["GDNType"]= "S";
          
           funGDNTYPE();
           termpopup.Hide();
           
        }
        protected void btn_Processor_Click(object sender, EventArgs e)
        {
            Session["GDNType"] = "P";
            
            funGDNTYPE();
            termpopup.Hide();
           
        }
        protected void btn_DepartmentTransfer_Click(object sender, EventArgs e)
        {
            Session["GDNType"] = "D";
           
            funGDNTYPE();
            termpopup.Hide();
           
        }
        protected void btn_General_Click(object sender, EventArgs e)
        {
            Session["GDNType"] = "G";
            
            funGDNTYPE();
            termpopup.Hide();
            
        }


        void funSupplierSelected()
        {
            try
            {
                DataTable dt = new DataTable();
                Session["Item_dt"] = dt;
                obj_bel_Gdn._iMode = "SupplierSelectedIndex";
                obj_bel_Gdn._OrderID =Convert.ToInt32(DropOrder.SelectedValue.Trim());
                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);
                obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                 using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                 {
                     if (ds.Tables.Count > 0)
                     {


                         if (ds.Tables[0].Rows.Count > 0)
                         {
                             DropParty.SelectedValue = ds.Tables[0].Rows[0]["PartyID"].ToString();
                             DropJobNo.SelectedValue = ds.Tables[0].Rows[0]["JOBID"].ToString();
                         }
                         if (ds.Tables[1].Rows.Count > 0)
                         {

                             Session["GDNdt_pop"] = ds.Tables[1];
                             searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                             searchResult.DataBind();



                         }
                         else
                         {
                             DataTable dt1 = new DataTable();
                             Session["GDNdt_pop"] = dt1;
                             searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                             searchResult.DataBind();
                         }

                     }

                 }
            }
            catch(Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funSupplierSelected", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funProcessorSelected()
        {
            try
            {
                obj_bel_Gdn._iMode = "ProcessorSelectedIndex";
                obj_bel_Gdn._OrderID = Convert.ToInt32(DropOrder.SelectedValue.Trim());
                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);
                obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            DropParty.SelectedValue = ds.Tables[0].Rows[0]["PartyID"].ToString();
                            DropJobNo.SelectedValue = ds.Tables[0].Rows[0]["JOBID"].ToString();
                        }
                        if (ds.Tables[1].Rows.Count > 0)
                        {
                            Session["GDNdt_pop"] = ds.Tables[1];
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();


                        }
                        else
                        {
                            DataTable dt = new DataTable();
                            Session["GDNdt_pop"] = dt;
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funProcessorSelected", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        protected void DropOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (Session["GDNType"].ToString())
            {
                case "S":
                    {
                        funSupplierSelected();
                        DropOrder.Focus();
                        break;

                    }
                case "P":
                    {
                        funProcessorSelected();
                        DropOrder.Focus();
                        break;

                    }
            }
        }

        protected void DropParty_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (Session["GDNType"].ToString())
            {
                case "S":
                    {
                        functionSupplierbind();
                        DropOrder.Focus();
                        break;

                    }
                case "P":
                    {
                        functionProcessorbind();
                        DropOrder.Focus();
                        break;

                    }
            }
        }

        void functionSupplierbind()
        {
            try
            {


                obj_bel_Gdn._iMode = "ComboBindpartysupplier";
                obj_bel_Gdn._PartyID =Convert.ToInt32( DropParty.SelectedValue.Trim());
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        

                        if (ds.Tables[0].Rows.Count > 0)
                        {


                            DropOrder.DataValueField = "PurchaseOrderID";
                            DropOrder.DataTextField = "PurchaseOrderNo";
                            DropOrder.DataSource = ds.Tables[0];
                            DropOrder.DataBind();
                            DropOrder.SelectedIndex = 0;
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionSupplierbind", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        void functionProcessorbind()
        {
            try
            {


                obj_bel_Gdn._iMode = "ComboBindPartyProcessor";
                obj_bel_Gdn._PartyID = Convert.ToInt32(DropParty.SelectedValue.Trim());
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        

                        if (ds.Tables[0].Rows.Count > 0)
                        {


                            DropOrder.DataValueField = "WorkOrderID";
                            DropOrder.DataTextField = "WorkOrderNo";
                            DropOrder.DataSource = ds.Tables[0];
                            DropOrder.DataBind();
                            DropOrder.SelectedIndex = 0;
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionProcessorbind", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void btn_Print_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(hfldid.Value.ToString()) != "0" && Convert.ToString(hfldid.Value.ToString()) != string.Empty)
            {
               // ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('../Report/ReportViewer.aspx?value=GDNPRINT&JOBID=" + "" + "');", true);
               funPrint();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please select the item from search');", true);
            }
        }
        void funPrint()
        {
            try
            {

                if (Session["GDNType"].ToString() == "S")
                {
                    obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value.ToString());
                    obj_bel_Gdn._iMode = "PurchasePrint";
                    obj_bel_Gdn._Title = "Supplier";
                    using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[1].Rows.Count > 0)
                            {
                                Session["SaveUser"] = ds.Tables[0].Rows[0]["LoginID"].ToString();
                                Common.CommonVariablesandmsg.TittleNo = "Po.No";
                                Common.CommonVariablesandmsg.Tittle = "Supplier";
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../Report/ReportViewer.aspx?value=GDNPRINT" + "','_blank')", true);

                                //obj_bel_Gdn._TitleNo = "Po.No";
                                //Report.ReportViewer obj_Report = new Report.ReportViewer();
                                //string Path = obj_Report.GDNPrint(obj_bel_Gdn);
                                //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('" + Path + "');", true);

                                //string dirName = Server.MapPath("../Images/Print");

                                //var files = new DirectoryInfo(dirName).GetFiles("*.pdf");
                                //foreach (var file in files.Where(file => DateTime.UtcNow - file.CreationTimeUtc < TimeSpan.FromHours(-12)))
                                //{
                                //    file.Delete();
                                //    Common.CommonVariablesandmsg.CountPdf = 0;
                                //}
                            }
                        }

                    }
                }

                else if (Session["GDNType"].ToString() == "P")
                {
                    obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value.ToString());
                    obj_bel_Gdn._iMode = "WorkPrint";
                    obj_bel_Gdn._Title = "Processor";
                    using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[1].Rows.Count > 0)
                            {
                                Session["SaveUser"] = ds.Tables[0].Rows[0]["LoginID"].ToString();
                                Common.CommonVariablesandmsg.TittleNo = "Wo.No";
                                Common.CommonVariablesandmsg.Tittle = "Processor";
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../Report/ReportViewer.aspx?value=GDNPRINT" + "','_blank')", true);
                                //obj_bel_Gdn._TitleNo = "Wo.No";
                                //Report.ReportViewer obj_Report = new Report.ReportViewer();
                                //string Path=obj_Report.GDNPrint(obj_bel_Gdn);
                                //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('" + Path + "');", true);

                                //string dirName = Server.MapPath("../Images/Print");

                                //var files = new DirectoryInfo(dirName).GetFiles("*.pdf");
                                //foreach (var file in files.Where(file => DateTime.UtcNow - file.CreationTimeUtc < TimeSpan.FromHours(-12)))
                                //{
                                //    file.Delete();
                                //    Common.CommonVariablesandmsg.CountPdf = 0;
                                //}
                            }
                        }

                    }
                }

                else if (Session["GDNType"].ToString() == "D")
                {
                    obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value.ToString());
                    obj_bel_Gdn._iMode = "DepartmentPrint";
                    obj_bel_Gdn._Title = "Transfer";
                    using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[1].Rows.Count > 0)
                            {
                                Session["SaveUser"] = ds.Tables[0].Rows[0]["LoginID"].ToString();
                               
                                Common.CommonVariablesandmsg.Tittle = "Transfer";
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../Report/ReportViewer.aspx?value=GDNDEPARTMENTPRINT" + "','_blank')", true);
                                //Report.ReportViewer obj_Report = new Report.ReportViewer();
                                //string Path = obj_Report.GDNDepartmentPrint(obj_bel_Gdn);
                                //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('" + Path + "');", true);

                                //string dirName = Server.MapPath("../Images/Print");

                                //var files = new DirectoryInfo(dirName).GetFiles("*.pdf");
                                //foreach (var file in files.Where(file => DateTime.UtcNow - file.CreationTimeUtc < TimeSpan.FromHours(-12)))
                                //{
                                //    file.Delete();
                                //    Common.CommonVariablesandmsg.CountPdf = 0;
                                //}
                            }
                        }

                    }
                }

                else if (Session["GDNType"].ToString() == "G")
                {
                    obj_bel_Gdn._GDNID = Convert.ToInt32(hfldid.Value.ToString());
                    obj_bel_Gdn._iMode = "GeneralPrint";
                    obj_bel_Gdn._Title = "General";
                    using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                    {
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[1].Rows.Count > 0)
                            {
                                Session["SaveUser"] = ds.Tables[0].Rows[0]["LoginID"].ToString();
                                Common.CommonVariablesandmsg.Tittle = "General";
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../Report/ReportViewer.aspx?value=GDNDEPARTMENTPRINT" + "','_blank')", true);
                                //Report.ReportViewer obj_Report = new Report.ReportViewer();
                                //string Path = obj_Report.GDNDepartmentPrint(obj_bel_Gdn);
                                //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('" + Path + "');", true);

                                //string dirName = Server.MapPath("../Images/Print");

                                //var files = new DirectoryInfo(dirName).GetFiles("*.pdf");
                                //foreach (var file in files.Where(file => DateTime.UtcNow - file.CreationTimeUtc < TimeSpan.FromHours(-12)))
                                //{
                                //    file.Delete();
                                //    Common.CommonVariablesandmsg.CountPdf = 0;
                                //}
                            }
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:funPrint", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionGetTOBranchID()
        {
            try
            {
                
                obj_bel_Gdn._iMode = "GetTObranchID";
                obj_bel_Gdn._WareHouseID = Convert.ToInt32(DropWareHouse.SelectedValue);//Received WarehouseID
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            HTOBranchID.Value = Convert.ToString(ds.Tables[0].Rows[0]["BranchID"].ToString());
                        }

                       

                    }
                }
            }
            catch(Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionGetTOBranchID", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void DropFromWarehouse_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (HGDNTYPE.Value == "D")
            {
                funDepartmentBind();
                
            }
            else if (HGDNTYPE.Value == "G")
            {
                

                functionGeneralbindReceived();
                
            }
            else if (HGDNTYPE.Value == "S")
            {
               
                funSupplierSelected();
            }
            else if (HGDNTYPE.Value == "P")
            {

            }
        }
        void functionGeneralbindReceived()
        {
            try
            {


                obj_bel_Gdn._iMode = "GeneralComboBind";
                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);//Received WarehouseID
                obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                obj_bel_Gdn._FromWareHouseID = Convert.ToInt32(DropFromWarehouse.SelectedValue);
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {
                        

                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            //DropParty.DataValueField = "PartyID";
                            //DropParty.DataTextField = "PartyName";
                            //DropParty.DataSource = ds.Tables[0];
                            //DropParty.DataBind();
                            //DropParty.SelectedIndex = 0;
                        }

                        if (ds.Tables[1].Rows.Count > 0)
                        {

                            Session["GDNdt_pop"] = ds.Tables[1];
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();
                        }
                        else
                        {
                            DataTable dt = new DataTable();
                            Session["GDNdt_pop"] = dt;
                            searchResult.DataSource = Session["GDNdt_pop"] as DataTable;
                            searchResult.DataBind();
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GDN:functionGeneralbindReceived", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void DropWareHouse_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (HGDNTYPE.Value == "D")
            {
                functionGetTOBranchID();
            }
        }

        protected void DropJobNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (Session["GDNType"].ToString())
            {
                case "S":
                    {
                        funPObaseJOB();
                        DropOrder.Focus();
                        break;

                    }
                case "P":
                    {
                        funWObaseJOB();
                        DropOrder.Focus();
                        break;

                    }
            }
        }

        void funPObaseJOB()
        {
            try
            {
                
                obj_bel_Gdn._iMode = "GetPOJob";
                obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            DropOrder.DataValueField = "PurchaseOrderID";
                            DropOrder.DataTextField = "PurchaseOrderNo";
                            DropOrder.DataSource = ds.Tables[0];
                            DropOrder.DataBind();
                            DropOrder.SelectedIndex = 0;
                        }


                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GRN:funPObaseJOB", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        void funWObaseJOB()
        {
            try
            {
                obj_bel_Gdn._iMode = "GetWOJob";
                obj_bel_Gdn._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                using (DataSet ds = obj_dal_Gdn.dal_GDNDetail(obj_bel_Gdn))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            DropOrder.DataValueField = "WorkOrderID";
                            DropOrder.DataTextField = "WorkOrderNo";
                            DropOrder.DataSource = ds.Tables[0];
                            DropOrder.DataBind();
                            DropOrder.SelectedIndex = 0;
                        }


                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GRN:funWObaseJOB", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
    }
}