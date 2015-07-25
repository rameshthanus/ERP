using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_ChangePassword
    {
       string LoginPassword = string.Empty;
       public string _LoginPassword
        {
            get { return LoginPassword; }

            set { LoginPassword = value; }
        }
       string NewPassword = string.Empty;
       public string _NewPassword
        {
            get { return NewPassword; }

            set { NewPassword = value; }
        }
       string iMode = string.Empty;
       public string _iMode
       {
           get { return iMode; }

           set { iMode = value; }
       }
    }
}
