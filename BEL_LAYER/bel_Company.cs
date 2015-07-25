using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_Company
    {
        int CompanyID = 0;
        public int _CompanyID
        {
            get { return CompanyID; }
            set { CompanyID = value; }
        }

        string CompanyCode = string.Empty;
        public string _CompanyCode
        {
            get { return CompanyCode; }
            set { CompanyCode = value; }
        }
        string Prefix = string.Empty;
        public string _Prefix
        {
            get { return Prefix; }
            set { Prefix = value; }
        }

        string CompanyName = string.Empty;
        public string _CompanyName
        {
            get { return CompanyName; }
            set { CompanyName = value; }
        }

        string Address1 = string.Empty;
        public string _Address1
        {
            get { return Address1; }
            set { Address1 = value; }
        }

        string Address2 = string.Empty;
        public string _Address2
        {
            get { return Address2; }
            set { Address2 = value; }
        }

        string Address3 = string.Empty;
        public string _Address3
        {
            get { return Address3; }
            set { Address3 = value; }
        }

        string City = string.Empty;
        public string _City
        {
            get { return City; }
            set { City = value; }
        }

        string State = string.Empty;
        public string _State
        {
            get { return State; }
            set { State = value; }
        }

        string Country = string.Empty;
        public string _Country
        {
            get { return Country; }
            set { Country = value; }
        }

        string PostalCode = string.Empty;
        public string _PostalCode
        {
            get { return PostalCode; }
            set { PostalCode = value; }
        }

        string PhoneNumber = string.Empty;
        public string _PhoneNumber
        {
            get { return PhoneNumber; }
            set { PhoneNumber = value; }
        }

        string Fax = string.Empty;
        public string _Fax
        {
            get { return Fax; }
            set { Fax = value; }
        }

        string Email = string.Empty;
        public string _Email
        {
            get { return Email; }
            set { Email = value; }
        }

        string PAN = string.Empty;
        public string _PAN
        {
            get { return PAN; }
            set { PAN = value; }
        }
        string CST = string.Empty;
        public string _CST
        {
            get { return CST; }
            set { CST = value; }
        }

        string TIN = string.Empty;
        public string _TIN
        {
            get { return TIN; }
            set { TIN = value; }
        }

        string ContactPerson = string.Empty;
        public string _ContactPerson
        {
            get { return ContactPerson; }
            set { ContactPerson = value; }
        }
        string IECode = string.Empty;
        public string _IECode
        {
            get { return IECode; }
            set { IECode = value; }
        }
        DateTime StartFY = System.DateTime.Now;
        public DateTime _StartFY
        {
            get { return StartFY; }
            set { StartFY = value; }
        }

        int CurrentFY = 0;
        public int _CurrentFY
        {
            get { return CurrentFY; }
            set { CurrentFY = value; }
        }

        int LastFY = 0;
        public int _LastFY
        {
            get { return LastFY; }
            set { LastFY = value; }
        }

        int BankID = 0;
        public int _BankID
        {
            get { return BankID; }
            set { BankID = value; }
        }
        string BankName = string.Empty;
        public string _BankName
        {
            get { return BankName; }
            set { BankName = value; }
        }

        string BranchName = string.Empty;
        public string _BranchName
        {
            get { return BranchName; }
            set { BranchName = value; }
        }
        string AccountNo = string.Empty;
        public string _AccountNo
        {
            get { return AccountNo; }
            set { AccountNo = value; }
        }

        string SwiftCode = string.Empty;
        public string _SwiftCode
        {
            get { return SwiftCode; }
            set { SwiftCode = value; }
        }
        string BankStatus = string.Empty;
        public string _BankStatus
        {
            get { return BankStatus; }
            set { BankStatus = value; }
        }

        string CompanyStatus = string.Empty;
        public string _CompanyStatus
        {
            get { return CompanyStatus; }
            set { CompanyStatus = value; }
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
