using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataSetRead
{
    class Program
    {
        static void Main(string[] args)
        {
            //28.4用DataSet读取数据
            SqlConnection thisConnection = new SqlConnection(
                @"Data Source=htkj-86c98d70eb;" +
                @"AttachDbFilename='C:\SQL Server 2000 Sample Databases\NORTHWND.MDF';" +
                @"Integrated Security=True;Connect Timeout=30"
            );

            SqlDataAdapter thisAdapter = new SqlDataAdapter(
                "select Customerid,contactname from customers",thisConnection
                );

            DataSet thisDataSet = new DataSet();
            thisAdapter.Fill(thisDataSet, "Customers");
            foreach (DataRow theRow in thisDataSet.Tables["Customers"].Rows)
            {
                Console.WriteLine(theRow["CustomerID"] + "\t" + theRow["ContactName"]);
            }

            thisConnection.Close();

            Console.Write("Program finished,press Enter/Return to continue:");
            Console.ReadLine();


        }
    }
}
