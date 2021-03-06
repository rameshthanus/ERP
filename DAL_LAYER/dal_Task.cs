﻿using System;
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

namespace DAL_LAYER
{
    public class dal_Task
    {
        public DataSet dal_TaskDetail(bel_Task obj_bel_Task)
        {

            DataSet ds = new DataSet();
            try
            {

                SqlCommand sqlcmd = new SqlCommand("spu_TaskListSearch");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@TaskListID", obj_bel_Task._TaskListID);
                sqlcmd.Parameters.AddWithValue("@TaskListDetailID", obj_bel_Task._TaskListDetailID);
                sqlcmd.Parameters.AddWithValue("@UserGroupID", obj_bel_Task._UserGroupID);
                sqlcmd.Parameters.AddWithValue("@UserID", obj_bel_Task._UserID);
                sqlcmd.Parameters.AddWithValue("@JobID", Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                sqlcmd.Parameters.AddWithValue("@CompanyID", Convert.ToInt32(HttpContext.Current.Session["CompanyID"]));
                sqlcmd.Parameters.AddWithValue("@BranchID", Convert.ToInt32(HttpContext.Current.Session["BranchID"]));
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Task._iMode);
                sqlcmd.Parameters.AddWithValue("@ScreenName", obj_bel_Task._ScreenName);
                
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
