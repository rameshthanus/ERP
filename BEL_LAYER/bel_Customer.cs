using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Customer
    {
        int PartyID = 0;
        public int _PartyID
        {
            get { return PartyID; }
            set { PartyID = value; }
        }

        string PartyCode = string.Empty;
        public string _PartyCode
        {
            get { return PartyCode; }
            set { PartyCode = value; }
        }

        string PartyName = string.Empty;
        public string _PartyName
        {
            get { return PartyName; }
            set { PartyName = value; }
        }

        string Type = string.Empty;
        public string _Type
        {
            get { return Type; }

            set { Type = value; }
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

        int CountryID = 0;
        public int _CountryID
        {
            get { return CountryID; }
            set { CountryID = value; }
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

        string CustomerStatus = string.Empty;
        public string _CustomerStatus
        {
            get { return CustomerStatus; }
            set { CustomerStatus = value; }
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
