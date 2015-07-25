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

namespace DAL_LAYER
{
   public class dal_StockResult
    {
       public DataSet dal_StockCreate(bel_StockResult obj_bel_Stock)
       {
           DataSet ds = new DataSet();
           try
           {
               SqlCommand sqlcmd = new SqlCommand(obj_bel_Stock._StoreProceture);
               sqlcmd.CommandTimeout = 0;
               sqlcmd.CommandType = CommandType.StoredProcedure;
               sqlcmd.Parameters.Clear();
               sqlcmd.Parameters.AddWithValue("@JOBCode", obj_bel_Stock._JOBCode);
               sqlcmd.Parameters.AddWithValue("@ProductCode", obj_bel_Stock._ProductCode);
               sqlcmd.Parameters.AddWithValue("@OrderQty", obj_bel_Stock._OrderQty);
               sqlcmd.Parameters.AddWithValue("@TotalReceipt", obj_bel_Stock._TotalReceipt);
               sqlcmd.Parameters.AddWithValue("@WareHouse1", obj_bel_Stock._WareHouse1);
               sqlcmd.Parameters.AddWithValue("@WareHouse2", obj_bel_Stock._WareHouse2);
               sqlcmd.Parameters.AddWithValue("@WareHouse3", obj_bel_Stock._WareHouse3);
               sqlcmd.Parameters.AddWithValue("@WareHouse4", obj_bel_Stock._WareHouse4);
               sqlcmd.Parameters.AddWithValue("@WareHouse5", obj_bel_Stock._WareHouse5);
               sqlcmd.Parameters.AddWithValue("@WareHouse6", obj_bel_Stock._WareHouse6);
               sqlcmd.Parameters.AddWithValue("@WareHouse7", obj_bel_Stock._WareHouse7);
               sqlcmd.Parameters.AddWithValue("@WareHouse8", obj_bel_Stock._WareHouse8);
               sqlcmd.Parameters.AddWithValue("@WareHouse9", obj_bel_Stock._WareHouse9);
               sqlcmd.Parameters.AddWithValue("@WareHouse10", obj_bel_Stock._WareHouse10);
               sqlcmd.Parameters.AddWithValue("@AtProcess", obj_bel_Stock._AtProcess);
               sqlcmd.Parameters.AddWithValue("@Conversion", obj_bel_Stock._Conversion);
               sqlcmd.Parameters.AddWithValue("@Net", obj_bel_Stock._Net);
               sqlcmd.Parameters.AddWithValue("@Packed", obj_bel_Stock._Packed);
               sqlcmd.Parameters.AddWithValue("@Balance", obj_bel_Stock._Balance);
               sqlcmd.Parameters.AddWithValue("@Value", obj_bel_Stock._Value);
               sqlcmd.Parameters.AddWithValue("@iMode", "Create");
              
              
               ds = DataFunctions.GetDataSet(sqlcmd);
           }
           catch (Exception es)
           {

           }
           return ds;
       }

