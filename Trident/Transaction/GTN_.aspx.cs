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
    public partial class GTN1 : System.Web.UI.Page
    {
        public decimal totalFooterQty = 0;
        public decimal totalAmount = 0;
        bel_GTN obj_bel_GTN = new bel_GTN();
        dal_GTN obj_dal_GTN = new dal_GTN();
       // public static DataTable Item_dt = new DataTable();
        //public static DataTable dt_pop = new DataTable();
      //  int Row_Count = 0;
      //  public static int row_index = 0;
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
                        obj_Common.functionCheckActhorization("Transfer", "AssignAuthorization");
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
                            txtRate.Attributes.Add("onkeypress", "return handleEnter('" + ItemSave.ClientID + "', event)");


                            txtGTNDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");


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
                                Item_dt.Columns.Add(new DataColumn("Rate", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("Amount", typeof(decimal)));
                                Item_dt.Columns.Add(new DataColumn("GTNDetailID", typeof(Int32)));

                                //DataRow dr;
                                //dr = Item_dt.NewRow();
                                //Item_dt.Rows.Add(dr);
                               
                                Session["GTNItem_dt"] = Item_dt;
                                gridGTN.DataSource = Session["GTNItem_dt"] as DataTable;
                                gridGTN.DataBind();



                            }
                            if (hfldid.Value != "0" && hfldid.Value != string.Empty)
                            {


                                obj_bel_GTN._GTNID = Convert.ToInt32(hfldid.Value);
                                functionfetcdata(obj_bel_GTN);
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
                obj_bel_GTN._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_GTN._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_GTN._ScreenName = "GTN";
                obj_bel_GTN._iMode = "AutoCode";
                using (DataSet ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
                {
                    if (ds.Tables.Count > 0)
                    {


                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            txtGTNNo.Text = ds.Tables[0].Rows[0][0].ToString();
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionfetcdata(bel_GTN obj_bel_GTN)  //selected item will sow the corresponding text box
        {
            try
            {

                obj_bel_GTN._iMode = "Fetch";
                using (DataSet ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["GTNID"] != null)
                            {
                                hfldid.Value = ds.Tables[0].Rows[0]["GTNID"].ToString();
                            }
                            if (ds.Tables[0].Rows[0]["GTNNo"] != null)
                            {

                                txtGTNNo.Text = ds.Tables[0].Rows[0]["GTNNo"].ToString();

                            }

                            if (ds.Tables[0].Rows[0]["GTNDate"] != null)
                            {

                                DateTime date = System.DateTime.Now;
                                date = Convert.ToDateTime(ds.Tables[0].Rows[0]["GTNDate"]);

                                txtGTNDate.Text = date.ToString("dd-MMM-yyyy");
                               // .Text = ds.Tables[0].Rows[0]["GTNDate"].ToString();

                            }




                            if (ds.Tables[0].Rows[0]["FromJOBID"] != null)
                            {

                                DropFromJobNo.SelectedValue = ds.Tables[0].Rows[0]["FromJOBID"].ToString();

                            }
                            if (ds.Tables[0].Rows[0]["ToJOBID"] != null)
                            {

                                DropToJobNo.SelectedValue = ds.Tables[0].Rows[0]["ToJOBID"].ToString();

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

                          
                            Session["GTNItem_dt"] = ds.Tables[1];
                            gridGTN.DataSource = Session["GTNItem_dt"] as DataTable;
                            gridGTN.DataBind();
                        }

                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:functionfetcdata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void functionbindcombo()
        {
            try
            {


                obj_bel_GTN._iMode = "ComboBind";
                using (DataSet ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
                {
                    if (ds.Tables.Count > 0)
                    {

                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            DropFromJobNo.DataValueField = "JOBID";
                            DropFromJobNo.DataTextField = "JOBCode";
                            DropFromJobNo.DataSource = ds.Tables[0];
                            DropFromJobNo.DataBind();
                            DropFromJobNo.SelectedIndex = 0;

                            DropToJobNo.DataValueField = "JOBID";
                            DropToJobNo.DataTextField = "JOBCode";
                            DropToJobNo.DataSource = ds.Tables[0];
                            DropToJobNo.DataBind();
                            DropToJobNo.SelectedIndex = 0;
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
                        }

                        if (ds.Tables[7].Rows.Count > 0)
                        {

                            DropTowarehouse.DataValueField = "WarehouseID";
                            DropTowarehouse.DataTextField = "WarehouseName";
                            DropTowarehouse.DataSource = ds.Tables[7];
                            DropTowarehouse.DataBind();
                            DropTowarehouse.SelectedIndex = 0;
                        }


                    }
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:functionbindcombo", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funBindValue(string ProductCode)
        {
            try
            {


                obj_bel_GTN._ProductCode = ProductCode;
                obj_bel_GTN._iMode = "ProductCode";
                using (DataSet ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
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

                            if (Convert.ToString(ds.Tables[0].Rows[0]["SalePrice"].ToString()) != string.Empty)
                            {

                                txtRate.Text = ds.Tables[0].Rows[0]["SalePrice"].ToString();

                            }
                            if (Convert.ToString(ds.Tables[0].Rows[0]["CategoryID"].ToString()) != string.Empty)
                            {

                                Dropcategory.SelectedValue = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                            }





                        }
                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:funBindValue", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funAdditemtodatatable(int row)
        {
            try
            {
                DataTable Item_dt = Session["GTNItem_dt"] as DataTable;
                // CommonVariablesandmsg.Item_dt =(DataTable) Session["datatable_item"];

                int Row_Count = Convert.ToInt32(Session["GTNRow_Count"]);
                int row_index = Convert.ToInt32(Session["GTNrow_index"]);
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
                    Item_dt.Rows[Row_Count]["Qty"] = Convert.ToDecimal(txtquantity.Text);
                    Item_dt.Rows[Row_Count]["Rate"] = Convert.ToDecimal(txtRate.Text);
                    Item_dt.Rows[Row_Count]["Amount"] = Convert.ToDecimal(Amt.Value);
                    Item_dt.Rows[Row_Count]["GTNDetailID"] = "0";

                    for (int i = 0; i <= Item_dt.Rows.Count - 1; i++)
                    {
                        Item_dt.Rows[i]["SNo"] = i + 1;

                    }

                    Session["GTNItem_dt"] = Item_dt;
                    gridGTN.DataSource = Session["GTNItem_dt"] as DataTable;
                    gridGTN.DataBind();

                }
                else if (Convert.ToString(hUpdateID.Value) == "1")
                {

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
                    Item_dt.Rows[row_index]["Qty"] = Convert.ToDecimal(txtquantity.Text);
                    Item_dt.Rows[row_index]["Rate"] = Convert.ToDecimal(txtRate.Text);
                    Item_dt.Rows[row_index]["Amount"] = Convert.ToDecimal(Amt.Value);


                    hUpdateID.Value = "0";
                    Session["GTNItem_dt"] = Item_dt;
                    gridGTN.DataSource = Session["GTNItem_dt"] as DataTable;
                    gridGTN.DataBind();

                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:funAdditemtodatatable", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                txtGTNNo.Text = string.Empty;
                DropFromwarehouse.SelectedIndex = 0;
                DropTowarehouse.SelectedIndex = 0;
                txtGTNDate.Text = System.DateTime.Now.ToString("dd-MMM-yyyy");
                DropFromJobNo.SelectedIndex = 0;
                DropToJobNo.SelectedIndex = 0;
                
                txtProductCode.Text = string.Empty;
                DropDesign.SelectedIndex = 0;
                Dropsize.SelectedIndex = 0;
                txtquantity.Text = string.Empty;
                txtAmount.Text = string.Empty;

                txtDescription.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropUOM.SelectedIndex = 0;
                Dropcategory.SelectedIndex = 0;
                txtRate.Text = string.Empty;


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
                obj_Common.LogFile(ex.Message, "GTN:functioncleardata", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                Item_dt.Columns.Add(new DataColumn("GTNDetailID", typeof(Int32)));

                //DataRow dr;
                //dr = Item_dt.NewRow();
                //Item_dt.Rows.Add(dr);

                Session["GTNItem_dt"] = Item_dt;
                gridGTN.DataSource = Session["GTNItem_dt"] as DataTable;
                gridGTN.DataBind();



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
                txtAmount.Text = string.Empty;
                txtDescription.Text = string.Empty;
                txtRemarks.Text = string.Empty;
                Dropcolour.SelectedIndex = 0;
                DropUOM.SelectedIndex = 0;
                txtRate.Text = string.Empty;
                txtquantity.Text = string.Empty;
                hItemID.Value = "0";
                HCategoryID.Value = "0";
                HProductGroupID.Value = "0";
                HQualityID.Value = "0";
                txtProductCode.Focus();

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:funItemSaveClearData", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                obj_bel_GTN._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_GTN._BillToDate = Convert.ToDateTime(Todate);
                obj_bel_GTN._ScreenName = "GTN";
                obj_bel_GTN._iMode = "AutoCode";
                using (DataSet ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
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
                obj_Common.LogFile(ex.Message, "GTN:funGetAutoCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
            return "0";
        }
        Boolean CheckDuplicatecustomer()
        {


            obj_bel_GTN._GTNNo = funGetAutoCodeDuplicate();
            obj_bel_GTN._iMode = "Duplicate";
            obj_bel_GTN._GTNID = Convert.ToInt32(hfldid.Value);


            using (DataSet dsUom = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
            {
                
                if (dsUom.Tables[0].Rows[0][0].ToString() == "0")
                {
                    if (gridGTN.Rows.Count > 0)
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
                        obj_bel_GTN._iMode = "Insert";

                        funAutoGentration();
                    }
                    else
                    {
                        obj_bel_GTN._iMode = "Update";


                    }


                    obj_bel_GTN._GTNID = Convert.ToInt32(hfldid.Value);


                    if (txtGTNNo.Text.Trim() != string.Empty)
                    {


                        obj_bel_GTN._GTNNo = Convert.ToString(txtGTNNo.Text.Trim());
                    }
                    else
                    {
                        obj_bel_GTN._GTNNo = string.Empty;
                    }


                    if (DropFromwarehouse.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_GTN._FromWareHouseID = Convert.ToInt32(DropFromwarehouse.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_GTN._FromWareHouseID = 0;
                    }

                    if (DropTowarehouse.SelectedValue.Trim() != string.Empty)
                    {

                        obj_bel_GTN._ToWareHouseID = Convert.ToInt32(DropTowarehouse.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_GTN._ToWareHouseID = 0;
                    }

                    if (txtGTNDate.Text.Trim() != string.Empty)
                    {


                        obj_bel_GTN._GTNDate = Convert.ToDateTime(txtGTNDate.Text.Trim());
                    }
                    else
                    {
                        obj_bel_GTN._GTNDate = System.DateTime.Now;
                    }


                    if (DropFromJobNo.SelectedValue.Trim() != string.Empty)
                    {


                     //   obj_bel_GTN._FromJOBID = Convert.ToInt32(DropFromJobNo.SelectedValue.Trim());
                    }
                    else
                    {
                      //  obj_bel_GTN._FromJOBID = 0;
                    }

                    if (DropToJobNo.SelectedValue.Trim() != string.Empty)
                    {


                        obj_bel_GTN._ToJOBID = Convert.ToInt32(DropFromJobNo.SelectedValue.Trim());
                    }
                    else
                    {
                        obj_bel_GTN._ToJOBID = Convert.ToInt32(DropFromJobNo.SelectedValue.Trim());
                    }



                    if (txtRemarks.Text.Trim() != string.Empty)
                    {
                        obj_bel_GTN._Remarks = Convert.ToString(txtRemarks.Text.Trim());
                    }
                    else
                    {
                        obj_bel_GTN._Remarks = string.Empty;
                    }

                    if (HTotalAmount.Value.Trim() != string.Empty)
                    {


                        obj_bel_GTN._TotalAmount = Convert.ToDecimal(HTotalAmount.Value);
                    }
                    else
                    {
                        obj_bel_GTN._TotalAmount = 0;
                    }

                    if (HTotalQty.Value.Trim() != string.Empty)
                    {


                        obj_bel_GTN._TotalQty = Convert.ToDecimal(HTotalQty.Value);
                    }
                    else
                    {
                        obj_bel_GTN._TotalQty = 0;
                    }

                    int result = 0;

                  //  DataTable dt_new = new DataTable();
                    Session["GTNItem_dt"] = funcSUMDuplicateValue();
                    result = obj_dal_GTN.dal_GTNInsert(obj_bel_GTN, Session["GTNItem_dt"] as DataTable);


                    if (result.ToString() == "1" || result.ToString() == "2" || result.ToString() == "3" || result.ToString() == "4")
                    {

                       // functioncleardata();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Saved Successfully');", true);
                        hfldid.Value = Convert.ToString(Session["HeaderID"]);
                        obj_bel_GTN._GTNID = Convert.ToInt32(hfldid.Value);
                        functioncleardata();
                        functionfetcdata(obj_bel_GTN);
                        
                    }
                }

                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('GTN Number Already Exists or Please enter the atleast one item.');", true);
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:functionSaverecord", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        public DataTable funcSUMDuplicateValue()
        {
            DataTable dt = new DataTable();
            try
            {


                DataTable Item_dt = Session["GTNItem_dt"] as DataTable;
                var result = Item_dt.AsEnumerable()
                            .GroupBy(r => new
                            {

                                ProductID = r.Field<Int32>("ProductID"),
                                ProductCode = r.Field<String>("ProductCode"),
                                Description = r.Field<String>("Description"),
                                CategoryName = r.Field<String>("CategoryName"),
                                DesignName = r.Field<String>("DesignName"),
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
                                row.SetField("Amount", g.Sum(r => r.Field<decimal>("Amount")));
                                return row;
                            }).CopyToDataTable();

                dt = result;

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:funcSUMDuplicateValue", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                obj_bel_GTN._ScreenName = "GTN";
                obj_bel_GTN._BillFromDate = Convert.ToDateTime(FromDate);
                obj_bel_GTN._BillToDate = Convert.ToDateTime(Todate);
                using (DataSet ds = obj_dal_GTN.dal_AutoGen(obj_bel_GTN))
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

                                txtGTNNo.Text = ds.Tables[0].Rows[0][0].ToString();

                            }

                        }
                    }

                }

            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:funGentrateAutogen", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        protected void gridGTN_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                DataTable Item_dt = Session["GTNItem_dt"] as DataTable;

                if (e.CommandName.ToUpper() == "DELETEROW")
                {
                    
                        //get the row index then only you get selected row id
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;

                        if (Convert.ToString(gridGTN.DataKeys[row.RowIndex]["GTNDetailID"].ToString()) != "0")
                        {
                            if (Common.CommonVariablesandmsg.DeleteRigts == "Y")
                            {


                            obj_bel_GTN._GTNDetailID = Convert.ToInt32(gridGTN.DataKeys[row.RowIndex]["GTNDetailID"].ToString());
                            obj_bel_GTN._iMode = "ItemDelete";
                            using (DataSet ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
                            {


                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        if (ds.Tables[0].Rows[0][0].ToString() == "1")
                                        {
                                            Item_dt.Rows[d].Delete();
                                            Item_dt.AcceptChanges();
                                            Session["GTNItem_dt"] = Item_dt;
                                            gridGTN.DataSource = Session["GTNItem_dt"] as DataTable;
                                            gridGTN.DataBind();

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
                                Session["GTNItem_dt"] = Item_dt;
                                gridGTN.DataSource = Session["GTNItem_dt"] as DataTable;
                                gridGTN.DataBind();

                            }
                            else
                            {
                                gridGTN.DataSource = Item_dt;
                                gridGTN.DataBind();

                            }

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Record Deleted Successfully');", true);
                        }
                    

                }
                if (e.CommandName.ToUpper() == "EDITROW")
                {
                    
                        GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                        int d = row.RowIndex;
                        if (Convert.ToString(gridGTN.DataKeys[row.RowIndex]["GTNDetailID"].ToString()) != "0")
                        {
                            if (Common.CommonVariablesandmsg.EditRigts == "Y")
                            {

                            obj_bel_GTN._GTNDetailID = Convert.ToInt32(Convert.ToInt32(gridGTN.DataKeys[row.RowIndex]["GTNDetailID"].ToString()));
                       
                            obj_bel_GTN._GTNID = Convert.ToInt32(hfldid.Value);
                           // obj_bel_GTN._FromJOBID = Convert.ToInt32(DropFromJobNo.SelectedValue);
                            obj_bel_GTN._FromWareHouseID = Convert.ToInt32(DropFromwarehouse.SelectedValue);
                            obj_bel_GTN._ProductID = Convert.ToInt32(Item_dt.Rows[d]["ProductID"].ToString());
                            funGetAvailableQty(obj_bel_GTN);
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
                            txtRate.Text = Convert.ToString(Item_dt.Rows[d]["Rate"]);
                            txtAmount.Text = Convert.ToString(Item_dt.Rows[d]["Amount"]);
                            Amt.Value = Convert.ToString(Item_dt.Rows[d]["Amount"]);

                            hUpdateID.Value = "1";
                            Session["GTNrow_index"] = d;
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to Edit this screen');", true);


                        }

                        }
                        else
                        {
                            obj_bel_GTN._GTNID = Convert.ToInt32(hfldid.Value);
                         //   obj_bel_GTN._FromJOBID = Convert.ToInt32(DropFromJobNo.SelectedValue);
                            obj_bel_GTN._FromWareHouseID = Convert.ToInt32(DropFromwarehouse.SelectedValue);
                            obj_bel_GTN._ProductID = Convert.ToInt32(Item_dt.Rows[d]["ProductID"].ToString());
                            funGetAvailableQty(obj_bel_GTN);
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
                            txtRate.Text = Convert.ToString(Item_dt.Rows[d]["Rate"]);
                            txtAmount.Text = Convert.ToString(Item_dt.Rows[d]["Amount"]);
                            Amt.Value = Convert.ToString(Item_dt.Rows[d]["Amount"]);
                            hUpdateID.Value = "1";
                            Session["GTNrow_index"] = d;


                        }


                   
                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:gridGTN_RowCommand", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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


        protected void gridGTN_RowDataBound(object sender, GridViewRowEventArgs e)
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
                obj_Common.LogFile(ex.Message, "GTN:btnLoad_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                obj_Common.LogFile(ex.Message, "GTN:ItemSave_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {
                if (Common.CommonVariablesandmsg.ViewRights == "Y")
                {
                    Response.Redirect("../SearchListTransaction.aspx?pg=GTN");
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view this screen');", true);


                }
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:Search_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                funPrint();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Please select the item from search');", true);
            }
        }

        public void funPrint()
        {
            obj_bel_GTN._iMode = "Print";
            obj_bel_GTN._GTNID = Convert.ToInt32(hfldid.Value.ToString());
            using (DataSet ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        Session["SaveUser"] = ds.Tables[0].Rows[0]["LoginID"].ToString();
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../Report/ReportViewer.aspx?value=GTNPRINT" + "','_blank')", true);
                    //    Report.ReportViewer rep = new Report.ReportViewer();
                    //    string Path = rep.GTNPrint(obj_bel_GTN);
                    //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('" + Path + "');", true);

                    //    string dirName = Server.MapPath("../Images/Print");

                    //    var files = new DirectoryInfo(dirName).GetFiles("*.pdf");
                    //    foreach (var file in files.Where(file => DateTime.UtcNow - file.CreationTimeUtc < TimeSpan.FromHours(-12)))
                    //    {
                    //        file.Delete();
                    //        Common.CommonVariablesandmsg.CountPdf = 0;
                    //    }
                    }
                }
            }

        }
        void funGetAvailableQty(bel_GTN obj_bel_GTN)
        {
            try
            {
                decimal AviQty = 0;
                decimal Qty = 0;
                decimal TotalAviQty = 0;
                obj_bel_GTN._iMode = "GetAvailableQty";
                using (DataSet ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
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
                obj_Common.LogFile(ex.Message, "GTN:funGetAvailableQty", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
        void funBindGridPopup(string ProductCode, string iMode)
        {
            try
            {


                obj_bel_GTN._ProductCode = ProductCode;
                obj_bel_GTN._iMode = iMode;
             //   obj_bel_GTN._FromJOBID = Convert.ToInt32(DropFromJobNo.SelectedValue);
                //obj_bel_GTN._FromWareHouseID = Convert.ToInt32(DropFromwarehouse.SelectedValue);
                using (DataSet ds = obj_dal_GTN.dal_GTNDetail(obj_bel_GTN))
                {
                    if (ds.Tables.Count > 0)
                    {

                        if (ds.Tables[0].Rows.Count == 0)
                        {

                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Inactive Item.');", true);
                            txtProductCode.Focus();
                            searchResult.DataSource = null;
                            searchResult.DataBind();

                        }
                        else if (ds.Tables[0].Rows[0][0].ToString() == "Exists")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('There is no stock.');", true);
                            txtProductCode.Focus();

                        }

                        else if (ds.Tables[0].Rows[0][1].ToString() != string.Empty)
                        {
                           
                            Session["GTNdt_pop"] = ds.Tables[0];
                            searchResult.DataSource = Session["GTNdt_pop"] as DataTable;
                            searchResult.DataBind();
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "GTN:funBindGridPopup", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                obj_Common.LogFile(ex.Message, "GTN:Button1_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                       // Session["GTNdt_pop"] = dt;
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
                obj_Common.LogFile(ex.Message, "GTN:funFilterProductCode", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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

                        obj_bel_GTN._iMode = "Insert";
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
                        obj_bel_GTN._iMode = "Update";
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
                obj_Common.LogFile(ex.Message, "GTN:Save_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
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
                obj_Common.LogFile(ex.Message, "GTN:searchResult_RowCommand", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
    }
}