using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_Salesreturn
    {
       int SalesReturnID = 0;
       public int _SalesReturnID
        {
            get { return SalesReturnID; }
            set { SalesReturnID = value; }
        }

       int SalesReturnDetailID = 0;
       public int _SalesReturnDetailID
        {
            get { return SalesReturnDetailID; }
            set { SalesReturnDetailID = value; }
        }

        int BranchID = 0;
        public int _BranchID
        {
            get { return BranchID; }
            set { BranchID = value; }
        }

        int ProductID = 0;
        public int _ProductID
        {
            get { return ProductID; }
            set { ProductID = value; }
        }

        string ProductCode = string.Empty;
        public string _ProductCode
        {
            get { return ProductCode; }
            set { ProductCode = value; }
        }

        int JOBID = 0;
        public int _JOBID
        {
            get { return JOBID; }
            set { JOBID = value; }
        }

        string ScreenName = string.Empty;
        public string _ScreenName
        {
            get { return ScreenName; }
            set { ScreenName = value; }
        }
        int CompanyID = 0;
        public int _CompanyID
        {
            get { return CompanyID; }
            set { CompanyID = value; }
        }

        int WarehouseID = 0;
        public int _WarehouseID
        {
            get { return WarehouseID; }
            set { WarehouseID = value; }
        }

        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }
        }

        int CategoryID = 0;
        public int _CategoryID
        {
            get { return CategoryID; }
            set { CategoryID = value; }
        }

        int QuotationID = 0;
        public int _QuotationID
        {
            get { return QuotationID; }
            set { QuotationID = value; }
        }


        int PartyID = 0;
        public int _PartyID
        {
            get { return PartyID; }
            set { PartyID = value; }
        }
    }
}
