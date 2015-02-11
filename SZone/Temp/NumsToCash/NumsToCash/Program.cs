using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NumsToCash
{
    class Program
    {
        public static string Cash(double nums)
        {
            return string.Format("{0:C}", nums);
        }
        static void Main(string[] args)
        {
            string num=Cash (2.5);
            string num2=string.Format("{0:C}", 2.5);

            Console.WriteLine(num);
            Console.WriteLine("{0:C}", 90000.00000);
            Console.WriteLine(num2);

            Console.ReadLine();

        }

        
    }
}
