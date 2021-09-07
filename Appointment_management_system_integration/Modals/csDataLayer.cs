using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Appointment_management_system_integration.Modals
{
    public class csDataLayer
    {
        string ConnectionString = ConfigurationManager.AppSettings["scheduling_system"].ToString();
        SqlConnection con;

        public void OpenConection()
        {
            con = new SqlConnection(ConnectionString);
            con.Open();
        }


        public void CloseConnection()
        {
            con.Close();
        }


        public string ExecuteQueries(string Query_)
        {
            OpenConection();

            SqlCommand cmd = new SqlCommand(Query_, con);
            int res = cmd.ExecuteNonQuery();
            string result = "failure";
            if (res == 1)
            {
                result = "success";
            }

            return result;
        }


        public SqlDataReader DataReader(string Query_)
        {
            SqlCommand cmd = new SqlCommand(Query_, con);
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }


        public DataSet ShowDataInGridView(string Query_)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlDataAdapter dr = new SqlDataAdapter(Query_, ConnectionString);
                dr.Fill(ds);
                object dataum = ds.Tables[0]; 
            }
            catch (Exception ex)
            {
                ds = null;
            }
            return ds;

        }
    }
}