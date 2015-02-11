using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DeletingData
{
    class Program
    {
        static void Main(string[] args)
        {
            //28.5.2 删除数据行
            SqlConnection thisConnection = new SqlConnection(
                @"Data Source=htkj-86c98d70eb;" +
                @"AttachDbFilename='C:\SQL Server 2000 Sample Databases\NORTHWND.MDF';" +
                @"Integrated Security=True;Connect Timeout=30"
            );

            SqlDataAdapter thisAdapter = new SqlDataAdapter(
                "Select customerid,companyname from customers", thisConnection
                );

            SqlCommandBuilder thisBulder = new SqlCommandBuilder(thisAdapter);
            DataSet thisDataSet = new DataSet();

            thisAdapter.Fill(thisDataSet, "Customers");
            Console.WriteLine("# row befor change: {0}", thisDataSet.Tables["Customers"].Rows.Count);


            DataColumn[] keys = new DataColumn[1];
            keys[0] = thisDataSet.Tables["Customers"].Columns["customerid"];
            thisDataSet.Tables["Customers"].PrimaryKey = keys;

            DataRow findRow = thisDataSet.Tables["Customers"].Rows.Find("ZACZI");

            if (findRow != null)
            {
                Console.WriteLine("ZACZI aready in Customers table");
                Console.WriteLine("Removing ZACZI . . .");

                findRow.Delete();

                thisAdapter.Update(thisDataSet, "Customers");
            }

            Console.WriteLine("# rows after change: {0}", thisDataSet.Tables["Customers"].Rows.Count);
            thisConnection.Close();
            Console.Write("Program finished,press Enter/Return to continue:");
            Console.ReadLine();

        }
    }
}
