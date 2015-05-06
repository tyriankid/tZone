namespace Hanstrong.Decrypts
{
    partial class FileTransferDialog {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FileTransferDialog));
            this.grpTotal = new System.Windows.Forms.GroupBox();
            this.labRunTime = new System.Windows.Forms.Label();
            this.labTotalPercent = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.labSumSize = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.toltalProgressBar = new System.Windows.Forms.ProgressBar();
            this.grpCurrent = new System.Windows.Forms.GroupBox();
            this.labState = new System.Windows.Forms.Label();
            this.labSinglePercent = new System.Windows.Forms.Label();
            this.labSingleSize = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.transProgressBar = new System.Windows.Forms.ProgressBar();
            this.labFileName = new System.Windows.Forms.Label();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnBackground = new System.Windows.Forms.Button();
            this.sysNotify = new System.Windows.Forms.NotifyIcon(this.components);
            this.readyDataTimer = new System.Windows.Forms.Timer(this.components);
            this.readySpeedTimer = new System.Windows.Forms.Timer(this.components);
            this.grpTotal.SuspendLayout();
            this.grpCurrent.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpTotal
            // 
            this.grpTotal.Controls.Add(this.labRunTime);
            this.grpTotal.Controls.Add(this.labTotalPercent);
            this.grpTotal.Controls.Add(this.label8);
            this.grpTotal.Controls.Add(this.labSumSize);
            this.grpTotal.Controls.Add(this.label6);
            this.grpTotal.Controls.Add(this.toltalProgressBar);
            this.grpTotal.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpTotal.Location = new System.Drawing.Point(5, 109);
            this.grpTotal.Name = "grpTotal";
            this.grpTotal.Size = new System.Drawing.Size(292, 78);
            this.grpTotal.TabIndex = 5;
            this.grpTotal.TabStop = false;
            this.grpTotal.Text = "任务进度";
            // 
            // labRunTime
            // 
            this.labRunTime.AutoSize = true;
            this.labRunTime.Location = new System.Drawing.Point(227, 38);
            this.labRunTime.Margin = new System.Windows.Forms.Padding(3, 0, 0, 0);
            this.labRunTime.Name = "labRunTime";
            this.labRunTime.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.labRunTime.Size = new System.Drawing.Size(53, 12);
            this.labRunTime.TabIndex = 6;
            this.labRunTime.Text = "运行时间";
            this.labRunTime.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // labTotalPercent
            // 
            this.labTotalPercent.AutoSize = true;
            this.labTotalPercent.Location = new System.Drawing.Point(71, 38);
            this.labTotalPercent.Name = "labTotalPercent";
            this.labTotalPercent.Size = new System.Drawing.Size(17, 12);
            this.labTotalPercent.TabIndex = 2;
            this.labTotalPercent.Text = "0%";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(6, 38);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(59, 12);
            this.label8.TabIndex = 1;
            this.label8.Text = "完成比例:";
            // 
            // labSumSize
            // 
            this.labSumSize.AutoSize = true;
            this.labSumSize.Location = new System.Drawing.Point(71, 17);
            this.labSumSize.Name = "labSumSize";
            this.labSumSize.Size = new System.Drawing.Size(23, 12);
            this.labSumSize.TabIndex = 1;
            this.labSumSize.Text = "0/0";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(6, 17);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(59, 12);
            this.label6.TabIndex = 0;
            this.label6.Text = "完成数量:";
            // 
            // toltalProgressBar
            // 
            this.toltalProgressBar.Location = new System.Drawing.Point(8, 57);
            this.toltalProgressBar.Name = "toltalProgressBar";
            this.toltalProgressBar.Size = new System.Drawing.Size(278, 12);
            this.toltalProgressBar.TabIndex = 0;
            // 
            // grpCurrent
            // 
            this.grpCurrent.Controls.Add(this.labState);
            this.grpCurrent.Controls.Add(this.labSinglePercent);
            this.grpCurrent.Controls.Add(this.labSingleSize);
            this.grpCurrent.Controls.Add(this.label3);
            this.grpCurrent.Controls.Add(this.label2);
            this.grpCurrent.Controls.Add(this.label1);
            this.grpCurrent.Controls.Add(this.transProgressBar);
            this.grpCurrent.Controls.Add(this.labFileName);
            this.grpCurrent.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpCurrent.Location = new System.Drawing.Point(5, 5);
            this.grpCurrent.Name = "grpCurrent";
            this.grpCurrent.Size = new System.Drawing.Size(292, 104);
            this.grpCurrent.TabIndex = 4;
            this.grpCurrent.TabStop = false;
            this.grpCurrent.Text = "传输进度";
            // 
            // labState
            // 
            this.labState.AutoSize = true;
            this.labState.Location = new System.Drawing.Point(71, 41);
            this.labState.Name = "labState";
            this.labState.Size = new System.Drawing.Size(29, 12);
            this.labState.TabIndex = 7;
            this.labState.Text = "开始";
            // 
            // labSinglePercent
            // 
            this.labSinglePercent.AutoSize = true;
            this.labSinglePercent.Location = new System.Drawing.Point(259, 62);
            this.labSinglePercent.Name = "labSinglePercent";
            this.labSinglePercent.Size = new System.Drawing.Size(17, 12);
            this.labSinglePercent.TabIndex = 6;
            this.labSinglePercent.Text = "0%";
            // 
            // labSingleSize
            // 
            this.labSingleSize.AutoSize = true;
            this.labSingleSize.Location = new System.Drawing.Point(71, 62);
            this.labSingleSize.Name = "labSingleSize";
            this.labSingleSize.Size = new System.Drawing.Size(41, 12);
            this.labSingleSize.TabIndex = 5;
            this.labSingleSize.Text = "label4";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 62);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(59, 12);
            this.label3.TabIndex = 4;
            this.label3.Text = "传输进度:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 41);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 12);
            this.label2.TabIndex = 3;
            this.label2.Text = "传输状态:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 12);
            this.label1.TabIndex = 2;
            this.label1.Text = "当前文件:";
            // 
            // transProgressBar
            // 
            this.transProgressBar.Location = new System.Drawing.Point(8, 82);
            this.transProgressBar.Name = "transProgressBar";
            this.transProgressBar.Size = new System.Drawing.Size(278, 12);
            this.transProgressBar.TabIndex = 0;
            // 
            // labFileName
            // 
            this.labFileName.AutoSize = true;
            this.labFileName.Location = new System.Drawing.Point(71, 21);
            this.labFileName.Name = "labFileName";
            this.labFileName.Size = new System.Drawing.Size(41, 12);
            this.labFileName.TabIndex = 1;
            this.labFileName.Text = "文件名";
            // 
            // btnCancel
            // 
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(181, 193);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(110, 22);
            this.btnCancel.TabIndex = 6;
            this.btnCancel.Text = "取消(&C)";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnBackground
            // 
            this.btnBackground.DialogResult = System.Windows.Forms.DialogResult.Ignore;
            this.btnBackground.Location = new System.Drawing.Point(67, 193);
            this.btnBackground.Name = "btnBackground";
            this.btnBackground.Size = new System.Drawing.Size(110, 22);
            this.btnBackground.TabIndex = 6;
            this.btnBackground.Text = "后台(&B)";
            this.btnBackground.UseVisualStyleBackColor = true;
            this.btnBackground.Click += new System.EventHandler(this.btnBackground_Click);
            // 
            // sysNotify
            // 
            this.sysNotify.Icon = ((System.Drawing.Icon)(resources.GetObject("sysNotify.Icon")));
            // 
            // readyDataTimer
            // 
            this.readyDataTimer.Tick += new System.EventHandler(this.readyDataTimer_Tick);
            // 
            // readySpeedTimer
            // 
            this.readySpeedTimer.Interval = 1000;
            this.readySpeedTimer.Tick += new System.EventHandler(this.readySpeedTimer_Tick);
            // 
            // FileTransferDialog
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(302, 221);
            this.Controls.Add(this.btnBackground);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.grpTotal);
            this.Controls.Add(this.grpCurrent);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "FileTransferDialog";
            this.Padding = new System.Windows.Forms.Padding(5);
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "文件";
            this.TopMost = true;
            this.Load += new System.EventHandler(this.frmTransferDialog_Load);
            this.grpTotal.ResumeLayout(false);
            this.grpTotal.PerformLayout();
            this.grpCurrent.ResumeLayout(false);
            this.grpCurrent.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpTotal;
        private System.Windows.Forms.GroupBox grpCurrent;
        private System.Windows.Forms.Label label1;
        internal System.Windows.Forms.Label labFileName;
        private System.Windows.Forms.Label labSinglePercent;
        private System.Windows.Forms.Label labSingleSize;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnBackground;
        private System.Windows.Forms.Label labTotalPercent;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label labSumSize;
        private System.Windows.Forms.Label label6;
        internal System.Windows.Forms.ProgressBar toltalProgressBar;
        private System.Windows.Forms.Label labState;
        private System.Windows.Forms.NotifyIcon sysNotify;
        private System.Windows.Forms.Timer readyDataTimer;
        public System.Windows.Forms.ProgressBar transProgressBar;
        private System.Windows.Forms.Timer readySpeedTimer;
        private System.Windows.Forms.Label labRunTime;



    }
}