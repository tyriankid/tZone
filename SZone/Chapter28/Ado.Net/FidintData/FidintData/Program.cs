using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace FindingData
{
    class Program
    {
        static void Main(string[] args)
        {
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

            if (findRow == null)
            {
                Console.WriteLine("ZACZI not found, will add to Customers table");

                DataRow thisRow = thisDataSet.Tables["Customers"].NewRow();
                thisRow["Customerid"] = "ZACZI";
                thisRow["CompanyName"] = "Zachary Zithers Ltd.";
                thisDataSet.Tables["Customers"].Rows.Add(thisRow);
                if ((findRow = thisDataSet.Tables["Customers"].Rows.Find("ZACZI")) != null)
                {
                    Console.WriteLine("ZACZI successfully added to Customerstable");
                }

            }
            else
            {
                Console.WriteLine("ZACZI already present in database");
            }

            thisAdapter.Update(thisDataSet, "Customers");

            Console.WriteLine("# rows after change: {0}", thisDataSet.Tables["Customers"].Rows.Count);
            thisConnection.Close();
            Console.Write("Program finished,press Enter/Return to continue:");
            Console.ReadLine();
        }
    }
}
