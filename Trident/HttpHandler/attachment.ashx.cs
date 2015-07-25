using System;
using System.Web;
using System.IO;

namespace Trident.HttpHandler
{
    /// <summary>
    /// Summary description for attachment
    /// </summary>
    public class attachment : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                if (context.Request.QueryString["path"] != null && context.Request.QueryString["file"] != null)
                {
                    //for deleting existing File by file name
                    string Serverpath = context.Request.QueryString["path"].ToString();
                    string filename = context.Request.QueryString["file"].ToString();
                    Serverpath = Serverpath + "\\" + filename;

                    if (File.Exists(Serverpath))
                    {
                        File.Delete(Serverpath);
                    }
                }
                else if (context.Request.QueryString["filepath"] != null && context.Request.QueryString["file"] != null)
                {
                    //for downloading existing File
                    string filepath = context.Request.QueryString["filepath"].ToString();
                    string file = context.Request.QueryString["file"].ToString();

                    if (File.Exists(filepath + "\\" + file))
                    {
                        context.Response.Clear();
                        context.Response.ContentType = "application/octet-stream";
                        context.Response.AddHeader("Content-Disposition", string.Format("attachment; filename=\"{0}\"", file));
                        context.Response.WriteFile(filepath + "\\" + file);
                        context.Response.Flush();
                    }

                }
                else
                {
                    HttpPostedFile postedFile = context.Request.Files["Filedata"];

                    string savepath = "";
                    string tempPath = "";
                    tempPath = System.Configuration.ConfigurationManager.AppSettings["FolderPath"];
                   
                    string filename = postedFile.FileName;
                    string[] filenamea = new string[2];
                    filenamea = filename.Split('.');
                    string filenamed;
                    DateTime filename_ = DateTime.Now;
                    filenamed = filename_.ToString("ddMMyyyyhhmmss");
                    filenamed = filenamed + '-' + filenamea[0] + "." + filenamea[1];
                    
                    savepath = context.Server.MapPath("/" + tempPath + "/");

                    if (!Directory.Exists(savepath))
                        Directory.CreateDirectory(savepath);

                    postedFile.SaveAs(savepath + @"\" + filenamed);
                    context.Response.Write(tempPath + "/" + filenamed);
                }
                //  context.Response.StatusCode = 200;
            }
            catch (Exception ex)
            {
                context.Response.Write("Error: " + ex.Message);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}