<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Task_Info_Detail.aspx.cs" Inherits="PUB_Task_Info_Detail" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Powered By Hanstrong RIA Visual.NET From No.6 Design With 2015-1-6 9:50:25 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务单详情</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Task_Info_Detail.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="label1" style="position:absolute;top:18px;left:17px;width:72px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:14px;left:85px" Width="158px" Height="20px" ID="textbox1" ClientInstanceName="textbox1" runat="server" dsfield="ds.IsoNo" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label2" style="position:absolute;top:18px;left:263px;width:54px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">部门：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:12px;left:300px" Width="158px" Height="20px" ID="txtAppDep" ClientInstanceName="txtAppDep" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label3" style="position:absolute;top:17px;left:490px;width:54px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">专业：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:12px;left:526px" Width="120px" Height="20px" ID="textbox3" ClientInstanceName="textbox3" runat="server" dsfield="ds.Major" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label4" style="position:absolute;top:49px;left:41px;width:50px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">类别：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:45px;left:85px" Width="158px" Height="20px" ID="textbox4" ClientInstanceName="textbox4" runat="server" dsfield="ds.TypeName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label5" style="position:absolute;top:16px;left:680px;width:63px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请人：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:11px;left:735px" Width="84px" Height="20px" ID="txtAppUser" ClientInstanceName="txtAppUser" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label6" style="position:absolute;top:52px;left:263px;width:50px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">座机：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:45px;left:300px" Width="158px" Height="20px" ID="textbox6" ClientInstanceName="textbox6" runat="server" dsfield="ds.Phone" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label7" style="position:absolute;top:49px;left:489px;width:44px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">手机：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:44px;left:526px" Width="120px" Height="20px" ID="textbox7" ClientInstanceName="textbox7" runat="server" dsfield="ds.Mobile" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label8" style="position:absolute;top:80px;left:17px;width:65px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请时间：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:77px;left:85px" Width="70px" Height="20px" ID="textbox8" ClientInstanceName="textbox8" runat="server" dsfield="ds.AppDate" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:77px;left:158px" Width="20px" Height="20px" ID="textbox9" ClientInstanceName="textbox9" runat="server" dsfield="ds.apphh" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label9" style="position:absolute;top:81px;left:185px;width:16px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">时</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:77px;left:202px" Width="20px" Height="20px" ID="textbox10" ClientInstanceName="textbox10" runat="server" dsfield="ds.appmm" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label10" style="position:absolute;top:81px;left:227px;width:17px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">分</div>    
        <div id="label11" style="position:absolute;top:81px;left:253px;width:62px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">需要时间：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:76px;left:311px" Width="70px" Height="20px" ID="textbox11" ClientInstanceName="textbox11" runat="server" dsfield="ds.NeedDate" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:76px;left:384px" Width="20px" Height="20px" ID="textbox12" ClientInstanceName="textbox12" runat="server" dsfield="ds.needhh" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label12" style="position:absolute;top:80px;left:411px;width:14px;height:14px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">时</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:76px;left:426px" Width="20px" Height="20px" ID="textbox13" ClientInstanceName="textbox13" runat="server" dsfield="ds.needmm" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label13" style="position:absolute;top:80px;left:452px;width:20px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">分</div>    
        <div id="label14" style="position:absolute;top:49px;left:656px;width:86px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务发起人：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:43px;left:735px" Width="84px" Height="20px" ID="txtTaskUser" ClientInstanceName="txtTaskUser" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label15" style="position:absolute;top:16px;left:840px;width:64px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">制作人：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:11px;left:894px" Width="84px" Height="20px" ID="txtProducer" ClientInstanceName="txtProducer" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label16" style="position:absolute;top:81px;left:488px;width:53px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">状态：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:77px;left:526px" Width="120px" Height="20px" ID="combox8" ClientInstanceName="combox8" dsfield="ds.state" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        
    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:75px;left:653px" Width="76px" Height="25px" Text="更新" ID="button1" ClientInstanceName="button1" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_rotate_anticlockwise.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){StateUpdate()}"  />
        </dx:ASPxButton>    
        <div id="label17" style="position:absolute;top:47px;left:828px;width:75px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">记账月份：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:45px;left:894px" Width="84px" Height="20px" ID="textbox16" ClientInstanceName="textbox16" runat="server" dsfield="ds.AccountMonth" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label18" style="position:absolute;top:108px;left:17px;width:68px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务名称：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:106px;left:85px" Width="372px" Height="20px" ID="textbox17" ClientInstanceName="textbox17" runat="server" dsfield="ds.PrjName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label19" style="position:absolute;top:113px;left:489px;width:51px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">份数：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:107px;left:526px" Width="53px" Height="20px" ID="textbox18" ClientInstanceName="textbox18" runat="server" dsfield="ds.CopyCount" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:108px;left:735px" Width="84px" Height="20px" ID="textbox19" ClientInstanceName="textbox19" runat="server" dsfield="ds.ColorTypeName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label20" style="position:absolute;top:114px;left:692px;width:38px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">颜色：</div>    
        <div id="label21" style="position:absolute;top:110px;left:828px;width:68px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">设计阶段：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:107px;left:894px" Width="84px" Height="20px" ID="textbox20" ClientInstanceName="textbox20" runat="server" dsfield="ds.PhaseName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
    <div id="jqgrid1_pos" style="position:absolute; left:17px; top:134px;">
        <table id="jqgrid1_grid" onclick="jqgrid1.evClick()" ondblclick="jqgrid1.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jqgrid1_pager" style="text-align:center;display:none"></div>
    </div>    
        <div id="label22" style="position:absolute;top:259px;left:24px;width:71px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">封面要求：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:254px;left:86px" Width="90px" Height="20px" ID="textbox21" ClientInstanceName="textbox21" runat="server" dsfield="ds.CoverName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:253px;left:199px" Width="77px" Height="20px" ID="checkbox1" ClientInstanceName="checkbox1" runat="server" Text="脊背印字" dsfield="ds.IsPrint" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <div id="label23" style="position:absolute;top:256px;left:302px;width:80px;height:26px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">装订方式：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:253px;left:365px" Width="90px" Height="20px" ID="textbox22" ClientInstanceName="textbox22" runat="server" dsfield="ds.BookBindName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxCheckBox Enabled="true" Display="none" style="position:absolute;top:141px;left:1059px" Width="115px" Height="20px" ID="checkbox2" ClientInstanceName="checkbox2" runat="server" Text="需电子归档" dsfield="ds.IsArch" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <div id="label24" style="position:absolute;top:383px;left:459px;width:63px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">文件列表</div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:377px;left:878px" Width="121px" Height="25px" Text="下载全部文件" ID="button2" ClientInstanceName="button2" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_down.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){DownloadAllFiles()}"  />
        </dx:ASPxButton>    
