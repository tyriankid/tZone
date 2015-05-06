using System;
using System.Collections.Generic;
using System.Windows.Forms;
using Hanstrong.DrawingPrns;

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
                string aa = "";
                foreach (string item in args)
                {
                    aa += item;
                }
                PseudoProtocol call = new PseudoProtocol(aa);
                
                #region 测试代码s
                //PseudoProtocol call = new PseudoProtocol("drawingprns://downloadpltfiles/?objid=21356F572DDAAB4319A73AE297F7E79B");
                //PseudoProtocol call = new PseudoProtocol("drawingprns://uploadpubfiles/?objid=B432C4D884334F9D8ED4A406009AAF28&type=pub");
                //PseudoProtocol call = new PseudoProtocol("drawingprns://downloadfiles/?objid=C8C7A77EE78CFDED0C1CA1269E0CD377");
                //PseudoProtocol call = new PseudoProtocol("drawingprns://downloadarh/?tpid=prj&vtpid=Y1&where=prjbh&value=42-B2421S");
                //PseudoProtocol call = new PseudoProtocol("drawingprns://comarhgd/?rowids=cd6ca42d0ebf41328971ffc7f31fed56,212A-2013-4XS1627,42-K0021S-G0101&username=范秀红&vtpid=Y1");
                //PseudoProtocol call = new PseudoProtocol("drawingprns://buildzip/?dwgids=&pubid=40037651A04117B506BCDB4BA1FFE776");
                #endregion

                call.Execute();

                #region 手动批量压缩
                //frmHBuilderZip fhbz = new frmHBuilderZip();
                //Application.Run(new frmHBuilderZip());
                #endregion
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            //Application.Run(new Form1());
        }
    }
}
