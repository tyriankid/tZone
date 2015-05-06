using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace Hanstrong.Decrypts
{
    static class Program
    {
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            try
            {
                if (args == null || args.Length == 0) return;
                PseudoProtocol call = new PseudoProtocol(args[0]);
                call.Execute();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            //Application.Run(new Form1());
        }
    }
}
