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
using CrystalDecisions.Shared;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace Trident.Transaction
{
    public partial class PackingList : System.Web.UI.Page
    {
        public decimal CortonSum = 0;
        //public string TempCortonTotal = "0";
        public decimal totalFooterQty = 0;
        public decimal totalAmount = 0;
        bel_PackingList obj_bel_Packing = new bel_PackingList();
        dal_PackingList obj_dal_Packing = new dal_PackingList();
       // public static DataTable Item_dt = new DataTable();
        public static DataTable Box_dt = new DataTable();
        public static DataTable dt_pop = new DataTable();
        public static DataTable Item_dt_Job = new DataTable();
        int Row_Count = 0;
        public static int row_index = 0;
        public static int row_indexCorton = 0;
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
                        obj_Common.functionCheckActhorization("Packing-List", "AssignAuthorization");
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
                           // string path1 = Server.MapPath(@"..\Images\Print\" + "namespace" + ".pdf");
                           // File.Create(path1);
                            txtSearch.Attributes.Add("onkeypress", "return handleEnter('" + btnSearchPOP.ClientID + "', event)");
                            txtProductCode.Attributes.Add("onkeypress", "return handleEnter('" + Button1.ClientID + "', event)");
                            txtquantity.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtCortonPcs.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtGrossWeight.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");                            
                            txtNetWeight.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtCartonSize.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtPopNewCortonNo.Attributes.Add("onkeypress", "return handleEnter('" + btn_Ok.ClientID + "', event)");
                            
                            txtInvoiceDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");
                            txtBuyerDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");

                            DropJobNo.Focus();
                            //  RegisterCallBackReference();
                            functionbindcombo();
                            funGetAutoCode();
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
                                Item_dt.Columns.Add(new DataColumn("CartonNo", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("NewCartonNo", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("ProductCode", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("Description", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("BuyerReferences", typeof(string)));
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
                                Item_dt.Columns.Add(new DataColumn("PcsCarton", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("TotalPcs", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("NetWt", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("GrsWt", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("CartonSize", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("PackingDetailID", typeof(Int32)));

                                //DataRow dr;
                                //dr = Item_dt.NewRow();
                                //Item_dt.Rows.Add(dr);

                                Session["PackingItem_dt"] = Item_dt;
                                gridPacking.DataSource = Session["PackingItem_dt"] as DataTable;
                                gridPacking.DataBind();

                                


                            }
                            if (hfldid.Value != "0" && hfldid.Value != string.Empty)
                            {


                                obj_bel_Packing._PackingListID = Convert.ToInt32(hfldid.Value);
                                functionfetcdata(obj_bel_Packing);
                            }
                            else if (hfldid.Value == string.Empty)
                                hfldid.Value = "0";


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
                obj_bel_Packing._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Packing._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_Packing._ScreenName = "Packing-List";
                obj_bel_Packing._iMode = "AutoCode";
                using (DataSet ds = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            txtInvoiceNo.Text = ds.Tables[0].Rows[0][0].ToString();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionfetcdata(bel_PackingList obj_bel_Packing)  //selected item will sow the corresponding text box
        {
            try
            {

                obj_bel_Packing._iMode = "Fetch";
                using (DataSet ds = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["PackingListID"] != null)
                            {
                                hfldid.Value = ds.Tables[0].Rows[0]["PackingListID"].ToString();
                            }
                            if (ds.Tables[0].Rows[0]["InvoiceNo"] != null)
                            {

                                txtInvoiceNo.Text = ds.Tables[0].Rows[0]["InvoiceNo"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["InvoiceDate"] != null)
                            {
                                DateTime date = System.DateTime.Now;
                                date = Convert.ToDateTime(ds.Tables[0].Rows[0]["InvoiceDate"]);

                                txtInvoiceDate.Text = date.ToString("dd-MMM-yyyy");
                               // .Text = ds.Tables[0].Rows[0]["InvoiceDate"].ToString();

                            }




                            if (ds.Tables[0].Rows[0]["JOBID"] != null)
                            {

                                DropJobNo.SelectedValue = ds.Tables[0].Rows[0]["JOBID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["PartyID"] != null)
                            {

                                DropCustomer.SelectedValue = ds.Tables[0].Rows[0]["PartyID"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["BuyerOrderNo"] != null)
                            {

                                txtBuyerOrderNo.Text = ds.Tables[0].Rows[0]["BuyerOrderNo"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["BuyerOrderDate"] != null)
                            {
                                DateTime date = System.DateTime.Now;
                                date = Convert.ToDateTime(ds.Tables[0].Rows[0]["BuyerOrderDate"].ToString());

                                txtBuyerDate.Text = date.ToString("dd-MMM-yyyy");
                                //.Text = ds.Tables[0].Rows[0]["BuyerOrderDate"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["OtherRef"] != null)
                            {

                                txtOtherReference.Text = ds.Tables[0].Rows[0]["OtherRef"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["OrginCountryID"] != null)
                            {

                                DropCountryofOrigin.SelectedValue = ds.Tables[0].Rows[0]["OrginCountryID"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["FinalCountryID"] != null)
                            {

                                DropCountryFinal.SelectedValue = ds.Tables[0].Rows[0]["FinalCountryID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["VesselFlightNo"] != null)
                            {

                                txtVesselFlight.Text = ds.Tables[0].Rows[0]["VesselFlightNo"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["PlaceofReceipt"] != null)
                            {

                                txtPlaceofReceipt.Text = ds.Tables[0].Rows[0]["PlaceofReceipt"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["vessalFiligtNo1"] != null)
                            {

                                txtVesselFligt2.Text = ds.Tables[0].Rows[0]["vessalFiligtNo1"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["PortofLoadingID"] != null)
                            {

                                DropPortofLoading.SelectedValue = ds.Tables[0].Rows[0]["PortofLoadingID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["PortofDestinationID"] != null)
                            {

                                DropPortofDestination.SelectedValue = ds.Tables[0].Rows[0]["PortofDestinationID"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["FinalDestination"] != null)
                            {

                                txtFinalDestination.Text = ds.Tables[0].Rows[0]["FinalDestination"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["PaymentTermID"] != null)
                            {

                                DropPaymentterm.SelectedValue = ds.Tables[0].Rows[0]["PaymentTermID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["DeliveryTermID"] != null)
                            {

                                DropDeliveryterm.SelectedValue = ds.Tables[0].Rows[0]["DeliveryTermID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["MarkNoContainerNo"] != null)
                            {

                                txtMarkNos.Text = ds.Tables[0].Rows[0]["MarkNoContainerNo"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["NoKindPkgs"] != null)
                            {

                                txtNoKinfofPage.Text = ds.Tables[0].Rows[0]["NoKindPkgs"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["Status"] != null)
                            {


                                // rblstate.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();

                            }






                        }
                        if (ds.Tables[1].Rows.Count > 0)
                        {

                            Session["PackingItem_dt"] = ds.Tables[1];                          
                            gridPacking.DataSource = Session["PackingItem_dt"] as DataTable;
                            gridPacking.DataBind();

                        }

                       

                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:functionfetcdata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionbindcombo()
        {
            try
            {


                obj_bel_Packing._iMode = "ComboBind";
                using (DataSet ds = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
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
                            Dropcategory.DataValueField = "CategoryID";
                            Dropcategory.DataTextField = "CategoryName";
                            Dropcategory.DataSource = ds.Tables[5];
                            Dropcategory.DataBind();
                            Dropcategory.SelectedIndex = 0;
                        }
                        if (ds.Tables[6].Rows.Count > 0)
                        {

                            DropCustomer.DataValueField = "PartyID";
                            DropCustomer.DataTextField = "PartyName";
                            DropCustomer.DataSource = ds.Tables[6];
                            DropCustomer.DataBind();
                            DropCustomer.SelectedIndex = 0;

                        }

                        if (ds.Tables[7].Rows.Count > 0)
                        {

                            DropCountryofOrigin.DataValueField = "CountryID";
                            DropCountryofOrigin.DataTextField = "name";
                            DropCountryofOrigin.DataSource = ds.Tables[7];
                            DropCountryofOrigin.DataBind();
                            DropCountryofOrigin.SelectedIndex = 99;

                        }
                        if (ds.Tables[8].Rows.Count > 0)
                        {

                            DropCountryFinal.DataValueField = "CountryID";
                            DropCountryFinal.DataTextField = "name";
                            DropCountryFinal.DataSource = ds.Tables[8];
                            DropCountryFinal.DataBind();
                            DropCountryFinal.SelectedIndex =0;

                        }
                        if (ds.Tables[9].Rows.Count > 0)
                        {

                            DropDeliveryterm.DataValueField = "DeliveryTermID";
                            DropDeliveryterm.DataTextField = "DeliveryTerm";
                            DropDeliveryterm.DataSource = ds.Tables[9];
                            DropDeliveryterm.DataBind();
                            DropDeliveryterm.SelectedIndex = 0;

                        }
                        if (ds.Tables[10].Rows.Count > 0)
                        {

                            DropPaymentterm.DataValueField = "PaymentTermID";
                            DropPaymentterm.DataTextField = "PaymentTerm";
                            DropPaymentterm.DataSource = ds.Tables[10];
                            DropPaymentterm.DataBind();
                            DropPaymentterm.SelectedIndex = 0;

                        }
                        if (ds.Tables[11].Rows.Count > 0)
                        {

                            DropPortofDestination.DataValueField = "PortofDestinationID";
                            DropPortofDestination.DataTextField = "PortofDestination";
                            DropPortofDestination.DataSource = ds.Tables[11];
                            DropPortofDestination.DataBind();
                            DropPortofDestination.SelectedIndex = 0;
                        }
                        if (ds.Tables[12].Rows.Count > 0)
                        {

                            DropPortofLoading.DataValueField = "PortofDestinationID";
                            DropPortofLoading.DataTextField = "PortofDestination";
                            DropPortofLoading.DataSource = ds.Tables[12];
                            DropPortofLoading.DataBind();
                            DropPortofLoading.SelectedIndex = 0;
                        }




                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        void funBindValue(string ProductCode)
        {
            try
            {


                obj_bel_Packing._ProductCode = ProductCode;
                obj_bel_Packing._iMode = "ProductCode";
                using (DataSet ds = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
                {
                    if (ds.Tables.Count > 0)
                    {


                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
      
        void funAdditemtodatatable(int row)
        {
            try
            {
                // CommonVariablesandmsg.Item_dt =(DataTable) Session["datatable_item"];

                DataTable Item_dt = Session["PackingItem_dt"] as DataTable;
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
                    CortonSum = 0;

                    DataRow dr;
                    dr = Item_dt.NewRow();
                    Item_dt.Rows.Add(dr);
                    Row_Count = Item_dt.Rows.Count - 1;

                    


                    Item_dt.Rows[Row_Count]["ProductID"] = Convert.ToInt32(hItemID.Value);
                    Item_dt.Rows[Row_Count]["ProductCode"] = Convert.ToString(txtProductCode.Text);
                    Item_dt.Rows[Row_Count]["CartonNo"] = Convert.ToString(HCortonNo.Value);
                    Item_dt.Rows[Row_Count]["BuyerReferences"] = Convert.ToString(txtBuyerRef.Text.Trim());
                    Item_dt.Rows[Row_Count]["NewCartonNo"] = Convert.ToString(txtNewCartonNo.Text.Trim());
                    Item_dt.Rows[Row_Count]["ProductGroupID"] = Convert.ToInt32(HProductGroupID.Value);
                    Item_dt.Rows[Row_Count]["CategoryID"] = Convert.ToInt32(Dropcategory.SelectedValue);
                    Item_dt.Rows[Row_Count]["CategoryName"] = Convert.ToString(Dropcategory.SelectedItem);
                    Item_dt.Rows[Row_Count]["QualityID"] = Convert.ToInt32(HQualityID.Value);
                    Item_dt.Rows[Row_Count]["DesignID"] = Convert.ToInt32(DropDesign.SelectedValue);
                    Item_dt.Rows[Row_Count]["DesignName"] = Convert.ToString(DropDesign.SelectedItem);
                    Item_dt.Rows[Row_Count]["ColorID"] = Convert.ToInt32(Dropcolour.SelectedValue);
                    Item_dt.Rows[Row_Count]["ColorName"] = Convert.ToString(Dropcolour.SelectedItem);
                    Item_dt.Rows[Row_Count]["SizeName"] = Convert.ToString(Dropsize.SelectedItem);
                    Item_dt.Rows[Row_Count]["SizeID"] = Convert.ToInt32(Dropsize.SelectedValue);
                    Item_dt.Rows[Row_Count]["UOMName"] = Convert.ToString(DropUOM.SelectedItem);
                    Item_dt.Rows[Row_Count]["UOMID"] = Convert.ToInt32(DropUOM.SelectedValue);
                    Item_dt.Rows[Row_Count]["Qty"] = Convert.ToDecimal(txtquantity.Text.Trim());
                    Item_dt.Rows[Row_Count]["PcsCarton"] = Convert.ToDecimal(txtCortonPcs.Text.Trim());                    
                    Item_dt.Rows[Row_Count]["TotalPcs"] = Convert.ToDecimal(txtPcs.Text.Trim());                    
                    Item_dt.Rows[Row_Count]["NetWt"] = Convert.ToDecimal(txtNetWeight.Text.Trim());
                    Item_dt.Rows[Row_Count]["GrsWt"] = Convert.ToDecimal(txtGrossWeight.Text.Trim());
                    Item_dt.Rows[Row_Count]["CartonSize"] = Convert.ToString(txtCartonSize.Text.Trim());
                    Item_dt.Rows[Row_Count]["PackingDetailID"] = "0";

                    for (int i = 0; i <= Item_dt.Rows.Count - 1; i++)
                    {
                        Item_dt.Rows[i]["SNo"] = i + 1;

                    }

                    Session["PackingItem_dt"] = Item_dt;
                    gridPacking.DataSource = Session["PackingItem_dt"] as DataTable;
                    gridPacking.DataBind();

                }
                else if (Convert.ToString(hUpdateID.Value) == "1")
                {
                    CortonSum = 0;




                    Item_dt.Rows[row_index]["ProductID"] = Convert.ToInt32(hItemID.Value);
                    Item_dt.Rows[row_index]["ProductCode"] = Convert.ToString(txtProductCode.Text);
                    Item_dt.Rows[row_index]["CartonNo"] = Convert.ToString(HCortonNo.Value);
                    Item_dt.Rows[row_index]["NewCartonNo"] = Convert.ToString(txtNewCartonNo.Text.Trim());
                    Item_dt.Rows[row_index]["BuyerReferences"] = Convert.ToString(txtBuyerRef.Text.Trim());
                    Item_dt.Rows[row_index]["ProductGroupID"] = Convert.ToInt32(HProductGroupID.Value);
                    Item_dt.Rows[row_index]["CategoryID"] = Convert.ToInt32(Dropcategory.SelectedValue);
                    Item_dt.Rows[row_index]["CategoryName"] = Convert.ToString(Dropcategory.SelectedItem);
                    Item_dt.Rows[row_index]["QualityID"] = Convert.ToInt32(HQualityID.Value);
                    Item_dt.Rows[row_index]["DesignID"] = Convert.ToInt32(DropDesign.SelectedValue);
                    Item_dt.Rows[row_index]["DesignName"] = Convert.ToString(DropDesign.SelectedItem);
                    Item_dt.Rows[row_index]["ColorID"] = Convert.ToInt32(Dropcolour.SelectedValue);
                    Item_dt.Rows[row_index]["ColorName"] = Convert.ToString(Dropcolour.SelectedItem);
                    Item_dt.Rows[row_index]["SizeName"] = Convert.ToString(Dropsize.SelectedItem);
                    Item_dt.Rows[row_index]["SizeID"] = Convert.ToInt32(Dropsize.SelectedValue);
                    Item_dt.Rows[row_index]["UOMName"] = Convert.ToString(DropUOM.SelectedItem);
                    Item_dt.Rows[row_index]["UOMID"] = Convert.ToInt32(DropUOM.SelectedValue);
                    Item_dt.Rows[row_index]["Qty"] = Convert.ToDecimal(txtquantity.Text.Trim());
                    Item_dt.Rows[row_index]["PcsCarton"] = Convert.ToDecimal(txtCortonPcs.Text.Trim());
                    Item_dt.Rows[row_index]["TotalPcs"] = Convert.ToDecimal(txtPcs.Text.Trim());
                    Item_dt.Rows[row_index]["NetWt"] = Convert.ToDecimal(txtNetWeight.Text.Trim());
                    Item_dt.Rows[row_index]["GrsWt"] = Convert.ToDecimal(txtGrossWeight.Text.Trim());
                    Item_dt.Rows[row_index]["CartonSize"] = Convert.ToString(txtCartonSize.Text.Trim());
                                      
                    hUpdateID.Value = "0";
                    Session["PackingItem_dt"] = Item_dt;
                    gridPacking.DataSource = Session["PackingItem_dt"] as DataTable;
                    gridPacking.DataBind();

                }
            }
            catch (Exception ex)
            {

            }
        }
        public void functioncleardata()
        {
            try
            {
                hfldid.Value = "0";
                Session["HeaderID"] = "0";
                hItemID.Value = "0";
                HCategoryID.Value = "0";
                HProductGroupID.Value = "0";
                HQualityID.Value = "0";
                HCortonNo.Value = "0";
                txtInvoiceNo.Text = string.Empty;
                txtOtherReference.Text = string.Empty;
                DropCustomer.SelectedIndex = 0;               
                txtInvoiceDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");
                DropJobNo.SelectedIndex = 0;
                txtBuyerOrderNo.Text = string.Empty;
                txtBuyerDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");
                DropCountryofOrigin.SelectedIndex = 0;
                DropCountryFinal.SelectedIndex = 0;
                DropDeliveryterm.SelectedIndex = 0;
                DropPaymentterm.SelectedIndex = 0;
                DropPortofDestination.SelectedIndex = 0;
                DropPortofLoading.SelectedIndex = 0;
                txtVesselFlight.Text = string.Empty;
                txtPlaceofReceipt.Text = string.Empty;
                txtVesselFligt2.Text = string.Empty;
                txtFinalDestination.Text = string.Empty;
                txtMarkNos.Text = string.Empty;
                txtNoKinfofPage.Text = string.Empty;
                txtProductCode.Text = string.Empty;
                DropDesign.SelectedIndex = 0;
                Dropsize.SelectedIndex = 0;
                Dropcategory.SelectedIndex = 0;
                txtquantity.Text = string.Empty;
                txtNewCartonNo.Text = string.Empty;
                txtBuyerRef.Text = string.Empty;
                txtCortonPcs.Text = string.Empty;
                txtPcs.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropUOM.SelectedIndex = 0;
                txtquantity.Text = string.Empty;
                txtCortonPcs.Text = string.Empty;
                txtPcs.Text = string.Empty;
                txtNetWeight.Text = string.Empty;
                txtGrossWeight.Text = string.Empty;
                txtCartonSize.Text = string.Empty; 
                HTotalQty.Value = "0";
                HTotalAmount.Value = "0";
                funInitialDataTable();
                funGetAutoCode();
                txtProductCode.Focus();
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:functioncleardata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                Item_dt.Columns.Add(new DataColumn("CartonNo", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("NewCartonNo", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("ProductCode", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("Description", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("BuyerReferences", typeof(string)));
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
                Item_dt.Columns.Add(new DataColumn("PcsCarton", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("TotalPcs", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("NetWt", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("GrsWt", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("CartonSize", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("PackingDetailID", typeof(Int32)));

                //DataRow dr;
                //dr = Item_dt.NewRow();
                //Item_dt.Rows.Add(dr);

                Session["PackingItem_dt"] = Item_dt;
                gridPacking.DataSource = Session["PackingItem_dt"] as DataTable;
                gridPacking.DataBind();




            }
        }
        void funItemSaveClearData()
        {
            try
            {
                txtProductCode.Text = string.Empty;
                DropDesign.SelectedIndex = 0;
                Dropsize.SelectedIndex = 0;
                Dropcategory.SelectedIndex = 0;
                txtquantity.Text = string.Empty;

               txtNewCartonNo.Text = string.Empty;
                txtBuyerRef.Text = string.Empty;
                txtCortonPcs.Text = string.Empty;
                txtPcs.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropUOM.SelectedIndex = 0;

                txtquantity.Text = string.Empty;
                txtCortonPcs.Text = string.Empty;
               
                txtPcs.Text = string.Empty;
                txtNetWeight.Text = string.Empty;
                txtGrossWeight.Text = string.Empty;
                txtCartonSize.Text = string.Empty;               
                hItemID.Value = "0";
                HCategoryID.Value = "0";
                HProductGroupID.Value = "0";
                HCortonNo.Value = "0";
                HQualityID.Value = "0";
                txtProductCode.Focus();

            }
            catch (Exception ex)
            {

            }
        }
        Boolean CheckDuplicatecustomer()
        {


            obj_bel_Packing._InvoiceNo = txtInvoiceNo.Text.ToString().Trim();
            obj_bel_Packing._iMode = "Duplicate";
            obj_bel_Packing._PackingListID = Convert.ToInt32(hfldid.Value);


            using (DataSet dsUom = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
            {
               
                if (dsUom.Tables[0].Rows[0][0].ToString() == "0")
                {
                    if (gridPacking.Rows.Count > 0)
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





                    obj_bel_Packing._PackingListID = Convert.ToInt32(hfldid.Value);
                    if (DropCustomer.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Packing._PartyID = Convert.ToInt32(DropCustomer.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._PartyID = 0;
                    }

                    if (txtInvoiceDate.Text.Trim() != string.Empty)
                    {


                        obj_bel_Packing._InvoiceDate = Convert.ToDateTime(txtInvoiceDate.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._InvoiceDate = System.DateTime.Now;
                    }

                    if (txtOtherReference.Text.Trim() != string.Empty)
                    {
                        obj_bel_Packing._OtherRef = Convert.ToString(txtOtherReference.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._OtherRef = string.Empty;
                    }

                    


                    if (DropJobNo.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Packing._JOBID = Convert.ToInt32(DropJobNo.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._JOBID = 0;
                    }

                    if (txtBuyerOrderNo.Text.Trim() != string.Empty)
                    {
                        obj_bel_Packing._BuyerOrderNo = Convert.ToString(txtBuyerOrderNo.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._BuyerOrderNo = string.Empty;
                    }


                    if (txtBuyerDate.Text.Trim() != string.Empty)
                    {


                        obj_bel_Packing._BuyerOrderDate = Convert.ToDateTime(txtBuyerDate.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._BuyerOrderDate = System.DateTime.Now;
                    }

                    if (DropCountryofOrigin.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Packing._OrginCountryID = Convert.ToInt32(DropCountryofOrigin.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._OrginCountryID = 0;
                    }

                    if (DropCountryFinal.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Packing._FinalCountryID = Convert.ToInt32(DropCountryFinal.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._FinalCountryID = 0;
                    }

                    if (DropDeliveryterm.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Packing._DeliveryTermID = Convert.ToInt32(DropDeliveryterm.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._DeliveryTermID = 0;
                    }

                    if (DropPaymentterm.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Packing._PaymentTermID = Convert.ToInt32(DropPaymentterm.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._PaymentTermID = 0;
                    }

                    if (DropPortofDestination.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Packing._PortofDestinationID = Convert.ToInt32(DropPortofDestination.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._PortofDestinationID = 0;
                    }

                    if (DropPortofLoading.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Packing._PortofLoadingID = Convert.ToInt32(DropPortofLoading.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._PortofLoadingID = 0;
                    }

                    if (txtVesselFlight.Text.Trim() != string.Empty)
                    {
                        obj_bel_Packing._VesselFlightNo = Convert.ToString(txtVesselFlight.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._VesselFlightNo = string.Empty;
                    }

                    if (txtPlaceofReceipt.Text.Trim() != string.Empty)
                    {
                        obj_bel_Packing._PlaceofReceipt = Convert.ToString(txtPlaceofReceipt.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._PlaceofReceipt = string.Empty;
                    }

                    if (txtVesselFligt2.Text.Trim() != string.Empty)
                    {
                        obj_bel_Packing._vessalFiligtNo1 = Convert.ToString(txtVesselFligt2.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._vessalFiligtNo1 = string.Empty;
                    }

                    if (txtFinalDestination.Text.Trim() != string.Empty)
                    {
                        obj_bel_Packing._FinalDestination = Convert.ToString(txtFinalDestination.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._FinalDestination = string.Empty;
                    }

                    if (txtMarkNos.Text.Trim() != string.Empty)
                    {
                        obj_bel_Packing._MarkNoContainerNo = Convert.ToString(txtMarkNos.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._MarkNoContainerNo = string.Empty;
                    }

                    if (txtNoKinfofPage.Text.Trim() != string.Empty)
                    {
                        obj_bel_Packing._NoKindPkgs = Convert.ToString(txtNoKinfofPage.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._NoKindPkgs = string.Empty;
                    }

                    if (hfldid.Value == "0")
                    {
                        obj_bel_Packing._iMode = "Insert";

                        funAutoGentration();                       
                    }
                    else
                    {                        
                        obj_bel_Packing._iMode = "Update";
                       
                    }

                    if (HTotalQty.Value.Trim() != string.Empty)
                    {


                        obj_bel_Packing._TotalQty = Convert.ToDecimal(HTotalQty.Value);
                    }
                    else
                    {
                        obj_bel_Packing._TotalQty = 0;
                    }

                    if (HCortonTotal.Value.Trim() != string.Empty)
                    {


                        obj_bel_Packing._TotalCarton = Convert.ToDecimal(HCortonTotal.Value);
                    }
                    else
                    {
                        obj_bel_Packing._TotalCarton = 0;
                    }
                   

                    if (txtInvoiceNo.Text.Trim() != string.Empty)
                    {


                        obj_bel_Packing._InvoiceNo = Convert.ToString(txtInvoiceNo.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Packing._InvoiceNo = string.Empty;
                    }
                    int result = 0;

                    DataTable dt_new = new DataTable();
                    //  dt_new = funcSUMDuplicateValue();
                    result = obj_dal_Packing.dal_PackingListInsert(obj_bel_Packing, Session["PackingItem_dt"] as DataTable);


                    if (result.ToString() == "1" || result.ToString() == "2" || result.ToString() == "3" || result.ToString() == "4")
                    {

                       // functioncleardata();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Saved Successfully');", true);
                        hfldid.Value = Convert.ToString(Session["HeaderID"]);
                        obj_bel_Packing._PackingListID = Convert.ToInt32(hfldid.Value);
                        functioncleardata();
                        functionfetcdata(obj_bel_Packing);
                        

                    }
                }

                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Packing Number Already Exists or Please enter the atleast one item');", true);
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:functionSaverecord", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
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
                obj_bel_Packing._ScreenName = "Packing-List";
                obj_bel_Packing._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Packing._BillToDate = Convert.ToDateTime(Todate);
                using (DataSet ds = obj_dal_Packing.dal_AutoGen(obj_bel_Packing))
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

                                txtInvoiceNo.Text = ds.Tables[0].Rows[0][0].ToString();

                            }

                        }
                    }

                }

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:funGentrateAutogen", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void gridPacking_RowCommand3(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                DataTable Item_dt = Session["PackingItem_dt"] as DataTable;
                if (e.CommandName.ToUpper() == "DELETEROW")
                {
                   
                        //get the row index then only you get selected row id
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;

                        if (Convert.ToString(gridPacking.DataKeys[row.RowIndex]["PackingListID"].ToString()) != "0")
                        {
                            if (Common.CommonVariablesandmsg.DeleteRigts == "Y")
                            {


                            obj_bel_Packing._PackingListID = Convert.ToInt32(gridPacking.DataKeys[row.RowIndex]["PackingListID"].ToString());
                            obj_bel_Packing._iMode = "ItemDelete";
                            using (DataSet ds = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
                            {


                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        if (ds.Tables[0].Rows[0][0].ToString() == "1")
                                        {
                                            Item_dt.Rows[d].Delete();
                                            Item_dt.AcceptChanges();
                                            Session["PackingItem_dt"] = Item_dt;
                                            gridPacking.DataSource = Session["PackingItem_dt"] as DataTable;
                                            gridPacking.DataBind();

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
                                Session["PackingItem_dt"] = Item_dt;
                                gridPacking.DataSource = Session["PackingItem_dt"] as DataTable;
                                gridPacking.DataBind();

                            }
                            else
                            {
                                Session["PackingItem_dt"] = Item_dt;
                                gridPacking.DataSource = Session["PackingItem_dt"] as DataTable;
                                gridPacking.DataBind();

                            }

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Deleted Successfully');", true);
                        }
                    

                }
                if (e.CommandName.ToUpper() == "EDITROW")
                {
                   
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;
                        if (Convert.ToString(gridPacking.DataKeys[row.RowIndex]["PackingDetailID"].ToString()) != "0")
                        {
                            if (Common.CommonVariablesandmsg.EditRigts == "Y")
                            {

                            obj_bel_Packing._PackingListID = Convert.ToInt32(Convert.ToInt32(gridPacking.DataKeys[row.RowIndex]["PackingDetailID"].ToString()));
                           
                            txtProductCode.Text = Item_dt.Rows[d]["ProductCode"].ToString();
                            hItemID.Value = Item_dt.Rows[d]["ProductID"].ToString();
                            HCortonNo.Value = Convert.ToString(Item_dt.Rows[d]["CartonNo"]);
                            txtNewCartonNo.Text = Convert.ToString(Item_dt.Rows[d]["NewCartonNo"]);
                            txtBuyerRef.Text = Convert.ToString(Item_dt.Rows[d]["BuyerReferences"]);
                            HProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["ProductGroupID"]);
                            HQualityID.Value = Convert.ToString(Item_dt.Rows[d]["QualityID"]);
                            Dropcategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["CategoryID"]);
                            DropDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DesignID"]);
                            Dropcolour.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ColorID"]);
                            DropUOM.SelectedValue = Convert.ToString(Item_dt.Rows[d]["UOMID"]);
                            Dropsize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["SizeID"]);
                            txtquantity.Text = Convert.ToString(Item_dt.Rows[d]["Qty"]);
                            txtCortonPcs.Text = Convert.ToString(Item_dt.Rows[d]["PcsCarton"]);
                            txtPcs.Text = Convert.ToString(Item_dt.Rows[d]["TotalPcs"]); 
                            txtNetWeight.Text = Convert.ToString(Item_dt.Rows[d]["NetWt"]);
                            txtGrossWeight.Text = Convert.ToString(Item_dt.Rows[d]["GrsWt"]);
                            txtCartonSize.Text = Convert.ToString(Item_dt.Rows[d]["CartonSize"]);
                            
                            hUpdateID.Value = "1";
                            row_index = d;
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);


                        }

                        }
                        else
                        {

                            txtProductCode.Text = Item_dt.Rows[d]["ProductCode"].ToString();
                            hItemID.Value = Item_dt.Rows[d]["ProductID"].ToString();
                            HCortonNo.Value = Convert.ToString(Item_dt.Rows[d]["CartonNo"]);
                            txtNewCartonNo.Text = Convert.ToString(Item_dt.Rows[d]["NewCartonNo"]);
                            txtBuyerRef.Text = Convert.ToString(Item_dt.Rows[d]["BuyerReferences"]);
                            HProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["ProductGroupID"]);
                            HQualityID.Value = Convert.ToString(Item_dt.Rows[d]["QualityID"]);
                            Dropcategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["CategoryID"]);
                            DropDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DesignID"]);
                            Dropcolour.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ColorID"]);
                            DropUOM.SelectedValue = Convert.ToString(Item_dt.Rows[d]["UOMID"]);
                            Dropsize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["SizeID"]);
                            txtquantity.Text = Convert.ToString(Item_dt.Rows[d]["Qty"]);
                            txtCortonPcs.Text = Convert.ToString(Item_dt.Rows[d]["PcsCarton"]);
                            txtPcs.Text = Convert.ToString(Item_dt.Rows[d]["TotalPcs"]);
                            txtNetWeight.Text = Convert.ToString(Item_dt.Rows[d]["NetWt"]);
                            txtGrossWeight.Text = Convert.ToString(Item_dt.Rows[d]["GrsWt"]);
                            txtCartonSize.Text = Convert.ToString(Item_dt.Rows[d]["CartonSize"]);

                            hUpdateID.Value = "1";
                            row_index = d;



                        }


                    
                }
            }
            catch (Exception ex)
            {

            }
        }
      


        public decimal GetTotalAmount()
        {
            HCortonTotal.Value = Convert.ToString(totalAmount);
            
            return totalAmount;
        }
        public decimal GetTotalQty()
        {
            HTotalQty.Value = Convert.ToString(totalFooterQty);
            return totalFooterQty;
        }


        protected void gridPacking_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Separator)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                decimal salary = (decimal)rowView["TotalPcs"];
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

            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {
                if (Common.CommonVariablesandmsg.ViewRights == "Y")
                {
                    Response.Redirect("../SearchListTransaction.aspx?pg=PACKING", false);
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view this screen');", true);


                }
            }
            catch (Exception ex)
            {

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

        protected void btn_Print_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(hfldid.Value.ToString()) != "0" && Convert.ToString(hfldid.Value.ToString()) != string.Empty)
            {
              //  Response.Redirect("../SearchListTransaction.aspx?pg=PACKING", false);
              //  ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('../Report/ReportViewer.aspx?value=PACKINGPRINT&JOBID=" + "" + "');", true);



                funPrint();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please select the item from search');", true);
            }
        }

        public void funPrint()
        {
            
            obj_bel_Packing._iMode = "Print";
            obj_bel_Packing._PackingListID = Convert.ToInt32(hfldid.Value.ToString());
            using (DataSet ds = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        Session["SaveUser"] = ds.Tables[0].Rows[0]["LoginID"].ToString();
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../Report/ReportViewer.aspx?value=PACKINGPRINT" + "','_blank')", true);
                      //  Report.ReportViewer rep = new Report.ReportViewer();
                      //string Path=  rep.PackingListPrint();                     
                     
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
        //protected string GetAutoPrintJs()
        //{
        //    var script = new StringBuilder();
        //    script.Append("var pp = getPrintParams();");
        //    script.Append("pp.interactive= pp.constants.interactionLevel.full;");
        //    script.Append("print(pp);"); return script.ToString();
        //}
        //protected void StreamPdf(Stream pdfSource)
        //{
        //    var outputStream = new MemoryStream();
        //    var pdfReader = new PdfReader(pdfSource);
        //    var pdfStamper = new PdfStamper(pdfReader, outputStream);
        //    //Add the auto-print javascript
        //    var writer = pdfStamper.Writer;
        //    writer.AddJavaScript(GetAutoPrintJs());
        //    pdfStamper.Close();
        //    var content = outputStream.ToArray();
        //    outputStream.Close();
        //    Response.ContentType = "application/pdf";
        //    Response.BinaryWrite(content);
        //    Response.End();
        //    outputStream.Close();
        //    outputStream.Dispose();
        //}
      
        void funBindGridPopup(string ProductCode, string iMode)
        {
            try
            {


                obj_bel_Packing._ProductCode = ProductCode;
                obj_bel_Packing._iMode = iMode;
                using (DataSet ds = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
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
                            dt_pop = ds.Tables[0];
                            searchResult.DataSource = dt_pop;
                            searchResult.DataBind();

                        }
                    }
                }
            }

            catch (Exception ex)
            {

            }
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
               
                string ItemCode = string.Empty;
                string Barcode = string.Empty;
                obj_bel_Packing._iMode = "";
                if (Convert.ToString(txtProductCode.Text) != string.Empty)
                {
                    ItemCode = Convert.ToString(txtProductCode.Text);
                }
                FunGetCortonBox();
                txtSearch.Text = txtProductCode.Text.Trim();
                funFilterProductCode();
               
                mpe.Show();





            }
            catch (Exception ex)
            {

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

                if (dt_pop != null && dt_pop.Rows.Count > 0)
                {
                    DataTable dataTable = dt_pop;
                    DataTable dt = new DataTable();
                    var result = from row in dataTable.AsEnumerable()
                                 where row.Field<string>("CartonNo").ToLower().Contains(txtSearch.Text.ToLower())

                                 select row;

                    try
                    {
                        dt = result.CopyToDataTable();
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

                        obj_bel_Packing._iMode = "Insert";
                        functionSaverecord();
                        functioncleardata();
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
                        obj_bel_Packing._iMode = "Update";
                        functionSaverecord();
                        functioncleardata();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);


                    }


                }
            }
            catch (Exception ex)
            {

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
                    row_indexCorton = row.RowIndex;
                    termpopup.Show();
                    txtPopNewCortonNo.Focus();
                    //if (Convert.ToString(searchResult.DataKeys[row.RowIndex]["CartonNo"].ToString()) != "0")
                    //{
                    //    ProductCode = Convert.ToString(searchResult.DataKeys[row.RowIndex]["CartonNo"].ToString());



                    //    txtProductCode.Text = ProductCode;
                    //    //funBindValue(ProductCode);
                    //    mpe.Hide();
                    //   // txtquantity.Focus();









                    //}

                }
            }
            catch (Exception ex)
            {

            }
        }
      
       

        protected void btn_PrintBox_Click(object sender, EventArgs e)
        {
            //funPrint();
        }
        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            termpopup.Hide();
        }


        void FunGetCortonBox()
        {
            try
            {
                obj_bel_Packing._iMode = "GridPopup";
                obj_bel_Packing._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                using (DataSet ds = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
                {
                    if (ds.Tables.Count > 0)
                    {

                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            int k = 0, j = 1;
                            // decimal qty = 0;
                            // decimal CartonPcs = 0;

                            int BoxRow_Count = 0;
                            Box_dt.Clear();
                            if (Box_dt.Columns.Count > 1)
                            {


                            }
                            else
                            {
                                Box_dt.Columns.Add("SNo");
                                Box_dt.Columns.Add("Selectno");
                                Box_dt.Columns.Add("ProductID");
                                Box_dt.Columns.Add("CartonNo");
                                Box_dt.Columns.Add("NewCartonNo");
                                Box_dt.Columns.Add("ProductCode");
                                Box_dt.Columns.Add("BuyerReferences");
                                Box_dt.Columns.Add("Description");
                                Box_dt.Columns.Add("ProductGroupID");
                                Box_dt.Columns.Add("CategoryID");
                                Box_dt.Columns.Add("CategoryName");
                                Box_dt.Columns.Add("QualityID");
                                Box_dt.Columns.Add("DesignID");
                                Box_dt.Columns.Add("DesignName");
                                Box_dt.Columns.Add("UOMID");
                                Box_dt.Columns.Add("UOMName");
                                Box_dt.Columns.Add("ColorID");
                                Box_dt.Columns.Add("ColorName");
                                Box_dt.Columns.Add("SizeName");
                                Box_dt.Columns.Add("SizeID");
                                Box_dt.Columns.Add("Qty");
                                Box_dt.Columns.Add("PcsCarton");
                                Box_dt.Columns.Add("TotalPcs");
                                Box_dt.Columns.Add("NetWt");
                                Box_dt.Columns.Add("GrsWt");
                                Box_dt.Columns.Add("CartonSize");
                                Box_dt.Columns.Add("PackingDetailID");
                            }
                            while (k <= ds.Tables[0].Rows.Count - 1)//get the all the data and bind to the data table
                            {

                                if (Convert.ToInt32(ds.Tables[0].Rows[k]["TotalPcs"]) > 0)
                                {
                                    int sno = Convert.ToInt32(ds.Tables[0].Rows[k]["SNo"]);
                                    string Selectno = Convert.ToString(ds.Tables[0].Rows[k]["Selectno"]);
                                    int ProductID = Convert.ToInt32(ds.Tables[0].Rows[k]["ProductID"]);
                                    string ProductCode = Convert.ToString(ds.Tables[0].Rows[k]["ProductCode"]);
                                    string Description = Convert.ToString(ds.Tables[0].Rows[k]["Description"]);
                                    int ProductGroupID = Convert.ToInt32(ds.Tables[0].Rows[k]["ProductGroupID"]);
                                    int CategoryID = Convert.ToInt32(ds.Tables[0].Rows[k]["CategoryID"]);
                                    string CategoryName = Convert.ToString(ds.Tables[0].Rows[k]["CategoryName"]);
                                    int QualityID = Convert.ToInt32(ds.Tables[0].Rows[k]["QualityID"]);
                                    int DesignID = Convert.ToInt32(ds.Tables[0].Rows[k]["DesignID"]);
                                    string DesignName = Convert.ToString(ds.Tables[0].Rows[k]["DesignName"]);
                                    int ColorID = Convert.ToInt32(ds.Tables[0].Rows[k]["ColorID"]);
                                    string ColorName = Convert.ToString(ds.Tables[0].Rows[k]["ColorName"]);
                                    int SizeID = Convert.ToInt32(ds.Tables[0].Rows[k]["SizeID"]);
                                    string SizeName = Convert.ToString(ds.Tables[0].Rows[k]["SizeName"]);
                                    int UOMID = Convert.ToInt32(ds.Tables[0].Rows[k]["UOMID"]);
                                    string UOMName = Convert.ToString(ds.Tables[0].Rows[k]["UOMName"]);
                                    decimal qty = Convert.ToDecimal(ds.Tables[0].Rows[k]["Qty"]);
                                    decimal PcsCarton = Convert.ToDecimal(ds.Tables[0].Rows[k]["PcsCarton"]);
                                    decimal TotalPcs = Convert.ToDecimal(ds.Tables[0].Rows[k]["TotalPcs"]);
                                    decimal NetWt = Convert.ToDecimal(ds.Tables[0].Rows[k]["NetWt"]);
                                    decimal GrsWt = Convert.ToDecimal(ds.Tables[0].Rows[k]["GrsWt"]);
                                    string CartonSize = Convert.ToString(ds.Tables[0].Rows[k]["CartonSize"]);
                                    string NewCartonNo = Convert.ToString(ds.Tables[0].Rows[k]["NewCartonNo"]);
                                    int CartonNo = Convert.ToInt32(ds.Tables[0].Rows[k]["CartonNo"]);
                                    string BuyerReferences = Convert.ToString(ds.Tables[0].Rows[k]["BuyerReferences"]);
                                    int PackingDetailID = Convert.ToInt32(ds.Tables[0].Rows[k]["PackingDetailID"]);



                                    for (int i = 0; i < qty; i++)
                                    {

                                        DataRow[] rows;
                                        int RowsLenth = 0;
                                        int OldCarton = CartonNo++;
                                        if (Item_dt_Job.Rows.Count > 0)
                                        {
                                            rows = Item_dt_Job.Select("CartonNo ='" + OldCarton + "'", string.Empty, DataViewRowState.CurrentRows);
                                            RowsLenth = rows.Length;
                                        }
                                        else
                                        {
                                            RowsLenth = 0;
                                        }
                                        if (RowsLenth == 0)
                                        {
                                            DataRow dr;
                                            dr = Box_dt.NewRow();
                                            Box_dt.Rows.Add(dr);
                                            BoxRow_Count = Box_dt.Rows.Count - 1;
                                            Box_dt.Rows[BoxRow_Count]["SNo"] = j++;
                                            Box_dt.Rows[BoxRow_Count]["Selectno"] = Selectno;
                                            Box_dt.Rows[BoxRow_Count]["ProductID"] = ProductID;
                                            Box_dt.Rows[BoxRow_Count]["ProductCode"] = ProductCode;
                                            Box_dt.Rows[BoxRow_Count]["Description"] = Description;
                                            Box_dt.Rows[BoxRow_Count]["ProductGroupID"] = ProductGroupID;
                                            Box_dt.Rows[BoxRow_Count]["CategoryID"] = CategoryID;
                                            Box_dt.Rows[BoxRow_Count]["CategoryName"] = CategoryName;
                                            Box_dt.Rows[BoxRow_Count]["QualityID"] = QualityID;
                                            Box_dt.Rows[BoxRow_Count]["DesignID"] = DesignID;
                                            Box_dt.Rows[BoxRow_Count]["DesignName"] = DesignName;
                                            Box_dt.Rows[BoxRow_Count]["ColorID"] = ColorID;
                                            Box_dt.Rows[BoxRow_Count]["ColorName"] = ColorName;
                                            Box_dt.Rows[BoxRow_Count]["SizeID"] = SizeID;
                                            Box_dt.Rows[BoxRow_Count]["SizeName"] = SizeName;
                                            Box_dt.Rows[BoxRow_Count]["UOMID"] = UOMID;
                                            Box_dt.Rows[BoxRow_Count]["UOMName"] = UOMName;
                                            Box_dt.Rows[BoxRow_Count]["Qty"] = qty;
                                            Box_dt.Rows[BoxRow_Count]["PcsCarton"] = PcsCarton;
                                            Box_dt.Rows[BoxRow_Count]["TotalPcs"] = TotalPcs;
                                            Box_dt.Rows[BoxRow_Count]["NetWt"] = NetWt;
                                            Box_dt.Rows[BoxRow_Count]["GrsWt"] = GrsWt;
                                            Box_dt.Rows[BoxRow_Count]["CartonSize"] = CartonSize;
                                            Box_dt.Rows[BoxRow_Count]["NewCartonNo"] = NewCartonNo;
                                            Box_dt.Rows[BoxRow_Count]["CartonNo"] = OldCarton;
                                            Box_dt.Rows[BoxRow_Count]["BuyerReferences"] = BuyerReferences;
                                            Box_dt.Rows[BoxRow_Count]["PackingDetailID"] = PackingDetailID;


                                        }

                                    }


                                }


                                k++;
                            }
                            dt_pop = Box_dt;
                            searchResult.DataSource = Box_dt;
                            searchResult.DataBind();
                        }
                        else
                        {
                            Box_dt.Clear();
                            searchResult.DataSource = Box_dt;
                            searchResult.DataBind();
                        }
                    }
                }
            }
            catch(Exception ex)
          {

           }
        }

        protected void btn_CortonOk_Click(object sender, EventArgs e) //main pop up ok
        {

            funInsertPoptogrid();
            mpe.Hide();
        }

        protected void btn_CortonCancel_Click(object sender, EventArgs e)
        {
            mpe.Hide();
        }

        protected void btn_Ok_Click(object sender, EventArgs e) //corton vaule popup
        {
            DataRow[] rows = Box_dt.Select("NewCartonNo ='"+txtPopNewCortonNo.Text+"'", string.Empty, DataViewRowState.CurrentRows);
           
            if (rows.Length == 0)
            {
                Box_dt.Rows[row_indexCorton]["NewCartonNo"] = Convert.ToString(txtPopNewCortonNo.Text.Trim());
                Box_dt.Rows[row_indexCorton]["Selectno"] = Convert.ToString("Y");
                dt_pop = Box_dt;
                searchResult.DataSource = Box_dt;
                searchResult.DataBind();
                termpopup.Hide();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
         "err_msg",
         "alert('This New Carton No. is already present!)');",
         true);
            }
        }

        protected void btn_cancen_Click(object sender, EventArgs e)
        {
            termpopup.Hide();
        }

        void funInsertPoptogrid()
        {
            DataTable Item_dt = Session["PackingItem_dt"] as DataTable;
            int row = 0;
             int k = 0;
             int r = 0;
            if (Item_dt.Rows.Count == 0)
            {
                r = 0;
            }
            else
            {
                r = Item_dt.Rows.Count;
            }

            while (k <= Box_dt.Rows.Count - 1)//get the all the data and bind to the data table
            {


                if (Convert.ToString(Box_dt.Rows[k]["Selectno"]) == "Y" && Convert.ToString(Box_dt.Rows[k]["NewCartonNo"]) != string.Empty)
                {

                

                DataRow dr = Item_dt.NewRow();
                Item_dt.Rows.Add(dr);


                Item_dt.Rows[r]["SNo"] = Box_dt.Rows[k]["SNo"].ToString();
                Item_dt.Rows[r]["ProductID"] = Box_dt.Rows[k]["ProductID"].ToString();
                Item_dt.Rows[r]["ProductCode"] = Box_dt.Rows[k]["ProductCode"].ToString();
                Item_dt.Rows[r]["CartonNo"] = Box_dt.Rows[k]["CartonNo"].ToString();
                Item_dt.Rows[r]["NewCartonNo"] = Box_dt.Rows[k]["NewCartonNo"].ToString();
                Item_dt.Rows[r]["BuyerReferences"] = Box_dt.Rows[k]["BuyerReferences"].ToString();
                Item_dt.Rows[r]["ProductGroupID"] = Box_dt.Rows[k]["ProductGroupID"].ToString();
                Item_dt.Rows[r]["CategoryID"] = Box_dt.Rows[k]["CategoryID"].ToString();
                Item_dt.Rows[r]["CategoryName"] = Box_dt.Rows[k]["CategoryName"].ToString();
                Item_dt.Rows[r]["QualityID"] = Box_dt.Rows[k]["QualityID"].ToString();
                Item_dt.Rows[r]["DesignID"] = Box_dt.Rows[k]["DesignID"].ToString();
                Item_dt.Rows[r]["DesignName"] = Box_dt.Rows[k]["DesignName"].ToString();
                Item_dt.Rows[r]["ColorID"] = Box_dt.Rows[k]["ColorID"].ToString();
                Item_dt.Rows[r]["ColorName"] = Box_dt.Rows[k]["ColorName"].ToString();
                Item_dt.Rows[r]["SizeName"] = Box_dt.Rows[k]["SizeName"].ToString();
                Item_dt.Rows[r]["SizeID"] = Box_dt.Rows[k]["SizeID"].ToString();
                Item_dt.Rows[r]["UOMName"] = Box_dt.Rows[k]["UOMName"].ToString();
                Item_dt.Rows[r]["UOMID"] = Box_dt.Rows[k]["UOMID"].ToString();
                Item_dt.Rows[r]["Qty"] = Box_dt.Rows[k]["Qty"].ToString();
                Item_dt.Rows[r]["PcsCarton"] = Box_dt.Rows[k]["PcsCarton"].ToString();
                Item_dt.Rows[r]["TotalPcs"] = Box_dt.Rows[k]["TotalPcs"].ToString();
                Item_dt.Rows[r]["NetWt"] = Box_dt.Rows[k]["NetWt"].ToString();
                Item_dt.Rows[r]["GrsWt"] = Box_dt.Rows[k]["GrsWt"].ToString();
                Item_dt.Rows[r]["CartonSize"] = Box_dt.Rows[k]["CartonSize"].ToString();
                Item_dt.Rows[r]["PackingDetailID"] = "0";  
               

              
                r++;

                }

                k++;

            }

            Session["PackingItem_dt"] = Item_dt;
            gridPacking.DataSource = Session["PackingItem_dt"] as DataTable;
            gridPacking.DataBind();
        }

        protected void DropJobNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            obj_bel_Packing._iMode = "GetJobItem";
            obj_bel_Packing._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
            using (DataSet ds = obj_dal_Packing.dal_PackingListDetail(obj_bel_Packing))
            {
                if (ds.Tables.Count > 0)
                {

                    if (ds.Tables[0].Rows.Count > 0)
                    {

                        Item_dt_Job = ds.Tables[0];
                        
                    }
                    else
                    {
                        Item_dt_Job.Clear();
                       
                    }
                }
                else
                {
                    Item_dt_Job.Clear();
                    
                }
            }
        }
    }
}