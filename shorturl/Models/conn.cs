using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace shorturl.Models
{
    public class conn
    {
        string ConnectionString = "Data Source=192.168.116.187;Initial Catalog=scheduling_system;Persist Security Info=True;User ID=scheduling_system;Password=app_mgmt";
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
            string result = "failure";

            try
            {
                OpenConection();

                SqlCommand cmd = new SqlCommand(Query_, con);
                int res = cmd.ExecuteNonQuery();

                if (res == 1)
                {
                    result = "success";
                }
                CloseConnection();
                return result;
            }
            catch (Exception e)
            {
                return result;
            }
        }

        public SqlDataReader DataReader(string Query_)
        {
            SqlCommand cmd = new SqlCommand(Query_, con);
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }


        public DataSet ShowDataInGridView(string Query_)
        {
            SqlDataAdapter dr = new SqlDataAdapter(Query_, ConnectionString);
            DataSet ds = new DataSet();
            dr.Fill(ds);
            object dataum = ds.Tables[0];
            return ds;
        }
    }
}