<iframe id="iframe1" name="iframe1" frameborder="0" scrolling="auto" url="" parms="" style="position:absolute;top:404px;left:16px;width:983px;height:136px;display:block;border:1px solid #A0A0A0;"></iframe><script type="text/javascript">InitIframe('iframe1')</script>    
        <div id="label25" style="position:absolute;top:281px;left:458px;width:64px;height:22px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">特殊说明</div>    
        <dx:ASPxMemo Enabled="false" Display="block" style="position:absolute;top:297px;left:16px" Width="980px" Height="75px" ID="mtextbox1" ClientInstanceName="mtextbox1" Text="" dsfield="ds.memo" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="mtextbox">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxMemo>    
        <div id="label26" style="position:absolute;top:549px;left:460px;width:70px;height:22px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务日志</div>    
    <div id="jqgrid2_pos" style="position:absolute; left:15px; top:565px;">
        <table id="jqgrid2_grid" onclick="jqgrid2.evClick()" ondblclick="jqgrid2.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jqgrid2_pager" style="text-align:center;display:none"></div>
    </div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:695px;left:583px" Width="82px" Height="25px" Text="结算" ID="button3" ClientInstanceName="button3" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_down.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Caul()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:694px;left:669px" Width="112px" Height="25px" Text="电子归档" ID="btnArch" ClientInstanceName="btnArch" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(20,42).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ToArh()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:694px;left:784px" Width="135px" Height="25px" Text="打印委托单" ID="button5" ClientInstanceName="button5" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/book_open.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){PrintReport()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:694px;left:921px" Width="78px" Height="25px" Text="返回" ID="button6" ClientInstanceName="button6" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(47,25).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){dialog.close('re')}"  />
        </dx:ASPxButton>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:20px;left:1062px" Width="19px" Height="20px" ID="_txtAppDep" ClientInstanceName="_txtAppDep" runat="server" dsfield="ds.AppDep" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:21px;left:1113px" Width="19px" Height="20px" ID="_txtProducer" ClientInstanceName="_txtProducer" runat="server" dsfield="ds.Producer" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:20px;left:1138px" Width="19px" Height="20px" ID="_txtTaskUser" ClientInstanceName="_txtTaskUser" runat="server" dsfield="ds.TaskUser" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:20px;left:1089px" Width="19px" Height="20px" ID="_txtAppUser" ClientInstanceName="_txtAppUser" runat="server" dsfield="ds.AppUser" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:97px;left:1065px" Width="28px" Height="20px" ID="txtrid" ClientInstanceName="txtrid" runat="server" dsfield="ds.rowid" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:265px;left:1039px" Width="30px" Height="20px" ID="txtarch" ClientInstanceName="txtarch" runat="server" dsfield="ds.ArchState" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:267px;left:1082px" Width="28px" Height="20px" ID="txtover" ClientInstanceName="txtover" runat="server" dsfield="ds.OverState" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label27" style="position:absolute;top:259px;left:467px;width:68px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">电子归档：</div>    
        <div id="label28" style="position:absolute;top:258px;left:561px;width:48px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">结算：</div>    
        <div id="label29" style="position:absolute;top:255px;left:527px;width:27px;height:27px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">x</div>    
        <div id="label30" style="position:absolute;top:255px;left:598px;width:18px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">x</div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:377px;left:777px" Width="100px" Height="25px" Text="工具下载" ID="button7" ClientInstanceName="button7" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/wrench.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Tools()}"  />
        </dx:ASPxButton>    
        <div id="lbAllCost" style="position:absolute;top:255px;left:621px;width:48px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">￥</div>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:textbox1,s:'textbox1',t:'textbox',d:'ds.IsoNo',v:'出版单号',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtAppDep,s:'txtAppDep',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:textbox3,s:'textbox3',t:'textbox',d:'ds.Major',v:'专业',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox4,s:'textbox4',t:'textbox',d:'ds.TypeName',v:'任务类别名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtAppUser,s:'txtAppUser',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:textbox6,s:'textbox6',t:'textbox',d:'ds.Phone',v:'座机',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox7,s:'textbox7',t:'textbox',d:'ds.Mobile',v:'手机',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox8,s:'textbox8',t:'textbox',d:'ds.AppDate',v:'申请时间',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox9,s:'textbox9',t:'textbox',d:'ds.apphh',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox10,s:'textbox10',t:'textbox',d:'ds.appmm',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox11,s:'textbox11',t:'textbox',d:'ds.NeedDate',v:'需要时间',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox12,s:'textbox12',t:'textbox',d:'ds.needhh',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox13,s:'textbox13',t:'textbox',d:'ds.needmm',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtTaskUser,s:'txtTaskUser',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtProducer,s:'txtProducer',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:combox8,s:'combox8',t:'combox',d:'ds.state',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox16,s:'textbox16',t:'textbox',d:'ds.AccountMonth',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox17,s:'textbox17',t:'textbox',d:'ds.PrjName',v:'项目名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox18,s:'textbox18',t:'textbox',d:'ds.CopyCount',v:'份数',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox19,s:'textbox19',t:'textbox',d:'ds.ColorTypeName',v:'出版颜色',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox20,s:'textbox20',t:'textbox',d:'ds.PhaseName',v:'阶段名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox21,s:'textbox21',t:'textbox',d:'ds.CoverName',v:'封面要求名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:checkbox1,s:'checkbox1',t:'checkbox',d:'ds.IsPrint',v:'是否脊背印字',f:'',l:'50',k:false,n:true,r:true,w:true},{c:textbox22,s:'textbox22',t:'textbox',d:'ds.BookBindName',v:'装订方式名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:checkbox2,s:'checkbox2',t:'checkbox',d:'ds.IsArch',v:'是否需要归档',f:'',l:'50',k:false,n:true,r:true,w:true},{c:mtextbox1,s:'mtextbox1',t:'mtextbox',d:'ds.memo',v:'备注',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtAppDep,s:'_txtAppDep',t:'textbox',d:'ds.AppDep',v:'申请部门',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtProducer,s:'_txtProducer',t:'textbox',d:'ds.Producer',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtTaskUser,s:'_txtTaskUser',t:'textbox',d:'ds.TaskUser',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtAppUser,s:'_txtAppUser',t:'textbox',d:'ds.AppUser',v:'申请人',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtrid,s:'txtrid',t:'textbox',d:'ds.rowid',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtarch,s:'txtarch',t:'textbox',d:'ds.ArchState',v:'是否已归档',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtover,s:'txtover',t:'textbox',d:'ds.OverState',v:'是否已结算',f:'',l:'50',k:false,n:true,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'null',data:<%=GetDataSetJson("ds",10000) %>});ds.Bind2Ctrl();
        var dsVol = new dataset({id:'dsVol',grid:'jqgrid1',data:<%=GetDataSetJson("dsVol",10000,"") %>});dsVol.Bind2Ctrl();
        var dsLog = new dataset({id:'dsLog',grid:'jqgrid2',data:<%=GetDataSetJson("dsLog",10000,"") %>});dsLog.Bind2Ctrl();
        
        var jqgrid1 = $("#jqgrid1_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("dsVol","") %>,
            left:17,top:134,height:89,width:982,multiselect:false,rownumbers:true,dataset:dsVol,caption:"",haveFootBar:false,rowNum:10000,pager:$("#jqgrid1_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jqgrid1.RowIndex=jqgrid1.getInd(id);jqgrid1.ColIndex=ic},
            onPaging:function(pgb){jqgrid1.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){jqgrid1.OrderByCol(fd,ic,ord,'');}
        }));jqgrid1.InitData();
        var jqgrid2 = $("#jqgrid2_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("dsLog","") %>,
            left:15,top:565,height:101,width:983,multiselect:false,rownumbers:false,dataset:dsLog,caption:"",haveFootBar:false,rowNum:10000,pager:$("#jqgrid2_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jqgrid2.RowIndex=jqgrid2.getInd(id);jqgrid2.ColIndex=ic},
            onPaging:function(pgb){jqgrid2.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){jqgrid2.OrderByCol(fd,ic,ord,'');}
        }));jqgrid2.InitData();
        
    </script>
</body>
</html>
