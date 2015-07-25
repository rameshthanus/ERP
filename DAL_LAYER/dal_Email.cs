using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using StepOne_Object;
using BEL_LAYER;
using System.Web.SessionState;
using System.Web;
using System.Net.Mail;
using System.Net;

namespace DAL_LAYER
{
   public class dal_Email
    {
       public Boolean SendingEmail(bel_Email obj_bel_Email)
       {
           try
           {
               MailMessage mMailMessage = new MailMessage();

               mMailMessage.From = new MailAddress(obj_bel_Email.FromAddress);
               mMailMessage.To.Add(new MailAddress(obj_bel_Email.ToAddress.Trim()));
               mMailMessage.Body = obj_bel_Email.BodyContent;

               for (int i = 0; i < obj_bel_Email.Attachment.Count; i++)
                   mMailMessage.Attachments.Add(new Attachment(obj_bel_Email.Attachment[i].ToString()));


               mMailMessage.Subject = obj_bel_Email.Subject;
               mMailMessage.IsBodyHtml = true;
               mMailMessage.BodyEncoding = System.Text.Encoding.UTF8;
               mMailMessage.Priority = MailPriority.High;

               SmtpClient mSmtpClient = new SmtpClient(obj_bel_Email.SMTPHost, obj_bel_Email.SMTPPort);
              mSmtpClient.UseDefaultCredentials = false;
              // mSmtpClient.UseDefaultCredentials = true;
               mSmtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
               mSmtpClient.Credentials = new NetworkCredential(obj_bel_Email.SMTPUserName, obj_bel_Email.SMTPPassword);
               mSmtpClient.EnableSsl = true;
               mSmtpClient.Send(mMailMessage);
           }
           catch (Exception ex)
           {
               return false;
           }
           return true;
       }

       
    }
}
