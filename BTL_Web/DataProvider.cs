using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BTL_Web
{
    public class DataProvider
    {
        public string strCon = @"Data Source=DESKTOP-HEUQBNO\XUANCUONG;Initial Catalog=WebNC;Integrated Security=True";
        public SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-HEUQBNO\XUANCUONG;Initial Catalog=WebNC;Integrated Security=True");


        public void connDB()
        {
            conn.Open();
        }

        public void closeDB()
        {
            if (conn.State == ConnectionState.Open)
            { conn.Close(); }
        }

        public DataTable getDT(string query)
        {
            DataTable dt = new DataTable();
            try
            {
                connDB();
                SqlDataAdapter Adapter = new SqlDataAdapter(query, conn);
                DataSet ds = new DataSet();

                Adapter.Fill(dt);
            }
            catch (System.Exception)
            {
                dt = null;
            }
            finally
            {
                closeDB();
            }

            return dt;
        }
    }
}