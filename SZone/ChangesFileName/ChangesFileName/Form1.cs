using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace ChangesFileName
{
    public partial class Form1 : Form
    {
        private string FolderPath = @"C:\WINDOWS\Temp\XTSJ\PltDwg";

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.textBox1.Text = FolderPath;
            this.textBox2.Text = ".sign";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            folderBrowserDialog1.RootFolder = Environment.SpecialFolder.Desktop;
            folderBrowserDialog1.SelectedPath = FolderPath;
            if (folderBrowserDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                this.textBox1.Text = folderBrowserDialog1.SelectedPath;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (Directory.Exists(textBox1.Text))
            {
                string[] dir = Directory.GetDirectories(textBox1.Text);
                if (dir.Length > 0)
                {
                    foreach (string item in dir)
                    {
                        string[] files = Directory.GetFiles(item);
                        if (files.Length > 0)
                        {
                            foreach (string file in files)
                            {
                                FileInfo fi = new FileInfo(file);
                                if (fi.Extension.ToLower().Contains("dwg"))
                                {
                                    string desk = string.Format(@"{0}\{1}{2}.dwg", textBox1.Text, fi.Name.Substring(0, fi.Name.LastIndexOf(".")), textBox2.Text);
                                    File.Copy(file, desk);
                                }

                                if (fi.Extension.ToLower().Contains("plt"))
                                {
                                    string desk = string.Format(@"{0}\{1}{2}.plt", textBox1.Text, fi.Name.Substring(0, fi.Name.LastIndexOf(".")), textBox2.Text);
                                    File.Copy(file, desk);
                                }
                            }
                        }
                    }
                    MessageBox.Show("转换完成");
                }
            }
        }
    }
}
