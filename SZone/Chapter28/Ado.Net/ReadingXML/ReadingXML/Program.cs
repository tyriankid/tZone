using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ReadingXML
{
    class Program
    {
        static void Main(string[] args)
        {
            //28.7 下半部分
            DataSet thisDataSet = new DataSet();
            thisDataSet.ReadXml(@"G:\TyrianZone\SZone\Chapter28\Ado.Net\DataRelationExample\nwinddata.xml");

            foreach (DataRow custRow in thisDataSet.Tables["Customers"].Rows)
            {
                Console.WriteLine("Customer ID: " + custRow["CustomerID"] + "Name: " + custRow["CompanyName"]);
            }

            Console.WriteLine("Table created by ReadXml is called {0}", thisDataSet.Tables[0].TableName);

            Console.Write("Program finished,press Enter/Return to continue:");
            Console.ReadLine();
        }
    }
}
