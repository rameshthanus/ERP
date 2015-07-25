using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_ShippingAddress
    {
       int ShippingAddressID = 0;
       public int _ShippingAddressID
        {
            get { return ShippingAddressID; }

            set { ShippingAddressID = value; }
        }

        string screenName = string.Empty;
        public string _screenName
        {
            get { return screenName; }

            set { screenName = value; }
        }
        string Code = string.Empty;
        public string _Code
        {
            get { return Code; }

            set { Code = value; }
        }
        int PartyID = 0;
        public int _PartyID
        {
            get { return PartyID; }

            set { PartyID = value; }
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

        string Zipcode = string.Empty;
        public string _Zipcode
        {
            get { return Zipcode; }

            set { Zipcode = value; }
        }

        string Status = string.Empty;
        public string _Status
        {
            get { return Status; }

            set { Status = value; }
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

        int CompanyID = 0;
        public int _CompanyID
        {
            get { return CompanyID; }

            set { CompanyID = value; }
        }
    }
}
