﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace Trident.Transaction
{
    public partial class Quotation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateFolder();

        }
        protected void CreateFolder()
        {
            try
            {


                string Serverpath = System.Configuration.ConfigurationManager.AppSettings["FolderPath"];
                string sDirPath = Server.MapPath("/" + Serverpath + "/");
                DirectoryInfo ObjSearchDir = new DirectoryInfo(sDirPath);

                if (!ObjSearchDir.Exists)
                {
                    ObjSearchDir.Create();
                    //Random number folder for file uploading

                    hdnUploadFilePath.Value = sDirPath;
                }
                else
                {
                    hdnUploadFilePath.Value = sDirPath;
                    // hdnFileFolder.Value = "0";
                }

            }
            catch (Exception mEx)
            {

            }
        }
    }
}