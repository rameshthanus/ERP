using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_PurchaseReturn
    {

        int PurchaseReturnID = 0;
        public int _PurchaseReturnID
        {
            get { return PurchaseReturnID; }
            set { PurchaseReturnID = value; }
        }

      
        int CategotyID = 0;
        public int _CategotyID
        {
            get { return CategotyID; }
            set { CategotyID = value; }
        }

        int PurchaseReturnDetailID = 0;
        public int _PurchaseReturnDetailID
        {
            get { return PurchaseReturnDetailID; }
            set { PurchaseReturnDetailID = value; }
        }

        DateTime PurchaseReturnDate = System.DateTime.Now;
        public DateTime _PurchaseReturnDate
        {
            get { return PurchaseReturnDate; }
            set { PurchaseReturnDate = value; }
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
        string PurchaseReturnNo = string.Empty;
        public string _PurchaseReturnNo
        {
            get { return PurchaseReturnNo; }
            set { PurchaseReturnNo = value; }
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
