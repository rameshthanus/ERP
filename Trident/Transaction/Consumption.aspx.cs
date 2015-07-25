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
    public partial class Consumption : System.Web.UI.Page
    {
        public decimal totalReqPcs = 0;
        public decimal totalOrderQty = 0;
        public string strDuplicate = string.Empty;
        bel_Consumption obj_bel_Consumption = new bel_Consumption();
        dal_Comsumption obj_dal_Consumption = new dal_Comsumption();


        //public static DataTable Item_dt = new DataTable();
      //  public static DataTable dt_pop = new DataTable();

       // int Row_Count_Delivery = 0;
      //  public static int row_index_Delivery = 0;
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
                        obj_Common.functionCheckActhorization("Consumption", "AssignAuthorization");
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

                            txtOredrquantity.Text = "1";
                            txtSearch.Attributes.Add("onkeypress", "return handleEnter('" + btnSearchPOP.ClientID + "', event)");
                            txtProductCode.Attributes.Add("onkeypress", "return handleEnter('" + btn_Receive_Pop.ClientID + "', event)");
                            txtquantity.Attributes.Add("onkeypress", "return handleEnter('" + btn_Deli_ItemSave.ClientID + "', event)");
                            txtDeliProductCode.Attributes.Add("onkeypress", "return handleEnter('" + btn_Delivery_Pop.ClientID + "', event)");
                            txtcomsumption.Attributes.Add("onkeypress", "return handleEnter('" + btn_Deli_ItemSave.ClientID + "', event)");
                            txtExcess.Attributes.Add("onkeypress", "return handleEnter('" + btn_Deli_ItemSave.ClientID + "', event)");

                           // txtExcessValue.Attributes.Add("ReadOnly", "ReadOnly");
                            txtConsumptiondate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");
                           

                            txtProductCode.Focus();
                           
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
                                Item_dt.Columns.Add(new DataColumn("ReceivableProductID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableProductGroupID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableProductCode", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableDescription", typeof(string)));                               
                                Item_dt.Columns.Add(new DataColumn("ReceivableCategoryID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableCategoryName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableQualityID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableDesignID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableDesignName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableColorID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableColorName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableSizeName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableSizeID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableUOMID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("ReceivableOrderQty", typeof(decimal)));

                                Item_dt.Columns.Add(new DataColumn("DeliverableProductID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableProductGroupID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableProductCode", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableDescription", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableCategoryID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableCategoryName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableQualityID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableDesignID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableDesignName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableColorID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableColorName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableSizeName", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableSizeID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableUOMID", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("DeliverableOrderQty", typeof(decimal)));

                                Item_dt.Columns.Add(new DataColumn("Consumption", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("Excess", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("ExecssValue", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("ReqPcs", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("ConsumptionDetailID", typeof(Int32)));
                                Session["ConsItem_dt"] = Item_dt;
                                gridDelivery.DataSource = Session["ConsItem_dt"] as DataTable;                                
                                gridDelivery.DataBind();




                            }
                            if (hfldid.Value != "0" && hfldid.Value != string.Empty)
                            {


                                obj_bel_Consumption._ComsumptionID = Convert.ToInt32(hfldid.Value);
                                functionfetcdata(obj_bel_Consumption);
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
                obj_bel_Consumption._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Consumption._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_Consumption._ScreenName = "Consumption";
                obj_bel_Consumption._iMode = "AutoCode";
                using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            txtConsumtionNo.Text = ds.Tables[0].Rows[0][0].ToString();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        void functionfetcdata(bel_Consumption obj_bel_Consumption)  //selected item will sow the corresponding text box
        {
            try
            {

                obj_bel_Consumption._iMode = "Fetch";
                using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["ComsumptionID"] != null)
                            {
                                hfldid.Value = ds.Tables[0].Rows[0]["ComsumptionID"].ToString();
                            }
                            if (ds.Tables[0].Rows[0]["ConsumptionNo"] != null)
                            {

                                txtConsumtionNo.Text = ds.Tables[0].Rows[0]["ConsumptionNo"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["ConsumptionDate"] != null)
                            {

                                DateTime date = System.DateTime.Now;
                                date = Convert.ToDateTime(ds.Tables[0].Rows[0]["ConsumptionDate"]);

                                txtConsumptiondate.Text = date.ToString("dd-MMM-yyyy");
                               

                            }
                            if (ds.Tables[0].Rows[0]["PartyID"] != null)
                            {

                                DropCustomer.SelectedValue = ds.Tables[0].Rows[0]["PartyID"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["JOBID"] != null)
                            {

                                DropJobNo.SelectedValue = ds.Tables[0].Rows[0]["JOBID"].ToString();

                            }
                            

                            if (ds.Tables[0].Rows[0]["Status"] != null)
                            {


                                //rblPaymenttype.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();

                            }
                           






                        }
                       
                        if (ds.Tables[1].Rows.Count > 0)
                        {
                            
                        
                            Session["ConsItem_dt"] = ds.Tables[1];
                            gridDelivery.DataSource = Session["ConsItem_dt"] as DataTable;
                            gridDelivery.DataBind();

                        }

                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:functionfetcdata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionbindcombo()
        {
            try
            {


                obj_bel_Consumption._iMode = "ComboBind";
                using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            DropCustomer.DataValueField = "PartyID";
                            DropCustomer.DataTextField = "PartyName";
                            DropCustomer.DataSource = ds.Tables[0];
                            DropCustomer.DataBind();
                            DropCustomer.SelectedIndex = 0;

                            
                        }
                        if (ds.Tables[1].Rows.Count > 0)
                        {

                            DropJobNo.DataValueField = "JOBID";
                            DropJobNo.DataTextField = "JOBCode";
                            DropJobNo.DataSource = ds.Tables[1];
                            DropJobNo.DataBind();
                            DropJobNo.SelectedIndex = 0;
                        }
                        if (ds.Tables[2].Rows.Count > 0)
                        {

                            DropDesign.DataValueField = "DesignID";
                            DropDesign.DataTextField = "DesignName";
                            DropDesign.DataSource = ds.Tables[2];
                            DropDesign.DataBind();
                            DropDesign.SelectedIndex = 0;

                            DropDeliDesign.DataValueField = "DesignID";
                            DropDeliDesign.DataTextField = "DesignName";
                            DropDeliDesign.DataSource = ds.Tables[2];
                            DropDeliDesign.DataBind();
                            DropDeliDesign.SelectedIndex = 0;
                        }

                        if (ds.Tables[3].Rows.Count > 0)
                        {
                            Dropcolour.DataValueField = "ColorID";
                            Dropcolour.DataTextField = "ColorName";
                            Dropcolour.DataSource = ds.Tables[3];
                            Dropcolour.DataBind();
                            Dropcolour.SelectedIndex = 0;

                            DropDeliColor.DataValueField = "ColorID";
                            DropDeliColor.DataTextField = "ColorName";
                            DropDeliColor.DataSource = ds.Tables[3];
                            DropDeliColor.DataBind();
                            DropDeliColor.SelectedIndex = 0;
                        }
                        if (ds.Tables[4].Rows.Count > 0)
                        {

                            Dropsize.DataValueField = "SizeID";
                            Dropsize.DataTextField = "SizeName";
                            Dropsize.DataSource = ds.Tables[4];
                            Dropsize.DataBind();
                            Dropsize.SelectedIndex = 0;

                            DropDeliSize.DataValueField = "SizeID";
                            DropDeliSize.DataTextField = "SizeName";
                            DropDeliSize.DataSource = ds.Tables[4];
                            DropDeliSize.DataBind();
                            DropDeliSize.SelectedIndex = 0;
                        }

                        if (ds.Tables[5].Rows.Count > 0)
                        {

                            DropCategory.DataValueField = "CategoryID";
                            DropCategory.DataTextField = "CategoryName";
                            DropCategory.DataSource = ds.Tables[5];
                            DropCategory.DataBind();
                            DropCategory.SelectedIndex = 0;

                            DropDeliCategory.DataValueField = "CategoryID";
                            DropDeliCategory.DataTextField = "CategoryName";
                            DropDeliCategory.DataSource = ds.Tables[5];
                            DropDeliCategory.DataBind();
                            DropDeliCategory.SelectedIndex = 0;
                        }
                        


                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:functionbindcombo", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }


        void funBindValueReceive(string ProductCode, Int32 ProformaID, Int32 Qty, Int32 ProductID)
        {
            try
            {
                obj_bel_Consumption._ProductID = ProductID;
                obj_bel_Consumption._ProformaID = ProformaID;
                obj_bel_Consumption._ProductCode = ProductCode;
                obj_bel_Consumption._iMode = "ProductCode";
                using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
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

                            hReceiveItemID.Value = ds.Tables[0].Rows[0]["ProductID"].ToString();
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

                                HUOMID.Value = ds.Tables[0].Rows[0]["UOMID"].ToString();
                            }


                            if (Convert.ToString(ds.Tables[0].Rows[0]["OrderQty"].ToString()) != string.Empty)
                            {
                                txtOredrquantity.Text = ds.Tables[0].Rows[0]["OrderQty"].ToString();
                                //txtquantity.Text = ds.Tables[0].Rows[0]["OrderQty"].ToString();
                            }



                        }

                        if (ds.Tables[1].Rows.Count > 0)
                        {
                            if (Convert.ToString(ds.Tables[1].Rows[0]["Qty"].ToString()) != string.Empty)
                            {

                                txtquantity.Text =Convert.ToString( Convert.ToInt32( ds.Tables[1].Rows[0]["Qty"].ToString()) * Convert.ToInt32( Qty));
                            }
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:funBindValueReceive", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        void funBindValueDelivery(string ProductCode)
        {
            try
            {


                obj_bel_Consumption._ProductCode = ProductCode;
                obj_bel_Consumption._iMode = "ProductCode";
                using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
                {
                    if (ds.Tables.Count > 0)
                    {

                        if (ds.Tables[0].Rows.Count == 0)
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Inactive Item.');", true);
                            txtDeliProductCode.Focus();

                        }
                        else if (ds.Tables[0].Rows[0][0].ToString() == "Exists")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Product Code Does not Exists.');", true);
                            txtDeliProductCode.Focus();

                        }

                        else if (ds.Tables[0].Rows[0][1].ToString() != string.Empty)
                        {

                            hDeliveryItemID.Value = ds.Tables[0].Rows[0]["ProductID"].ToString();
                            if (Convert.ToString(ds.Tables[0].Rows[0]["Description"].ToString()) != string.Empty)
                            {

                                txtDeliDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["ProductCode"].ToString()) != string.Empty)
                            {

                                txtDeliProductCode.Text = ds.Tables[0].Rows[0]["ProductCode"].ToString();
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["ProductGroupID"].ToString()) != string.Empty)
                            {

                                HDeliProductGroupID.Value = ds.Tables[0].Rows[0]["ProductGroupID"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["CategoryID"].ToString()) != string.Empty)
                            {

                                DropDeliCategory.SelectedValue = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["QualityID"].ToString()) != string.Empty)
                            {

                                HDeliQualityID.Value = ds.Tables[0].Rows[0]["QualityID"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["DesignID"].ToString()) != string.Empty)
                            {

                                DropDeliDesign.SelectedValue = ds.Tables[0].Rows[0]["DesignID"].ToString();
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["ColorID"].ToString()) != string.Empty)
                            {

                                DropDeliColor.SelectedValue = ds.Tables[0].Rows[0]["ColorID"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["SizeID"].ToString()) != string.Empty)
                            {

                                DropDeliSize.SelectedValue = ds.Tables[0].Rows[0]["SizeID"].ToString();
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["UOMID"].ToString()) != string.Empty)
                            {

                                HDeliUOMID.Value = ds.Tables[0].Rows[0]["UOMID"].ToString();
                            }


                            if (Convert.ToString(ds.Tables[0].Rows[0]["OrderQty"].ToString()) != string.Empty)
                            {
                                
                                //txtDeliOrderQty.Text = ds.Tables[0].Rows[0]["OrderQty"].ToString();
                                txtDeliOrderQty.Text = txtquantity.Text;
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["Consumption"].ToString()) != string.Empty)
                            {

                                txtcomsumption.Text = ds.Tables[0].Rows[0]["Consumption"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["Excess"].ToString()) != string.Empty)
                            {

                                txtExcess.Text = ds.Tables[0].Rows[0]["Excess"].ToString();
                            }

                            if (Convert.ToString(ds.Tables[0].Rows[0]["ReqPcs"].ToString()) != string.Empty)
                            {

                                txtPcs.Text = ds.Tables[0].Rows[0]["ReqPcs"].ToString();
                            }



                        }
                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:funBindValueDelivery", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

       

        void funAdditemtodatatableDelivery(int row)
        {
            try
            {
                DataTable Item_dt = Session["ConsItem_dt"] as DataTable;
                int Row_Count_Delivery = Convert.ToInt32(Session["ConsRow_Count"]);
                int row_index_Delivery = Convert.ToInt32(Session["Consrow_index"]);
                if (Item_dt.Rows.Count == 1)
                {

                    if (Convert.ToString(Item_dt.Rows[Row_Count_Delivery]["ReceivableProductID"]) == string.Empty
                        && Convert.ToString(Item_dt.Rows[Row_Count_Delivery]["DeliverableProductID"]) == string.Empty
                        && Convert.ToString(Item_dt.Rows[Row_Count_Delivery]["ReceivableProductGroupID"]) == string.Empty)
                    {
                        Item_dt.Rows[0].Delete();
                    }

                }
                
                if (Convert.ToString(hDeliveryUpdateID.Value) == "0")
                {
                    DataRow dr;
                    dr = Item_dt.NewRow();
                    Item_dt.Rows.Add(dr);
                    Row_Count_Delivery = Item_dt.Rows.Count - 1;
                    
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableProductID"] = Convert.ToInt32(hReceiveItemID.Value);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableProductCode"] = Convert.ToString(txtProductCode.Text);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableDescription"] = Convert.ToString(txtDescription.Text);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableProductGroupID"] = Convert.ToInt32(HProductGroupID.Value);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableCategoryID"] = Convert.ToInt32(DropCategory.SelectedValue);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableCategoryName"] = Convert.ToString(DropCategory.SelectedItem);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableQualityID"] = Convert.ToInt32(HQualityID.Value);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableDesignID"] = Convert.ToInt32(DropDesign.SelectedValue);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableDesignName"] = Convert.ToString(DropDesign.SelectedItem);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableColorID"] = Convert.ToInt32(Dropcolour.SelectedValue);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableColorName"] = Convert.ToString(Dropcolour.SelectedItem);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableSizeName"] = Convert.ToString(Dropsize.SelectedItem);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableSizeID"] = Convert.ToInt32(Dropsize.SelectedValue);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableUOMID"] = Convert.ToInt32(HUOMID.Value);
                    Item_dt.Rows[Row_Count_Delivery]["ReceivableOrderQty"] = Convert.ToDecimal(txtquantity.Text);

                    txtDeliOrderQty.Text = txtquantity.Text;
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableProductID"] = Convert.ToInt32(hDeliveryItemID.Value);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableProductCode"] = Convert.ToString(txtDeliProductCode.Text);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableDescription"] = Convert.ToString(txtDeliDescription);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableProductGroupID"] = Convert.ToInt32(HDeliProductGroupID.Value);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableCategoryID"] = Convert.ToInt32(DropDeliCategory.SelectedValue);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableCategoryName"] = Convert.ToString(DropDeliCategory.SelectedItem);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableQualityID"] = Convert.ToInt32(HDeliQualityID.Value);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableDesignID"] = Convert.ToInt32(DropDeliDesign.SelectedValue);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableDesignName"] = Convert.ToString(DropDeliDesign.SelectedItem);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableColorID"] = Convert.ToInt32(DropDeliColor.SelectedValue);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableColorName"] = Convert.ToString(DropDeliColor.SelectedItem);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableSizeName"] = Convert.ToString(DropDeliSize.SelectedItem);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableSizeID"] = Convert.ToInt32(DropDeliSize.SelectedValue);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableUOMID"] = Convert.ToInt32(HDeliUOMID.Value);
                    Item_dt.Rows[Row_Count_Delivery]["DeliverableOrderQty"] = Convert.ToDecimal(txtDeliOrderQty.Text);
                    Item_dt.Rows[Row_Count_Delivery]["Consumption"] = Convert.ToDecimal(txtcomsumption.Text);
                    Item_dt.Rows[Row_Count_Delivery]["Excess"] = Convert.ToDecimal(txtExcess.Text);
                    Item_dt.Rows[Row_Count_Delivery]["ReqPcs"] = Convert.ToDecimal(txtPcs.Text);
                    Item_dt.Rows[Row_Count_Delivery]["ExecssValue"] = Convert.ToDecimal(txtExcessValue.Text);
                    Item_dt.Rows[Row_Count_Delivery]["ConsumptionDetailID"] = "0";

                    for (int i = 0; i <= Item_dt.Rows.Count - 1; i++)
                    {
                        Item_dt.Rows[i]["SNo"] = i + 1;

                    }
                    Session["ConsItem_dt"] = Item_dt;
                    gridDelivery.DataSource = Session["ConsItem_dt"] as DataTable;
                    gridDelivery.DataBind();
                  

                }
                else if (Convert.ToString(hDeliveryUpdateID.Value) == "1")
                {
                   
                    Item_dt.Rows[row_index_Delivery]["ReceivableProductID"] = Convert.ToInt32(hReceiveItemID.Value);
                    Item_dt.Rows[row_index_Delivery]["ReceivableProductCode"] = Convert.ToString(txtProductCode.Text);
                    Item_dt.Rows[row_index_Delivery]["ReceivableDescription"] = Convert.ToString(txtDescription.Text);
                    Item_dt.Rows[row_index_Delivery]["ReceivableProductGroupID"] = Convert.ToInt32(HProductGroupID.Value);
                    Item_dt.Rows[row_index_Delivery]["ReceivableCategoryID"] = Convert.ToInt32(DropCategory.SelectedValue);
                    Item_dt.Rows[row_index_Delivery]["ReceivableCategoryName"] = Convert.ToString(DropCategory.SelectedItem);
                    Item_dt.Rows[row_index_Delivery]["ReceivableQualityID"] = Convert.ToInt32(HQualityID.Value);
                    Item_dt.Rows[row_index_Delivery]["ReceivableDesignID"] = Convert.ToInt32(DropDesign.SelectedValue);
                    Item_dt.Rows[row_index_Delivery]["ReceivableDesignName"] = Convert.ToString(DropDesign.SelectedItem);
                    Item_dt.Rows[row_index_Delivery]["ReceivableColorID"] = Convert.ToInt32(Dropcolour.SelectedValue);
                    Item_dt.Rows[row_index_Delivery]["ReceivableColorName"] = Convert.ToString(Dropcolour.SelectedItem);
                    Item_dt.Rows[row_index_Delivery]["ReceivableSizeName"] = Convert.ToString(Dropsize.SelectedItem);
                    Item_dt.Rows[row_index_Delivery]["ReceivableSizeID"] = Convert.ToInt32(Dropsize.SelectedValue);
                    Item_dt.Rows[row_index_Delivery]["ReceivableUOMID"] = Convert.ToInt32(HUOMID.Value);
                    Item_dt.Rows[row_index_Delivery]["ReceivableOrderQty"] = Convert.ToDecimal(txtquantity.Text);

                    txtDeliOrderQty.Text = txtquantity.Text;
                    Item_dt.Rows[row_index_Delivery]["DeliverableProductID"] = Convert.ToInt32(hDeliveryItemID.Value);
                    Item_dt.Rows[row_index_Delivery]["DeliverableProductCode"] = Convert.ToString(txtDeliProductCode.Text);
                    Item_dt.Rows[row_index_Delivery]["DeliverableDescription"] = Convert.ToString(txtDeliDescription);
                    Item_dt.Rows[row_index_Delivery]["DeliverableProductGroupID"] = Convert.ToInt32(HDeliProductGroupID.Value);
                    Item_dt.Rows[row_index_Delivery]["DeliverableCategoryID"] = Convert.ToInt32(DropDeliCategory.SelectedValue);
                    Item_dt.Rows[row_index_Delivery]["DeliverableCategoryName"] = Convert.ToString(DropDeliCategory.SelectedItem);
                    Item_dt.Rows[row_index_Delivery]["DeliverableQualityID"] = Convert.ToInt32(HDeliQualityID.Value);
                    Item_dt.Rows[row_index_Delivery]["DeliverableDesignID"] = Convert.ToInt32(DropDeliDesign.SelectedValue);
                    Item_dt.Rows[row_index_Delivery]["DeliverableDesignName"] = Convert.ToString(DropDeliDesign.SelectedItem);
                    Item_dt.Rows[row_index_Delivery]["DeliverableColorID"] = Convert.ToInt32(DropDeliColor.SelectedValue);
                    Item_dt.Rows[row_index_Delivery]["DeliverableColorName"] = Convert.ToString(DropDeliColor.SelectedItem);
                    Item_dt.Rows[row_index_Delivery]["DeliverableSizeName"] = Convert.ToString(DropDeliSize.SelectedItem);
                    Item_dt.Rows[row_index_Delivery]["DeliverableSizeID"] = Convert.ToInt32(DropDeliSize.SelectedValue);
                    Item_dt.Rows[row_index_Delivery]["DeliverableUOMID"] = Convert.ToInt32(HDeliUOMID.Value);
                    Item_dt.Rows[row_index_Delivery]["DeliverableOrderQty"] = Convert.ToDecimal(txtDeliOrderQty.Text);
                    Item_dt.Rows[row_index_Delivery]["Consumption"] = Convert.ToDecimal(txtcomsumption.Text);
                    Item_dt.Rows[row_index_Delivery]["Excess"] = Convert.ToDecimal(txtExcess.Text);
                    Item_dt.Rows[row_index_Delivery]["ExecssValue"] = Convert.ToDecimal(txtExcessValue.Text);
                    Item_dt.Rows[row_index_Delivery]["ReqPcs"] = Convert.ToDecimal(txtPcs.Text);
                    

                    hDeliveryUpdateID.Value = "0";
                    Session["ConsItem_dt"] = Item_dt;
                    gridDelivery.DataSource = Session["ConsItem_dt"] as DataTable;
                    gridDelivery.DataBind();

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:funAdditemtodatatableDelivery", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                Item_dt.Columns.Add(new DataColumn("ReceivableProductID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ReceivableProductGroupID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ReceivableProductCode", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("ReceivableDescription", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("ReceivableCategoryID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ReceivableCategoryName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("ReceivableQualityID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ReceivableDesignID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ReceivableDesignName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("ReceivableColorID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ReceivableColorName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("ReceivableSizeName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("ReceivableSizeID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ReceivableUOMID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("ReceivableOrderQty", typeof(decimal)));

                Item_dt.Columns.Add(new DataColumn("DeliverableProductID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DeliverableProductGroupID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DeliverableProductCode", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("DeliverableDescription", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("DeliverableCategoryID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DeliverableCategoryName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("DeliverableQualityID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DeliverableDesignID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DeliverableDesignName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("DeliverableColorID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DeliverableColorName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("DeliverableSizeName", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("DeliverableSizeID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DeliverableUOMID", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("DeliverableOrderQty", typeof(decimal)));

                Item_dt.Columns.Add(new DataColumn("Consumption", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("Excess", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("ExecssValue", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("ReqPcs", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("ConsumptionDetailID", typeof(Int32)));
                Session["ConsItem_dt"] = Item_dt;
                gridDelivery.DataSource = Session["ConsItem_dt"] as DataTable;
                gridDelivery.DataBind();




            }
        }
        public void functioncleardata()
        {
            try
            {
                
                hfldid.Value = "0";
                Session["HeaderID"] = "0";
                hReceiveItemID.Value = "0";
                hDeliveryItemID.Value = "0";
                HUOMID.Value = "0";
                HProductGroupID.Value = "0";
                HQualityID.Value = "0";
                HDeliUOMID.Value = "0";
                HDeliProductGroupID.Value = "0";
                HDeliQualityID.Value = "0";
                txtConsumtionNo.Text = string.Empty;
                DropCustomer.SelectedIndex = 0;
                txtConsumptiondate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");
                DropJobNo.SelectedIndex = 0;
                
                txtProductCode.Text = string.Empty;
                DropDesign.SelectedIndex = 0;
                Dropsize.SelectedIndex = 0;
                txtquantity.Text = string.Empty;                
                txtDescription.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropCategory.SelectedIndex = 0;             
                
                HTotalQty.Value = "0";
                HTotalPcsMtr.Value = "0";
                txtOredrquantity.Text = "1";
                txtDeliProductCode.Text = string.Empty;
                DropDeliDesign.SelectedIndex = 0;
                DropDeliSize.SelectedIndex = 0;
                txtDeliOrderQty.Text = string.Empty;
                txtDeliDescription.Text = string.Empty;
                DropDeliColor.SelectedIndex = 0;
                DropDeliCategory.SelectedIndex = 0;
                txtcomsumption.Text = string.Empty;
                txtExcess.Text = string.Empty;
                txtPcs.Text = string.Empty;
                txtExcessValue.Text = string.Empty;

                funInitialDataTable();
                funGetAutoCode();
                txtProductCode.Focus();
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:functioncleardata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funItemSaveClearDataReceive()
        {
            try
            {

                txtProductCode.Text = string.Empty;
                DropDesign.SelectedIndex = 0;
                Dropsize.SelectedIndex = 0;
                txtquantity.Text = string.Empty;
                txtDescription.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropCategory.SelectedIndex = 0;

                txtOredrquantity.Text = "1";
                hReceiveItemID.Value = "0";                
                HUOMID.Value = "0";
                HProductGroupID.Value = "0";
                HQualityID.Value = "0";
                txtExcessValue.Text = string.Empty;
                txtProductCode.Focus();

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:funItemSaveClearDataReceive", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        void funItemSaveClearDataDelivery()
        {
            try
            {

                txtDeliProductCode.Text = string.Empty;
                DropDeliDesign.SelectedIndex = 0;
                DropDeliSize.SelectedIndex = 0;
                txtDeliOrderQty.Text = string.Empty;
                txtDeliDescription.Text = string.Empty;
                DropDeliColor.SelectedIndex = 0;
                DropDeliCategory.SelectedIndex = 0;
                txtcomsumption.Text = string.Empty;
                txtExcess.Text = string.Empty;
                txtPcs.Text = string.Empty;

               
                hDeliveryItemID.Value = "0";               
                HDeliUOMID.Value = "0";
                HDeliProductGroupID.Value = "0";
                HDeliQualityID.Value = "0";

                txtDeliProductCode.Focus();

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:funItemSaveClearDataDelivery", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        Boolean CheckDuplicatecustomer()
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
            obj_bel_Consumption._BillFromDate = Convert.ToDateTime(FromDate);
            obj_bel_Consumption._BillToDate = Convert.ToDateTime(Todate);
            obj_bel_Consumption._ConsumptionNo = funGetAutoCodeDuplicate();
            obj_bel_Consumption._iMode = "Duplicate";
            obj_bel_Consumption._ComsumptionID = Convert.ToInt32(hfldid.Value);
            obj_bel_Consumption._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);


            using (DataSet dsUom = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
            {
               
                if ((dsUom.Tables[0].Rows[0][0].ToString() == "0") && (dsUom.Tables[1].Rows[0][0].ToString() == "0"))
                {
                    if (gridDelivery.Rows.Count > 0)
                    {
                        return false;
                    }
                    
                }
               
                
               
            }
            return true;
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
                obj_bel_Consumption._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Consumption._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_Consumption._ScreenName = "Consumption";
                obj_bel_Consumption._iMode = "AutoCode";
                using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
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
                obj_Common.LogFile(ex.Message, "Consumption:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
            return "0";
        }

        void functionSaverecord() //Save the record to the table
        {
            try
            {
                if (CheckDuplicatecustomer() == false)
                {
                    if (hfldid.Value == "0")
                    {
                        obj_bel_Consumption._iMode = "Insert";

                        funAutoGentration();
                    }
                    else
                    {
                        obj_bel_Consumption._iMode = "Update";


                    }


                    obj_bel_Consumption._ComsumptionID = Convert.ToInt32(hfldid.Value);


                    


                    if (DropCustomer.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Consumption._PartyID = Convert.ToInt32(DropCustomer.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Consumption._PartyID = 0;
                    }


                    if (txtConsumptiondate.Text.Trim() != string.Empty)
                    {


                        obj_bel_Consumption._ConsumptionDate = Convert.ToDateTime(txtConsumptiondate.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Consumption._ConsumptionDate = System.DateTime.Now;
                    }


                    if (DropJobNo.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_Consumption._JOBID = Convert.ToInt32(DropJobNo.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_Consumption._JOBID = 0;
                    }



                    
                    if (HTotalQty.Value.Trim() != string.Empty)
                    {


                        obj_bel_Consumption._TotalQty = Convert.ToDecimal(HTotalQty.Value);
                    }
                    else
                    {
                        obj_bel_Consumption._TotalQty = 0;
                    }

                    if (HTotalPcsMtr.Value.Trim() != string.Empty)
                    {


                        obj_bel_Consumption._TotalReqmtr = Convert.ToDecimal(HTotalPcsMtr.Value);
                    }
                    else
                    {
                        obj_bel_Consumption._TotalReqmtr = 0;
                    }

                    if (txtConsumtionNo.Text.Trim() != string.Empty)
                    {


                        obj_bel_Consumption._ConsumptionNo = Convert.ToString(txtConsumtionNo.Text.Trim());
                    }
                    else
                    {
                        obj_bel_Consumption._ConsumptionNo = string.Empty;
                    }
                    int result = 0;

                   // DataTable dt_new = new DataTable();
                    //DataTable dt_new1 = new DataTable();
                  //  dt_new = funcSUMDuplicateValueReceive();
                   // dt_new1 = funcSUMDuplicateValueDelivery();
                    result = obj_dal_Consumption.dal_ConsumptionInsert(obj_bel_Consumption, Session["ConsItem_dt"] as DataTable);


                    if (result.ToString() == "1" || result.ToString() == "2" || result.ToString() == "3" || result.ToString() == "4")
                    {

                        //functioncleardata();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Saved Successfully');", true);
                        hfldid.Value = Convert.ToString(Session["HeaderID"]);
                        obj_bel_Consumption._ComsumptionID = Convert.ToInt32(hfldid.Value);
                        functioncleardata();
                        functionfetcdata(obj_bel_Consumption);
                        
                    }
                }

                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Consumption No or Job Number Already Exists or Please enter the atleast one item');", true);
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:functionSaverecord", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        

        //public DataTable funcSUMDuplicateValueDelivery()
        //{
        //    DataTable dt = new DataTable();
        //    try
        //    {



        //        var result = Item_dt.AsEnumerable()
        //                    .GroupBy(r => new
        //                    {
        //                        ProductID = r.Field<Int32>("ReceivableProductID"),
        //                        ProductGroupID = r.Field<Int32>("ReceivableProductGroupID"),
        //                        UOMID = r.Field<Int32>("DeliverableUOMID"),
        //                        CategoryID = r.Field<Int32>("DeliverableCategoryID"),
        //                        QualityID = r.Field<Int32>("DeliverableQualityID"),
        //                        DesignID = r.Field<Int32>("DeliverableDesignID"),
        //                        ColorID = r.Field<Int32>("DeliverableColorID"),
        //                        SizeID = r.Field<Int32>("DeliverableSizeID"),

        //                        DeliverableProductID = r.Field<Int32>("DeliverableProductID"),
        //                        DeliverableProductGroupID = r.Field<Int32>("DeliverableProductGroupID"),
        //                        DeliverableUOMID = r.Field<Int32>("DeliverableUOMID"),
        //                        DeliverableCategoryID = r.Field<Int32>("DeliverableCategoryID"),
        //                        DeliverableQualityID = r.Field<Int32>("DeliverableQualityID"),
        //                        DeliverableDesignID = r.Field<Int32>("DeliverableDesignID"),
        //                        DeliverableColorID = r.Field<Int32>("DeliverableColorID"),
        //                        DeliverableSizeID = r.Field<Int32>("DeliverableSizeID"),
                               
                                
        //                    })
        //                    .Select(g =>
        //                    {
        //                        var row = g.First();
        //                        row.SetField("OrderQty", g.Sum(r => r.Field<Int32>("OrderQty")));
        //                        row.SetField("Consumption", g.Sum(r => r.Field<decimal>("Consumption")));
        //                        row.SetField("Excess", g.Sum(r => r.Field<decimal>("Excess")));
        //                        row.SetField("ReqPcs", g.Sum(r => r.Field<decimal>("ReqPcs")));

        //                        return row;
        //                    }).CopyToDataTable();

        //        dt = result;

        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    return dt;
        //}
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
                obj_bel_Consumption._ScreenName = "Consumption";
                obj_bel_Consumption._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_Consumption._BillToDate = Convert.ToDateTime(Todate);
                using (DataSet ds = obj_dal_Consumption.dal_AutoGen(obj_bel_Consumption))
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
                                txtConsumtionNo.Text = ds.Tables[0].Rows[0][0].ToString();

                            }

                        }
                    }

                }

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:funGentrateAutogen", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

      

        protected void gridDelivery_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                DataTable Item_dt = Session["ConsItem_dt"] as DataTable;
                
                if (e.CommandName.ToUpper() == "DELETEROW")
                {
                    
                        //get the row index then only you get selected row id
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;

                        if (Convert.ToString(gridDelivery.DataKeys[row.RowIndex]["ConsumptionDetailID"].ToString()) != "0")
                        {

                            if (Common.CommonVariablesandmsg.DeleteRigts == "Y")
                            {

                            obj_bel_Consumption._ConsumptionDetailID = Convert.ToInt32(gridDelivery.DataKeys[row.RowIndex]["ConsumptionDetailID"].ToString());
                            obj_bel_Consumption._iMode = "ItemDelete";
                            using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
                            {


                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        if (ds.Tables[0].Rows[0][0].ToString() == "1")
                                        {

                                            Item_dt.Rows[d].Delete();
                                            Item_dt.AcceptChanges();
                                            Session["ConsItem_dt"] = Item_dt;
                                            gridDelivery.DataSource = Session["ConsItem_dt"] as DataTable;
                                            gridDelivery.DataBind();
                                            
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
                                Session["ConsItem_dt"] = Item_dt;
                                gridDelivery.DataSource = Session["ConsItem_dt"] as DataTable;
                                gridDelivery.DataBind();

                            }
                            else
                            {
                                Session["ConsItem_dt"] = Item_dt;
                                gridDelivery.DataSource = Session["ConsItem_dt"] as DataTable;
                                gridDelivery.DataBind();
                            }

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Deleted Successfully');", true);
                        }
                   

                }
                if (e.CommandName.ToUpper() == "EDITROW")
                {
                    
                        
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;
                        if (Convert.ToString(gridDelivery.DataKeys[row.RowIndex]["ConsumptionDetailID"].ToString()) != "0")
                        {
                            if (Common.CommonVariablesandmsg.EditRigts == "Y")
                            {

                            obj_bel_Consumption._ConsumptionDetailID = Convert.ToInt32(Convert.ToInt32(gridDelivery.DataKeys[row.RowIndex]["ConsumptionDetailID"].ToString()));


                            txtProductCode.Text = Item_dt.Rows[d]["ReceivableProductCode"].ToString();
                            hReceiveItemID.Value = Item_dt.Rows[d]["ReceivableProductID"].ToString();
                            txtDescription.Text = Convert.ToString(Item_dt.Rows[d]["ReceivableDescription"]);
                            HProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["ReceivableProductGroupID"]);
                            HQualityID.Value = Convert.ToString(Item_dt.Rows[d]["ReceivableQualityID"]);
                            DropCategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ReceivableCategoryID"]);
                            DropDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ReceivableDesignID"]);
                            Dropcolour.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ReceivableColorID"]);
                            HUOMID.Value = Convert.ToString(Item_dt.Rows[d]["ReceivableUOMID"]);
                            Dropsize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ReceivableSizeID"]);
                            txtquantity.Text = Convert.ToString(Item_dt.Rows[d]["ReceivableOrderQty"]); 

                            txtDeliProductCode.Text = Item_dt.Rows[d]["DeliverableProductCode"].ToString();
                            hDeliveryItemID.Value = Item_dt.Rows[d]["DeliverableProductID"].ToString();
                            txtDeliDescription.Text = Convert.ToString(Item_dt.Rows[d]["DeliverableDescription"]);
                            HDeliProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["DeliverableProductGroupID"]);
                            HDeliQualityID.Value = Convert.ToString(Item_dt.Rows[d]["DeliverableQualityID"]);
                            DropDeliCategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DeliverableCategoryID"]);
                            DropDeliDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DeliverableDesignID"]);
                            DropDeliColor.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DeliverableColorID"]);
                            HDeliUOMID.Value = Convert.ToString(Item_dt.Rows[d]["DeliverableUOMID"]);
                            DropDeliSize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DeliverableSizeID"]);
                            txtDeliOrderQty.Text = Convert.ToString(Item_dt.Rows[d]["DeliverableOrderQty"]);
                            txtcomsumption.Text = Convert.ToString(Item_dt.Rows[d]["Consumption"]);
                            txtExcess.Text = Convert.ToString(Item_dt.Rows[d]["Excess"]);
                            txtPcs.Text = Convert.ToString(Item_dt.Rows[d]["ReqPcs"]);
                         txtExcessValue.Text = Convert.ToString(Item_dt.Rows[d]["ExecssValue"]);
                            //HReceiveQty.Value = Convert.ToString(Item_dt.Rows[d]["OrderQty"]);
                            
                            hDeliveryUpdateID.Value = "1";
                            Session["Consrow_index"] = d;
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);


                        }
                        }
                        else
                        {

                            txtProductCode.Text = Item_dt.Rows[d]["ReceivableProductCode"].ToString();
                            hReceiveItemID.Value = Item_dt.Rows[d]["ReceivableProductID"].ToString();
                            txtDescription.Text = Convert.ToString(Item_dt.Rows[d]["ReceivableDescription"]);
                            HProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["ReceivableProductGroupID"]);
                            HQualityID.Value = Convert.ToString(Item_dt.Rows[d]["ReceivableQualityID"]);
                            DropCategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ReceivableCategoryID"]);
                            DropDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ReceivableDesignID"]);
                            Dropcolour.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ReceivableColorID"]);
                            HUOMID.Value = Convert.ToString(Item_dt.Rows[d]["ReceivableUOMID"]);
                            Dropsize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ReceivableSizeID"]);
                            txtquantity.Text = Convert.ToString(Item_dt.Rows[d]["ReceivableOrderQty"]);

                            txtDeliProductCode.Text = Item_dt.Rows[d]["DeliverableProductCode"].ToString();
                            hDeliveryItemID.Value = Item_dt.Rows[d]["DeliverableProductID"].ToString();
                            txtDeliDescription.Text = Convert.ToString(Item_dt.Rows[d]["DeliverableDescription"]);
                            HDeliProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["DeliverableProductGroupID"]);
                            HDeliQualityID.Value = Convert.ToString(Item_dt.Rows[d]["DeliverableQualityID"]);
                            DropDeliCategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DeliverableCategoryID"]);
                            DropDeliDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DeliverableDesignID"]);
                            DropDeliColor.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DeliverableColorID"]);
                            HDeliUOMID.Value = Convert.ToString(Item_dt.Rows[d]["DeliverableUOMID"]);
                            DropDeliSize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DeliverableSizeID"]);
                            txtDeliOrderQty.Text = Convert.ToString(Item_dt.Rows[d]["DeliverableOrderQty"]);
                            txtcomsumption.Text = Convert.ToString(Item_dt.Rows[d]["Consumption"]);
                            txtExcess.Text = Convert.ToString(Item_dt.Rows[d]["Excess"]);
                            txtExcessValue.Text = Convert.ToString(Item_dt.Rows[d]["ExecssValue"]);
                            txtPcs.Text = Convert.ToString(Item_dt.Rows[d]["ReqPcs"]);
                            hDeliveryUpdateID.Value = "1";
                            Session["Consrow_index"] = d;


                        }


                   
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:gridDelivery_RowCommand", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }


        public decimal GetReqPcsMtr()
        {

            HTotalPcsMtr.Value = Convert.ToString(totalReqPcs);
            return totalReqPcs;
        }
        public decimal GetOrderQty()
        {

            HTotalQty.Value = Convert.ToString(totalOrderQty);
            return totalOrderQty;
        }
        protected void gridDelivery_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Separator)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                decimal fqty = (decimal)rowView["DeliverableOrderQty"];

                decimal psc = (decimal)rowView["ReqPcs"];
                totalOrderQty += fqty;
                totalReqPcs += psc;
            }
        }

       




       

        protected void btn_Deli_ItemSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Common.CommonVariablesandmsg.SaveRigts == "Y")
                {

                    int i = 0;                    
                    funAdditemtodatatableDelivery(i);
                    funItemSaveClearDataReceive();
                    funItemSaveClearDataDelivery();
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Save this screen');", true);


                }




            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:btn_Deli_ItemSave_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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

                        obj_bel_Consumption._iMode = "Insert";
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
                        obj_bel_Consumption._iMode = "Update";
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

            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {
                if (Common.CommonVariablesandmsg.ViewRights == "Y")
                {
                    Response.Redirect("../SearchListTransaction.aspx?pg=CONSUMPTION");
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view this screen');", true);


                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:Search_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            functioncleardata();
            funItemSaveClearDataDelivery();
            funItemSaveClearDataReceive();
            
        }

        protected void Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HomeContentPage.aspx");
        }




        void funBindGridPopup(string ProductCode, string iMode)
        {
            try
            {


                obj_bel_Consumption._ProductCode = ProductCode;
                obj_bel_Consumption._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                obj_bel_Consumption._iMode = iMode;
                using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
                {
                    if (ds.Tables.Count > 0)
                    {

                        if (ds.Tables[0].Rows.Count == 0)
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Inactive Item.');", true);

                            if (HPopName.Value == "Receive")
                            {
                                txtProductCode.Focus();
                            }
                            else if (HPopName.Value == "Delivery")
                            {
                                txtDeliProductCode.Focus();
                            }
                            


                        }
                        else if (ds.Tables[0].Rows[0][0].ToString() == "Exists")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('There is no stock.');", true);
                            if (HPopName.Value == "Receive")
                            {
                                txtProductCode.Focus();
                            }
                            else if (HPopName.Value == "Delivery")
                            {
                                txtDeliProductCode.Focus();
                            }

                        }

                        else if (ds.Tables[0].Rows[0][1].ToString() != string.Empty)
                        {
                            
                            Session["Consdt_pop"] = ds.Tables[0];
                            searchResult.DataSource = Session["Consdt_pop"] as DataTable;
                            searchResult.DataBind();

                        }
                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:funBindGridPopup", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        protected void btn_Receive_Pop_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToString(DropJobNo.SelectedValue) != "0" && Convert.ToString(DropJobNo.SelectedValue) != String.Empty)
                {
                    HPopName.Value = "Receive";
                    string ItemCode = string.Empty;
                    string Barcode = string.Empty;
                    if (Convert.ToString(txtProductCode.Text) != string.Empty)
                    {
                        ItemCode = Convert.ToString(txtProductCode.Text);
                    }
                    funBindGridPopup(ItemCode, "GridPopup");
                    txtSearch.Text = txtProductCode.Text.Trim();
                    funFilterProductCode();

                    mpe.Show();


                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please Select te Job No.');", true);


                }

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:btn_Receive_Pop_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void btn_Delivery_Pop_Click(object sender, EventArgs e)
        {
            try
            {
                HPopName.Value = "Delivery";
                string ItemCode = string.Empty;
                string Barcode = string.Empty;
                if (Convert.ToString(txtDeliProductCode.Text) != string.Empty)
                {

                    ItemCode = Convert.ToString(txtDeliProductCode.Text);
                }
                funBindGridPopup(ItemCode, "GridPopupAll");
                txtSearch.Text = txtDeliProductCode.Text.Trim();
                funFilterProductCode();
                
                mpe.Show();
                

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:btn_Delivery_Pop_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

       

        protected void searchResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToUpper() == "EDITROW")
                {

                    string ProductCode = string.Empty;
                    int ProformaID = 0;
                    int Qty = 0;
                    int ProductID=0;
                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResult.DataKeys[row.RowIndex]["ProductCode"].ToString()) != "0")
                    {
                        ProductCode = Convert.ToString(searchResult.DataKeys[row.RowIndex]["ProductCode"].ToString());

                        Label chkIslblProformaID = (Label)(searchResult.Rows[row.RowIndex].FindControl("lblProformaID"));
                        ProformaID = Convert.ToInt32(chkIslblProformaID.Text);
                        Label chkIslblQuantity = (Label)(searchResult.Rows[row.RowIndex].FindControl("lblQuantity"));
                        Qty = Convert.ToInt32(chkIslblQuantity.Text);

                        Label chkIslblProductID = (Label)(searchResult.Rows[row.RowIndex].FindControl("lblProductID"));
                        ProductID = Convert.ToInt32(chkIslblProductID.Text);
                        
                        
                        if (HPopName.Value == "Receive")
                        {

                            txtProductCode.Text = ProductCode;
                            funBindValueReceive(ProductCode, ProformaID, Qty, ProductID);
                            mpe.Hide();
                            txtquantity.Focus();
                        }
                        else if (HPopName.Value == "Delivery")
                        {
                            
                            txtDeliProductCode.Text = ProductCode;
                            funBindValueDelivery(ProductCode);
                            mpe.Hide();
                            txtcomsumption.Focus();
                            
                        }









                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:searchResult_RowCommand", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                DataTable dt_pop = Session["Consdt_pop"] as DataTable;

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
                       // Session["Consdt_pop"] = dt;
                        searchResult.DataSource = dt;
                        searchResult.DataBind();
                    }
                    catch (Exception ex)
                    {
                        throw(ex);
                    }
                }


                txtSearch.Focus();
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "Consumption:funFilterProductCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void Print_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(hfldid.Value.ToString()) != "0" && Convert.ToString(hfldid.Value.ToString()) != string.Empty)
            {
                //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('../Report/ReportViewer.aspx?value=CONSUMPTIONPRINT&JOBID=" + "" + "');", true);

                binddatareport();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please select the item from search');", true);
            }
        }
        public void binddatareport()
        {
            obj_bel_Consumption._iMode = "Print";
            obj_bel_Consumption._ComsumptionID= Convert.ToInt32(hfldid.Value);
            using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
            {
                if (ds.Tables.Count > 0)
                {
                   if(ds.Tables[1].Rows.Count>0)
                   {
                       Session["SaveUser"] = ds.Tables[0].Rows[0]["LoginID"].ToString();
                       ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../Report/ReportViewer.aspx?value=CONSUMPTIONPRINT" + "','_blank')", true);
                       //Report.ReportViewer rep = new Report.ReportViewer();
                       //string Path = rep.ConsumptionPrint();
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
        protected void DropJobNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            funGetCustomerfromJob();
        }

        void funGetCustomerfromJob()
        {
            if (Convert.ToString(DropJobNo.SelectedValue) != "0" && Convert.ToString(DropJobNo.SelectedValue) != string.Empty)
            {
                
                obj_bel_Consumption._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                obj_bel_Consumption._iMode = "GetCustomerJOB";
                using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            DropCustomer.SelectedValue = ds.Tables[0].Rows[0]["PartyID"].ToString();
                        }
                    }
                }
            }
        }

        protected void Abstract_Click(object sender, EventArgs e)
        {
            obj_bel_Consumption._iMode = "PrintAbstract";
            obj_bel_Consumption._ComsumptionID = Convert.ToInt32(hfldid.Value);
            using (DataSet ds = obj_dal_Consumption.dal_ConsumptionDetail(obj_bel_Consumption))
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        Session["SaveUser"] = ds.Tables[0].Rows[0]["LoginID"].ToString();
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../Report/ReportViewer.aspx?value=CONSUMPTIONPRINTABSTRACT" + "','_blank')", true);
                        //Report.ReportViewer rep = new Report.ReportViewer();
                        //string Path = rep.ConsumptionPrint();
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
}