using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LargeNumberQuery
{
    class Program
    {
        static void Main(string[] args)
        {
            
            
            int[] numbers = generateLotsOfNumbers(12345678);
            #region #26.7 查询大型数据集
            
            var queryResults = numbers.Where(n => n <1000);

            Console.WriteLine("Numbers less than 1000: ");
            foreach (var item in queryResults)
            {
                Console.WriteLine(item);
            }
            
            #endregion

            #region #26.8,合计运算符
            /*
            Console.WriteLine("Numeric Aggregates");
            var queryResults = numbers.Where(n => n > 1000);
            Console.WriteLine("Count of Numbers > 1000");
            Console.WriteLine(queryResults.Count());
            Console.WriteLine("Max of Numbers > 1000");
            Console.WriteLine(queryResults.Max());
            Console.WriteLine("Min of Numbers > 1000");
            Console.WriteLine(queryResults.Min());
            Console.WriteLine("Average of Numbers > 1000");
            Console.WriteLine(queryResults.Average());
            Console.WriteLine("Sum of Numbers > 1000");
            Console.WriteLine(queryResults.Sum(n => (long)n));
             */
            #endregion

           

            Console.Write("finished,pressEnter/Returntocontinue: ");
            Console.ReadLine();

            
        }

        private static int[] generateLotsOfNumbers(int count)
        {
            Random generator = new Random(0);
            int[] result = new int[count];
            for(int i = 0;i < count ; i ++)
            {
                result[i] = generator.Next();
            }
            return result;
        }
    }
}
