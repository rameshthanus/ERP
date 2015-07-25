using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using Trident.Common;
using System.Data;
using System.Net;
using System.Net.Sockets;
using System.Net.NetworkInformation;
using System.Text;

namespace Trident
{
    public partial class HomeHeader : System.Web.UI.Page
    {
        
       
      public DataTable dt_MenuGroup = new DataTable();
        public DataTable dt_Menu = new DataTable();

        bel_login obj_bel_Login = new bel_login();
        dal_login obj_dal_Login = new dal_login();
        Common.CommonFunction obj_Common = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Convert.ToInt32(Session["UserID"]) == 0)
                {
                    Response.Redirect("SessionTimeout.aspx");
                }
                else
                {


                    if (!IsPostBack)
                    {
                       
                          //lblcompanyName.InnerText = Convert.ToString(Session["CompanyName"]) + " -  (" + Session["BranchName"] + " )";
                            label.InnerText = Convert.ToString(Session["UserName"]);

                            //funBindMenu(); 

                        
                    }
                }


            }

            catch (Exception exe)
            {

            }
          
        }
        [System.Web.Services.WebMethod(EnableSession=true)]
        public static List<Dictionary<string, object>> get_notification()
        {
            DataSet ds = new DataSet();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = new Dictionary<string, object>();
            try
            {
                return Trident.classes.Json.getjson_((DataTable)HttpContext.Current.Session["NotificationTable"]);
            }
            catch(Exception e)
            {
                row.Add("res", "exception");
                rows.Add(row);
                return rows;

            }          

        }     
        void funBindMenu()
        {
            obj_bel_Login._iMode = "MenuBind";
            obj_bel_Login._UserID = Convert.ToInt32(Session["UserID"]);
            obj_bel_Login._BranchID = Convert.ToInt32(Session["BranchID"]);

            obj_bel_Login._CompanyID = Convert.ToInt32(Session["CompanyID"]);
             using (DataSet ds = obj_dal_Login.dal_Logindetail(obj_bel_Login))
             {
                 if (ds.Tables.Count > 0)
                 {
                     if (ds.Tables[0].Rows.Count > 0)
                     {
                         dt_MenuGroup = ds.Tables[0];
                     }
                     if (ds.Tables[1].Rows.Count > 0)
                     {
                         dt_Menu = ds.Tables[1];

                     }                                        
                 }
                 DataTable dt_final = new DataTable();
                 dt_final = ds.Tables[2];
                 dt_final.Merge(ds.Tables[3]);
                 Session["NotificationTable"] = dt_final;
             }
            StringBuilder strMenu = new StringBuilder();
            try
            {
               
						
                    strMenu.Append(" <div class=\"page-sidebar navbar-collapse collapse\">");
                    strMenu.Append("<ul class=\"page-sidebar-menu page-sidebar-menu-hover-submenu\" data-auto-scroll=\"true\" data-slide-speed=\"200\">");
               
                    foreach (DataRow dtRow in dt_MenuGroup.Rows)
                    {

                        if (Convert.ToInt32(dtRow["ModulesGroupID"]) == 1)
                        {
                           strMenu.Append(" <li class=\"start active \">");
                           strMenu.Append("<a href=\"HomeHeader.aspx\"> <i class=\"icon-home\"></i>");
                            strMenu.Append(" <span class=\"title\">"+ dtRow["ModulesGroupName"].ToString() +" </span>");
                            strMenu.Append(" <span class=\"selected\"></span>");
                            strMenu.Append(" </a></li>");
                            
                        }
                        else if (Convert.ToInt32(dtRow["ModulesGroupID"]) == 2)
                        {
                            
						  
                            strMenu.Append("<li>");
                            strMenu.Append("<a href=\"javascript:;\">");
                            strMenu.Append("<i class=\"icon-star\"></i>");
                            strMenu.Append("<span class=\"title\">"+ dtRow["ModulesGroupName"].ToString() +"</span>");
                            strMenu.Append("<span class=\"arrow\"></span>");
                            strMenu.Append("</a>");
                            strMenu.Append("<ul class=\"sub-menu\">");
                            
                           
                            
                            foreach (DataRow dtrow in dt_Menu.Rows)
                            {
                                if (Convert.ToInt32(dtRow["ModulesGroupID"]) == Convert.ToInt32(dtrow["ModulesGroupID"]))
                                {
                                   
                                strMenu.Append("<li>");
                                strMenu.Append("<a href=" + dtrow["Link"].ToString() + " target=\"_view\">");
                                strMenu.Append("<i class=" + dtrow["Icon"].ToString() + "></i>" +" "+ dtrow["ModulesName"].ToString() + "");                                
                                strMenu.Append("</a></li>");
                                 }
                            }
                            strMenu.Append("</ul>");
                           
                        }

                        else if (Convert.ToInt32(dtRow["ModulesGroupID"]) == 3)
                        {

                            strMenu.Append("<li>");
                            strMenu.Append("<a href=\"javascript:;\">");
                            strMenu.Append("<i class=\"icon-docs\"></i>");
                            strMenu.Append("<span class=\"title\">" + dtRow["ModulesGroupName"].ToString() + "</span>");
                            strMenu.Append("<span class=\"arrow\"></span>");
                            strMenu.Append("</a>");
                            strMenu.Append("<ul class=\"sub-menu\">");



                            foreach (DataRow dtrow in dt_Menu.Rows)
                            {
                                if (Convert.ToInt32(dtRow["ModulesGroupID"]) == Convert.ToInt32(dtrow["ModulesGroupID"]))
                                {

                                    strMenu.Append("<li>");
                                    strMenu.Append("<a href=" + dtrow["Link"].ToString() + " target=\"_view\">");
                                    strMenu.Append("<i class=" + dtrow["Icon"].ToString() + "></i>" +" "+ dtrow["ModulesName"].ToString() + "");                                
                                    strMenu.Append("</a></li>");
                                }
                            }
                            strMenu.Append("</ul>");
                        }

                        else if (Convert.ToInt32(dtRow["ModulesGroupID"]) == 4)
                        {

                            strMenu.Append("<li>");
                            strMenu.Append("<a href=\"javascript:;\">");
                            strMenu.Append("<i class=\"icon-basket\"></i>");
                            strMenu.Append("<span class=\"title\">" + dtRow["ModulesGroupName"].ToString() + "</span>");
                            strMenu.Append("<span class=\"arrow\"></span>");
                            strMenu.Append("</a>");
                            strMenu.Append("<ul class=\"sub-menu\">");



                            foreach (DataRow dtrow in dt_Menu.Rows)
                            {
                                if (Convert.ToInt32(dtRow["ModulesGroupID"]) == Convert.ToInt32(dtrow["ModulesGroupID"]))
                                {

                                    strMenu.Append("<li>");
                                    strMenu.Append("<a href=" + dtrow["Link"].ToString() + " target=\"_view\">");
                                    strMenu.Append("<i class=\"fa fa-angle-right\"></i>" +" "+ dtrow["ModulesName"].ToString() + "");  
                                    strMenu.Append("</a></li>");
                                }
                            }
                            strMenu.Append("</ul>");
                        }
                        else if (Convert.ToInt32(dtRow["ModulesGroupID"]) == 5)
                        {

                            strMenu.Append("<li>");
                            strMenu.Append("<a href=\"javascript:;\">");
                            strMenu.Append("<i  class=\"icon-user\"></i>");
                            strMenu.Append("<span class=\"title\">" + dtRow["ModulesGroupName"].ToString() + "</span>");
                            strMenu.Append("<span class=\"arrow\"></span>");
                            strMenu.Append("</a>");
                            strMenu.Append("<ul class=\"sub-menu\">");



                            foreach (DataRow dtrow in dt_Menu.Rows)
                            {
                                if (Convert.ToInt32(dtRow["ModulesGroupID"]) == Convert.ToInt32(dtrow["ModulesGroupID"]))
                                {

                                    strMenu.Append("<li>");
                                    strMenu.Append("<a href=" + dtrow["Link"].ToString() + " target=\"_view\">");
                                    strMenu.Append("<i class=" + dtrow["Icon"].ToString() + "></i>" +" "+ dtrow["ModulesName"].ToString() + "");                                
                                    strMenu.Append("</a></li>");
                                }
                            }
                            strMenu.Append("</ul>");
                        }

                        else if (Convert.ToInt32(dtRow["ModulesGroupID"]) == 6)
                        {

                            strMenu.Append("<li>");
                            strMenu.Append("<a href=\"javascript:;\">");
                            strMenu.Append("<i class=\"icon-puzzle\"></i>");
                            strMenu.Append("<span class=\"title\">" + dtRow["ModulesGroupName"].ToString() + "</span>");
                            strMenu.Append("<span class=\"arrow\"></span>");
                            strMenu.Append("</a>");
                            strMenu.Append("<ul class=\"sub-menu\">");



                            foreach (DataRow dtrow in dt_Menu.Rows)
                            {
                                if (Convert.ToInt32(dtRow["ModulesGroupID"]) == Convert.ToInt32(dtrow["ModulesGroupID"]))
                                {

                                    strMenu.Append("<li>");
                                    strMenu.Append("<a href=" + dtrow["Link"].ToString() + " target=\"_view\">");
                                    strMenu.Append("<i class=" + dtrow["Icon"].ToString() + "></i>" +" "+ dtrow["ModulesName"].ToString() + "");                                
                                    strMenu.Append("</a></li>");
                                }
                            }
                            strMenu.Append("</ul>");
                        }
                        
                       
                    }
                    strMenu.Append("</ul>");
                    strMenu.Append("</div>");

                    lblMenu.Text = strMenu.ToString();                   

            }
            catch(Exception ex)
            {

            }
        }

        protected void LnkSignout_Click(object sender, EventArgs e)
        {
            try
            {
                obj_Common.LoginHistory("LogOut");
                Response.Redirect("index.html");
            }
            catch (Exception ex)
            {
                obj_Common.LogFile(ex.Message, "LnkSignout_Click", Convert.ToInt32(ex.StackTrace.Substring(ex.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }
        }
       
        
				
            //        <li>
            //            <a href="javascript:;">
            //            <i class="icon-basket"></i>
            //            <span class="title">eCommerce</span>
            //            <span class="arrow "></span>
            //            </a>
            //            <ul class="sub-menu">
            //                <li>
            //                    <a href="ecommerce_index.html">
            //                    <i class="icon-home"></i>
            //                    Dashboard</a>
            //                </li>
            //                <li>
            //                    <a href="ecommerce_orders.html">
            //                    <i class="icon-basket"></i>
            //                    Orders</a>
            //                </li>
            //                <li>
            //                    <a href="ecommerce_orders_view.html">
            //                    <i class="icon-tag"></i>
            //                    Order View</a>
            //                </li>
            //                <li>
            //                    <a href="ecommerce_products.html">
            //                    <i class="icon-handbag"></i>
            //                    Products</a>
            //                </li>
            //                <li>
            //                    <a href="ecommerce_products_edit.html">
            //                    <i class="icon-pencil"></i>
            //                    Product Edit</a>
            //                </li>
            //            </ul>
            //        </li>
            //        <li>
            //            <a href="javascript:;">
            //            <i class="icon-rocket"></i>
            //            <span class="title">Page Layouts</span>
            //            <span class="arrow "></span>
            //            </a>
            //            <ul class="sub-menu">
            //                <li>
            //                    <a href="layout_fontawesome_icons.html">
            //                    <span class="badge badge-roundless badge-danger">new</span>Layout with Fontawesome Icons</a>
            //                </li>
            //                <li>
            //                    <a href="layout_glyphicons.html">
            //                    Layout with Glyphicon</a>
            //                </li>
            //                <li>
            //                    <a href="layout_full_height_content.html">
            //                    <span class="badge badge-roundless badge-warning">new</span>Full Height Content</a>
            //                </li>
            //                <li>
            //                    <a href="layout_sidebar_reversed.html">
            //                    <span class="badge badge-roundless badge-warning">new</span>Right Sidebar Page</a>
            //                </li>
            //                <li>
            //                    <a href="layout_sidebar_fixed.html">
            //                    Sidebar Fixed Page</a>
            //                </li>
            //                <li>
            //                    <a href="layout_sidebar_closed.html">
            //                    Sidebar Closed Page</a>
            //                </li>
            //                <li>
            //                    <a href="layout_ajax.html">
            //                    Content Loading via Ajax</a>
            //                </li>
            //                <li>
            //                    <a href="layout_disabled_menu.html">
            //                    Disabled Menu Links</a>
            //                </li>
            //                <li>
            //                    <a href="layout_blank_page.html">
            //                    Blank Page</a>
            //                </li>
            //                <li>
            //                    <a href="layout_fluid_page.html">
            //                    Fluid Page</a>
            //                </li>
            //                <li>
            //                    <a href="layout_language_bar.html">
            //                    Language Switch Bar</a>
            //                </li>
            //            </ul>
            //        </li>
            //        </ul>
            //    <!-- END SIDEBAR MENU -->
            //</div>
       
    }
}