using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_UOM
    {
        int UOMID = 0;
        public int _UOMID
        {
            get { return UOMID; }

            set { UOMID = value; }
        }

        string screenName = string.Empty;
        public string _screenName
        {
            get { return screenName; }

            set { screenName = value; }
        }
        string UOMCode = string.Empty;
        public string _UOMCode
        {
            get { return UOMCode; }

            set { UOMCode = value; }
        }

        string UOMName = string.Empty;
        public string _UOMName
        {
            get { return UOMName; }

            set { UOMName = value; }
        }

        string UOMStatus = string.Empty;
        public string _UOMStatus
        {
            get { return UOMStatus; }

            set { UOMStatus = value; }
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
