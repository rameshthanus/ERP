using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Net.Mail;
using System.Net;
using System.Configuration;

namespace Trident.CRM
{
    /// <summary>
    /// Summary description for MailWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class MailWebService : System.Web.Services.WebService
    {

        [WebMethod(EnableSession=true)]
        public bool SendUserMail(string toMailId, string subject, string message, string attachment,string cc,string bcc)
        {
            MailMessage mailMessage = new MailMessage();
            string mailid = ConfigurationManager.AppSettings["mailid"];
            string mailname = ConfigurationManager.AppSettings["mailname"];
            mailMessage.From = new MailAddress(mailid, mailname);
            mailMessage.To.Add(toMailId);
            if (cc != string.Empty)
            {
                mailMessage.CC.Add(cc);
            }
            if (bcc != string.Empty)
            {
                mailMessage.Bcc.Add(bcc);
            }
            mailMessage.Subject = subject;            
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = message;          
            System.Net.Mail.Attachment attachment_;
            if (attachment.Length > 0)
            {
                string[] path_ = attachment.Split(',');
                for (int i = 0; i < path_.Length; i++)
                {
                    attachment_ = new System.Net.Mail.Attachment(path_[i]);
                    mailMessage.Attachments.Add(attachment_);
                }             
            }                        
            SmtpClient mailbox = new SmtpClient()
            {
                DeliveryMethod =SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                EnableSsl = true,
                Host = ConfigurationManager.AppSettings["SMTPHost"],
                Port = Convert.ToInt32(ConfigurationManager.AppSettings["SMTPPort"]),
                Credentials = new NetworkCredential(mailid, ConfigurationManager.AppSettings["mailpass"])                                
            }; 
            mailbox.Send(mailMessage);
            return true;
        }
    }
}
