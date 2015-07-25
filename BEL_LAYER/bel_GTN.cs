using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_GTN
    {
       
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

        int GTNID = 0;
        public int _GTNID
        {
            get { return GTNID; }
            set { GTNID = value; }
        }

        int GTNDetailID = 0;
        public int _GTNDetailID
        {
            get { return GTNDetailID; }
            set { GTNDetailID = value; }
        }

        int Year = 0;
        public int _Year
        {
            get { return Year; }
            set { Year = value; }
        }

        string GTNNo = string.Empty;
        public string _GTNNo
        {
            get { return GTNNo; }
            set { GTNNo = value; }
        }

       

        string ProductCode = string.Empty;
        public string _ProductCode
        {
            get { return ProductCode; }
            set { ProductCode = value; }
        }


        DateTime GTNDate = System.DateTime.Now;
        public DateTime _GTNDate
        {
            get { return GTNDate; }
            set { GTNDate = value; }
        }
        int CategoryID = 0;
        public int _CategoryID
        {
            get { return CategoryID; }
            set { CategoryID = value; }
        }
        int JOBID = 0;
        public int _JOBID
        {
            get { return JOBID; }
            set { JOBID = value; }
        }

        int ToJOBID = 0;
        public int _ToJOBID
        {
            get { return ToJOBID; }
            set { ToJOBID = value; }
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
