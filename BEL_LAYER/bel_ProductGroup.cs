using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_ProductGroup
    {
        int ProductGroupID = 0;
        public int _ProductGroupID
        {
            get { return ProductGroupID; }

            set { ProductGroupID = value; }
        }

        string screenName = string.Empty;
        public string _screenName
        {
            get { return screenName; }

            set { screenName = value; }
        }
        string ProductGroupCode = string.Empty;
        public string _ProductGroupCode
        {
            get { return ProductGroupCode; }

            set { ProductGroupCode = value; }
        }

        string ProductGroupName = string.Empty;
        public string _ProductGroupName
        {
            get { return ProductGroupName; }

            set { ProductGroupName = value; }
        }

        string ProductGroupStatus = string.Empty;
        public string _ProductGroupStatus
        {
            get { return ProductGroupStatus; }

            set { ProductGroupStatus = value; }
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
