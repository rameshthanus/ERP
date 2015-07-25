using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_PackingList
    {
       int PackingListID = 0;
       public int _PackingListID
        {
            get { return PackingListID; }
            set { PackingListID = value; }
        }

       int ProductID = 0;
       public int _ProductID
        {
            get { return ProductID; }
            set { ProductID = value; }
        }
       
       int PackingDetailID = 0;
       public int _PackingDetailID
       {
           get { return PackingDetailID; }
           set { PackingDetailID = value; }
       }



       string ProductCode = string.Empty;
       public string _ProductCode
        {
            get { return ProductCode; }
            set { ProductCode = value; }
        }
       string InvoiceNo = string.Empty;
       public string _InvoiceNo
        {
            get { return InvoiceNo; }
            set { InvoiceNo = value; }
        }

       DateTime InvoiceDate = System.DateTime.Now;
       public DateTime _InvoiceDate
        {
            get { return InvoiceDate; }
            set { InvoiceDate = value; }
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

       string BuyerOrderNo = string.Empty;
       public string _BuyerOrderNo
       {
           get { return BuyerOrderNo; }
           set { BuyerOrderNo = value; }
       }
       DateTime BuyerOrderDate = System.DateTime.Now;
       public DateTime _BuyerOrderDate
       {
           get { return BuyerOrderDate; }
           set { BuyerOrderDate = value; }
       }

       string OtherRef = string.Empty;
       public string _OtherRef
       {
           get { return OtherRef; }
           set { OtherRef = value; }
       }

       int OrginCountryID = 0;
       public int _OrginCountryID
       {
           get { return OrginCountryID; }
           set { OrginCountryID = value; }
       }

       int FinalCountryID = 0;
       public int _FinalCountryID
       {
           get { return FinalCountryID; }
           set { FinalCountryID = value; }
       }

       string VesselFlightNo = string.Empty;
       public string _VesselFlightNo
       {
           get { return VesselFlightNo; }
           set { VesselFlightNo = value; }
       }


      
       string PlaceofReceipt = string.Empty;
       public string _PlaceofReceipt
       {
           get { return PlaceofReceipt; }
           set { PlaceofReceipt = value; }
       }

       string vessalFiligtNo1 = string.Empty;
       public string _vessalFiligtNo1
       {
           get { return vessalFiligtNo1; }
           set { vessalFiligtNo1 = value; }
       }

       int PortofLoadingID = 0;
       public int _PortofLoadingID
       {
           get { return PortofLoadingID; }
           set { PortofLoadingID = value; }
       }

       int PortofDestinationID = 0;
       public int _PortofDestinationID
       {
           get { return PortofDestinationID; }
           set { PortofDestinationID = value; }
       }

       string FinalDestination = string.Empty;
       public string _FinalDestination
       {
           get { return FinalDestination; }
           set { FinalDestination = value; }
       }

       int DeliveryTermID = 0;
       public int _DeliveryTermID
       {
           get { return DeliveryTermID; }
           set { DeliveryTermID = value; }
       }

       int PaymentTermID = 0;
       public int _PaymentTermID
       {
           get { return PaymentTermID; }
           set { PaymentTermID = value; }
       }


       string MarkNoContainerNo = string.Empty;
       public string _MarkNoContainerNo
       {
           get { return MarkNoContainerNo; }
           set { MarkNoContainerNo = value; }
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

       string NoKindPkgs = string.Empty;
       public string _NoKindPkgs
       {
           get { return NoKindPkgs; }
           set { NoKindPkgs = value; }
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
       string Status = string.Empty;
       public string _Status
       {
           get { return Status; }
           set { Status = value; }
       }

    }
}
