using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_PurchaseOrder
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
        int PurchaseOrderID = 0;
        public int _PurchaseOrderID
        {
            get { return PurchaseOrderID; }
            set { PurchaseOrderID = value; }
        }

        int Year = 0;
        public int _Year
        {
            get { return Year; }
            set { Year = value; }
        }

        int CurrencyID = 0;
        public int _CurrencyID
        {
            get { return CurrencyID; }
            set { CurrencyID = value; }
        }
        int CategotyID = 0;
        public int _CategotyID
        {
            get { return CategotyID; }
            set { CategotyID = value; }
        }

        int PurchaseOrderDetailID = 0;
        public int _PurchaseOrderDetailID
        {
            get { return PurchaseOrderDetailID; }
            set { PurchaseOrderDetailID = value; }
        }

        DateTime PurchaseOrderDate = System.DateTime.Now;
        public DateTime _PurchaseOrderDate
        {
            get { return PurchaseOrderDate; }
            set { PurchaseOrderDate = value; }
        }
        DateTime DeliveryDate = System.DateTime.Now;
        public DateTime _DeliveryDate
        {
            get { return DeliveryDate; }
            set { DeliveryDate = value; }
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

        int IndentID = 0;
        public int _IndentID
        {
            get { return IndentID; }

            set { IndentID = value; }
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
        string ProductCode = string.Empty;
        public string _ProductCode
        {
            get { return ProductCode; }
            set { ProductCode = value; }
        }
        string PurchaseOrderNo = string.Empty;
        public string _PurchaseOrderNo
        {
            get { return PurchaseOrderNo; }
            set { PurchaseOrderNo = value; }
        }

        string Description = string.Empty;
        public string _Description
        {
            get { return Description; }
            set { Description = value; }
        }

        string DeliveryAt = string.Empty;
        public string _DeliveryAt
        {
            get { return DeliveryAt; }
            set { DeliveryAt = value; }
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
