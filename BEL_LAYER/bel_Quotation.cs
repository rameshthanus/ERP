using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Web.SessionState;
using System.Web;


namespace BEL_LAYER
{
   public class bel_Quotation
    {
        DataTable  Item_Dt = null;
        public DataTable _Item_Dt
        {
            get { return HttpContext.Current.Session["Item_dt"] as DataTable; }
            set { Item_Dt = value; }
        }

        DataTable UOM_Dt = null;
        public DataTable _UOM_Dt
        {
            get { return HttpContext.Current.Session["UOM"] as DataTable; }
            set { _UOM_Dt = value; }
        }
  
       int PortofLoadingID = 0;
       public int _PortofLoadingID
        {
            get { return PortofLoadingID; }
            set { PortofLoadingID = value; }
        }

       string Discount = string.Empty;
       public string _Discount
       {
           get { return Discount; }
           set { Discount = value; }
       }
       string QTYWithUOM = string.Empty;
       public string _QTYWithUOM
       {
           get { return QTYWithUOM; }
           set { QTYWithUOM = value; }
       }

       string Commission = string.Empty;
       public string _Commission
       {
           get { return Commission; }
           set { Commission = value; }
       }

       string Certificate = string.Empty;
       public string _Certificate
       {
           get { return Certificate; }
           set { Certificate = value; }
       }

       string Packing = string.Empty;
       public string _Packing
       {
           get { return Packing; }
           set { Packing = value; }
       }

       int TremID = 0;
       public int _TremID
        {
            get { return TremID; }
            set { TremID = value; }
        }

       int BankID = 0;
       public int _BankID
       {
           get { return BankID; }
           set { BankID = value; }
       }
       int CategoryID = 0;
       public int _CategoryID
       {
           get { return CategoryID; }
           set { CategoryID = value; }
       }
      
       string TermStatus = string.Empty;
       public string _TermStatus
       {
           get { return TermStatus; }
           set { TermStatus = value; }
       }
       string Term = string.Empty;
       public string _Term
       {
           get { return Term; }
           set { Term = value; }
       }

       int ProformaID = 0;
       public int _ProformaID
       {
           get { return ProformaID; }
           set { ProformaID=value; }
       }

       int ProformaDetailID = 0;
       public int _ProformaDetailID
       {
           get { return ProformaDetailID; }
           set { ProformaDetailID = value; }
       }

       int Year = 0;
       public int _Year
       {
           get { return Year; }
           set { Year = value; }
       }

       string ProformaNo = string.Empty;
       public string _ProformaNo
       {
           get { return ProformaNo; }
           set { ProformaNo = value; }
       }

       string BuyerRef = string.Empty;
       public string _BuyerRef
       {
           get { return BuyerRef; }
           set { BuyerRef = value; }
       }
       string ProductCode = string.Empty;
       public string _ProductCode
       {
           get { return ProductCode; }
           set { ProductCode = value; }
       }
       

       DateTime ProformaDate = System.DateTime.Now;
       public DateTime _ProformaDate
       {
           get { return ProformaDate; }
           set { ProformaDate=value; }
       }
       int CustomerID = 0;
       public int _CustomerID
       {
           get { return CustomerID; }
           set { CustomerID = value; }
       }
       int JOBID = 0;
       public int _JOBID
       {
           get { return JOBID; }
           set { JOBID = value; }
       }

       string PONo = string.Empty;
       public string _PONo
       {
           get { return PONo; }
           set { PONo = value; }
       }

       DateTime PoDate = System.DateTime.Now;
       public DateTime _PoDate
       {
           get { return PoDate; }
           set { PoDate = value; }
       }

       string Status = string.Empty;
       public string _Status
       {
           get { return Status; }
           set { Status = value; }
       }
       int CurrencyID = 0;
       public int _CurrencyID
       {
           get { return CurrencyID; }
           set { CurrencyID = value; }
       }

       DateTime DeliveryDate = System.DateTime.Now;
       public DateTime _DeliveryDate
       {
           get { return DeliveryDate; }
           set { DeliveryDate = value; }
       }
       int ProductID = 0;
       public int _ProductID
       {
           get { return ProductID; }
           set { ProductID = value; }
       }

       int CountryID = 0;
       public int _CountryID
       {
           get { return CountryID; }
           set { CountryID = value; }
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
       int PriceTermID = 0;
       public int _PriceTermID
       {
           get { return PriceTermID; }
           set { PriceTermID = value; }
       }

       int PortofDestinationID =0;
       public int _PortofDestinationID
       {
           get { return PortofDestinationID; }
           set { PortofDestinationID = value; }
       }
       string DescriptionofGoods = string.Empty;
       public string _DescriptionofGoods
       {
           get { return DescriptionofGoods; }
           set { DescriptionofGoods = value; }
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
