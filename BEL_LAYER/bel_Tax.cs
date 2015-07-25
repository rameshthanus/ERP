using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_Tax
    {
        int TAXID = 0;
        public int _TAXID
        {
            get { return TAXID; }

            set { TAXID = value; }
        }
        string TaxName = string.Empty;
        public string _TaxName
        {
            get { return TaxName; }

            set { TaxName = value; }
        }
        string TAXCode = string.Empty;
        public string _TAXCode
        {
            get { return TAXCode; }

            set { TAXCode = value; }
        }

        decimal TaxValue = 0;
        public decimal _TaxValue
        {
            get { return TaxValue; }

            set { TaxValue = value; }
        }

        string TaxStatus = string.Empty;
        public string _TaxStatus
        {
            get { return TaxStatus; }

            set { TaxStatus = value; }
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
