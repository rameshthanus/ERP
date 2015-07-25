using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Category
    {
        int CategoryID = 0;
        public int _CategoryID
        {
            get { return CategoryID; }

            set { CategoryID = value; }
        }
        string screenName = string.Empty;
        public string _screenName
        {
            get { return screenName; }

            set { screenName = value; }
        }
        string PrefixC = string.Empty;
        public string _PrefixC
        {
            get { return PrefixC; }

            set { PrefixC = value; }
        }
        string CategoryCode = string.Empty;
        public string _CategoryCode
        {
            get { return CategoryCode; }

            set { CategoryCode = value; }
        }

        string CategoryName = string.Empty;
        public string _CategoryName
        {
            get { return CategoryName; }

            set { CategoryName = value; }
        }

        string CategoryStatus = string.Empty;
        public string _CategoryStatus
        {
            get { return CategoryStatus; }

            set { CategoryStatus = value; }
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
