using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
    public class bel_Config
    {
        int ConfigID = 0;
        public int _ConfigID
        {
            get { return ConfigID; }
            set { ConfigID = value; }
        }
        int Tolerance = 0;
        public int _Tolerance
        {
            get { return Tolerance; }
            set { Tolerance = value; }
        }


        string EmailID = string.Empty;
        public string _EmailID
        {
            get { return EmailID; }
            set { EmailID = value; }
        }

        string Password = string.Empty;
        public string _Password
        {
            get { return Password; }
            set { Password = value; }
        }

        string SMTPhost = string.Empty;
        public string _SMTPhost
        {
            get { return SMTPhost; }
            set { SMTPhost = value; }
        }

        int SMTPport = 0;
        public int _SMTPport
        {
            get { return SMTPport; }
            set { SMTPport = value; }
        }

        string Subject = string.Empty;
        public string _Subject
        {
            get { return Subject; }
            set { Subject = value; }
        }
     
        string Description = string.Empty;
        public string _Description
        {
            get { return Description; }
            set { Description = value; }
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


        int CreatedBy = 0;
        public int _CreatedBy
        {
            get { return CreatedBy; }
            set { CreatedBy = value; }
        }

        string ScreenName = string.Empty;
        public string _ScreenName
        {
            get { return ScreenName; }
            set { ScreenName = value; }
        }

        DateTime CreatedOn = System.DateTime.Now;
        public DateTime _CreatedOn
        {
            get { return CreatedOn; }
            set { CreatedOn = value; }
        }

       

        DateTime ModifiedOn = System.DateTime.Now;
        public DateTime _ModifiedOn
        {
            get { return ModifiedOn; }
            set { ModifiedOn = value; }
        }

        int ModifiedBy = 0;
        public int _ModifiedBy
        {
            get { return ModifiedBy; }
            set { ModifiedBy = value; }
        }


        string iMode = string.Empty;
        public string _iMode
        {
            get { return iMode; }
            set { iMode = value; }
        }
    }
}
