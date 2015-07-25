using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_UserCreation
    {
        
      

        string UserName = string.Empty;
        public string _UserName
        {
            get { return UserName; }
            set { UserName = value; }
        }

        string Password = string.Empty;
        public string _Password
        {
            get { return Password; }

            set { Password = value; }
        }

        int UserID = 0;
        public int _UserID
        {
            get { return UserID; }
            set { UserID = value; }
        }

      

        int UserGroupID = 0;
        public int _UserGroupID
        {
            get { return UserGroupID; }
            set { UserGroupID = value; }
        }

       

        string Email = string.Empty;
        public string _Email
        {
            get { return Email; }
            set { Email = value; }
        }


        string UserStatus = string.Empty;
        public string _UserStatus
        {
            get { return UserStatus; }
            set { UserStatus = value; }
        }

        string AdminStatus = string.Empty;
        public string _AdminStatus
        {
            get { return AdminStatus; }
            set { AdminStatus = value; }
        }

        string SuperAdminStatus = string.Empty;
        public string _SuperAdminStatus
        {
            get { return SuperAdminStatus; }
            set { SuperAdminStatus = value; }
        }
        
        string ScreenName = string.Empty;
        public string _ScreenName
        {
            get { return ScreenName; }
            set { ScreenName = value; }
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
