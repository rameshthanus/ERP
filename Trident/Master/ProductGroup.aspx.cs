using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Trident.Master
{
    public partial class ProductGroup1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            check_rights();
        }
        private void check_rights()
        {
            Trident.Common.CommonFunction obj_Common = new Common.CommonFunction();
            obj_Common.functionCheckActhorization("Product-Group", "AssignAuthorization");
            if (Common.CommonVariablesandmsg.ViewOnlyRights == "Y")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "calling", "cal_Readonly();", true);
            }
            if (Common.CommonVariablesandmsg.ViewRights == "N")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "OnClick", "javascript:alert('Your are not authorized to view');", true);
                Response.Redirect("../HomeContentPage.aspx");
            }
        }
    }
}