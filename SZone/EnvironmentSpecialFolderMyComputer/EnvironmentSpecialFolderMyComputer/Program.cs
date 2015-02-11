using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EnvironmentSpecialFolderMyComputer
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(new Program().GetCNName(Environment.SpecialFolder.MyMusic));
            Console.WriteLine(Environment.SpecialFolder.Desktop);
            Console.ReadLine();
        }

        string GetCNName(Environment.SpecialFolder type)
        {
            string cnName = string.Empty;
            switch (type)
            {
                case Environment.SpecialFolder.MyComputer:
                    cnName = "我的电脑";
                    break;
                case Environment.SpecialFolder.MyDocuments:
                    cnName = "我的文档";
                    break;
                case Environment.SpecialFolder.MyMusic:
                    cnName = "我的音乐";
                    break;
                default:
                    break;
            }
            return cnName;
        }
    }

}
