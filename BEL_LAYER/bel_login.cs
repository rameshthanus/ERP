using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_login
    {
        string YearName = string.Empty;
        public string _YearName
        {
            get { return YearName; }
            set { YearName = value; }
        }

        string EmailID = string.Empty;
        public string _EmailID
        {
            get { return EmailID; }
            set { EmailID = value; }
        }

        string YearStatus = string.Empty;
        public string _YearStatus
        {
            get { return YearStatus; }
            set { YearStatus = value; }
        }
        string LoginID = string.Empty;
        public string _LoginID
        {
            get { return LoginID; }
            set { LoginID = value; }
        }

        string LoginPassword = string.Empty;
        public string _LoginPassword
        {
            get { return LoginPassword; }
            set { LoginPassword = value; }
        }
        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }
        }

        int BranchID = 0;
        public int _BranchID
        {
            get { return BranchID; }
            set { BranchID = value; }
        }
        int UserID = 0;
        public int _UserID
        {
            get { return UserID; }
            set { UserID = value; }
        }
        int CompanyID = 0;
        public int _CompanyID
        {
            get { return CompanyID; }
            set { CompanyID = value; }
        }

        int PassordCompanyID = 0;
        public int _PassordCompanyID
        {
            get { return PassordCompanyID; }
            set { PassordCompanyID = value; }
        }

        int UserGroupID = 0;
        public int _UserGroupID
        {
            get { return UserGroupID; }
            set { UserGroupID = value; }
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
    }
}
