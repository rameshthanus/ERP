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
    public partial class GPN : System.Web.UI.Page
    {
        public decimal CortonSum = 0;
        //public string TempCortonTotal = "0";
        public decimal totalFooterQty = 0;
        public decimal totalAmount = 0;
        bel_GPN obj_bel_GPN = new bel_GPN();
        dal_GPN obj_dal_GPN = new dal_GPN();
       // public static DataTable Item_dt = new DataTable();
       // public static DataTable dt_pop = new DataTable();
      //  int Row_Count = 0;
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
                        obj_Common.functionCheckActhorization("Packing", "AssignAuthorization");
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
                            txtSearch.Attributes.Add("onkeypress", "return handleEnter('" + btnSearchPOP.ClientID + "', event)");
                            txtProductCode.Attributes.Add("onkeypress", "return handleEnter('" + Button1.ClientID + "', event)");
                            txtquantity.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtCortonPcs.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtGrossWeight.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtCartonFrom.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtCorton.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtNetWeight.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            txtCartonSize.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");
                            

                            txtGPNDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");

                            txtNetWeight.Text = "0";
                            txtGrossWeight.Text = "0";
                            txtProductCode.Focus();
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
                                Item_dt.Columns.Add(new DataColumn("CartonPcs", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("Carton", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("Pcs", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("NetWt", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("GrsWt", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("CartonSize", typeof(string)));
                                Item_dt.Columns.Add(new DataColumn("CartonFrom", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("CartonTo", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("Combined", typeof(Int32)));
                                Item_dt.Columns.Add(new DataColumn("GPNDetailID", typeof(Int32)));

                                //DataRow dr;
                                //dr = Item_dt.NewRow();
                                //Item_dt.Rows.Add(dr);

                                Session["GPNItem_dt"] = Item_dt;
                                gridGPN.DataSource = Session["GPNItem_dt"] as DataTable;
                                gridGPN.DataBind();




                            }
                            if (hfldid.Value != "0" && hfldid.Value != string.Empty)
                            {


                                obj_bel_GPN._GPNID = Convert.ToInt32(hfldid.Value);
                                functionfetcdata(obj_bel_GPN);
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
                obj_bel_GPN._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_GPN._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_GPN._ScreenName = "GPN";
                obj_bel_GPN._iMode = "AutoCode";
                using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            txtGPNNo.Text = ds.Tables[0].Rows[0][0].ToString();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionfetcdata(bel_GPN obj_bel_GPN)  //selected item will sow the corresponding text box
        {
            try
            {

                obj_bel_GPN._iMode = "Fetch";
                using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["GPNID"] != null)
                            {
                                hfldid.Value = ds.Tables[0].Rows[0]["GPNID"].ToString();
                            }
                            if (ds.Tables[0].Rows[0]["GPNNo"] != null)
                            {

                                txtGPNNo.Text = ds.Tables[0].Rows[0]["GPNNo"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["GPNDate"] != null)
                            {
                                DateTime date = System.DateTime.Now;
                                date = Convert.ToDateTime(ds.Tables[0].Rows[0]["GPNDate"]);

                                txtGPNDate.Text = date.ToString("dd-MMM-yyyy");

                                //txtGPNDate.Text = ds.Tables[0].Rows[0]["GPNDate"].ToString();

                            }




                            if (ds.Tables[0].Rows[0]["JOBID"] != null)
                            {

                                DropJobNo.SelectedValue = ds.Tables[0].Rows[0]["JOBID"].ToString();

                            }


                            if (ds.Tables[0].Rows[0]["Status"] != null)
                            {


                                // rblstate.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["Remarks"] != null)
                            {

                                txtRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                            }

                            if (ds.Tables[0].Rows[0]["FromWareHouseID"] != null)
                            {

                                DropFromwarehouse.SelectedValue = ds.Tables[0].Rows[0]["FromWareHouseID"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["ToWareHouseID"] != null)
                            {

                                DropTowarehouse.SelectedValue = ds.Tables[0].Rows[0]["ToWareHouseID"].ToString();

                            }





                        }
                        if (ds.Tables[1].Rows.Count > 0)
                        {                         
                            Session["GPNItem_dt"] = ds.Tables[1];
                            gridGPN.DataSource = Session["GPNItem_dt"] as DataTable;
                            gridGPN.DataBind();

                        }

                        HExistCortonValue.Value = HCortonTotal.Value;

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


                obj_bel_GPN._iMode = "ComboBind";
                using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
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

                            DropFromwarehouse.DataValueField = "WarehouseID";
                            DropFromwarehouse.DataTextField = "WarehouseName";
                            DropFromwarehouse.DataSource = ds.Tables[6];
                            DropFromwarehouse.DataBind();
                            DropFromwarehouse.SelectedIndex = 0;

                            DropTowarehouse.DataValueField = "WarehouseID";
                            DropTowarehouse.DataTextField = "WarehouseName";
                            DropTowarehouse.DataSource = ds.Tables[6];
                            DropTowarehouse.DataBind();
                            DropTowarehouse.SelectedIndex = 0;
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


                obj_bel_GPN._ProductCode = ProductCode;
                obj_bel_GPN._iMode = "ProductCode";
                using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
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


                            if (Convert.ToString(ds.Tables[0].Rows[0]["CategoryID"].ToString()) != string.Empty)
                            {

                                Dropcategory.SelectedValue = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["Combined"].ToString()) != string.Empty)
                            {

                                HCombined.Value = ds.Tables[0].Rows[0]["Combined"].ToString();
                            }
                            DataTable Item_dt = Session["GPNItem_dt"] as DataTable;
                            if (Item_dt.Rows.Count > 0)
                            {
                                if (ds.Tables[1].Rows.Count > 0)
                                {
                                    if (Convert.ToString(ds.Tables[1].Rows[0]["MaxNo"].ToString()) != string.Empty)
                                    {

                                        HInitialCorton.Value = Convert.ToString(Convert.ToInt32(ds.Tables[1].Rows[0]["MaxNo"].ToString()));
                                    }
                                }
                                else
                                {
                                    HInitialCorton.Value = Convert.ToString(0);
                                }
                                Int32 cartomfrom = Convert.ToInt32( funCaluculateCortonFromSum());
                                txtCartonFrom.Text = Convert.ToString(cartomfrom);
                            }
                            else
                            {
                                if (ds.Tables[1].Rows.Count > 0)
                                {
                                    if (Convert.ToString(ds.Tables[1].Rows[0]["MaxNo"].ToString()) != string.Empty)
                                    {

                                        txtCartonFrom.Text = Convert.ToString(Convert.ToInt32(ds.Tables[1].Rows[0]["MaxNo"].ToString()) + 1);
                                        HInitialCorton.Value = Convert.ToString(Convert.ToInt32(ds.Tables[1].Rows[0]["MaxNo"].ToString()));
                                    }
                                }
                                else
                                {
                                    txtCartonFrom.Text = Convert.ToString(1);
                                    HInitialCorton.Value = Convert.ToString(0);
                                }
                            }





                        }
                    }
                }
            }

            catch (Exception ex)
            {

            }
        }
        decimal funCaluculateCortonFromSum()
        {
            DataTable Item_dt = Session["GPNItem_dt"] as DataTable;
           
                decimal CortonFromSum = 0;
                CortonFromSum = Convert.ToDecimal(HInitialCorton.Value);
                for (int i = 0; i <= Item_dt.Rows.Count - 1; i++)
                {
                    CortonFromSum = Convert.ToDecimal(CortonFromSum) + Convert.ToDecimal(Item_dt.Rows[i]["Carton"].ToString());

                }

                return  CortonFromSum+1;
           
        }
        void funAdditemtodatatable(int row)
        {
            try
            {
                DataTable Item_dt = Session["GPNItem_dt"] as DataTable;
                // CommonVariablesandmsg.Item_dt =(DataTable) Session["datatable_item"];

                int Row_Count = Convert.ToInt32(Session["GPNRow_Count"]);
                int row_index = Convert.ToInt32(Session["GPNrow_index"]);
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

                    CortonSum = Convert.ToDecimal(HtempCortonTotal.Value) + Convert.ToDecimal(txtCorton.Text.Trim()) + Convert.ToDecimal(HInitialCorton.Value);


                    Item_dt.Rows[Row_Count]["ProductID"] = Convert.ToInt32(hItemID.Value);
                    Item_dt.Rows[Row_Count]["ProductCode"] = Convert.ToString(txtProductCode.Text);
                    Item_dt.Rows[Row_Count]["Description"] = Convert.ToString(txtDescription.Text);
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
                    Item_dt.Rows[Row_Count]["CartonPcs"] = Convert.ToDecimal(txtCortonPcs.Text.Trim());
                    Item_dt.Rows[Row_Count]["Carton"] = Convert.ToDecimal(txtCorton.Text.Trim());
                    Item_dt.Rows[Row_Count]["Pcs"] = Convert.ToDecimal(HPcs.Value.Trim());
                    Item_dt.Rows[Row_Count]["Combined"] = Convert.ToInt32(HCombined.Value);
                    Item_dt.Rows[Row_Count]["NetWt"] = Convert.ToDecimal(txtNetWeight.Text.Trim());
                    Item_dt.Rows[Row_Count]["GrsWt"] = Convert.ToDecimal(txtGrossWeight.Text.Trim());
                    Item_dt.Rows[Row_Count]["CartonSize"] = Convert.ToString(txtCartonSize.Text.Trim());
                    Item_dt.Rows[Row_Count]["CartonFrom"] = Convert.ToInt32(txtCartonFrom.Text.Trim());
                    Item_dt.Rows[Row_Count]["CartonTo"] = Convert.ToInt32(CortonSum);

                    Item_dt.Rows[Row_Count]["GPNDetailID"] = "0";

                    for (int i = 0; i <= Item_dt.Rows.Count - 1; i++)
                    {
                        Item_dt.Rows[i]["SNo"] = i + 1;

                    }

                    Session["GPNItem_dt"] = Item_dt;
                    gridGPN.DataSource = Session["GPNItem_dt"] as DataTable;
                    gridGPN.DataBind();

                }
                else if (Convert.ToString(hUpdateID.Value) == "1")
                {
                    CortonSum = 0;

                    CortonSum = Convert.ToDecimal(HtempCortonTotal.Value) + Convert.ToDecimal(txtCorton.Text.Trim()) + Convert.ToDecimal(HInitialCorton.Value);

                    Item_dt.Rows[row_index]["ProductID"] = Convert.ToInt32(hItemID.Value);
                    Item_dt.Rows[row_index]["ProductCode"] = Convert.ToString(txtProductCode.Text);
                    Item_dt.Rows[row_index]["Description"] = Convert.ToString(txtDescription.Text);
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
                    Item_dt.Rows[row_index]["CartonPcs"] = Convert.ToDecimal(txtCortonPcs.Text.Trim());
                    Item_dt.Rows[row_index]["Carton"] = Convert.ToDecimal(txtCorton.Text.Trim());
                    Item_dt.Rows[row_index]["Pcs"] = Convert.ToDecimal(HPcs.Value.Trim());
                    Item_dt.Rows[row_index]["Combined"] = Convert.ToInt32(HCombined.Value);
                    Item_dt.Rows[row_index]["NetWt"] = Convert.ToDecimal(txtNetWeight.Text.Trim());
                    Item_dt.Rows[row_index]["GrsWt"] = Convert.ToDecimal(txtGrossWeight.Text.Trim());
                    Item_dt.Rows[row_index]["CartonSize"] = Convert.ToString(txtCartonSize.Text.Trim());
                    Item_dt.Rows[row_index]["CartonFrom"] = Convert.ToInt32(txtCartonFrom.Text.Trim());
                    Item_dt.Rows[row_index]["CartonTo"] = Convert.ToInt32(CortonSum);

                    funAutocorrectCortonFrom(row_index);
                    hUpdateID.Value = "0";
                    Session["GPNItem_dt"] = Item_dt;
                    gridGPN.DataSource = Session["GPNItem_dt"] as DataTable;
                    gridGPN.DataBind();

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
                HInitialCorton.Value = "0";
                HtempCortonTotal.Value = "0";
                txtGPNNo.Text = string.Empty;
                DropFromwarehouse.SelectedIndex = 0;
                DropTowarehouse.SelectedIndex = 0;
                txtGPNDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");
                DropJobNo.SelectedIndex = 0;
                txtNetWeight.Text = "0";
                txtGrossWeight.Text = "0";
                txtProductCode.Text = string.Empty;
                DropDesign.SelectedIndex = 0;
                Dropsize.SelectedIndex = 0;
                txtquantity.Text = string.Empty;


                txtDescription.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropUOM.SelectedIndex = 0;
                Dropcategory.SelectedIndex = 0;
                txtCortonPcs.Text = string.Empty;
                txtCorton.Text = string.Empty;
                txtPcs.Text = string.Empty;
                txtNetWeight.Text = string.Empty;
                txtGrossWeight.Text = string.Empty;
                txtCartonSize.Text = string.Empty;
                txtCartonFrom.Text = string.Empty;
                txtCartonTo.Text = string.Empty;


                txtDescription.Text = string.Empty;
                txtRemarks.Text = string.Empty;

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
                Item_dt.Columns.Add(new DataColumn("CartonPcs", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("Carton", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("Pcs", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("NetWt", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("GrsWt", typeof(decimal)));
                Item_dt.Columns.Add(new DataColumn("CartonSize", typeof(string)));
                Item_dt.Columns.Add(new DataColumn("CartonFrom", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("CartonTo", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("Combined", typeof(Int32)));
                Item_dt.Columns.Add(new DataColumn("GPNDetailID", typeof(Int32)));

                //DataRow dr;
                //dr = Item_dt.NewRow();
                //Item_dt.Rows.Add(dr);

                Session["GPNItem_dt"] = Item_dt;
                gridGPN.DataSource = Session["GPNItem_dt"] as DataTable;
                gridGPN.DataBind();




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

                txtDescription.Text = string.Empty;
                txtRemarks.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropUOM.SelectedIndex = 0;

                txtquantity.Text = string.Empty;
                txtCortonPcs.Text = string.Empty;
                txtCorton.Text = string.Empty;
                txtPcs.Text = string.Empty;
                txtNetWeight.Text = "0";
                txtGrossWeight.Text = "0";
                
                txtCartonSize.Text = string.Empty;
                txtCartonFrom.Text = string.Empty;
                txtCartonTo.Text = string.Empty;
                hItemID.Value = "0";
                HCategoryID.Value = "0";
                HProductGroupID.Value = "0";
                HQualityID.Value = "0";
                txtProductCode.Focus();
                HInitialCorton.Value = "0";
              //  HtempCortonTotal.Value = "0";
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
                obj_bel_GPN._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_GPN._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_GPN._ScreenName = "GPN";
                obj_bel_GPN._iMode = "AutoCode";
                using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
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
                obj_Common.LogFile(ex.Message, "GPN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
            return "0";
        }
        Boolean CheckDuplicatecustomer()
        {


            obj_bel_GPN._GPNNo = funGetAutoCodeDuplicate();
            obj_bel_GPN._iMode = "Duplicate";
            obj_bel_GPN._GPNID = Convert.ToInt32(hfldid.Value);


            using (DataSet dsUom = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
            {
                
                if (dsUom.Tables[0].Rows[0][0].ToString() == "0")
                {
                    if (gridGPN.Rows.Count > 0)
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
                   


                   


                    if (DropFromwarehouse.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_GPN._FromWareHouseID = Convert.ToInt32(DropFromwarehouse.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_GPN._FromWareHouseID = 0;
                    }

                    if (DropTowarehouse.SelectedValue.Trim() != string.Empty)
                    {

                        obj_bel_GPN._ToWareHouseID = Convert.ToInt32(DropTowarehouse.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_GPN._ToWareHouseID = 0;
                    }

                    if (txtGPNDate.Text.Trim() != string.Empty)
                    {


                        obj_bel_GPN._GPNDate = Convert.ToDateTime(txtGPNDate.Text.Trim());
                    }
                    else
                    {
                        obj_bel_GPN._GPNDate = System.DateTime.Now;
                    }


                    if (DropJobNo.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_GPN._JOBID = Convert.ToInt32(DropJobNo.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_GPN._JOBID = 0;
                    }


                    if (txtRemarks.Text.Trim() != string.Empty)
                    {
                        obj_bel_GPN._Remarks = Convert.ToString(txtRemarks.Text.Trim());
                    }
                    else
                    {
                        obj_bel_GPN._Remarks = string.Empty;
                    }



                   

                    if (hfldid.Value == "0")
                    {
                        obj_bel_GPN._iMode = "Insert";

                        funAutoGentration();
                        obj_bel_GPN._TotalQty = Convert.ToDecimal(funCaluculateCortonFromSum()-1);
                        funGetAutoCortonBox(obj_bel_GPN);
                    }
                    else
                    {
                        decimal total = 0;
                        obj_bel_GPN._iMode = "Update";
                        total = Convert.ToDecimal(funCaluculateCortonFromSum() - 1) - Convert.ToDecimal(HExistCortonValue.Value);
                        obj_bel_GPN._TotalQty = total;
                        funGetAutoCortonBox(obj_bel_GPN);
                        

                             
                    }

                    if (HTotalQty.Value.Trim() != string.Empty)
                    {


                        obj_bel_GPN._TotalQty = Convert.ToDecimal(HTotalQty.Value);
                    }
                    else
                    {
                        obj_bel_GPN._TotalQty = 0;
                    }
                    obj_bel_GPN._GPNID = Convert.ToInt32(hfldid.Value);
                    if (txtGPNNo.Text.Trim() != string.Empty)
                    {


                        obj_bel_GPN._GPNNo = Convert.ToString(txtGPNNo.Text.Trim());
                    }
                    else
                    {
                        obj_bel_GPN._GPNNo = string.Empty;
                    }
                    int result = 0;

                    DataTable dt_new = new DataTable();
                    //  dt_new = funcSUMDuplicateValue();
                    result = obj_dal_GPN.dal_GPNInsert(obj_bel_GPN, Session["GPNItem_dt"] as DataTable);

                   
                    if (result.ToString() == "1" || result.ToString() == "2" || result.ToString() == "3" || result.ToString() == "4")
                    {

                      //  functioncleardata();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Saved Successfully');", true);
                        hfldid.Value = Convert.ToString(Session["HeaderID"]);
                        obj_bel_GPN._GPNID = Convert.ToInt32(hfldid.Value);
                        functioncleardata();
                        functionfetcdata(obj_bel_GPN);
                        
                    }
                }

                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('GPN Number Already Exists or Please enter the atleast one item.');", true);
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:functionSaverecord", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        //public DataTable funcSUMDuplicateValue()
        //{
        //    DataTable dt = new DataTable();
        //    try
        //    {



        //        var result = Item_dt.AsEnumerable()
        //                    .GroupBy(r => new
        //                    {

        //                        ProductID = r.Field<Int32>("ProductID"),
        //                        ProductCode = r.Field<String>("ProductCode"),
        //                        Description = r.Field<String>("Description"),
        //                        CategoryName = r.Field<String>("CategoryName"),
        //                        DesignName = r.Field<String>("DesignName"),
        //                        ProductGroupID = r.Field<Int32>("ProductGroupID"),
        //                        CategoryID = r.Field<Int32>("CategoryID"),
        //                        QualityID = r.Field<Int32>("QualityID"),
        //                        DesignID = r.Field<Int32>("DesignID"),
        //                        ColorID = r.Field<Int32>("ColorID"),
        //                        SizeID = r.Field<Int32>("SizeID"),
        //                        Rate = r.Field<decimal>("Rate"),


        //                    })
        //                    .Select(g =>
        //                    {
        //                        var row = g.First();
        //                        row.SetField("Qty", g.Sum(r => r.Field<Int32>("Qty")));
        //                        row.SetField("Amount", g.Sum(r => r.Field<decimal>("Amount")));
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
                obj_bel_GPN._ScreenName = "GPN";
                obj_bel_GPN._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_GPN._BillToDate = Convert.ToDateTime(Todate);
                using (DataSet ds = obj_dal_GPN.dal_AutoGen(obj_bel_GPN))
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

                                txtGPNNo.Text = ds.Tables[0].Rows[0][0].ToString();

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
      
        protected void gridGPN_RowCommand3(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                DataTable Item_dt = Session["GPNItem_dt"] as DataTable;

                if (e.CommandName.ToUpper() == "DELETEROW")
                {
                    
                        //get the row index then only you get selected row id
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;

                        if (Convert.ToString(gridGPN.DataKeys[row.RowIndex]["GPNDetailID"].ToString()) != "0")
                        {
                            if (Common.CommonVariablesandmsg.DeleteRigts == "Y")
                            {


                            obj_bel_GPN._GPNDetailID = Convert.ToInt32(gridGPN.DataKeys[row.RowIndex]["GPNDetailID"].ToString());
                            obj_bel_GPN._iMode = "ItemDelete";
                            using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
                            {


                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        if (ds.Tables[0].Rows[0][0].ToString() == "1")
                                        {
                                            Item_dt.Rows[d].Delete();
                                            Item_dt.AcceptChanges();
                                            Session["GPNItem_dt"] = Item_dt;
                                            gridGPN.DataSource = Session["GPNItem_dt"] as DataTable;
                                            gridGPN.DataBind();

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
                                Session["GPNItem_dt"] = Item_dt;
                                gridGPN.DataSource = Session["GPNItem_dt"] as DataTable;
                                gridGPN.DataBind();

                            }
                            else
                            {
                                Session["GPNItem_dt"] = Item_dt;
                                gridGPN.DataSource = Session["GPNItem_dt"] as DataTable;
                                gridGPN.DataBind();

                            }

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Deleted Successfully');", true);
                        }
                    

                }
                if (e.CommandName.ToUpper() == "EDITROW")
                {
                   
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;
                        if (Convert.ToString(gridGPN.DataKeys[row.RowIndex]["GPNDetailID"].ToString()) != "0")
                        {
                            if (Common.CommonVariablesandmsg.EditRigts == "Y")
                            {

                            obj_bel_GPN._GPNDetailID = Convert.ToInt32(Convert.ToInt32(gridGPN.DataKeys[row.RowIndex]["GPNDetailID"].ToString()));
                            funCaluculateCortonSum(d);
                            txtProductCode.Text = Item_dt.Rows[d]["ProductCode"].ToString();
                            hItemID.Value = Item_dt.Rows[d]["ProductID"].ToString();
                            txtDescription.Text = Convert.ToString(Item_dt.Rows[d]["Description"]);
                            HProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["ProductGroupID"]);
                            HQualityID.Value = Convert.ToString(Item_dt.Rows[d]["QualityID"]);
                            Dropcategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["CategoryID"]);
                            DropDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DesignID"]);
                            Dropcolour.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ColorID"]);
                            DropUOM.SelectedValue = Convert.ToString(Item_dt.Rows[d]["UOMID"]);
                            Dropsize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["SizeID"]);
                            txtquantity.Text = Convert.ToString(Item_dt.Rows[d]["Qty"]);
                            txtCortonPcs.Text = Convert.ToString(Item_dt.Rows[d]["CartonPcs"]);
                            txtCorton.Text = Convert.ToString(Item_dt.Rows[d]["Carton"]);
                            txtPcs.Text = Convert.ToString(Item_dt.Rows[d]["Pcs"]);
                            HPcs.Value = Convert.ToString(Item_dt.Rows[d]["Pcs"]);
                            HCombined.Value = Convert.ToString(Item_dt.Rows[d]["Combined"]);
                            
                            txtNetWeight.Text = Convert.ToString(Item_dt.Rows[d]["NetWt"]);
                            txtGrossWeight.Text = Convert.ToString(Item_dt.Rows[d]["GrsWt"]);
                            txtCartonSize.Text = Convert.ToString(Item_dt.Rows[d]["CartonSize"]);
                            txtCartonFrom.Text = Convert.ToString(Item_dt.Rows[d]["CartonFrom"]);
                            txtCartonTo.Text = Convert.ToString(Item_dt.Rows[d]["CartonTo"]);
                            HPcs.Value = Convert.ToString(Item_dt.Rows[d]["Pcs"]);
                            HCortonTo.Value = Convert.ToString(Item_dt.Rows[d]["CartonTo"]);
                            hUpdateID.Value = "1";
                            Session["GPNrow_index"] = d;
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);


                        }
                           

                        }
                        else
                        {
                            funCaluculateCortonSum(d);
                            txtProductCode.Text = Item_dt.Rows[d]["ProductCode"].ToString();
                            hItemID.Value = Item_dt.Rows[d]["ProductID"].ToString();
                            txtDescription.Text = Convert.ToString(Item_dt.Rows[d]["Description"]);
                            HProductGroupID.Value = Convert.ToString(Item_dt.Rows[d]["ProductGroupID"]);
                            HQualityID.Value = Convert.ToString(Item_dt.Rows[d]["QualityID"]);
                            Dropcategory.SelectedValue = Convert.ToString(Item_dt.Rows[d]["CategoryID"]);
                            DropDesign.SelectedValue = Convert.ToString(Item_dt.Rows[d]["DesignID"]);
                            Dropcolour.SelectedValue = Convert.ToString(Item_dt.Rows[d]["ColorID"]);
                            DropUOM.SelectedValue = Convert.ToString(Item_dt.Rows[d]["UOMID"]);
                            Dropsize.SelectedValue = Convert.ToString(Item_dt.Rows[d]["SizeID"]);
                            txtquantity.Text = Convert.ToString(Item_dt.Rows[d]["Qty"]);
                            txtCortonPcs.Text = Convert.ToString(Item_dt.Rows[d]["CartonPcs"]);
                            txtCorton.Text = Convert.ToString(Item_dt.Rows[d]["Carton"]);
                            txtPcs.Text = Convert.ToString(Item_dt.Rows[d]["Pcs"]);
                            HPcs.Value = Convert.ToString(Item_dt.Rows[d]["Pcs"]);
                            HCombined.Value = Convert.ToString(Item_dt.Rows[d]["Combined"]);
                            txtNetWeight.Text = Convert.ToString(Item_dt.Rows[d]["NetWt"]);
                            txtGrossWeight.Text = Convert.ToString(Item_dt.Rows[d]["GrsWt"]);
                            txtCartonSize.Text = Convert.ToString(Item_dt.Rows[d]["CartonSize"]);
                            txtCartonFrom.Text = Convert.ToString(Item_dt.Rows[d]["CartonFrom"]);
                            txtCartonTo.Text = Convert.ToString(Item_dt.Rows[d]["CartonTo"]);
                            HPcs.Value = Convert.ToString(Item_dt.Rows[d]["Pcs"]);
                            HCortonTo.Value = Convert.ToString(Item_dt.Rows[d]["CartonTo"]);
                            hUpdateID.Value = "1";
                            Session["GPNrow_index"] = d;
                           


                        }


                    
                }
            }
            catch (Exception ex)
            {

            }
        }
        void funCaluculateCortonSum(int index)
        {
            try
            {
                DataTable Item_dt = Session["GPNItem_dt"] as DataTable;
                decimal CortonSumT = 0;
                
                for (int i = 0; i <= index - 1; i++)
                {
                    CortonSumT = Convert.ToDecimal(CortonSumT) + Convert.ToDecimal(Item_dt.Rows[i]["Carton"].ToString());
                    
                }

                HtempCortonTotal.Value = Convert.ToString(CortonSumT);
            }
            catch (Exception ex)
            {

            }
        }


        public decimal GetTotalAmount()
        {
            HCortonTotal.Value = Convert.ToString(totalAmount);
            HtempCortonTotal.Value = Convert.ToString(totalAmount);
            return totalAmount;
        }
        public decimal GetTotalQty()
        {
            HTotalQty.Value = Convert.ToString(totalFooterQty);
            return totalFooterQty;
        }


        protected void gridGPN_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Separator)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                decimal salary = (decimal)rowView["Carton"];
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
                    Response.Redirect("../SearchListTransaction.aspx?pg=GPN",false);
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
                FunGetCortonBox();
                termpopup.Show();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please select the item from search');", true);
            }
        }

       
        void funBindGridPopup(string ProductCode, string iMode)
        {
            try
            {


                obj_bel_GPN._ProductCode = ProductCode;
                obj_bel_GPN._JOBID = Convert.ToInt32(DropJobNo.SelectedValue);
                obj_bel_GPN._FromWareHouseID = Convert.ToInt32(DropFromwarehouse.SelectedValue);
                obj_bel_GPN._iMode = iMode;
                using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
                {
                    if (ds.Tables.Count > 0)
                    {

                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Inactive Item.');", true);
                            //    txtProductCode.Focus();


                            //}
                            //else if (ds.Tables[0].Rows[0][0].ToString() == "Exists")
                            //{
                            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('There is no stock.');", true);
                            //    txtProductCode.Focus();

                            //}

                            if (ds.Tables[0].Rows[0][1].ToString() != string.Empty)
                            {
                                Session["GTNdt_pop"] = ds.Tables[0];
                                searchResult.DataSource = Session["GTNdt_pop"] as DataTable;
                                searchResult.DataBind();

                            }
                        }
                        else
                        {
                            DataTable dt = new DataTable();
                            Session["GTNdt_pop"] = dt;
                            searchResult.DataSource = Session["GTNdt_pop"] as DataTable;
                            searchResult.DataBind();

                        }
                    }
                    else
                    {
                        DataTable dt = new DataTable();
                        Session["GTNdt_pop"] = dt;
                        searchResult.DataSource = Session["GTNdt_pop"] as DataTable;
                        searchResult.DataBind();

                    }
                }
            }

            catch (Exception ex)
            {

            }
        }
        void funGetAutoCortonBoxNumber()
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
                obj_bel_GPN._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_GPN._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_GPN._iMode = "AutoGenCortonBox";
                using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            //int tocorton = 0;
                            //decimal tocorton1 = 0;
                            //int totaltocorton = 0;
                            txtCartonFrom.Text = Convert.ToString(ds.Tables[0].Rows[0][0].ToString());

                            //tocorton1 = Convert.ToDecimal(txtCorton.Text);
                            //tocorton = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());
                            //totaltocorton = tocorton + Convert.ToInt32(tocorton1);
                            //txtCartonTo.Text = Convert.ToString(totaltocorton);
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //funGetAutoCortonBoxNumber();
                string ItemCode = string.Empty;
                string Barcode = string.Empty;
                obj_bel_GPN._iMode = "";
                if (Convert.ToString(txtProductCode.Text) != string.Empty)
                {
                    ItemCode = Convert.ToString(txtProductCode.Text);
                }
                funBindGridPopup(ItemCode, "GridPopup");
                txtSearch.Text = txtProductCode.Text.Trim();
                funFilterProductCode();
                //if (searchResult.Rows.Count > 1)
                //{
                mpe.Show();

               
                //}
                //else if (searchResult.Rows.Count == 1)
                //{

                //    Label lblBarCode = (Label)(searchResult.Rows[0].FindControl("lblBarCode"));
                //    Barcode = Convert.ToString(lblBarCode.Text);

                //    txtBarCode.Text = Barcode;
                //    funBindValue(Barcode);

                //    txtquantity.Focus();

                //}




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
                DataTable dt_pop = Session["GTNdt_pop"] as DataTable;
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
                        //Session["GTNdt_pop"] = dt;
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

                        obj_bel_GPN._iMode = "Insert";
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
                        obj_bel_GPN._iMode = "Update";
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
                    int d = row.RowIndex;
                    if (Convert.ToString(searchResult.DataKeys[row.RowIndex]["ProductCode"].ToString()) != "0")
                    {
                        ProductCode = Convert.ToString(searchResult.DataKeys[row.RowIndex]["ProductCode"].ToString());
                        Label Lblqty = (Label)(searchResult.Rows[row.RowIndex].FindControl("lblQty"));

                      txtquantity.Text = Convert.ToString(Lblqty.Text);
                        
                       // searchResult.Rows[row.RowIndex].Cells["ProductCode"].ToString()

                        txtProductCode.Text = ProductCode;
                        funBindValue(ProductCode);
                        mpe.Hide();
                        txtquantity.Focus();









                    }

                }
            }
            catch (Exception ex)
            {

            }
        }
        void FunGetCortonBox()
        {
            DataTable Item_dt = Session["GPNItem_dt"] as DataTable;
            int k = 0, j = 1, DetailID = 0;
            decimal qty = 0;
            decimal CartonPcs = 0;
            DataTable Box_dt = new DataTable();
            int BoxRow_Count = 0;
            Box_dt.Columns.Add("SNo");
            Box_dt.Columns.Add("GPNDetailID");
            Box_dt.Columns.Add("Carton");
            Box_dt.Columns.Add("CartonPcs");
            while (k <= Item_dt.Rows.Count - 1)//get the all the data and bind to the data table
            {

                if (Convert.ToInt32(Item_dt.Rows[k]["Carton"]) > 0)
                {
                    qty = Convert.ToDecimal(Item_dt.Rows[k]["Carton"]);
                    CartonPcs = Convert.ToDecimal(Item_dt.Rows[k]["CartonPcs"]);
                    DetailID = Convert.ToInt32(Item_dt.Rows[k]["GPNDetailID"]);


                    for (int i = 0; i < qty; i++)
                    {

                        DataRow dr;
                        dr = Box_dt.NewRow();
                        Box_dt.Rows.Add(dr);
                        BoxRow_Count = Box_dt.Rows.Count - 1;
                        Box_dt.Rows[BoxRow_Count]["SNo"] = j++;
                        Box_dt.Rows[BoxRow_Count]["GPNDetailID"] = DetailID;
                        Box_dt.Rows[BoxRow_Count]["Carton"] = qty;
                        Box_dt.Rows[BoxRow_Count]["CartonPcs"] = CartonPcs;



                    }


                }


                k++;
            }

            gridBracode.DataSource = Box_dt;
            gridBracode.DataBind();
        }
        public void funPrint()
        {

            try
            {
                obj_bel_GPN._iMode = "GPNPrintTable";
                using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
                {
                    if (ds.Tables.Count > 0)
                    {
                                               

                    }

                }

                DataTable dt = new DataTable();
                dt.Columns.Add("GPNDetailID");
                dt.Columns.Add("GPNID");               
                dt.Columns.Add("BoxNo");



                int row = 0;
                int r = 0; int k = 0;
                // string Mobile = string.Empty;
                if (gridBracode.Rows.Count > 0)
                {
                    while (k <= gridBracode.Rows.Count - 1)//get the all the data and bind to the data table
                    {



                        CheckBox chkIsSave = (CheckBox)(gridBracode.Rows[k].FindControl("chkBxSelect"));
                        if (chkIsSave.Checked)
                        {
                            DataRow dr = dt.NewRow();
                            dt.Rows.Add(dr);
                            Label chkIsMobile = (Label)(gridBracode.Rows[k].FindControl("lblGPNDetailID"));
                           Label chkIsBox = (Label)(gridBracode.Rows[k].FindControl("lblSno"));
                            if (chkIsMobile.Text.ToString() != "0")
                            {
                                //obj_bel_GPN._GPNDetailID = Convert.ToInt32(chkIsMobile.Text);
                                //obj_bel_GPN._BoxNo = Convert.ToString(chkIsBox.Text);
                               // obj_bel_GPN._iMode = "Print";
                               // obj_bel_GPN._GPNID = Convert.ToInt32(hfldid.Value.ToString());

                                if (chkIsMobile.Text.ToString() != string.Empty)
                                {

                                    dt.Rows[r][0] = Convert.ToInt32(chkIsMobile.Text.ToString().Trim());

                                }
                                else
                                {

                                    dt.Rows[r][0] = 0;
                                }

                                if (hfldid.Value.ToString() != string.Empty)
                                {

                                    dt.Rows[r][1] = Convert.ToInt32(hfldid.Value.ToString().Trim());

                                }
                                else
                                {

                                    dt.Rows[r][1] = 0;
                                }

                                if (chkIsBox.Text.ToString() != string.Empty)
                                {

                                    dt.Rows[r][2] = Convert.ToDecimal(chkIsBox.Text.ToString().Trim());

                                }
                                else
                                {

                                    dt.Rows[r][2] =0;
                                }

                              


                            }
                            else
                            {

                            }



                            r++;

                        }
                        k++;
                    }

                      int result = obj_dal_GPN.dal_GPNPrintInsert(obj_bel_GPN, dt);


                      if (result.ToString() == "1" || result.ToString() == "2" || result.ToString() == "3" || result.ToString() == "4")
                      {
                          obj_bel_GPN._iMode = "Print";
                          obj_bel_GPN._GPNID = Convert.ToInt32(hfldid.Value.ToString());
                          using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
                          {
                              if (ds.Tables.Count > 0)
                              {
                                  if (ds.Tables[1].Rows.Count > 0)
                                  {
                                      Session["SaveUser"] = ds.Tables[0].Rows[0]["LoginID"].ToString();
                                      ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../Report/ReportViewer.aspx?value=GPNPRINT" + "','_blank')", true);
                                      //Report.ReportViewer rep = new Report.ReportViewer();
                                      //string Path = rep.GPNPrint(obj_bel_GPN);
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
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please select te item from search');", true);


                }


            }
            catch (Exception ex)
            {

            }
            

        }
       
        protected void btn_PrintBox_Click(object sender, EventArgs e)
        {
            funPrint();
        }
        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            termpopup.Hide();
        }
        protected void gridBracode_RowCreated(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
                {
                    CheckBox chkBxSelect = (CheckBox)e.Row.Cells[1].FindControl("chkBxSelect");
                    CheckBox chkBxHeader = (CheckBox)this.gridBracode.HeaderRow.FindControl("chkBxHeader");



                    chkBxSelect.Attributes["onclick"] = string.Format("javascript:ChildClick(this,'{0}');", chkBxHeader.ClientID);
                }
            }
            catch (Exception ex)
            {

            }
        }


        void funGetAutoCortonBox(bel_GPN obj_bel_GPN)
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
                obj_bel_GPN._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_GPN._BillToDate = Convert.ToDateTime(Todate);               
                obj_bel_GPN._iMode = "AutoGenCorton";
                using (DataSet ds = obj_dal_GPN.dal_GPNDetail(obj_bel_GPN))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int tocorton = 0;
                            decimal tocorton1 = 0;
                            int totaltocorton=0;
                            txtCartonFrom.Text = Convert.ToString(ds.Tables[0].Rows[0][0].ToString());

                              tocorton1 = Convert.ToDecimal(txtCorton.Text);
                               tocorton = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());
                               totaltocorton = tocorton + Convert.ToInt32( tocorton1);
                               //txtCartonTo.Text = Convert.ToString(totaltocorton);
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }


        void funAutocorrectCortonFrom(int index)
        {
            try
            {
                DataTable Item_dt = Session["GPNItem_dt"] as DataTable;
                int pCortonTo = 0;
                decimal Corton = 0;
                for (int i = index; i <= Item_dt.Rows.Count - 1; i++)
                {
                    pCortonTo = Convert.ToInt32( Item_dt.Rows[i - 1]["CartonTo"].ToString());

                    Item_dt.Rows[i]["CartonFrom"] = pCortonTo + 1;
                    Corton = Convert.ToDecimal(Item_dt.Rows[i]["Carton"].ToString());

                    Item_dt.Rows[i]["CartonTo"] = pCortonTo + Corton;
                }
               
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GPN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
    }
}