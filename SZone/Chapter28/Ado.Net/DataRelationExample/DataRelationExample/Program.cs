using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataRelationExample
{
    class Program
    {
        static void Main(string[] args)
        {
            //28.62.在DataSet中访问多个表----用关系导航
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


            SqlDataAdapter custAdapter = new SqlDataAdapter(
                "select * from Customers",thisConnection
                );
            SqlDataAdapter OrderAdapter = new SqlDataAdapter(
                "select * from Orders",thisConnection
                );
            custAdapter.Fill(thisDataSet, "Customers");
            OrderAdapter.Fill(thisDataSet, "Orders");

            //set up relation
            DataRelation custOrderRel = thisDataSet.Relations.Add("CustOrders",
                thisDataSet.Tables["Customers"].Columns["CustomerID"],
                thisDataSet.Tables["Orders"].Columns["CustomerID"]
                );

            //28.7 xml & ado.net
            //foreach (DataRow custRow in thisDataSet.Tables["Customers"].Rows)
            //{
            //    Console.WriteLine("Customer ID: " + custRow["CompanyName"]);
            //    foreach (DataRow orderRow in custRow.GetChildRows(custOrderRel))
            //    {
            //        Console.WriteLine("  Order ID: " + orderRow["OrderID"]);
            //    }
            //}

            //写入xml
            custOrderRel.Nested = true;
            thisDataSet.WriteXml(@"G:\TyrianZone\SZone\Chapter28\Ado.Net\DataRelationExample\nwinddata.xml");
            Console.WriteLine(@"successfully wrote xml output to file ");

            thisConnection.Close();
            Console.Write("Program finished,press Enter/Return to continue:");
            Console.ReadLine();
        }
    }
}
