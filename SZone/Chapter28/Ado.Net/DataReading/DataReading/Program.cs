using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataReading
{
    class Program
    {
        static void Main(string[] args)
        {
            //28.3 DataReader读取数据
            SqlConnection thisConnection = new SqlConnection(
                @"Data Source=htkj-86c98d70eb;" +
                @"AttachDbFilename='C:\SQL Server 2000 Sample Databases\NORTHWND.MDF';"+
                @"Integrated Security=True;Connect Timeout=30"
            );

            thisConnection.Open();
            SqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "select customerid,companyname from customers";
            SqlDataReader thisReader = thisCommand.ExecuteReader();

            while (thisReader.Read())
            {
                Console.WriteLine("\t{0}\t{1}",
                thisReader["CustomerID"], thisReader["CompanyName"]);
            }

            thisReader.Close();

            thisConnection.Close();

            Console.Write("Program finished,press Enter/Return to continue:");
            Console.ReadLine();



        }
    }
}
