using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_Product
    {
       string ReedPick = string.Empty;
       public string _ReedPick
        {
            get { return ReedPick; }
            set { ReedPick = value; }
        }

       string WarpWeft = string.Empty;
       public string _WarpWeft
        {
            get { return WarpWeft; }
            set { WarpWeft = value; }
        }

       int CurrencyID = 0;
       public int _CurrencyID
        {
            get { return CurrencyID; }
            set { CurrencyID = value; }
        }
       int ProductDetailID = 0;
       public int _ProductDetailID
        {
            get { return ProductDetailID; }
            set { ProductDetailID = value; }
        }

       int CombinedProductID = 0;
       public int _CombinedProductID
       {
           get { return CombinedProductID; }
           set { CombinedProductID = value; }
       }

       int Quantity = 0;
       public int _Quantity
       {
           get { return Quantity; }
           set { Quantity = value; }
       }

       string CombinedProduct = string.Empty;
       public string _CombinedProduct
       {
           get { return CombinedProduct; }
           set { CombinedProduct = value; }
       }
       int ProductID = 0;
       public int _ProductID
       {
           get { return ProductID; }
           set { ProductID=value; }
       }

       int ProductGroupID = 0;
       public int _ProductGroupID
       {
           get { return ProductGroupID; }
           set { ProductGroupID = value; }
       }
       int DesignID = 0;
       public int _DesignID
       {
           get { return DesignID; }
           set { DesignID = value; }
       }

       int ColorID = 0;
       public int _ColorID
       {
           get { return ColorID; }
           set { ColorID = value; }
       }


       int SizeID = 0;
       public int _SizeID
       {
           get { return SizeID; }
           set { SizeID = value; }
       }

       int CategoryID = 0;
       public int _CategoryID
       {
           get { return CategoryID; }
           set { CategoryID = value; }
       }

       int QualityID = 0;
       public int _QualityID
       {
           get { return QualityID; }
           set { QualityID = value; }
       }

       string Description = string.Empty;
       public string _Description
       {
           get { return Description; }
           set { Description = value; }
       }

       int UOMID = 0;
       public int _UOMID
       {
           get { return UOMID; }
           set { UOMID = value; }
       }

       decimal BuyPrice = 0;
       public decimal _BuyPrice
       {
           get { return BuyPrice; }
           set { BuyPrice = value; }
       }

       decimal SalePrice = 0;
       public decimal _SalePrice
       {
           get { return SalePrice; }
           set { SalePrice = value; }
       }

       string SKU = string.Empty;
       public string _SKU
       {
           get { return SKU; }
           set { SKU = value; }
       }
       string ProductCode = string.Empty;
       public string _ProductCode
       {
           get { return ProductCode; }
           set { ProductCode = value; }
       }
       string ProductStatus = string.Empty;
       public string _ProductStatus
       {
           get { return ProductStatus; }
           set { ProductStatus = value; }
       }
       string InventoryType = string.Empty;
       public string _InventoryType
       {
           get { return InventoryType; }
           set { InventoryType = value; }
       }

       string ARNO = string.Empty;
       public string _ARNO
       {
           get { return ARNO; }
           set { ARNO = value; }
       }


       string APNO = string.Empty;
       public string _APNO
       {
           get { return APNO; }
           set { APNO = value; }
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

       string ScreenName = string.Empty;
       public string _ScreenName
       {
           get { return ScreenName; }
           set { ScreenName = value; }
       }
    }
}
