using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace _27_2LINQtoSQLDataBinding
{
    public partial class Form1 : Form
    {
        NorthwindDataContext northwindDataContext = new NorthwindDataContext();


        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //27.8用LINQ to SQL 绑定数据
            customersBindingSource.DataSource = northwindDataContext.Customers;


        }

        private void customersBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            //27.9用LINQ TO SQL更新绑定数据
            northwindDataContext.SubmitChanges();
        }
    }
}
