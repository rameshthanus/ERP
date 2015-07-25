using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Warehouse
    {
        int WarehouseID = 0;
        public int _WarehouseID
        {
            get { return WarehouseID; }

            set { WarehouseID = value; }
        }

        string screenName = string.Empty;
        public string _screenName
        {
            get { return screenName; }

            set { screenName = value; }
        }
        string WarehouseCode = string.Empty;
        public string _WarehouseCode
        {
            get { return WarehouseCode; }

            set { WarehouseCode = value; }
        }

        string WarehouseName = string.Empty;
        public string _WarehouseName
        {
            get { return WarehouseName; }

            set { WarehouseName = value; }
        }
        string WarehouseBranch = string.Empty;
        public string _WarehouseBranch
        {
            get { return WarehouseBranch; }

            set { WarehouseBranch = value; }
        }
        string WarehouseStatus = string.Empty;
        public string _WarehouseStatus
        {
            get { return WarehouseStatus; }

            set { WarehouseStatus = value; }
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

        string UtilizeWarehouse = string.Empty;
        public string _UtilizeWarehouse
        {
            get { return UtilizeWarehouse; }
            set { UtilizeWarehouse = value; }
        }
    }
}
