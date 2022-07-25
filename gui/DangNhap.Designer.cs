
namespace DoAn.gui
{
    partial class DangNhap
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DangNhap));
            this.pnDN = new System.Windows.Forms.Panel();
            this.btnThoat = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnDangNhap = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.txtMatKhau = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.txtTaiKhoan = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.metroPanel1 = new MetroFramework.Controls.MetroPanel();
            this.pnDN.SuspendLayout();
            this.metroPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnDN
            // 
            this.pnDN.BackColor = System.Drawing.SystemColors.Control;
            this.pnDN.Controls.Add(this.btnThoat);
            this.pnDN.Controls.Add(this.btnDangNhap);
            this.pnDN.Controls.Add(this.txtMatKhau);
            this.pnDN.Controls.Add(this.txtTaiKhoan);
            this.pnDN.Controls.Add(this.label1);
            this.pnDN.Controls.Add(this.label2);
            this.pnDN.Location = new System.Drawing.Point(81, 26);
            this.pnDN.Name = "pnDN";
            this.pnDN.Size = new System.Drawing.Size(535, 192);
            this.pnDN.TabIndex = 5;
            // 
            // btnThoat
            // 
            this.btnThoat.Location = new System.Drawing.Point(165, 126);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(142, 47);
            this.btnThoat.TabIndex = 3;
            this.btnThoat.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnThoat.Values.Image")));
            this.btnThoat.Values.Text = "THOÁT";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // btnDangNhap
            // 
            this.btnDangNhap.Location = new System.Drawing.Point(325, 126);
            this.btnDangNhap.Name = "btnDangNhap";
            this.btnDangNhap.Size = new System.Drawing.Size(142, 47);
            this.btnDangNhap.TabIndex = 3;
            this.btnDangNhap.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnDangNhap.Values.Image")));
            this.btnDangNhap.Values.Text = "ĐĂNG NHẬP";
            this.btnDangNhap.Click += new System.EventHandler(this.btnDangNhap_Click);
            // 
            // txtMatKhau
            // 
            this.txtMatKhau.Location = new System.Drawing.Point(106, 81);
            this.txtMatKhau.Name = "txtMatKhau";
            this.txtMatKhau.PasswordChar = '*';
            this.txtMatKhau.Size = new System.Drawing.Size(361, 27);
            this.txtMatKhau.TabIndex = 2;
            this.txtMatKhau.Text = "321321";
            // 
            // txtTaiKhoan
            // 
            this.txtTaiKhoan.Location = new System.Drawing.Point(106, 32);
            this.txtTaiKhoan.Name = "txtTaiKhoan";
            this.txtTaiKhoan.Size = new System.Drawing.Size(361, 27);
            this.txtTaiKhoan.TabIndex = 1;
            this.txtTaiKhoan.Text = "TuanDat";
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Image = ((System.Drawing.Image)(resources.GetObject("label1.Image")));
            this.label1.Location = new System.Drawing.Point(45, 81);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(33, 27);
            this.label1.TabIndex = 0;
            // 
            // label2
            // 
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Image = ((System.Drawing.Image)(resources.GetObject("label2.Image")));
            this.label2.Location = new System.Drawing.Point(45, 32);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(33, 27);
            this.label2.TabIndex = 0;
            // 
            // metroPanel1
            // 
            this.metroPanel1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("metroPanel1.BackgroundImage")));
            this.metroPanel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.metroPanel1.Controls.Add(this.pnDN);
            this.metroPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.metroPanel1.HorizontalScrollbarBarColor = true;
            this.metroPanel1.HorizontalScrollbarHighlightOnWheel = false;
            this.metroPanel1.HorizontalScrollbarSize = 10;
            this.metroPanel1.Location = new System.Drawing.Point(20, 60);
            this.metroPanel1.Name = "metroPanel1";
            this.metroPanel1.Size = new System.Drawing.Size(702, 243);
            this.metroPanel1.TabIndex = 0;
            this.metroPanel1.VerticalScrollbarBarColor = true;
            this.metroPanel1.VerticalScrollbarHighlightOnWheel = false;
            this.metroPanel1.VerticalScrollbarSize = 10;
            // 
            // DangNhap
            // 
            this.AcceptButton = this.btnDangNhap;
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(742, 323);
            this.Controls.Add(this.metroPanel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "DangNhap";
            this.Style = MetroFramework.MetroColorStyle.Black;
            this.Text = "ĐĂNG NHẬP";
            this.TextAlign = MetroFramework.Forms.MetroFormTextAlign.Center;
            this.pnDN.ResumeLayout(false);
            this.pnDN.PerformLayout();
            this.metroPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private MetroFramework.Controls.MetroPanel metroPanel1;
        private System.Windows.Forms.Panel pnDN;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnThoat;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnDangNhap;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtMatKhau;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtTaiKhoan;
    }
}