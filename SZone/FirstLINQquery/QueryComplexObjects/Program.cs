using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QueryComplexObjects
{
    class Program
    {
        class Customer
        {
            public string ID { get; set; }
            public string City { get; set; }
            public string Country { get; set; }
            public string Region { get; set; }
            public decimal Sales { get; set; }

            public override string ToString()
            {
                return "ID: " + ID + " City: " + City + " Country: " + Country +
                    " Region: " + Region + " Sales: " + Sales;
            }
        }

        static void Main(string[] args)
        {
            
            List<Customer> customers = new List<Customer>
            {
                new Customer{ID = "A",City="New York", Country = "USA",Region="North America", Sales = 9999},
                new Customer{ID = "B",City="Mumbai", Country = "India",Region="Asia", Sales = 8888},
                new Customer{ID = "C",City="Karachi", Country = "Pakistan",Region="Asia", Sales = 7777},
                new Customer{ID = "D",City="Delhi", Country = "India",Region="Asia", Sales = 6666},
                new Customer{ID = "E",City="S    o  Paulo", Country = "Brazil",Region="South America", Sales = 5555},
                new Customer{ID = "F",City="Moscow", Country = "Russia",Region="Europe", Sales = 4444},
                new Customer{ID = "G",City="Seoul", Country = "Korea",Region="Asia", Sales = 3333},
                new Customer{ID = "H",City="Istanbul", Country = "Turkey",Region="Asia", Sales = 2222},
                new Customer{ID = "I",City="Shanghai", Country = "China",Region="Asia", Sales = 1111},
                new Customer{ID = "J",City="Lagos", Country = "Nigeria",Region="Africa", Sales = 1000},
                new Customer{ID = "K",City="Mexico City", Country = "Mexico",Region="North America", Sales = 2000},
                new Customer{ID = "L",City="Jakarta", Country = "Indonesia",Region="Asia", Sales = 3000},
                new Customer{ID = "M",City="Tokyo", Country = "Japan",Region="Asia", Sales = 4000},
                new Customer{ID = "N",City="Los Angeles", Country = "USA",Region="North America", Sales = 5000},
                new Customer{ID = "O",City="Cairo", Country = "Egypt",Region="Africa", Sales = 6000},
                new Customer{ID = "P",City="Tehran", Country = "Iran",Region="Asia", Sales = 7000},
                new Customer{ID = "Q",City="London", Country = "UK",Region="Europe", Sales = 8000},
                new Customer{ID = "R",City="Beijing", Country = "China",Region="Asia", Sales = 9000},
                new Customer{ID = "S",City="Bogot a", Country = "Colombia",Region="South America", Sales = 1001},
                new Customer{ID = "T",City="Lima", Country = "Peru",Region="South America", Sales = 2002},
            };

            #region #26.9,查询复杂的对象
            /*
            var queryResults = from c in customers
                               where c.Region == "Asia"
                               select c;
            Console.WriteLine("Customers in Asia: ");
            foreach (Customer c in queryResults)
            {
                //因为重写了Customer的ToString()才会输出方法里的内容,不然就是输出对象的信息了
                Console.WriteLine(c);  
            }
             */
            #endregion 

            #region #26.10,投射:在查询中创建新对象
            /*
            var queryResults = from c in customers
                               where c.Region == "North America"
                               select new { c.City, c.Country, c.Sales }
                               ;
            
             */ 
            #endregion 

            #region #26.11,投射:方法语法
            /*
            var queryResults = customers.Where(c => c.Region == "North America").Select(c => new { c.City,c.Country,c.Sales});

            //var queryResultsE = customers.Select(c => new { c.City, c.Country, c.Sales }).Where(c => c.Region == "Asia"); 

            //var queryResultsR = customers.Select(c => new { c.City, c.Country, c.Sales }).Where(c => c.City == "Asia"); 

             */
            #endregion

            #region #26.12,单值选择查询
            /*
            var queryResults = customers.Select(c => c.Region ).Distinct();
             */
            #endregion

            #region#26.13,Any和All
            /*
            bool anyUSA = customers.Any(c => c.Country == "USA");
            if (anyUSA)
            {
                Console.WriteLine("Some customers are in the USA");
            }
            else
            {
                Console.WriteLine("No customers are in the USA");
            }

            bool allAsia = customers.All(c => c.Region == "Asia");
            if (allAsia)
            {
                Console.WriteLine("All customers are in Asia");
            }
            else
            {
                Console.WriteLine("Not all customers are in Asia");
            }
             */
            #endregion

            #region #26.14,多级排序
            /*
            var queryResults = from c in customers
                               orderby c.Region descending, c.Country descending, c.City
                               select new { c.ID,c.Region,c.Country ,c.City};
            */
            #endregion

            #region#26.15,多级排序方法语法:ThenBy
            //下列代码等同于#26.14
            
            var queryResults = customers.OrderByDescending(c => c.Region)
                .ThenBy(c => c.City)
                .ThenByDescending(c => c.Country)
                .Select(c => new { c.ID, c.Region, c.Country, c.City });
             
            #endregion

            

            foreach (var item in queryResults)
            {
                Console.WriteLine(item);
            }
            
            Console.Write("Program finished, press Enter/Return to continue: ");
            Console.ReadLine();
        }
    }

    
}
