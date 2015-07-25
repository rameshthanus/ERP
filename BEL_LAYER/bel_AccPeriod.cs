using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace BEL_LAYER
{
    public class bel_AccPeriod
    {
        int AccountsPeriodID = 0;
        public int _AccountsPeriodID
        {
            get { return AccountsPeriodID; }

            set { AccountsPeriodID = value; }
        }

        int Year = 0;
        public int _Year
        {
            get { return Year; }
            set { Year = value; }
        }
        int Period = 0;
        public int _Period
        {
            get { return Period; }
            set { Period = value; }
        }

        DateTime StartDate = DateTime.Now;
        public DateTime _StartDate
        {
            get { return StartDate; }
            set { StartDate = value; }
        }
        DateTime EndDate = DateTime.Now;
        public DateTime _EndDate
        {
            get { return EndDate; }
            set { EndDate = value; }
        }
        string CloseStatus = string.Empty;
        public string _CloseStatus
        {
            get { return CloseStatus; }

            set { CloseStatus = value; }
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
