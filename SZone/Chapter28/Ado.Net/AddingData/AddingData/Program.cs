﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace AddingData
{
    class Program
    {
        static void Main(string[] args)
        {
            //28.5.1给数据库添加行
            SqlConnection thisConnection = new SqlConnection(
                @"Data Source=htkj-86c98d70eb;" +
                @"AttachDbFilename='C:\SQL Server 2000 Sample Databases\NORTHWND.MDF';" +
                @"Integrated Security=True;Connect Timeout=30"
            );

            SqlDataAdapter thisAdapter = new SqlDataAdapter(
                "Select customerid,companyname from customers",thisConnection
                );

            SqlCommandBuilder thisBulder = new SqlCommandBuilder(thisAdapter);
            DataSet thisDataSet = new DataSet();

            thisAdapter.Fill(thisDataSet, "Customers");

            Console.WriteLine("# row befor change: {0}", thisDataSet.Tables["Customers"].Rows.Count);

            DataRow thisRow = thisDataSet.Tables["Customers"].NewRow();
            thisRow["customerid"] = "ZACZI";
            thisRow["companyname"] = "Zachary Zithers Ltd.";
            thisDataSet.Tables["Customers"].Rows.Add(thisRow);

            Console.WriteLine("# rows after change: {0}", thisDataSet.Tables["Customers"].Rows.Count);

            thisAdapter.Update(thisDataSet, "Customers");




            thisConnection.Close();
            Console.Write("Program finished,press Enter/Return to continue:");
            Console.ReadLine();


        }
    }
}
