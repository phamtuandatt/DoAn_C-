using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DoAn.gui;
using System.Data.SqlClient;
using System.Configuration;

namespace DoAn
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Connect_System());

            //SqlConnection cnn = null;

            //string sFilePath = Application.ExecutablePath + ".config";
            //if (!System.IO.File.Exists(sFilePath))
            //{
            //    Connect_System frmCnn = new Connect_System();
            //    if (frmCnn.ShowDialog() == DialogResult.Cancel)
            //        Application.Exit();
            //    else
            //        Application.Restart();

            //    return;
            //}
            //else
            //{
            //    string sCNN = ConfigurationManager.ConnectionStrings["DoAn.Properties.Settings.QL_BSachConnectionString"].ConnectionString;
            //    cnn = new SqlConnection(sCNN);
            //    try
            //    {
            //        cnn.Open();
            //        cnn.Close();
            //        DangNhap dn = new DangNhap();
            //        dn.ShowDialog();
            //    }
            //    catch
            //    {
            //        Connect_System frmCnn = new Connect_System();
            //        frmCnn.ShowDialog();
            //    }
            //}
        }
    }
}
