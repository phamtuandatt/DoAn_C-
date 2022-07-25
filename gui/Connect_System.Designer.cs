
namespace DoAn.gui
{
    partial class Connect_System
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Connect_System));
            this.metroPanel1 = new MetroFramework.Controls.MetroPanel();
            this.pnCN = new System.Windows.Forms.Panel();
            this.btnSave = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.btnTest = new ComponentFactory.Krypton.Toolkit.KryptonButton();
            this.lbP = new System.Windows.Forms.Label();
            this.lbUID = new System.Windows.Forms.Label();
            this.lbDN = new System.Windows.Forms.Label();
            this.lbSN = new System.Windows.Forms.Label();
            this.txtDN = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.txtP = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.txtUID = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.txtSN = new ComponentFactory.Krypton.Toolkit.KryptonTextBox();
            this.metroPanel1.SuspendLayout();
            this.pnCN.SuspendLayout();
            this.SuspendLayout();
            // 
            // metroPanel1
            // 
            this.metroPanel1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("metroPanel1.BackgroundImage")));
            this.metroPanel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.metroPanel1.Controls.Add(this.pnCN);
            this.metroPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.metroPanel1.HorizontalScrollbarBarColor = true;
            this.metroPanel1.HorizontalScrollbarHighlightOnWheel = false;
            this.metroPanel1.HorizontalScrollbarSize = 10;
            this.metroPanel1.Location = new System.Drawing.Point(20, 60);
            this.metroPanel1.Name = "metroPanel1";
            this.metroPanel1.Size = new System.Drawing.Size(793, 328);
            this.metroPanel1.TabIndex = 0;
            this.metroPanel1.VerticalScrollbarBarColor = true;
            this.metroPanel1.VerticalScrollbarHighlightOnWheel = false;
            this.metroPanel1.VerticalScrollbarSize = 10;
            // 
            // pnCN
            // 
            this.pnCN.BackColor = System.Drawing.SystemColors.ControlDark;
            this.pnCN.Controls.Add(this.btnSave);
            this.pnCN.Controls.Add(this.btnTest);
            this.pnCN.Controls.Add(this.lbP);
            this.pnCN.Controls.Add(this.lbUID);
            this.pnCN.Controls.Add(this.lbDN);
            this.pnCN.Controls.Add(this.lbSN);
            this.pnCN.Controls.Add(this.txtDN);
            this.pnCN.Controls.Add(this.txtP);
            this.pnCN.Controls.Add(this.txtUID);
            this.pnCN.Controls.Add(this.txtSN);
            this.pnCN.Location = new System.Drawing.Point(80, 24);
            this.pnCN.Name = "pnCN";
            this.pnCN.Size = new System.Drawing.Size(628, 272);
            this.pnCN.TabIndex = 2;
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(440, 204);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(172, 44);
            this.btnSave.TabIndex = 5;
            this.btnSave.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnSave.Values.Image")));
            this.btnSave.Values.Text = "LƯU KẾT NỐI";
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnTest
            // 
            this.btnTest.Location = new System.Drawing.Point(262, 204);
            this.btnTest.Name = "btnTest";
            this.btnTest.Size = new System.Drawing.Size(172, 44);
            this.btnTest.TabIndex = 4;
            this.btnTest.Values.Image = ((System.Drawing.Image)(resources.GetObject("btnTest.Values.Image")));
            this.btnTest.Values.Text = "KẾT NỐI";
            this.btnTest.Click += new System.EventHandler(this.btnTest_Click);
            // 
            // lbP
            // 
            this.lbP.AutoSize = true;
            this.lbP.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbP.ForeColor = System.Drawing.Color.White;
            this.lbP.Location = new System.Drawing.Point(34, 162);
            this.lbP.Name = "lbP";
            this.lbP.Size = new System.Drawing.Size(83, 18);
            this.lbP.TabIndex = 13;
            this.lbP.Text = "Password";
            // 
            // lbUID
            // 
            this.lbUID.AutoSize = true;
            this.lbUID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbUID.ForeColor = System.Drawing.Color.White;
            this.lbUID.Location = new System.Drawing.Point(34, 119);
            this.lbUID.Name = "lbUID";
            this.lbUID.Size = new System.Drawing.Size(54, 18);
            this.lbUID.TabIndex = 13;
            this.lbUID.Text = "Login:";
            // 
            // lbDN
            // 
            this.lbDN.AutoSize = true;
            this.lbDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbDN.ForeColor = System.Drawing.Color.White;
            this.lbDN.Location = new System.Drawing.Point(34, 76);
            this.lbDN.Name = "lbDN";
            this.lbDN.Size = new System.Drawing.Size(143, 18);
            this.lbDN.TabIndex = 13;
            this.lbDN.Text = "Tên cơ sở dữ liệu:";
            // 
            // lbSN
            // 
            this.lbSN.AutoSize = true;
            this.lbSN.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbSN.ForeColor = System.Drawing.Color.White;
            this.lbSN.Location = new System.Drawing.Point(34, 33);
            this.lbSN.Name = "lbSN";
            this.lbSN.Size = new System.Drawing.Size(109, 18);
            this.lbSN.TabIndex = 13;
            this.lbSN.Text = "Tên máy chủ:";
            // 
            // txtDN
            // 
            this.txtDN.Location = new System.Drawing.Point(219, 72);
            this.txtDN.Name = "txtDN";
            this.txtDN.Size = new System.Drawing.Size(393, 27);
            this.txtDN.TabIndex = 1;
            this.txtDN.Text = "QL_BSach";
            // 
            // txtP
            // 
            this.txtP.Location = new System.Drawing.Point(219, 158);
            this.txtP.Name = "txtP";
            this.txtP.PasswordChar = '*';
            this.txtP.Size = new System.Drawing.Size(393, 27);
            this.txtP.TabIndex = 3;
            this.txtP.Text = "123";
            // 
            // txtUID
            // 
            this.txtUID.Location = new System.Drawing.Point(219, 115);
            this.txtUID.Name = "txtUID";
            this.txtUID.Size = new System.Drawing.Size(393, 27);
            this.txtUID.TabIndex = 2;
            this.txtUID.Text = "sa";
            // 
            // txtSN
            // 
            this.txtSN.Location = new System.Drawing.Point(219, 29);
            this.txtSN.Name = "txtSN";
            this.txtSN.Size = new System.Drawing.Size(393, 27);
            this.txtSN.TabIndex = 0;
            this.txtSN.Text = "PHAMTUANDAT\\TUANDAT";
            // 
            // Connect_System
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(833, 408);
            this.Controls.Add(this.metroPanel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Connect_System";
            this.Style = MetroFramework.MetroColorStyle.Black;
            this.Text = "KẾT NỐI MÁY CHỦ";
            this.TextAlign = MetroFramework.Forms.MetroFormTextAlign.Center;
            this.metroPanel1.ResumeLayout(false);
            this.pnCN.ResumeLayout(false);
            this.pnCN.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private MetroFramework.Controls.MetroPanel metroPanel1;
        private System.Windows.Forms.Panel pnCN;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtSN;
        private System.Windows.Forms.Label lbP;
        private System.Windows.Forms.Label lbUID;
        private System.Windows.Forms.Label lbDN;
        private System.Windows.Forms.Label lbSN;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtDN;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtUID;
        private ComponentFactory.Krypton.Toolkit.KryptonTextBox txtP;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnTest;
        private ComponentFactory.Krypton.Toolkit.KryptonButton btnSave;
    }
}