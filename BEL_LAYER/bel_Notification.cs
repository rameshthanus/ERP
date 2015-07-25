using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Notification
    {
        string NotificationType = string.Empty;
        public string _Notification
        {
            get { return NotificationType; }
            set { NotificationType = value; }
        }
        string Type = string.Empty;
        public string _Type
        {
            get { return Type; }
            set { Type = value; }
        }
        int NotificationDetailID = 0;
        public int _NotificationDetailID
        {
            get { return NotificationDetailID; }
            set { NotificationDetailID = value; }
        }
        int NotificationID = 0;
        public int _NotificationID
        {
            get { return NotificationID; }
            set { NotificationID = value; }
        }

        DateTime NoticationDate = System.DateTime.Now;
        public DateTime _NotificationDate
        {
            get { return NoticationDate; }
            set { NoticationDate = value; }
        }
        string shrt_description = string.Empty;
        public string _shrtdescription
        {
            get { return shrt_description; }
            set { shrt_description = value; }
        }
        string description = string.Empty;
        public string _description
        {
            get { return description; }
            set { description = value; }
        }
        string  UsergroupID = string.Empty;
        public string _UsergroupID
        {
            get { return UsergroupID; }
            set { UsergroupID = value; }
        }
        string UserID = string.Empty;
        public string _UserID
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

        int BranchID = 0;
        public int _BranchID
        {
            get { return BranchID; }
            set { BranchID = value; }
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
