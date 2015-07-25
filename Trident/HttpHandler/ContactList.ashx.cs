using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using MSDataAccess;
using Trident.classes;

namespace Trident.HttpHandler
{
    /// <summary>
    /// Summary description for ContactList
    /// </summary>
    public class ContactList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataSet ds = new DataSet();
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            object[] ob = new object[41];

            ob[0] = Convert.ToInt32((context.Request["PartyID"] == "" ? "0" : context.Request["PartyID"]));
            ob[1] =(context.Request["PartyCode"] == null ? "" : context.Request["PartyCode"]); 
            ob[2] = context.Request["PartyName"];
            ob[3] = context.Request["LastName"];
            ob[4] = context.Request["PrimaryEmail"];
            ob[5] = context.Request["OfficePhone"];
            ob[6] = context.Request["MobilePhone"];
            ob[7] = context.Request["HomePhone"];            
            ob[8] = Convert.ToDateTime(((context.Request["DateOfBirth"] == null ||context.Request["DateOfBirth"] == "") ? "1990/1/1" : context.Request["DateOfBirth"]));
            ob[9] = context.Request["Fax"];
            ob[10] =  Convert.ToInt32((context.Request["OrganizationID"] == "" ? "0" : context.Request["OrganizationID"]));
            ob[11] = context.Request["Title"];
            ob[12] = context.Request["Department"];
            ob[13] = context.Request["Reference"];
            ob[14] =  Convert.ToInt32((context.Request["ReportsTo"] == "" ? "0" : context.Request["ReportsTo"]));
            ob[15] =  Convert.ToInt32((context.Request["LeadSourceID"] == "" ? "0" : context.Request["LeadSourceID"]));
            ob[16] =  Convert.ToInt32((context.Request["AssignedTo"] == "" ? "0" : context.Request["AssignedTo"]));
            ob[17] = context.Request["DoNotCall"];
            ob[18] = context.Request["NotifyOwner"];
            ob[19] = context.Request["EmailOptOut"];
            ob[20] = context.Request["PrimaryTwitter"];
            ob[21] = context.Request["PortalUser"];
            ob[22] = Convert.ToDateTime(((context.Request["SupportStartDate"] == null ||context.Request["SupportStartDate"] == "") ? "1990/1/1" : context.Request["SupportStartDate"]));
            ob[23] = Convert.ToDateTime(((context.Request["SupportEndDate"] == null ||context.Request["SupportEndDate"] == "" )? "1990/1/1" : context.Request["SupportEndDate"]));
            ob[24] = context.Request["Address1"];
            ob[25] = context.Request["Address2"];
            ob[26] = context.Request["City"];
            ob[27] = context.Request["State"];
            ob[28] = context.Request["Zipcode"];
            ob[29] = context.Request["Country"];           
            ob[30] = context.Request["Description"];
            ob[31] = context.Request["ImagePath"];
            ob[32] = Convert.ToInt32((context.Request["CreatedBy"] == "" ? "0" : context.Request["CreatedBy"]));
            ob[33] = Convert.ToDateTime(((context.Request["CreatedOn"] == null ||context.Request["CreatedOn"] == "") ? "1990/1/1" : context.Request["CreatedOn"]));
            ob[34] = Convert.ToInt32((context.Request["ModifiedBy"] == "" ? "0" : context.Request["ModifiedBy"]));
            ob[35] = Convert.ToDateTime(((context.Request["ModifiedOn"] == null || context.Request["ModifiedOn"] == "") ? "1990/1/1" : context.Request["ModifiedOn"]));
            ob[36] = Convert.ToInt32((context.Request["CompanyID"] == "" ? "0" : context.Request["CompanyID"]));
            ob[37] = Convert.ToInt32((context.Request["BranchID"] == "" ? "0" : context.Request["BranchID"]));
            ob[38] = context.Request["imode"];
            ob[39] = context.Request["CustomerStatus"];
            ob[40] = context.Request["CustomerType"];

            ds = MSDataAccess.DataAccess.ExecuteDataset(Json.get_connectionstring(), "[spu_Contacts]", ob);
            if (ds.Tables.Count > 0)
            {
                DataTable dt = new DataTable();
                for (int i = 0; i < ds.Tables.Count; i++)
                {
                    dt.Merge(ds.Tables[i]);
                }
                context.Response.Write(Json.GetJson(dt));
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