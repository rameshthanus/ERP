using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_GPN
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

        int GPNID = 0;
        public int _GPNID
        {
            get { return GPNID; }
            set { GPNID = value; }
        }

        int GPNDetailID = 0;
        public int _GPNDetailID
        {
            get { return GPNDetailID; }
            set { GPNDetailID = value; }
        }

        int Year = 0;
        public int _Year
        {
            get { return Year; }
            set { Year = value; }
        }

        string GPNNo = string.Empty;
        public string _GPNNo
        {
            get { return GPNNo; }
            set { GPNNo = value; }
        }

        string BoxNo = string.Empty;
        public string _BoxNo
        {
            get { return BoxNo; }
            set { BoxNo = value; }
        }

        string ProductCode = string.Empty;
        public string _ProductCode
        {
            get { return ProductCode; }
            set { ProductCode = value; }
        }


        DateTime GPNDate = System.DateTime.Now;
        public DateTime _GPNDate
        {
            get { return GPNDate; }
            set { GPNDate = value; }
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
