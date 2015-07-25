using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Jobclosing
    {
        int JOBID = 0;
        public int _JOBID
        {
            get { return JOBID; }
            set { JOBID = value; }
        }

        string JOBCode = string.Empty;
        public string _JOBCode
        {
            get { return JOBCode; }
            set { JOBCode = value; }
        }

        string Remarks = string.Empty;
        public string _Remarks
        {
            get { return Remarks; }
            set { Remarks = value; }
        }
     
       

        string CancelReason = string.Empty;
        public string _CancelReason
        {
            get { return CancelReason; }
            set { CancelReason = value; }
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

        int BillNumber = 0;
        public int _BillNumber
        {
            get { return BillNumber; }
            set { BillNumber = value; }
        }

        DateTime ModifiedOn = System.DateTime.Now;
        public DateTime _ModifiedOn
        {
            get { return ModifiedOn; }
            set { ModifiedOn = value; }
        }

        int ModifiedBy = 0;
        public int _ModifiedBy
        {
            get { return ModifiedBy; }
            set { ModifiedBy = value; }
        }

        DateTime BillFromDate = System.DateTime.Now;
        public DateTime _BillFromDate
        {
            get { return BillFromDate; }
            set { BillFromDate = value; }
        }

        DateTime BillToDate = System.DateTime.Now;
        public DateTime _BillToDate
        {
            get { return BillToDate; }
            set { BillToDate = value; }
        }

        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }
        }
    }
}
