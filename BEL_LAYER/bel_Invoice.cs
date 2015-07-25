using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Invoice
    {
        int PID = 0;
        public int _PID
        {
            get { return PID; }
            set { PID = value; }
        }

        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }
        }
        
    }
}
