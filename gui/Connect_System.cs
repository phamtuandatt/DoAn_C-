using ComponentFactory.Krypton.Toolkit;
using DoAn.connect_database;
using DoAn.dao_xu_ly;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAn.gui
{
    public partial class Connect_System : MetroFramework.Forms.MetroForm
    {
        AppSetting appset = new AppSetting();
        SQLProvider db = new SQLProvider();
        string connectionString = "";
        public string ConnectionString { get => connectionString; set => connectionString = value; }

        public Connect_System()
        {
            InitializeComponent();
            pnCN.BackColor = Color.FromArgb(100, 0, 0, 0);
            lbSN.BackColor = Color.Transparent;
            lbDN.BackColor = Color.Transparent;
            lbUID.BackColor = Color.Transparent;
            lbP.BackColor = Color.Transparent;
        }

        private void btnTest_Click(object sender, EventArgs e)
        {
            if (txtSN.Text == "" || txtDN.Text == "")
                KryptonMessageBox.Show("Can not be empty!");
            else
            {
                if (txtUID.Text == "")
                {
                    ConnectionString = string.Format("server={0};database={1};Integrated Security = true;", txtSN.Text, txtDN.Text);
                }    
                else
                {
                    ConnectionString = string.Format("server={0};database={1};Integrated Security = true;uid={2};pwd={3}", txtSN.Text, txtDN.Text, txtUID.Text, txtP.Text);
                }    


                if (db.testConnection(ConnectionString))
                    KryptonMessageBox.Show("Kết nối thành công !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    KryptonMessageBox.Show("Kết nối KHÔNG thành công !", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (ConnectionString != "")
            {
                appset.setConnectionString("DoAn.Properties.Settings.QL_BSachConnectionString", ConnectionString);
                KryptonMessageBox.Show("Lưu kết nối thành công ! Hãy khởi động lại chương trình !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                DangNhap dn = new DangNhap();
                this.Hide();
                dn.Show();
                
            }
        }
    }
}
