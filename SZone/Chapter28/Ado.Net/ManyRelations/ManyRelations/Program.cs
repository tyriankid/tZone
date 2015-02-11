using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ManyRelations
{
    class Program
    {
        static void Main(string[] args)
        {
            //28.6 下半部分
            SqlConnection thisConnection = new SqlConnection(
                @"Data Source=htkj-86c98d70eb;" +
                @"AttachDbFilename='C:\SQL Server 2000 Sample Databases\NORTHWND.MDF';" +
                @"Integrated Security=True;Connect Timeout=30"
            );

            DataSet thisDataSet = new DataSet();

            SqlDataAdapter custAdapter = new SqlDataAdapter(
                "select * from Customers",thisConnection
                );
            custAdapter.Fill(thisDataSet,"Customers");

            SqlDataAdapter orderAdapter = new SqlDataAdapter(
                "select * from Orders", thisConnection
                );
            orderAdapter.Fill(thisDataSet, "Orders");

            SqlDataAdapter detailAdapter = new SqlDataAdapter(
                "select * from [Order Details]",thisConnection
                );
            detailAdapter.Fill(thisDataSet, "Order Details");

            SqlDataAdapter prodAdapter = new SqlDataAdapter(
                "select * from Products",thisConnection
                );
            prodAdapter.Fill(thisDataSet, "Products");

            DataRelation custOrderRel = thisDataSet.Relations.Add("CustOrders",
                thisDataSet.Tables["Customers"].Columns["CustomerID"],
                thisDataSet.Tables["Orders"].Columns["CustomerID"]
                );
            DataRelation orderDetailRel = thisDataSet.Relations.Add("OrderDetail",
                thisDataSet.Tables["Orders"].Columns["OrderID"],
                thisDataSet.Tables["Order Details"].Columns["OrderID"]
                );
            DataRelation orderProductRel = thisDataSet.Relations.Add("OrderProducts",
                thisDataSet.Tables["Products"].Columns["ProductID"],
                thisDataSet.Tables["Order Details"].Columns["ProductID"]
                );

            foreach (DataRow custRow in thisDataSet.Tables["Customers"].Rows)
            {
                Console.WriteLine("Customer ID: " + custRow["CustomerID"]);
                foreach (DataRow orderRow in custRow.GetChildRows(custOrderRel))
                {
                    Console.WriteLine("\tOrder ID: " + orderRow["OrderID"]);
                    Console.WriteLine("\t\tOrder Date: " + orderRow["OrderDate"]);

                    foreach (DataRow detailRow in orderRow.GetChildRows(orderDetailRel))
                    {
                        Console.WriteLine("\t\tProduct: " + detailRow.GetParentRow(orderProductRel)["ProductName"]);
                        Console.WriteLine("\t\tQuantity: " + detailRow["Quantity"]);
                    }
                }
            }

            thisConnection.Close();
            Console.Write("Program finished,press Enter/Return to continue:");
            Console.ReadLine();
        }
    }
}
