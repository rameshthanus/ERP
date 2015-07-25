using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_Approval
    {
       int ID = 0;
       public int _ID
        {
            get { return ID; }

            set { ID = value; }
        }
       DateTime FromDate = System.DateTime.Now;
       public DateTime _FromDate
       {
           get { return FromDate; }
           set { FromDate = value; }
       }
       DateTime ToDate = System.DateTime.Now;
       public DateTime _ToDate
       {
           get { return ToDate; }
           set { ToDate = value; }
       }
        string NO = string.Empty;
        public string _NO
        {
            get { return NO; }

            set { NO = value; }
        }

        string Closing = string.Empty;
        public string _Closing
        {
            get { return Closing; }

            set { Closing = value; }
        }

       

        int ApprovedStatus = 0;
        public int _ApprovedStatus
        {
            get { return ApprovedStatus; }

            set { ApprovedStatus = value; }
        }

        string Remarks = string.Empty;
        public string _Remarks
        {
            get { return Remarks; }

            set { Remarks = value; }
        }
        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }

            set { iMode = value; }
        }
        
    }
}
