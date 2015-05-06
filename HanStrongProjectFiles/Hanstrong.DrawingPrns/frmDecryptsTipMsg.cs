using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;

namespace Hanstrong.Decrypts
{
    public partial class frmDecryptsTipMsg : Form
    {
        public frmDecryptsTipMsg()
        {
            InitializeComponent();
        }

        public void AddItem(string text)
        {
            list.Items.Add(text);
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("确定终止？", "文档解密", MessageBoxButtons.YesNo) == DialogResult.No) return;
            Environment.Exit(Environment.ExitCode);
            Process.GetCurrentProcess().Kill();
        }
    }
}
