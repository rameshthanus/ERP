using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_Consumption
    {
       string ProductCode = string.Empty;
       public string _ProductCode
        {
            get { return ProductCode; }
            set { ProductCode = value; }
        }

       int ProformaID = 0;
       public int _ProformaID
        {
            get { return ProformaID; }

            set { ProformaID = value; }
        }

       int ProductID = 0;
       public int _ProductID
       {
           get { return ProductID; }

           set { ProductID = value; }
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

        int ConsumptionDetailID = 0;
        public int _ConsumptionDetailID
        {
            get { return ConsumptionDetailID; }

            set { ConsumptionDetailID = value; }
        }

       

       int ComsumptionID = 0;
       public int _ComsumptionID
        {
            get { return ComsumptionID; }

            set { ComsumptionID = value; }
        }

       string ConsumptionNo = string.Empty;
       public string _ConsumptionNo
       {
           get { return ConsumptionNo; }

           set { ConsumptionNo = value; }
       }

       DateTime ConsumptionDate = System.DateTime.Now;
       public DateTime _ConsumptionDate
       {
           get { return ConsumptionDate; }
           set { ConsumptionDate = value; }
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


       decimal TotalQty = 0;
       public decimal _TotalQty
       {
           get { return TotalQty; }

           set { TotalQty = value; }
       }
       decimal TotalReqmtr = 0;
       public decimal _TotalReqmtr
       {
           get { return TotalReqmtr; }

           set { TotalReqmtr = value; }
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
    }
}
