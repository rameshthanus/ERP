using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.Sql;
using System.Data;
using System.Web.Services;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;

namespace Trident.Master
{
    public partial class PtoductSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [Serializable]
        public class Data
        {
            // Yay for 3.5 auto properties
            public string SNo { get; set; }
            public string ProductCode { get; set; }
            public string Description { get; set; }
        };

        [WebMethod]
        public static List<Data> GetData()
        {
            List<Data> DataList = new List<Data>();
            bel_Product bel = new bel_Product();
            dal_Product dal = new dal_Product();
            bel._iMode = "Search";
            DataSet ds = new DataSet();
            ds = dal.dal_ProductDetail(bel);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                Data thisData2 = new Data();
                thisData2.SNo = row["SNo"].ToString();
                thisData2.ProductCode = row["ProductCode"].ToString();
                thisData2.Description = row["Description"].ToString();

                DataList.Add(thisData2);
            }

            //Data thisData = new Data();
            //thisData.SNo = "2";
            //thisData.ProductCode = "Hawk";
            //thisData.Description = "Aries";

            //DataList.Add(thisData);

           

            return DataList;
        }
    }
}