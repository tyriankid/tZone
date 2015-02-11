using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FirstLINQtoSQLQquery
{
    class Program
    {
        static void Main(string[] args)
        {
            NorthwindDataContext northWindDataContext = new NorthwindDataContext();

            /* //27.4-27.5
            var queryResults = from c in northWindDataContext.Customers
                               where c.Country == "USA"
                               select new
                               {
                                   ID = c.CustomerID,
                                   Name = c.CompanyName,
                                   City = c.City,
                                   State = c.Region,
                                   Orders = c.Orders
                               };

            */

            //27.6-27.7
            var totalResults = from c in northWindDataContext.Customers
                               select new
                               {
                                   Country = c.Country,
                                   Sales = c.Orders.Sum(o => o.Order_Details.Sum(od => od.Quantity * od.UnitPrice))
                               };

            Console.WriteLine("----- SQL for totalResults query -------");
            Console.WriteLine(totalResults);
            Console.WriteLine("Press Enter/Return to continue...");
            Console.ReadLine();

            var groupResults = from c in totalResults
                               group c by c.Country into cg
                               select new
                               {
                                   TotalSales = cg.Sum(c => c.Sales),
                                   Country = cg.Key
                               };

            Console.WriteLine("----- SQL for groupResults query -------");
            Console.WriteLine(groupResults);
            Console.WriteLine("Press Enter/Return to continue...");
            Console.ReadLine();

            var orderedResults = from cg in groupResults
                                 orderby cg.TotalSales descending
                                 select cg
                                 ;
            Console.WriteLine("----- SQL for orderedResults query -------");
            Console.WriteLine(orderedResults);
            Console.WriteLine("Press Enter/Return to continue...");
            Console.ReadLine();


            #region 27.3,第一个LINQ to SQL 查询 
            
            /*
            foreach (var item in queryResults)
            {
                Console.WriteLine(item);
            };
            */
            #endregion

            #region 27.4,浏览LINQ to SQL关系
            /*
            foreach (var item in queryResults)
            {
                Console.WriteLine("Customer:{0} {1}, {2} \n{3} orders:\tOrder ID\tOrder Date",
                        item.Name,item.City,item.State,item.Orders.Count
                    );
                foreach (Orders o in item.Orders) 
                {
                    Console.WriteLine("\t\t{0}\t{1}", o.OrderID, o.OrderDate);
                }
            }
            */
            #endregion

            #region 27.5,进一步探讨LINQ to SQL
            /*
            foreach (var item in queryResults)
            {
                Console.WriteLine("Customer:{0} {1}, {2} \n {3} orders:\n Order ID\tOrder Date\tTotalAmount",
                    item.Name,item.City,item.State,item.Orders.Count
                    );
                foreach (Orders o in item.Orders)
                {
                    Console.WriteLine(
                        "\r{0,10}\t{1,10}\t{2,10}",
                        o.OrderID,
                        o.OrderDate.Value.ToShortDateString(),
                        o.Order_Details.Sum(od => od.Quantity * od.UnitPrice).ToString("C2")
                        );
                }
            }
             */
            #endregion

            #region 27.6,LINQ to SQL 中的组合 排序和其他高级查询
            
            Console.WriteLine("Country\t\tTotal Sales\n--------\t------------");
            foreach (var item in orderedResults)
            {
                Console.WriteLine("{0,-15}{1,12}",
                item.Country,item.TotalSales.ToString("C2"));
            }
            
            #endregion



            Console.WriteLine("Press Enter/Return to continue...");
            Console.ReadLine();
        }
    }
}
