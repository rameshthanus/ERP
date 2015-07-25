using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_ErrorLog
    {
        DateTime FromDate = System.DateTime.Now;
        public DateTime _FromDate
        {
            get { return FromDate; }
            set { FromDate = value; }
        }
        DateTime ErrorlogDate = System.DateTime.Now;
        public DateTime _ErrorlogDate
        {
            get { return ErrorlogDate; }
            set { ErrorlogDate = value; }
        }
        DateTime ToDate = System.DateTime.Now;
        public DateTime _ToDate
        {
            get { return ToDate; }
            set { ToDate = value; }
        }


        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }


        }
        string ErrorMessage = string.Empty;
        public string _ErrorMessage
        {
            get { return ErrorMessage; }
            set { ErrorMessage = value; }


        }


        string FunctionName = string.Empty;
        public string _FunctionName
        {
            get { return FunctionName; }
            set { FunctionName = value; }


        }

        int ErrorLIne = 0;
        public int _ErrorLIne
        {
            get { return ErrorLIne; }
            set { ErrorLIne = value; }
        }

        string PageName = string.Empty;
        public string _PageName
        {
            get { return PageName; }
            set { PageName = value; }

        }
        int CreatedBy = 0;
        public int _CreatedBy
        {
            get { return CreatedBy; }
            set { CreatedBy = value; }
        }
    }
}
