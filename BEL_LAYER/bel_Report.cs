using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_Report
    {
       string WareHouseName = string.Empty;
       public string _WareHouseName
        {
            get { return WareHouseName; }

            set { WareHouseName = value; }
        }
        string ReportName = string.Empty;
        public string _ReportName
        {
            get { return ReportName; }

            set { ReportName = value; }
        }
        string BeforeFromDate = string.Empty;
        public string _BeforeFromDate
        {
            get { return BeforeFromDate; }

            set { BeforeFromDate = value; }
        }

        string FromDate = string.Empty;
        public string _FromDate
        {
            get { return FromDate; }

            set { FromDate = value; }
        }

        string ToDate = string.Empty;
        public string _ToDate
       {
           get { return ToDate; }

           set { ToDate = value; }
       }

       string Organaization = string.Empty;
       public string _Organaization
       {
           get { return Organaization; }

           set { Organaization = value; }
       }

        int CategoryID = 0;
        public int _CategoryID
        {
            get { return CategoryID; }

            set { CategoryID = value; }
        }

        int StockBranchID = 0;
        public int _StockBranchID
        {
            get { return StockBranchID; }

            set { StockBranchID = value; }
        }
       
        int WarehouseID = 0;
        public int _WarehouseID
        {
            get { return WarehouseID; }

            set { WarehouseID = value; }
        }
        

        int ProductGroupID = 0;
        public int _ProductGroupID
        {
            get { return ProductGroupID; }

            set { ProductGroupID = value; }
        }

        int SizeID = 0;
        public int _SizeID
        {
            get { return SizeID; }

            set { SizeID = value; }
        }

        int UOMID = 0;
        public int _UOMID
        {
            get { return UOMID; }

            set { UOMID = value; }
        }

        int ColorID = 0;
        public int _ColorID
        {
            get { return ColorID; }

            set { ColorID = value; }
        }

        int QualityID = 0;
        public int _QualityID
        {
            get { return QualityID; }

            set { QualityID = value; }
        }

        int DesignID = 0;
        public int _DesignID
        {
            get { return DesignID; }

            set { DesignID = value; }
        }

        int ProductID = 0;
        public int _ProductID
        {
            get { return ProductID; }

            set { ProductID = value; }
        }

        int PartyID = 0;
        public int _PartyID
        {
            get { return PartyID; }

            set { PartyID = value; }
        }

        int OrderID = 0;
        public int _OrderID
        {
            get { return OrderID; }

            set { OrderID = value; }
        }

        int UserID = 0;
        public int _UserID
        {
            get { return UserID; }

            set { UserID = value; }
        }


        int JOBID = 0;
        public int _JOBID
        {
            get { return JOBID; }

            set { JOBID = value; }
        }

        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }

            set { iMode = value; }
        }
    }
}
