using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BEL_LAYER
{
   public class bel_UserManagement
    {
       int PriviledgeID = 0;
       public int _PriviledgeID
        {
            get { return PriviledgeID; }
            set { PriviledgeID = value; }
        }

       int UserGroupID = 0;
       public int _UserGroupID
        {
            get { return UserGroupID; }
            set { UserGroupID = value; }
        }
       
       int UserID = 0;
       public int _UserID
        {
            get { return UserID; }
            set { UserID = value; }
        }

       int ModulesGroupID = 0;
       public int _ModulesGroupID
       {
           get { return ModulesGroupID; }
           set { ModulesGroupID = value; }
       }

       int ModulesID = 0;
       public int _ModulesID
       {
           get { return ModulesID; }
           set { ModulesID = value; }
       }

       string SaveRights = string.Empty;
       public string _SaveRights
       {
           get { return SaveRights; }
           set { SaveRights = value; }
       }

       string EditRights = string.Empty;
       public string _EditRights
       {
           get { return EditRights; }
           set { EditRights = value; }
       }


       string DeleteRights = string.Empty;
       public string _DeleteRights
       {
           get { return DeleteRights; }
           set { DeleteRights = value; }
       }

       string ViewRights = string.Empty;
       public string _ViewRights
       {
           get { return ViewRights; }
           set { ViewRights = value; }
       }
       string ViewOnlyRights = string.Empty;
       public string _ViewOnlyRights
       {
           get { return ViewOnlyRights; }
           set { ViewOnlyRights = value; }
       }

       string ReportRights = string.Empty;
       public string _ReportRights
       {
           get { return ReportRights; }
           set { ReportRights = value; }
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
