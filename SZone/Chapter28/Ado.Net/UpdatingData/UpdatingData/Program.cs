using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace UpdatingData
{
    class Program
    {
        static void Main(string[] args)
        {
            //28.5 更新数据库
            SqlConnection thisConnection = new SqlConnection(
                @"Data Source=htkj-86c98d70eb;" +
                @"AttachDbFilename='C:\SQL Server 2000 Sample Databases\NORTHWND.MDF';" +
                @"Integrated Security=True;Connect Timeout=30"
            );


            SqlDataAdapter thisAdapter = new SqlDataAdapter(
                "select Customerid,companyname from customers", thisConnection
                );
            //c builder
            SqlCommandBuilder thisBuilder = new SqlCommandBuilder(thisAdapter);
            //c ds
            DataSet thisDataSet = new DataSet();
            //fill dataset
            thisAdapter.Fill(thisDataSet, "Customers");
            //show data before change
            Console.WriteLine("name before change: {0}", thisDataSet.Tables["Customers"].Rows[9]["Companyname"]);
            //change
            thisDataSet.Tables["Customers"].Rows[9]["Companyname"] = "Acme, Inc.";
            //do change
            thisAdapter.Update(thisDataSet, "Customers");
            Console.WriteLine("name after change: {0}", thisDataSet.Tables["Customers"].Rows[9]["Companyname"]);



            thisConnection.Close();
            Console.Write("Program finished,press Enter/Return to continue:");
            Console.ReadLine();
        }
    }
}
