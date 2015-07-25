using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_APVoucher
    {
        int VoucherID = 0;
        public int _VoucherID
        {
            get { return VoucherID; }
            set { VoucherID = value; }
        }

        int ProductID = 0;
        public int _ProductID
        {
            get { return ProductID; }
            set { ProductID = value; }
        }

        int CategoryID = 0;
        public int _CategoryID
        {
            get { return CategoryID; }
            set { CategoryID = value; }
        }

        int Voucher_DetailID = 0;
        public int _Voucher_DetailID
        {
            get { return Voucher_DetailID; }
            set { Voucher_DetailID = value; }
        }

        string Status = string.Empty;
        public string _Status
        {
            get { return Status; }
            set { Status = value; }
        }

        string ProductCode = string.Empty;
        public string _ProductCode
        {
            get { return ProductCode; }
            set { ProductCode = value; }
        }
        string DCNo = string.Empty;
        public string _DCNo
        {
            get { return DCNo; }
            set { DCNo = value; }
        }

        DateTime DcDate = System.DateTime.Now;
        public DateTime _DcDate
        {
            get { return DcDate; }
            set { DcDate = value; }
        }

        int JOBID = 0;
        public int _JOBID
        {
            get { return JOBID; }
            set { JOBID = value; }
        }

        int PartyID = 0;
        public int _PartyID
        {
            get { return PartyID; }
            set { PartyID = value; }
        }
        int WarehouseID = 0;
        public int _WarehouseID
        {
            get { return WarehouseID; }
            set { WarehouseID = value; }
        }
        string Through = string.Empty;
        public string _Through
        {
            get { return Through; }
            set { Through = value; }
        }

        decimal TotalCarton = 0;
        public decimal _TotalCarton
        {
            get { return TotalCarton; }
            set { TotalCarton = value; }
        }

        decimal TotalQty = 0;
        public decimal _TotalQty
        {
            get { return TotalQty; }
            set { TotalQty = value; }
        }
        int QuotationID = 0;
        public int _QuotationID
        {
            get { return QuotationID; }
            set { QuotationID = value; }
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
