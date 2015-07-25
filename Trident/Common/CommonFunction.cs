using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_LAYER;
using DAL_LAYER;
using Trident.Common;
using System.Data;
using System.IO;
using System.Net;

namespace Trident.Common
{
    public class CommonFunction
    {
        bel_Authorization obj_bel_Autho = new bel_Authorization();
        dal_Authorization obj_dal_Autho = new dal_Authorization();
        public void functionCheckActhorization(string ScreenName, string iMode)
        {
            try
            {

                obj_bel_Autho._iMode = iMode;
                obj_bel_Autho._ScreenName = ScreenName;
                using (DataSet ds = obj_dal_Autho.dal_Authorizationdetail(obj_bel_Autho))
                {


                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Common.CommonVariablesandmsg.ViewOnlyRights = Convert.ToString(ds.Tables[0].Rows[0]["ViewonlyRights"].ToString());
                            Common.CommonVariablesandmsg.SaveRigts = Convert.ToString(ds.Tables[0].Rows[0]["SaveRights"].ToString());
                            Common.CommonVariablesandmsg.EditRigts = Convert.ToString(ds.Tables[0].Rows[0]["EditRights"].ToString());
                            Common.CommonVariablesandmsg.DeleteRigts = Convert.ToString(ds.Tables[0].Rows[0]["DeleteRights"].ToString());
                            Common.CommonVariablesandmsg.ViewRights = Convert.ToString(ds.Tables[0].Rows[0]["ViewRights"].ToString());
                            Common.CommonVariablesandmsg.ReportRights = Convert.ToString(ds.Tables[0].Rows[0]["ReportRights"].ToString());

                        }
                        else
                        {
                            Common.CommonVariablesandmsg.ViewOnlyRights = "N";
                            Common.CommonVariablesandmsg.SaveRigts = "N";
                            Common.CommonVariablesandmsg.EditRigts = "N";
                            Common.CommonVariablesandmsg.DeleteRigts = "N";
                            Common.CommonVariablesandmsg.ViewRights = "N";
                            Common.CommonVariablesandmsg.ReportRights = "N";

                        }
                    }
                    else
                    {
                        Common.CommonVariablesandmsg.SaveRigts = "N";
                        Common.CommonVariablesandmsg.EditRigts = "N";
                        Common.CommonVariablesandmsg.DeleteRigts = "N";
                        Common.CommonVariablesandmsg.ViewRights = "N";
                        Common.CommonVariablesandmsg.ReportRights = "N";
                    }
                }


            }
            catch (Exception exe)
            {

            }

        }

        public void LogFile(string sExceptionName, string sEventName, int nErrorLineNo, string sFormName)
        {
            bel_ErrorLog obj_Error = new bel_ErrorLog();
            dal_Errorlog obj_dal_error = new dal_Errorlog();
            try
            {
                obj_Error._ErrorlogDate = System.DateTime.Now;
                obj_Error._ErrorMessage = sExceptionName;
                obj_Error._FunctionName = sEventName;
                obj_Error._ErrorLIne = nErrorLineNo;
                obj_Error._PageName = sFormName;
                obj_Error._iMode = "Insert";
                using (DataSet ds = obj_dal_error.dal_ErrorLogDetail(obj_Error))
                {

                }
            }
            catch (Exception exe)
            {
                // LogFile(exe.Message, "Common:LogFile", Convert.ToInt32(exe.StackTrace.Substring(exe.StackTrace.LastIndexOf(":line") + 5)), this.Page.ToString());
            }

            //// HttpContext CurrentHTTPcontext = HttpContext.Current;
            //StreamWriter log;
            //string path = string.Empty;
            //path = HttpContext.Current.Server.MapPath("~/Barcode INI/logfile.txt");
            //if (!File.Exists(path))
            //{

            //    log = new StreamWriter(path);

            //}
            //   // Common.CommonVariablesandmsg.UserName

            //else
            //{

            //    log = File.AppendText(path);

            //}

            //// Write to the file:

            //log.WriteLine("Data Time:" + DateTime.Now);

            //log.WriteLine("Exception Name:" + sExceptionName);

            //log.WriteLine("Event Name:" + sEventName);



            //log.WriteLine("Error Line No.:" + nErrorLineNo);

            //log.WriteLine("Form Name:" + sFormName);

            //// Close the stream:

            //log.Close();

        }

        public void LoginHistory(string Status)
        {
            bel_LoginHistory obj_bel_Login = new bel_LoginHistory();
            dal_LoginHistory obj_dal_Login = new dal_LoginHistory();
            try
            {
                obj_bel_Login._LoginHistoryDate = System.DateTime.Now;                
                obj_bel_Login._Status = Status;
                obj_bel_Login._iMode = "Insert";
                using (DataSet ds = obj_dal_Login.dal_LoginHistoryDetail(obj_bel_Login))
                {

                }
            }
            catch (Exception exe)
            {
                LogFile(exe.Message, "Common:LoginHistory", Convert.ToInt32(exe.StackTrace.Substring(exe.StackTrace.LastIndexOf(":line") + 5)), "Common/CommonFunction");
            }



        }
    }
}