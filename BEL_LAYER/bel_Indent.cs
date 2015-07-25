using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Indent
    {
        int ApprovedStatus = 0;
        public int _ApprovedStatus
        {
            get { return ApprovedStatus; }

            set { ApprovedStatus = value; }
        }

        int ApprovedUserID = 0;
        public int _ApprovedUserID
        {
            get { return ApprovedUserID; }

            set { ApprovedUserID = value; }
        }

        int IndentID = 0;
        public int _IndentID
        {
            get { return IndentID; }

            set { IndentID = value; }
        }
        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }
        }
        string screenName = string.Empty;
        public string _screenName
        {
            get { return screenName; }

            set { screenName = value; }
        }

        int IndentDetailID = 0;
        public int _IndentDetailID
        {
            get { return IndentDetailID; }

            set { IndentDetailID = value; }
        }

        int BranchID = 0;
        public int _BranchID
        {
            get { return BranchID; }
            set { BranchID = value; }
        }
        int Year = 0;
        public int _Year
        {
            get { return Year; }
            set { Year = value; }
        }
        string IndentNo = string.Empty;
        public string _IndentNo
        {
            get { return IndentNo; }
            set { IndentNo = value; }
        }
        string ProductCode = string.Empty;
        public string _ProductCode
        {
            get { return ProductCode; }
            set { ProductCode = value; }
        }
        DateTime IndentDate = System.DateTime.Now;
        public DateTime _IndentDate
        {
            get { return IndentDate; }
            set { IndentDate = value; }
        }
        int ProductID = 0;
        public int _ProductID
        {
            get { return ProductID; }
            set { ProductID = value; }
        }
        int JobID = 0;
        public int _JobID
        {
            get { return JobID; }
            set { JobID = value; }
        }

        int QuotationID = 0;
        public int _QuotationID
        {
            get { return QuotationID; }
            set { QuotationID = value; }
        }
        int CategoryID = 0;
        public int _CategoryID
        {
            get { return CategoryID; }
            set { CategoryID = value; }
        }
        string Status = string.Empty;
        public string _Status
        {
            get { return Status; }
            set { Status = value; }
        }
        int CreatedBy = 0;
        public int _CreatedBy
        {
            get { return CreatedBy; }
            set { CreatedBy = value; }
        }
        string Remarks = string.Empty;
        public string _Remarks
        {
            get { return Remarks; }
            set { Remarks = value; }
        }
        string rRemarks = string.Empty;
        public string _rRemarks
        {
            get { return rRemarks; }
            set { rRemarks = value; }
        }

        DateTime CreatedOn = System.DateTime.Now;
        public DateTime _CreatedOn
        {
            get { return CreatedOn; }
            set { CreatedOn = value; }
        }
        DateTime ModifiedOn = System.DateTime.Now;
        public DateTime _ModifiedOn
        {
            get { return ModifiedOn; }
            set { ModifiedOn = value; }
        }

        int ModifiedBy = 0;
        public int _ModifiedBy
        {
            get { return ModifiedBy; }
            set { ModifiedBy = value; }
        }
        Decimal TotalRQty = 0;
        public Decimal _TotalRQty
        {
            get { return TotalRQty; }
            set { TotalRQty = value; }
        }
        Decimal TotalOQty = 0;
        public Decimal _TotalOQty
        {
            get { return TotalOQty; }
            set { TotalOQty = value; }
        }
        int RequiredQty = 0;
        public int _RequiredQty
        {
            get { return RequiredQty; }
            set { RequiredQty = value; }
        }
        int OrderedQty = 0;
        public int _OrderedQty
        {
            get { return OrderedQty; }
            set { OrderedQty = value; }
        }
        Decimal TotalAmount = 0;
        public Decimal _TotalAmount
        {
            get { return TotalAmount; }
            set { TotalAmount = value; }
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
    }
}
