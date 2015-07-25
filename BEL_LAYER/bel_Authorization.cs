using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_Authorization
    {
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

        string ScreenName = string.Empty;
        public string _ScreenName
        {
            get { return ScreenName; }
            set { ScreenName = value; }
        }

        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }
        }
    }
}
