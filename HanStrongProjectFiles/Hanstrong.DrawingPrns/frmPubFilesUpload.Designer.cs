namespace Hanstrong.Decrypts
{
    partial class frmPubFilesUpload
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
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.grpCurrent = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.transProgressBar = new System.Windows.Forms.ProgressBar();
            this.labFileName = new System.Windows.Forms.Label();
            this.labState = new System.Windows.Forms.Label();
            this.labSingleSize = new System.Windows.Forms.Label();
            this.labSinglePercent = new System.Windows.Forms.Label();
            this.grpTotal = new System.Windows.Forms.GroupBox();
            this.toltalProgressBar = new System.Windows.Forms.ProgressBar();
            this.label6 = new System.Windows.Forms.Label();
            this.labTotalPercent = new System.Windows.Forms.Label();
            this.labSumSize = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.labRunTime = new System.Windows.Forms.Label();
            this.btnBackground = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.sysNotify = new System.Windows.Forms.NotifyIcon(this.components);
            this.readyDataTimer = new System.Windows.Forms.Timer(this.components);
            this.readySpeedTimer = new System.Windows.Forms.Timer(this.components);
            this.grpCurrent.SuspendLayout();
            this.grpTotal.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 12);
            this.label1.TabIndex = 6;
            this.label1.Text = "当前文件：";
            // 
            // grpCurrent
            // 
            this.grpCurrent.Controls.Add(this.transProgressBar);
            this.grpCurrent.Controls.Add(this.label3);
            this.grpCurrent.Controls.Add(this.label2);
            this.grpCurrent.Controls.Add(this.labSinglePercent);
            this.grpCurrent.Controls.Add(this.labSingleSize);
            this.grpCurrent.Controls.Add(this.labState);
            this.grpCurrent.Controls.Add(this.labFileName);
            this.grpCurrent.Controls.Add(this.label1);
            this.grpCurrent.Location = new System.Drawing.Point(12, 12);
            this.grpCurrent.Name = "grpCurrent";
            this.grpCurrent.Size = new System.Drawing.Size(312, 123);
            this.grpCurrent.TabIndex = 7;
            this.grpCurrent.TabStop = false;
            this.grpCurrent.Text = "传输进度";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(18, 45);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 12);
            this.label2.TabIndex = 6;
            this.label2.Text = "传输状态：";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(18, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 12);
            this.label3.TabIndex = 6;
            this.label3.Text = "传输进度：";
            // 
            // transProgressBar
            // 
            this.transProgressBar.Location = new System.Drawing.Point(6, 101);
            this.transProgressBar.Name = "transProgressBar";
            this.transProgressBar.Size = new System.Drawing.Size(296, 10);
            this.transProgressBar.TabIndex = 7;
            // 
            // labFileName
            // 
            this.labFileName.AutoSize = true;
            this.labFileName.Location = new System.Drawing.Point(89, 17);
            this.labFileName.Name = "labFileName";
            this.labFileName.Size = new System.Drawing.Size(41, 12);
            this.labFileName.TabIndex = 6;
            this.labFileName.Text = "文件名";
            // 
            // labState
            // 
            this.labState.AutoSize = true;
            this.labState.Location = new System.Drawing.Point(89, 45);
            this.labState.Name = "labState";
            this.labState.Size = new System.Drawing.Size(29, 12);
            this.labState.TabIndex = 6;
            this.labState.Text = "开始";
            // 
            // labSingleSize
            // 
            this.labSingleSize.AutoSize = true;
            this.labSingleSize.Location = new System.Drawing.Point(89, 74);
            this.labSingleSize.Name = "labSingleSize";
            this.labSingleSize.Size = new System.Drawing.Size(41, 12);
            this.labSingleSize.TabIndex = 6;
            this.labSingleSize.Text = "label4";
            // 
            // labSinglePercent
            // 
            this.labSinglePercent.AutoSize = true;
            this.labSinglePercent.Location = new System.Drawing.Point(285, 74);
            this.labSinglePercent.Name = "labSinglePercent";
            this.labSinglePercent.Size = new System.Drawing.Size(17, 12);
            this.labSinglePercent.TabIndex = 6;
            this.labSinglePercent.Text = "0%";
            // 
            // grpTotal
            // 
            this.grpTotal.Controls.Add(this.toltalProgressBar);
            this.grpTotal.Controls.Add(this.label6);
            this.grpTotal.Controls.Add(this.labRunTime);
            this.grpTotal.Controls.Add(this.labTotalPercent);
            this.grpTotal.Controls.Add(this.labSumSize);
            this.grpTotal.Controls.Add(this.label11);
            this.grpTotal.Location = new System.Drawing.Point(12, 141);
            this.grpTotal.Name = "grpTotal";
            this.grpTotal.Size = new System.Drawing.Size(312, 90);
            this.grpTotal.TabIndex = 7;
            this.grpTotal.TabStop = false;
            this.grpTotal.Text = "任务进度";
            // 
            // toltalProgressBar
            // 
            this.toltalProgressBar.Location = new System.Drawing.Point(6, 71);
            this.toltalProgressBar.Name = "toltalProgressBar";
            this.toltalProgressBar.Size = new System.Drawing.Size(296, 10);
            this.toltalProgressBar.TabIndex = 7;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(18, 45);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(65, 12);
            this.label6.TabIndex = 6;
            this.label6.Text = "完成比例：";
            // 
            // labTotalPercent
            // 
            this.labTotalPercent.AutoSize = true;
            this.labTotalPercent.Location = new System.Drawing.Point(89, 45);
            this.labTotalPercent.Name = "labTotalPercent";
            this.labTotalPercent.Size = new System.Drawing.Size(17, 12);
            this.labTotalPercent.TabIndex = 6;
            this.labTotalPercent.Text = "0%";
            // 
            // labSumSize
            // 
            this.labSumSize.AutoSize = true;
            this.labSumSize.Location = new System.Drawing.Point(89, 17);
            this.labSumSize.Name = "labSumSize";
            this.labSumSize.Size = new System.Drawing.Size(23, 12);
            this.labSumSize.TabIndex = 6;
            this.labSumSize.Text = "0/0";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(18, 17);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(65, 12);
            this.label11.TabIndex = 6;
            this.label11.Text = "完成数量：";
            // 
            // labRunTime
            // 
            this.labRunTime.AutoSize = true;
            this.labRunTime.Location = new System.Drawing.Point(249, 45);
            this.labRunTime.Name = "labRunTime";
            this.labRunTime.Size = new System.Drawing.Size(53, 12);
            this.labRunTime.TabIndex = 6;
            this.labRunTime.Text = "运行时间";
            // 
            // btnBackground
            // 
            this.btnBackground.DialogResult = System.Windows.Forms.DialogResult.Ignore;
            this.btnBackground.Location = new System.Drawing.Point(103, 237);
            this.btnBackground.Name = "btnBackground";
            this.btnBackground.Size = new System.Drawing.Size(99, 24);
            this.btnBackground.TabIndex = 8;
            this.btnBackground.Text = "后台(&B)";
            this.btnBackground.UseVisualStyleBackColor = true;
            // 
            // btnCancel
            // 
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(208, 237);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(99, 24);
            this.btnCancel.TabIndex = 8;
            this.btnCancel.Text = "取消(&C)";
            this.btnCancel.UseVisualStyleBackColor = true;
            // 
            // sysNotify
            // 
            this.sysNotify.Text = "notifyIcon1";
            this.sysNotify.Visible = true;
            // 
            // readySpeedTimer
            // 
            this.readySpeedTimer.Interval = 1000;
            // 
            // frmPubFilesUpload
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(336, 273);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnBackground);
            this.Controls.Add(this.grpTotal);
            this.Controls.Add(this.grpCurrent);
            this.Name = "frmPubFilesUpload";
            this.Text = "frmPubFilesUpload";
            this.grpCurrent.ResumeLayout(false);
            this.grpCurrent.PerformLayout();
            this.grpTotal.ResumeLayout(false);
            this.grpTotal.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox grpCurrent;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ProgressBar transProgressBar;
        private System.Windows.Forms.Label labFileName;
        private System.Windows.Forms.Label labSingleSize;
        private System.Windows.Forms.Label labState;
        private System.Windows.Forms.Label labSinglePercent;
        private System.Windows.Forms.GroupBox grpTotal;
        private System.Windows.Forms.ProgressBar toltalProgressBar;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label labTotalPercent;
        private System.Windows.Forms.Label labSumSize;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label labRunTime;
        private System.Windows.Forms.Button btnBackground;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.NotifyIcon sysNotify;
        private System.Windows.Forms.Timer readyDataTimer;
        private System.Windows.Forms.Timer readySpeedTimer;
    }
}