       public int dal_StockInsert(bel_StockResult obj_bel_Stock, DataTable dt)
       {

           int value;

           int Result = 0;
           string connectionString = ConfigurationManager.ConnectionStrings["SQLConn"].ConnectionString;
           SqlConnection connection = new SqlConnection(connectionString);
           SqlTransaction trn;
           connection.Open();
           trn = connection.BeginTransaction();


           try
           {

               SqlCommand sqlcmd2 = new SqlCommand(obj_bel_Stock._StoreProceture, connection, trn);
               sqlcmd2.CommandTimeout = 0;
               sqlcmd2.CommandType = CommandType.StoredProcedure;

               for (int i = 0; i <= dt.Rows.Count - 1; i++)
               {
                   sqlcmd2.Parameters.Clear();




                        sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                        if (Convert.ToString(dt.Rows[i]["JOBCode"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@JOBCode", Convert.ToString(dt.Rows[i]["JOBCode"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@JOBCode", string.Empty);
                        }

                        if (Convert.ToString(dt.Rows[i]["ProductCode"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@ProductCode", Convert.ToString(dt.Rows[i]["ProductCode"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@ProductCode", string.Empty);
                        }


                        if (Convert.ToString(dt.Rows[i]["OrderQty"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@OrderQty", Convert.ToDecimal(dt.Rows[i]["OrderQty"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@OrderQty", 0);
                        }

                        if (Convert.ToString(dt.Rows[i]["TotalReceipt"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@TotalReceipt", Convert.ToDecimal(dt.Rows[i]["TotalReceipt"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@TotalReceipt", 0);
                        }

                        if (obj_bel_Stock._Count == 1)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }


                            sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse4", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse5", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse7", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse10", 0);
                        }
                        if (obj_bel_Stock._Count == 2)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }
                            if (Convert.ToString(dt.Rows[i]["WareHouse2"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", Convert.ToDecimal(dt.Rows[i]["WareHouse2"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            }


                            sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse4", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse5", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse7", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse10", 0);
                        }
                        if (obj_bel_Stock._Count == 3)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }
                            if (Convert.ToString(dt.Rows[i]["WareHouse2"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", Convert.ToDecimal(dt.Rows[i]["WareHouse2"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse3"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", Convert.ToDecimal(dt.Rows[i]["WareHouse3"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            }
                           
                           
                            sqlcmd2.Parameters.AddWithValue("@WareHouse4",0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse5",0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse7",0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse10",0);
                        }

                        if (obj_bel_Stock._Count == 4)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }
                            if (Convert.ToString(dt.Rows[i]["WareHouse2"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", Convert.ToDecimal(dt.Rows[i]["WareHouse2"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse3"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", Convert.ToDecimal(dt.Rows[i]["WareHouse3"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse4"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", Convert.ToDecimal(dt.Rows[i]["WareHouse4"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", 0);
                            }
                           
                            sqlcmd2.Parameters.AddWithValue("@WareHouse5", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse7", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse10", 0);
                        }

                        if (obj_bel_Stock._Count == 5)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }
                            if (Convert.ToString(dt.Rows[i]["WareHouse2"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", Convert.ToDecimal(dt.Rows[i]["WareHouse2"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse3"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", Convert.ToDecimal(dt.Rows[i]["WareHouse3"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse4"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", Convert.ToDecimal(dt.Rows[i]["WareHouse4"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse5"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", Convert.ToDecimal(dt.Rows[i]["WareHouse5"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", 0);
                            }
                           
                            sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse7", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse10", 0);
                        }

                        if (obj_bel_Stock._Count == 6)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }
                            if (Convert.ToString(dt.Rows[i]["WareHouse2"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", Convert.ToDecimal(dt.Rows[i]["WareHouse2"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse3"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", Convert.ToDecimal(dt.Rows[i]["WareHouse3"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse4"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", Convert.ToDecimal(dt.Rows[i]["WareHouse4"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse5"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", Convert.ToDecimal(dt.Rows[i]["WareHouse5"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse6"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", Convert.ToDecimal(dt.Rows[i]["WareHouse6"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            }
                           
                            sqlcmd2.Parameters.AddWithValue("@WareHouse7", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse10", 0);
                        }


                        if (obj_bel_Stock._Count == 7)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }
                            if (Convert.ToString(dt.Rows[i]["WareHouse2"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", Convert.ToDecimal(dt.Rows[i]["WareHouse2"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse3"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", Convert.ToDecimal(dt.Rows[i]["WareHouse3"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse4"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", Convert.ToDecimal(dt.Rows[i]["WareHouse4"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse5"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", Convert.ToDecimal(dt.Rows[i]["WareHouse5"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse6"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", Convert.ToDecimal(dt.Rows[i]["WareHouse6"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse7"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse7", Convert.ToDecimal(dt.Rows[i]["WareHouse7"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse7", 0);
                            }
                            
                            sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse10", 0);
                        }


                        if (obj_bel_Stock._Count == 8)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }
                            if (Convert.ToString(dt.Rows[i]["WareHouse2"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", Convert.ToDecimal(dt.Rows[i]["WareHouse2"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse3"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", Convert.ToDecimal(dt.Rows[i]["WareHouse3"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse4"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", Convert.ToDecimal(dt.Rows[i]["WareHouse4"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse5"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", Convert.ToDecimal(dt.Rows[i]["WareHouse5"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse6"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", Convert.ToDecimal(dt.Rows[i]["WareHouse6"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            }

                           

                            if (Convert.ToString(dt.Rows[i]["WareHouse7"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse7", Convert.ToDecimal(dt.Rows[i]["WareHouse7"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse7", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse8"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse8", Convert.ToDecimal(dt.Rows[i]["WareHouse8"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            }
                            
                           
                            sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            sqlcmd2.Parameters.AddWithValue("@WareHouse10", 0);
                        }

                        if (obj_bel_Stock._Count == 9)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }
                            if (Convert.ToString(dt.Rows[i]["WareHouse2"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", Convert.ToDecimal(dt.Rows[i]["WareHouse2"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse3"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", Convert.ToDecimal(dt.Rows[i]["WareHouse3"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse4"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", Convert.ToDecimal(dt.Rows[i]["WareHouse4"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse5"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", Convert.ToDecimal(dt.Rows[i]["WareHouse5"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse6"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", Convert.ToDecimal(dt.Rows[i]["WareHouse6"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            }

                           

                            if (Convert.ToString(dt.Rows[i]["WareHouse7"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse7", Convert.ToDecimal(dt.Rows[i]["WareHouse7"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse7", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse8"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse8", Convert.ToDecimal(dt.Rows[i]["WareHouse8"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse9"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse9", Convert.ToDecimal(dt.Rows[i]["WareHouse9"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            }

                           
                            sqlcmd2.Parameters.AddWithValue("@WareHouse10", 0);
                        }

                        if (obj_bel_Stock._Count == 10)
                        {
                            if (Convert.ToString(dt.Rows[i]["WareHouse1"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", Convert.ToDecimal(dt.Rows[i]["WareHouse1"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse1", 0);
                            }
                            if (Convert.ToString(dt.Rows[i]["WareHouse2"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", Convert.ToDecimal(dt.Rows[i]["WareHouse2"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse2", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse3"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", Convert.ToDecimal(dt.Rows[i]["WareHouse3"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse3", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse4"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", Convert.ToDecimal(dt.Rows[i]["WareHouse4"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse4", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse5"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", Convert.ToDecimal(dt.Rows[i]["WareHouse5"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse5", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse6"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", Convert.ToDecimal(dt.Rows[i]["WareHouse6"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse6", 0);
                            }

                           

                            if (Convert.ToString(dt.Rows[i]["WareHouse7"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse7", Convert.ToDecimal(dt.Rows[i]["WareHouse7"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse7", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse8"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse8", Convert.ToDecimal(dt.Rows[i]["WareHouse8"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse8", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse9"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse9", Convert.ToDecimal(dt.Rows[i]["WareHouse9"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse9", 0);
                            }

                            if (Convert.ToString(dt.Rows[i]["WareHouse10"].ToString()) != string.Empty)
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse10", Convert.ToDecimal(dt.Rows[i]["WareHouse10"].ToString()));
                            }
                            else
                            {
                                sqlcmd2.Parameters.AddWithValue("@WareHouse10", 0);
                            }
                           
                            
                        }
                       


                        if (Convert.ToString(dt.Rows[i]["AtProcess"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@AtProcess", Convert.ToDecimal(dt.Rows[i]["AtProcess"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@AtProcess", 0);
                        }

                        if (Convert.ToString(dt.Rows[i]["Conversion"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@Conversion", Convert.ToDecimal(dt.Rows[i]["Conversion"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@Conversion", 0);
                        }
                        if (Convert.ToString(dt.Rows[i]["Net"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@Net", Convert.ToDecimal(dt.Rows[i]["Net"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@Net", 0);
                        }

                        if (Convert.ToString(dt.Rows[i]["Packed"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@Packed", Convert.ToDecimal(dt.Rows[i]["Packed"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@Packed", 0);
                        }

                        if (Convert.ToString(dt.Rows[i]["Balance"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@Balance", Convert.ToDecimal(dt.Rows[i]["Balance"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@Balance", 0);
                        }
                        if (Convert.ToString(dt.Rows[i]["Value"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@Value", Convert.ToDecimal(dt.Rows[i]["Value"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@Value", 0);
                        }

                        if (Convert.ToString(dt.Rows[i]["DC"].ToString()) != string.Empty)
                        {
                            sqlcmd2.Parameters.AddWithValue("@DC", Convert.ToDecimal(dt.Rows[i]["DC"].ToString()));
                        }
                        else
                        {
                            sqlcmd2.Parameters.AddWithValue("@DC", 0);
                        }



                   Result = sqlcmd2.ExecuteNonQuery();


               }


               trn.Commit();
               //Dsstockin = DataFunctions.GetDataSet(sqlcmd);

           }
           catch (SqlException ex)
           {
               trn.Rollback();

           }


           connection.Close();
           return Result;

       }


       public int dal_StockBranchInsert(bel_StockResult obj_bel_Stock, DataTable dt)
       {

           int value;

           int Result = 0;
           string connectionString = ConfigurationManager.ConnectionStrings["SQLConn"].ConnectionString;
           SqlConnection connection = new SqlConnection(connectionString);
           SqlTransaction trn;
           connection.Open();
           trn = connection.BeginTransaction();


           try
           {

               SqlCommand sqlcmd2 = new SqlCommand(obj_bel_Stock._StoreProceture, connection, trn);
               sqlcmd2.CommandTimeout = 0;
               sqlcmd2.CommandType = CommandType.StoredProcedure;

               for (int i = 0; i <= dt.Rows.Count - 1; i++)
               {
                   sqlcmd2.Parameters.Clear();




                   sqlcmd2.Parameters.AddWithValue("@iMode", "Insert");
                   if (Convert.ToString(dt.Rows[i]["JOBCode"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@JOBCode", Convert.ToString(dt.Rows[i]["JOBCode"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@JOBCode", string.Empty);
                   }

                   if (Convert.ToString(dt.Rows[i]["ProductCode"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@ProductCode", Convert.ToString(dt.Rows[i]["ProductCode"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@ProductCode", string.Empty);
                   }


                   if (Convert.ToString(dt.Rows[i]["OrderQty"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@OrderQty", Convert.ToDecimal(dt.Rows[i]["OrderQty"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@OrderQty", 0);
                   }

                   if (Convert.ToString(dt.Rows[i]["OrderQty"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@TotalReceipt", Convert.ToDecimal(dt.Rows[i]["TotalReceipt"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@OrderQty", 0);
                   }

                   if (obj_bel_Stock._Count == 1)
                   {
                       if (Convert.ToString(dt.Rows[i]["Branch1"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", Convert.ToDecimal(dt.Rows[i]["Branch1"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", 0);
                       }


                       sqlcmd2.Parameters.AddWithValue("@Branch2", 0);
                       sqlcmd2.Parameters.AddWithValue("@Branch3", 0);
                       sqlcmd2.Parameters.AddWithValue("@Branch4", 0);
                       sqlcmd2.Parameters.AddWithValue("@Branch5", 0);
                       
                   }
                   if (obj_bel_Stock._Count == 2)
                   {
                       if (Convert.ToString(dt.Rows[i]["Branch1"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", Convert.ToDecimal(dt.Rows[i]["Branch1"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", 0);
                       }
                       if (Convert.ToString(dt.Rows[i]["Branch2"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch2", Convert.ToDecimal(dt.Rows[i]["Branch2"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch2", 0);
                       }


                       sqlcmd2.Parameters.AddWithValue("@Branch3", 0);
                       sqlcmd2.Parameters.AddWithValue("@Branch4", 0);
                       sqlcmd2.Parameters.AddWithValue("@Branch5", 0);
                       
                   }
                   if (obj_bel_Stock._Count == 3)
                   {
                       if (Convert.ToString(dt.Rows[i]["Branch1"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", Convert.ToDecimal(dt.Rows[i]["Branch1"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", 0);
                       }
                       if (Convert.ToString(dt.Rows[i]["Branch2"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch2", Convert.ToDecimal(dt.Rows[i]["Branch2"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch2", 0);
                       }

                       if (Convert.ToString(dt.Rows[i]["Branch3"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch3", Convert.ToDecimal(dt.Rows[i]["Branch3"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch3", 0);
                       }


                       sqlcmd2.Parameters.AddWithValue("@Branch4", 0);
                       sqlcmd2.Parameters.AddWithValue("@Branch5", 0);
                       
                   }

                   if (obj_bel_Stock._Count == 4)
                   {
                       if (Convert.ToString(dt.Rows[i]["Branch1"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", Convert.ToDecimal(dt.Rows[i]["Branch1"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", 0);
                       }
                       if (Convert.ToString(dt.Rows[i]["Branch2"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch2", Convert.ToDecimal(dt.Rows[i]["Branch2"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch2", 0);
                       }

                       if (Convert.ToString(dt.Rows[i]["Branch3"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch3", Convert.ToDecimal(dt.Rows[i]["Branch3"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch3", 0);
                       }

                       if (Convert.ToString(dt.Rows[i]["Branch4"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch4", Convert.ToDecimal(dt.Rows[i]["Branch4"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch4", 0);
                       }

                       sqlcmd2.Parameters.AddWithValue("@Branch5", 0);
                       
                   }

                   if (obj_bel_Stock._Count == 5)
                   {
                       if (Convert.ToString(dt.Rows[i]["Branch1"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", Convert.ToDecimal(dt.Rows[i]["Branch1"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch1", 0);
                       }
                       if (Convert.ToString(dt.Rows[i]["Branch2"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch2", Convert.ToDecimal(dt.Rows[i]["Branch2"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch2", 0);
                       }

                       if (Convert.ToString(dt.Rows[i]["Branch3"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch3", Convert.ToDecimal(dt.Rows[i]["Branch3"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch3", 0);
                       }

                       if (Convert.ToString(dt.Rows[i]["Branch4"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch4", Convert.ToDecimal(dt.Rows[i]["Branch4"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch4", 0);
                       }

                       if (Convert.ToString(dt.Rows[i]["Branch5"].ToString()) != string.Empty)
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch5", Convert.ToDecimal(dt.Rows[i]["Branch5"].ToString()));
                       }
                       else
                       {
                           sqlcmd2.Parameters.AddWithValue("@Branch5", 0);
                       }

                       
                   }

                   

               



                   if (Convert.ToString(dt.Rows[i]["AtProcess"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@AtProcess", Convert.ToDecimal(dt.Rows[i]["AtProcess"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@AtProcess", 0);
                   }

                   if (Convert.ToString(dt.Rows[i]["Conversion"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@Conversion", Convert.ToDecimal(dt.Rows[i]["Conversion"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@Conversion", 0);
                   }
                   if (Convert.ToString(dt.Rows[i]["Net"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@Net", Convert.ToDecimal(dt.Rows[i]["Net"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@Net", 0);
                   }

                   if (Convert.ToString(dt.Rows[i]["Packed"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@Packed", Convert.ToDecimal(dt.Rows[i]["Packed"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@Packed", 0);
                   }

                   if (Convert.ToString(dt.Rows[i]["Balance"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@Balance", Convert.ToDecimal(dt.Rows[i]["Balance"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@Balance", 0);
                   }

                   if (Convert.ToString(dt.Rows[i]["DC"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@DC", Convert.ToDecimal(dt.Rows[i]["DC"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@DC", 0);
                   }
                   if (Convert.ToString(dt.Rows[i]["Value"].ToString()) != string.Empty)
                   {
                       sqlcmd2.Parameters.AddWithValue("@Value", Convert.ToDecimal(dt.Rows[i]["Value"].ToString()));
                   }
                   else
                   {
                       sqlcmd2.Parameters.AddWithValue("@Value", 0);
                   }





                   Result = sqlcmd2.ExecuteNonQuery();


               }


               trn.Commit();
               //Dsstockin = DataFunctions.GetDataSet(sqlcmd);

           }
           catch (SqlException ex)
           {
               trn.Rollback();

           }


           connection.Close();
           return Result;

       }
       
    }
}
