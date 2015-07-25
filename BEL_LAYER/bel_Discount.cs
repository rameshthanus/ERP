using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_Discount
    {
       int DiscountID = 0;
       public int _DiscountID
        {
            get { return DiscountID; }

            set { DiscountID = value; }
        }
       string DiscountCode = string.Empty;
       public string _DiscountCode
        {
            get { return DiscountCode; }

            set { DiscountCode = value; }
        }
       string DiscountName = string.Empty;
       public string _DiscountName
        {
            get { return DiscountName; }

            set { DiscountName = value; }
        }

       decimal DiscountValue = 0;
       public decimal _DiscountValue
        {
            get { return DiscountValue; }

            set { DiscountValue = value; }
        }

       string DiscountStatus = string.Empty;
       public string _DiscountStatus
        {
            get { return DiscountStatus; }

            set { DiscountStatus = value; }
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
        string screenName = string.Empty;
        public string _screenName
        {
            get { return screenName; }

            set { screenName = value; }
        }
    }
}
