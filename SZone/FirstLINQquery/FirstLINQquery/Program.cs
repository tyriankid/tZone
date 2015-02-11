using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FirstLINQquery
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] names = {"Alonso" , "Zheng" , "Smith" , "Jones" , "Smythe" ,
                              "Small" , "Ruiz" , "Hsieh" , "Jorgenson" , "Ilyich" , "Singh" , "Samba" , "Fatimah"};

            #region #26.2,LINQ查询语句
            /*
            var queryResults = from n in names 
                               where n.StartsWith("S")
                               select n;
            */
            #endregion

            #region #26.3,λ表达式 
            /*
            var queryResults = names.Where(n => n.StartsWith("S")); //理解为:n是(以"S"开头的)
             */
            #endregion

            #region #26.4,排序查询结果
            /*
            var queryResults = from n in names
                               where n.StartsWith("S")
                               orderby n
                               select n;
            */
            #endregion

            #region #26.5,orderby子句
            /*
            var queryResults = from n in names
                               where n.StartsWith("S")
                               //orderby n descending  //z-a降序
                               orderby n.Substring(n.Length - 1) //按照最后一个字母的顺序排序
                               select n;
             */
            #endregion

            #region #26.6,用方法语法排序
            
            var queryResults = names.OrderBy(n => n).Where(n => n.StartsWith("S"));
             
            #endregion

            
            //输出结果
            Console.WriteLine("Names beginning with S: ");
            foreach (var item in queryResults)
            {
                Console.WriteLine(item);
            }
            Console.Write("Program finished, press Enter/Return to continue: ");
            Console.ReadLine();

        }
    }
}
