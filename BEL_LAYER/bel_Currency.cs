using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Currency
    {

        int CurrencyID = 0;
        public int _CurrencyID
        {
            get { return CurrencyID; }

            set { CurrencyID = value; }
        }

        string screenName = string.Empty;
        public string _screenName
        {
            get { return screenName; }

            set { screenName = value; }
        }
        string CurrencyCode = string.Empty;
        public string _CurrencyCode
        {
            get { return CurrencyCode; }

            set { CurrencyCode = value; }
        }

        string CurrencyName = string.Empty;
        public string _CurrencyName
        {
            get { return CurrencyName; }

            set { CurrencyName = value; }
        }
        string Currency = string.Empty;
        public string _Currency
        {
            get { return Currency; }

            set { Currency = value; }
        }
        string CentsName = string.Empty;
        public string _CentsName
        {
            get { return CentsName; }

            set { CentsName = value; }
        }

        decimal ExRate = 0;
        public decimal _ExRate
        {
            get { return ExRate; }
            set { ExRate = value; }
        }
        string CurrencyStatus = string.Empty;
        public string _CurrencyStatus
        {
            get { return CurrencyStatus; }

            set { CurrencyStatus = value; }
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
