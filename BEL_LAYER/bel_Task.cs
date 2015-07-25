using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Task
    {
        int TaskListID = 0;
        public int _TaskListID
        {
            get { return TaskListID; }

            set { TaskListID = value; }
        }

        int TaskListDetailID = 0;
        public int _TaskListDetailID
        {
            get { return TaskListDetailID; }

            set { TaskListDetailID = value; }
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

        int JobID = 0;
        public int _JobID
        {
            get { return JobID; }

            set { JobID = value; }
        }

        int CompanyID = 0;
        public int _CompanyID
        {
            get { return CompanyID; }

            set { CompanyID = value; }
        }

        int BranchID = 0;
        public int _BranchID
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

        string ScreenName = string.Empty;
        public string _ScreenName
        {
            get { return ScreenName; }
            set { ScreenName = value; }
        }
    }
}
