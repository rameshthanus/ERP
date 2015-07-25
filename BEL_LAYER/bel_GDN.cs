using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_GDN
    {
        string Title = string.Empty;
        public string _Title
        {
            get { return Title; }
            set { Title = value; }
        }

        string TitleNo = string.Empty;
        public string _TitleNo
        {
            get { return TitleNo; }
            set { TitleNo = value; }
        }

       
       int OrderID = 0;
       public int _OrderID
        {
            get { return OrderID; }
            set { OrderID = value; }
        }
       int ToBranchID = 0;
       public int _ToBranchID
        {
            get { return ToBranchID; }
            set { ToBranchID = value; }
        }

       int WareHouseID = 0;
       public int _WareHouseID
       {
           get { return WareHouseID; }
           set { WareHouseID = value; }
       }

       int FromWareHouseID =0;
       public int _FromWareHouseID
       {
           get { return FromWareHouseID; }
           set { FromWareHouseID = value; }
       }

       int GDNID = 0;
       public int _GDNID
        {
            get { return GDNID; }
            set { GDNID = value; }
        }

       int GDNDetailID = 0;
       public int _GDNDetailID
        {
            get { return GDNDetailID; }
            set { GDNDetailID = value; }
        }

        int Year = 0;
        public int _Year
        {
            get { return Year; }
            set { Year = value; }
        }

        string GDNNo = string.Empty;
        public string _GDNNo
        {
            get { return GDNNo; }
            set { GDNNo = value; }
        }

        string Type = string.Empty;
        public string _Type
        {
            get { return Type; }
            set { Type = value; }
        }
        
        string ProductCode = string.Empty;
        public string _ProductCode
        {
            get { return ProductCode; }
            set { ProductCode = value; }
        }


        DateTime GDNDate = System.DateTime.Now;
        public DateTime _GDNDate
        {
            get { return GDNDate; }
            set { GDNDate = value; }
        }
        int PartyID = 0;
        public int _PartyID
        {
            get { return PartyID; }
            set { PartyID = value; }
        }
        int JOBID = 0;
        public int _JOBID
        {
            get { return JOBID; }
            set { JOBID = value; }
        }

        

        string Status = string.Empty;
        public string _Status
        {
            get { return Status; }
            set { Status = value; }
        }
        
        int ProductID = 0;
        public int _ProductID
        {
            get { return ProductID; }
            set { ProductID = value; }
        }



        string Through = string.Empty;
        public string _Through
        {
            get { return Through; }
            set { Through = value; }
        }

        string Remarks = string.Empty;
        public string _Remarks
        {
            get { return Remarks; }
            set { Remarks = value; }
        }


        decimal TotalQty = 0;
        public decimal _TotalQty
        {
            get { return TotalQty; }
            set { TotalQty = value; }
        }

        decimal TotalAmount = 0;
        public decimal _TotalAmount
        {
            get { return TotalAmount; }
            set { TotalAmount = value; }
        }

        int CreatedBy = 0;
        public int _CreatedBy
        {
            get { return CreatedBy; }
            set { CreatedBy = value; }
        }


        DateTime CreatedOn = System.DateTime.Now;
        public DateTime _CreatedOn
        {
            get { return CreatedOn; }
            set { CreatedOn = value; }
        }

        int ModifiedBy = 0;
        public int _ModifiedBy
        {
            get { return ModifiedBy; }
            set { ModifiedBy = value; }
        }
        DateTime ModifiedOn = System.DateTime.Now;
        public DateTime _ModifiedOn
        {
            get { return ModifiedOn; }
            set { ModifiedOn = value; }
        }


        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }
        }

        DateTime BillFromDate = System.DateTime.Now;
        public DateTime _BillFromDate
        {
            get { return BillFromDate; }
            set { BillFromDate = value; }
        }
        DateTime BillToDate = System.DateTime.Now;
        public DateTime _BillToDate
        {
            get { return BillToDate; }
            set { BillToDate = value; }
        }
        string ScreenName = string.Empty;
        public string _ScreenName
        {
            get { return ScreenName; }
            set { ScreenName = value; }
        }
    }
}
