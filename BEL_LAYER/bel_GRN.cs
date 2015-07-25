using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_GRN
    {
        string Title = string.Empty;
        public string _Title
        {
            get { return Title; }
            set { Title = value; }
        }
        string DCNo = string.Empty;
        public string _DCNo
        {
            get { return DCNo; }
            set { DCNo = value; }
        }
        string NoTitle = string.Empty;
        public string _NoTitle
        {
            get { return NoTitle; }
            set { NoTitle = value; }
        }

        int OrderID = 0;
        public int _OrderID
        {
            get { return OrderID; }
            set { OrderID = value; }
        }
        int CategoryID = 0;
        public int _CategoryID
        {
            get { return CategoryID; }
            set { CategoryID = value; }
        }

        int ToWareHouseID = 0;
        public int _ToWareHouseID
        {
            get { return ToWareHouseID; }
            set { ToWareHouseID = value; }
        }

        int FromWareHouseID = 0;
        public int _FromWareHouseID
        {
            get { return FromWareHouseID; }
            set { FromWareHouseID = value; }
        }

        int GRNID = 0;
        public int _GRNID
        {
            get { return GRNID; }
            set { GRNID = value; }
        }

        int GRNDetailID = 0;
        public int _GRNDetailID
        {
            get { return GRNDetailID; }
            set { GRNDetailID = value; }
        }

        int Year = 0;
        public int _Year
        {
            get { return Year; }
            set { Year = value; }
        }

        string GRNNo = string.Empty;
        public string _GRNNo
        {
            get { return GRNNo; }
            set { GRNNo = value; }
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

        Int32 InvoiceNo = 0;
        public Int32 _InvoiceNo
        {
            get { return InvoiceNo; }
            set { InvoiceNo = value; }
        }
        Int32 FromBranchID = 0;
        public Int32 _FromBranchID
        {
            get { return FromBranchID; }
            set { FromBranchID = value; }
        }
        DateTime GRNDate = System.DateTime.Now;
        public DateTime _GRNDate
        {
            get { return GRNDate; }
            set { GRNDate = value; }
        }

        DateTime InvoiceDate = System.DateTime.Now;
        public DateTime _InvoiceDate
        {
            get { return InvoiceDate; }
            set { InvoiceDate = value; }
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
