using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_SubType
    {
        int SubTypeID = 0;
        public int _SubTypeID
        {
            get { return SubTypeID; }

            set { SubTypeID = value; }
        }

        string screenName = string.Empty;
        public string _screenName
        {
            get { return screenName; }

            set { screenName = value; }
        }
        string Subtype = string.Empty;
        public string _SubType
        {
            get { return Subtype; }

            set { Subtype = value; }
        }

        string Description = string.Empty;
        public string _Description
        {
            get { return Description; }

            set { Description = value; }
        }

        string SubTypeStatus = string.Empty;
        public string _SubTypeStatus
        {
            get { return SubTypeStatus; }

            set { SubTypeStatus = value; }
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

        int CompanyID = 0;
        public int _CompanyID
        {
            get { return CompanyID; }

            set { CompanyID = value; }
        }
    }
}
