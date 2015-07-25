using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace BEL_LAYER
{
  public class bel_Email
    {
        string _CustomerName = "";
        public string CustomerName
        {
            get { return _CustomerName; }
            set { _CustomerName = value; }
        }

        string _Password = "";
        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }

        string _FromAddress = "";
        public string FromAddress
        {
            get { return _FromAddress; }
            set { _FromAddress = value; }
        }

        string _ToAddress = "";
        public string ToAddress
        {
            get { return _ToAddress; }
            set { _ToAddress = value; }
        }

        string _BCCAddress = "";
        public string BCCAddress
        {
            get { return _BCCAddress; }
            set { _BCCAddress = value; }
        }

        string _CCAddress = "";
        public string CCAddress
        {
            get { return _CCAddress; }
            set { _CCAddress = value; }
        }

        ArrayList _Attachment = new ArrayList();
        public ArrayList Attachment
        {
            get { return _Attachment; }
            set { _Attachment = value; }
        }

        string _Subject = "";
        public string Subject
        {
            get { return _Subject; }
            set { _Subject = value; }
        }

        string _BodyContent = "";
        public string BodyContent
        {
            get { return _BodyContent; }
            set { _BodyContent = value; }
        }

        //string _SMTPHost =  ConfigurationSettings.AppSettings["SMTPHost"].ToString();

        string _SMTPHost = string.Empty;
        public string SMTPHost
        {
            get { return _SMTPHost; }
            set { _SMTPHost = value; }
        }

        //Int32 _SMTPPort =Convert.ToInt32(ConfigurationSettings.AppSettings["SMTPPort"].ToString());

        Int32 _SMTPPort = 0;
        public Int32 SMTPPort
        {
            get { return _SMTPPort; }
            set { _SMTPPort = value; }
        }

        string _SMTPUserName = string.Empty;
        //ConfigurationSettings.AppSettings["SMTPUserName"].ToString();
        //string _SMTPUserName = string.Empty;
        public string SMTPUserName
        {
            get { return _SMTPUserName; }
            set { _SMTPUserName = value; }
        }

        string _SMTPPassword = string.Empty;
        //ConfigurationSettings.AppSettings["SMTPPassword"].ToString();
        //string _SMTPPassword = string.Empty;
        public string SMTPPassword
        {
            get { return _SMTPPassword; }
            set { _SMTPPassword = value; }
        }
    }
}
