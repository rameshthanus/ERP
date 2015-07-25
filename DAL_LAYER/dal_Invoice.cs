using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using StepOne_Object;
using BEL_LAYER;

namespace DAL_LAYER
{
    public class dal_Invoice
    {
        public DataSet dal_Invoicedetail(bel_Invoice obj_bel_Invoice)
        {

            DataSet ds = new DataSet();
            try
            {
                SqlCommand sqlcmd = new SqlCommand("spu_InvoicePrint");
                sqlcmd.CommandTimeout = 0;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.Clear();
                sqlcmd.Parameters.AddWithValue("@PID", obj_bel_Invoice._PID);               
                sqlcmd.Parameters.AddWithValue("@iMode", obj_bel_Invoice._iMode);                
                ds = DataFunctions.GetDataSet(sqlcmd);
            }
            catch (Exception ex)
            {


            }
            return ds;

        }
    }
}
