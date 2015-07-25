using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_LoginHistory
    {
        int LoginistoryID = 0;
        public int _LoginistoryID
        {
            get { return LoginistoryID; }
            set { LoginistoryID = value; }
        }

        DateTime LoginHistoryDate = System.DateTime.Now;
        public DateTime _LoginHistoryDate
        {
            get { return LoginHistoryDate; }
            set { LoginHistoryDate = value; }
        }

        int UserGroupID = 0;
        public int _UserGroupID
        {
            get { return UserGroupID; }
            set { UserGroupID = value; }
        }

        int UserID = 0;
        public int _UserID
        {
            get { return UserID; }
            set { UserID = value; }
        }
        string Status = string.Empty;
        public string _Status
        {
            get { return Status; }
            set { Status = value; }
        }

        string BranchID = string.Empty;
        public string _BranchID
        {
            get { return BranchID; }
            set { BranchID = value; }
        }

        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }
        }
    }
}
