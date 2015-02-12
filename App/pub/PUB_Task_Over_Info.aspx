<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Task_Over_Info.aspx.cs" Inherits="PUB_Task_Over_Info" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.5 Design With 2015-1-6 10:41:31 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务管理结算页面</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Task_Over_Info.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
<div id="div3" style="position:absolute;top:377px;left:5px;width:966px;height:142px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
        <div id="label1" style="position:absolute;top:12px;left:11px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号</div>    
        <div id="labelPImg" style="position:absolute;top:315px;left:12px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">工程图 (白,蓝图)</div>    
        <div id="labelCT" style="position:absolute;top:280px;left:12px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">彩色写真(卫片)</div>    
        <div id="labelCP" style="position:absolute;top:255px;left:10px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">彩色打印</div>    
        <div id="labelbwPrint" style="position:absolute;top:227px;left:11px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">黑白打印</div>    
        <div id="labelBindType" style="position:absolute;top:190px;left:272px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">装订方式</div>    
        <div id="labelRequire" style="position:absolute;top:193px;left:11px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">封面要求</div>    
        <div id="labelSp" style="position:absolute;top:191px;left:721px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">特殊说明</div>    
        <div id="labelCount" style="position:absolute;top:41px;left:395px;width:35px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">份数</div>    
        <div id="labelMonth" style="position:absolute;top:12px;left:827px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">记账月份</div>    
        <div id="labelProducer" style="position:absolute;top:12px;left:672px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">制作人</div>    
        <div id="labelAppUser" style="position:absolute;top:14px;left:529px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请人</div>    
        <div id="labelMajor" style="position:absolute;top:11px;left:395px;width:33px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">专业</div>    
        <div id="labeldep" style="position:absolute;top:11px;left:209px;width:36px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">部门</div>    
        <div id="labelTaskName" style="position:absolute;top:42px;left:12px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务名称</div>    
        <dx:ASPxMemo Enabled="false" Display="block" style="position:absolute;top:41px;left:533px" Width="437px" Height="136px" ID="tbaSp" ClientInstanceName="tbaSp" Text="" dsfield="ds.Memo" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="mtextbox">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxMemo>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:188px;left:167px" Width="88px" Height="20px" ID="cbIsBackFont" ClientInstanceName="cbIsBackFont" runat="server" Text="脊背印字" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:186px;left:438px" Width="128px" Height="20px" ID="cbArch" ClientInstanceName="cbArch" runat="server" Text="需电子归档" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:8px;left:69px" Width="137px" Height="20px" ID="tbIsoNo" ClientInstanceName="tbIsoNo" runat="server" dsfield="ds.IsoNo" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:8px;left:241px" Width="147px" Height="20px" ID="tbAppDep" ClientInstanceName="tbAppDep" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:9px;left:727px" Width="84px" Height="20px" ID="tbProducer" ClientInstanceName="tbProducer" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:9px;left:580px" Width="84px" Height="20px" ID="tbAppUser" ClientInstanceName="tbAppUser" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:8px;left:437px" Width="84px" Height="20px" ID="tbMajor" ClientInstanceName="tbMajor" runat="server" dsfield="ds.Major" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:8px;left:886px" Width="84px" Height="20px" ID="tbMonth" ClientInstanceName="tbMonth" runat="server" dsfield="ds.AccountMonth" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:36px;left:69px" Width="320px" Height="20px" ID="tbTaskName" ClientInstanceName="tbTaskName" runat="server" dsfield="ds.PrjName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:188px;left:67px" Width="90px" Height="20px" ID="tbRequire" ClientInstanceName="tbRequire" runat="server" dsfield="ds.CoverName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:186px;left:331px" Width="90px" Height="20px" ID="tbBindType" ClientInstanceName="tbBindType" runat="server" dsfield="ds.BookBindName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:37px;left:438px" Width="82px" Height="20px" ID="tbCount" ClientInstanceName="tbCount" runat="server" dsfield="ds.CopyCount" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
<div id="divPrint" style="position:absolute;top:214px;left:5px;width:965px;height:157px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
        <div id="labelGlueBind" style="position:absolute;top:351px;left:71px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">胶装</div>    
        <div id="label1_c_c" style="position:absolute;top:395px;left:14px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号</div>    
        <div id="labelPA0" style="position:absolute;top:318px;left:815px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A0</div>    
        <div id="labelPA1" style="position:absolute;top:317px;left:628px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A1</div>    
        <div id="labelPA2" style="position:absolute;top:314px;left:425px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A2</div>    
        <div id="labelPA3" style="position:absolute;top:314px;left:245px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3</div>    
        <div id="labelPA4" style="position:absolute;top:317px;left:70px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4</div>    
        <div id="labelCA0" style="position:absolute;top:286px;left:423px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A0</div>    
        <div id="labelCA1" style="position:absolute;top:283px;left:245px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A1</div>    
        <div id="labelCA2" style="position:absolute;top:286px;left:71px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A2</div>    
        <div id="labelCA3" style="position:absolute;top:254px;left:817px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3＋</div>    
        <div id="labelCA3D" style="position:absolute;top:255px;left:628px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3双面</div>    
        <div id="labelCA3S" style="position:absolute;top:254px;left:424px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3单面</div>    
        <div id="labelCA4D" style="position:absolute;top:252px;left:245px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4双面</div>    
        <div id="labelCA4S" style="position:absolute;top:253px;left:69px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4单面</div>    
        <div id="labelBA3" style="position:absolute;top:224px;left:817px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3＋</div>    
        <div id="labelBA3D" style="position:absolute;top:223px;left:628px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3双面</div>    
        <div id="labelBA3S" style="position:absolute;top:225px;left:423px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3单面</div>    
        <div id="labelBA4D" style="position:absolute;top:225px;left:246px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4双面</div>    
        <div id="labelZ18" style="position:absolute;top:321px;left:755px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelBA4S" style="position:absolute;top:224px;left:68px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4单面</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:222px;left:126px" Width="60px" Height="20px" ID="btBox_BA4S" ClientInstanceName="btBox_BA4S" Text="" dsfield="dsOver.BA4S" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="labelZ25" style="position:absolute;top:394px;left:197px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">页</div>    
        <div id="labelZ16" style="position:absolute;top:318px;left:375px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ15" style="position:absolute;top:319px;left:197px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ14" style="position:absolute;top:287px;left:550px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ13" style="position:absolute;top:286px;left:375px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ12" style="position:absolute;top:287px;left:197px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ11" style="position:absolute;top:257px;left:944px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ10" style="position:absolute;top:257px;left:755px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ9" style="position:absolute;top:255px;left:550px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ8" style="position:absolute;top:254px;left:375px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ7" style="position:absolute;top:255px;left:197px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ6" style="position:absolute;top:230px;left:944px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ5" style="position:absolute;top:230px;left:755px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ4" style="position:absolute;top:228px;left:550px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ3" style="position:absolute;top:227px;left:375px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ2" style="position:absolute;top:228px;left:197px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:345px;left:126px" Width="60px" Height="20px" ID="btBox_GlueBind_Int" ClientInstanceName="btBox_GlueBind_Int" Text="" dsfield="dsOver.GlueBind" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:314px;left:871px" Width="60px" Height="20px" ID="btBox_PA0" ClientInstanceName="btBox_PA0" Text="" dsfield="dsOver.PA0" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:314px;left:683px" Width="60px" Height="20px" ID="btBox_PA1" ClientInstanceName="btBox_PA1" Text="" dsfield="dsOver.PA1" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:314px;left:480px" Width="60px" Height="20px" ID="btBox_PA2" ClientInstanceName="btBox_PA2" Text="" dsfield="dsOver.PA2" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:314px;left:303px" Width="60px" Height="20px" ID="btBox_PA3" ClientInstanceName="btBox_PA3" Text="" dsfield="dsOver.PA3" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:314px;left:126px" Width="60px" Height="20px" ID="btBox_PA4" ClientInstanceName="btBox_PA4" Text="" dsfield="dsOver.PA4" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:283px;left:480px" Width="60px" Height="20px" ID="btBox_CA0" ClientInstanceName="btBox_CA0" Text="" dsfield="dsOver.CA0" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:283px;left:303px" Width="60px" Height="20px" ID="btBox_CA1" ClientInstanceName="btBox_CA1" Text="" dsfield="dsOver.CA1" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:283px;left:126px" Width="60px" Height="20px" ID="btBox_CA2" ClientInstanceName="btBox_CA2" Text="" dsfield="dsOver.CA2" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:251px;left:871px" Width="60px" Height="20px" ID="btBox_CA3" ClientInstanceName="btBox_CA3" Text="" dsfield="dsOver.CA3plus" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:251px;left:683px" Width="60px" Height="20px" ID="btBox_CA3D" ClientInstanceName="btBox_CA3D" Text="" dsfield="dsOver.CA3D" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:251px;left:480px" Width="60px" Height="20px" ID="btBox_CA3S" ClientInstanceName="btBox_CA3S" Text="" dsfield="dsOver.CA3S" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:251px;left:303px" Width="60px" Height="20px" ID="btBox_CA4D" ClientInstanceName="btBox_CA4D" Text="" dsfield="dsOver.CA4D" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:251px;left:126px" Width="60px" Height="20px" ID="btBox_CA4S" ClientInstanceName="btBox_CA4S" Text="" dsfield="dsOver.CA4S" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:222px;left:871px" Width="60px" Height="20px" ID="btBox_BA3" ClientInstanceName="btBox_BA3" Text="" dsfield="dsOver.BA3plus" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:222px;left:683px" Width="60px" Height="20px" ID="btBox_BA3D" ClientInstanceName="btBox_BA3D" Text="" dsfield="dsOver.BA3D" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:222px;left:480px" Width="60px" Height="20px" ID="btBox_BA3S" ClientInstanceName="btBox_BA3S" Text="" dsfield="dsOver.BA3S" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:222px;left:303px" Width="60px" Height="20px" ID="btBox_BA4D" ClientInstanceName="btBox_BA4D" Text="" dsfield="dsOver.BA4D" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
<div id="div1" style="position:absolute;top:382px;left:1060px;width:122px;height:165px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
        <div id="labelZ24" style="position:absolute;top:347px;left:754px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">Kg</div>    
        <div id="labelZ21" style="position:absolute;top:350px;left:375px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">本</div>    
        <div id="labelZ23" style="position:absolute;top:351px;left:550px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">本</div>    
        <div id="labelZ20" style="position:absolute;top:351px;left:197px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">本</div>    
        <div id="labelZ19" style="position:absolute;top:321px;left:944px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ17" style="position:absolute;top:319px;left:550px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:388px;left:126px" Width="60px" Height="20px" ID="btBox_ComposingPage_Int" ClientInstanceName="btBox_ComposingPage_Int" Text="" dsfield="dsOver.ComposingPage" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="labelAddPrint" style="position:absolute;top:351px;left:625px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">加晒</div>    
        <div id="labelPinBind" style="position:absolute;top:350px;left:424px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">订装</div>    
        <div id="labelBackFont1" style="position:absolute;top:349px;left:234px;width:65px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">脊背字对位</div>    
        <div id="labelBind" style="position:absolute;top:352px;left:12px;width:57px;height:17px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">装订</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:455px;left:480px" Width="60px" Height="20px" ID="btBox_ArchBag_Int" ClientInstanceName="btBox_ArchBag_Int" Text="" dsfield="dsOver.ArchBag" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:345px;left:683px" Width="60px" Height="20px" ID="btBox_AddPrint_Int" ClientInstanceName="btBox_AddPrint_Int" Text="" dsfield="dsOver.AddPrint" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:345px;left:480px" Width="60px" Height="20px" ID="btBox_PinBind_Int" ClientInstanceName="btBox_PinBind_Int" Text="" dsfield="dsOver.PinBind" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:345px;left:303px" Width="60px" Height="20px" ID="btBox_BackFont_Int" ClientInstanceName="btBox_BackFont_Int" Text="" dsfield="dsOver.BackFont" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="label1_c_c_c" style="position:absolute;top:395px;left:14px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号</div>    
        <div id="labelDesign" style="position:absolute;top:394px;left:13px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">设计制作</div>    
        <div id="labelMemo" style="position:absolute;top:564px;left:5px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">结算备注</div>    
        <div id="labelOtherPrj" style="position:absolute;top:495px;left:68px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">其他项目</div>    
        <div id="labelArchBag" style="position:absolute;top:454px;left:430px;width:40px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">档案袋(小)</div>    
        <div id="labelTwoPhoto" style="position:absolute;top:454px;left:247px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">2寸相片</div>    
        <div id="labelOnePhoto" style="position:absolute;top:457px;left:70px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">1寸相片</div>    
        <div id="labelDesignCost" style="position:absolute;top:393px;left:632px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">设计费</div>    
        <div id="labelUDisk" style="position:absolute;top:423px;left:422px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">U盘</div>    
        <div id="labelScanPage" style="position:absolute;top:394px;left:421px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">扫描</div>    
        <div id="labelCdRom" style="position:absolute;top:425px;left:248px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">光盘</div>    
        <div id="labelEditPage" style="position:absolute;top:391px;left:247px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">编辑</div>    
        <div id="labelVisitingCard" style="position:absolute;top:426px;left:73px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">名片</div>    
        <div id="labelComposingPage" style="position:absolute;top:393px;left:77px;width:43px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">排版</div>    
        <div id="labelOther" style="position:absolute;top:427px;left:14px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">杂件</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:488px;left:480px" Width="60px" Height="20px" ID="btBox_OthPrjCost" ClientInstanceName="btBox_OthPrjCost" Text="" dsfield="dsOver.OtherCost" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:454px;left:303px" Width="60px" Height="20px" ID="btBox_TwoPhoto_Int" ClientInstanceName="btBox_TwoPhoto_Int" Text="" dsfield="dsOver.TwoPhoto" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:455px;left:126px" Width="60px" Height="20px" ID="btBox_OnePhoto_Int" ClientInstanceName="btBox_OnePhoto_Int" Text="" dsfield="dsOver.OnePhoto" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:388px;left:683px" Width="60px" Height="20px" ID="btBox_DesignCost" ClientInstanceName="btBox_DesignCost" Text="" dsfield="dsOver.DesignCost" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:422px;left:480px" Width="60px" Height="20px" ID="btBox_UDisk_Int" ClientInstanceName="btBox_UDisk_Int" Text="" dsfield="dsOver.UDisk" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:388px;left:480px" Width="60px" Height="20px" ID="btBox_ScanPage_Int" ClientInstanceName="btBox_ScanPage_Int" Text="" dsfield="dsOver.ScanPage" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:421px;left:303px" Width="60px" Height="20px" ID="btBox_CdRom_Int" ClientInstanceName="btBox_CdRom_Int" Text="" dsfield="dsOver.CdRom" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:387px;left:303px" Width="60px" Height="20px" ID="btBox_EditPage_Int" ClientInstanceName="btBox_EditPage_Int" Text="" dsfield="dsOver.EditPage" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:422px;left:126px" Width="60px" Height="20px" ID="btBox_VisitingCard_Int" ClientInstanceName="btBox_VisitingCard_Int" Text="" dsfield="dsOver.VisitingCard" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="labelZ32" style="position:absolute;top:458px;left:197px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ28" style="position:absolute;top:390px;left:753px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ31" style="position:absolute;top:426px;left:551px;width:64px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">个(折合A4)</div>    
        <div id="labelZ27" style="position:absolute;top:394px;left:552px;width:65px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张(折合A4)</div>    
        <div id="labelZ30" style="position:absolute;top:427px;left:375px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ26" style="position:absolute;top:393px;left:375px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">页</div>    
        <div id="labelZ29" style="position:absolute;top:428px;left:197px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">盒</div>    
        <div id="labelZ33" style="position:absolute;top:457px;left:375px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">张</div>    
        <div id="labelZ35" style="position:absolute;top:493px;left:550px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelOtherPrjCost" style="position:absolute;top:491px;left:429px;width:38px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">费用</div>    
        <div id="labelZ34" style="position:absolute;top:462px;left:551px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">个</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:490px;left:126px" Width="240px" Height="20px" ID="tbOthPrjName" ClientInstanceName="tbOthPrjName" runat="server" dsfield="dsOver.OtherPrj" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxMemo Enabled="true" Display="block" style="position:absolute;top:525px;left:70px" Width="903px" Height="94px" ID="txaMemo" ClientInstanceName="txaMemo" Text="" dsfield="dsOver.Memo" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="mtextbox">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxMemo>    
    <div id="gd_pos" style="position:absolute; left:11px; top:65px;">
        <table id="gd_grid" onclick="gd.evClick()" ondblclick="gd.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="gd_pager" style="text-align:center;display:none"></div>
    </div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:630px;left:674px" Width="94px" Height="25px" Text="保存" ID="btnSave" ClientInstanceName="btnSave" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(45,16).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Save()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:630px;left:776px" Width="94px" Height="25px" Text="重置" ID="btnReSet" ClientInstanceName="btnReSet" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_rotate_clockwise.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ReSet()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:630px;left:879px" Width="94px" Height="25px" Text="返回" ID="btnCancel" ClientInstanceName="btnCancel" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(47,25).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){dialog.close('re')}"  />
        </dx:ASPxButton>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:23px;left:993px" Width="134px" Height="20px" ID="task_rowid" ClientInstanceName="task_rowid" runat="server" dsfield="ds.rowid" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:288px;left:994px" Width="62px" Height="20px" ID="over_rowid" ClientInstanceName="over_rowid" runat="server" dsfield="dsOver.rowid" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:321px;left:994px" Width="62px" Height="20px" ID="over_PubId" ClientInstanceName="over_PubId" runat="server" dsfield="dsOver.PubId" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:90px;left:1081px" Width="26px" Height="20px" ID="txtAppDate" ClientInstanceName="txtAppDate" runat="server" dsfield="ds.AppDate" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:192px;left:1092px" Width="28px" Height="20px" ID="_tbProducer" ClientInstanceName="_tbProducer" runat="server" dsfield="ds.Producer" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:192px;left:1057px" Width="25px" Height="20px" ID="_tbAppUser" ClientInstanceName="_tbAppUser" runat="server" dsfield="ds.AppUser" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:191px;left:1014px" Width="23px" Height="20px" ID="_tbAppDep" ClientInstanceName="_tbAppDep" runat="server" dsfield="ds.AppDep" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:453px;left:871px" Width="60px" Height="20px" ID="btBox_ArchBagP_Int" ClientInstanceName="btBox_ArchBagP_Int" Text="" dsfield="dsOver.ArchBagP" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:454px;left:683px" Width="60px" Height="20px" ID="btBox_ArchBagD_Int" ClientInstanceName="btBox_ArchBagD_Int" Text="" dsfield="dsOver.ArchBagD" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="labelArchBagD" style="position:absolute;top:453px;left:816px;width:53px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">档案袋(大)</div>    
        <div id="labelArchBagP" style="position:absolute;top:454px;left:635px;width:48px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">档案袋(皮面)</div>    
        <div id="labelZ34ccc" style="position:absolute;top:458px;left:942px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">个</div>    
        <div id="labelZ34c" style="position:absolute;top:459px;left:753px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">个</div>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:tbaSp,s:'tbaSp',t:'mtextbox',d:'ds.Memo',v:'特殊说明',f:'',l:'50',k:false,n:true,r:true,w:true},{c:cbIsBackFont,s:'cbIsBackFont',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbArch,s:'cbArch',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:tbIsoNo,s:'tbIsoNo',t:'textbox',d:'ds.IsoNo',v:'出版单号',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbAppDep,s:'tbAppDep',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:tbProducer,s:'tbProducer',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:tbAppUser,s:'tbAppUser',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:tbMajor,s:'tbMajor',t:'textbox',d:'ds.Major',v:'专业',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbMonth,s:'tbMonth',t:'textbox',d:'ds.AccountMonth',v:'记账月份',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbTaskName,s:'tbTaskName',t:'textbox',d:'ds.PrjName',v:'任务名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbRequire,s:'tbRequire',t:'textbox',d:'ds.CoverName',v:'封面要求名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbBindType,s:'tbBindType',t:'textbox',d:'ds.BookBindName',v:'装订方式名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbCount,s:'tbCount',t:'textbox',d:'ds.CopyCount',v:'份数',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BA4S,s:'btBox_BA4S',t:'btntxtbox',d:'dsOver.BA4S',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_GlueBind_Int,s:'btBox_GlueBind_Int',t:'btntxtbox',d:'dsOver.GlueBind',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA0,s:'btBox_PA0',t:'btntxtbox',d:'dsOver.PA0',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA1,s:'btBox_PA1',t:'btntxtbox',d:'dsOver.PA1',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA2,s:'btBox_PA2',t:'btntxtbox',d:'dsOver.PA2',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA3,s:'btBox_PA3',t:'btntxtbox',d:'dsOver.PA3',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA4,s:'btBox_PA4',t:'btntxtbox',d:'dsOver.PA4',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA0,s:'btBox_CA0',t:'btntxtbox',d:'dsOver.CA0',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA1,s:'btBox_CA1',t:'btntxtbox',d:'dsOver.CA1',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA2,s:'btBox_CA2',t:'btntxtbox',d:'dsOver.CA2',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA3,s:'btBox_CA3',t:'btntxtbox',d:'dsOver.CA3plus',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA3D,s:'btBox_CA3D',t:'btntxtbox',d:'dsOver.CA3D',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA3S,s:'btBox_CA3S',t:'btntxtbox',d:'dsOver.CA3S',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA4D,s:'btBox_CA4D',t:'btntxtbox',d:'dsOver.CA4D',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA4S,s:'btBox_CA4S',t:'btntxtbox',d:'dsOver.CA4S',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BA3,s:'btBox_BA3',t:'btntxtbox',d:'dsOver.BA3plus',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BA3D,s:'btBox_BA3D',t:'btntxtbox',d:'dsOver.BA3D',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BA3S,s:'btBox_BA3S',t:'btntxtbox',d:'dsOver.BA3S',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BA4D,s:'btBox_BA4D',t:'btntxtbox',d:'dsOver.BA4D',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_ComposingPage_Int,s:'btBox_ComposingPage_Int',t:'btntxtbox',d:'dsOver.ComposingPage',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_ArchBag_Int,s:'btBox_ArchBag_Int',t:'btntxtbox',d:'dsOver.ArchBag',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_AddPrint_Int,s:'btBox_AddPrint_Int',t:'btntxtbox',d:'dsOver.AddPrint',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PinBind_Int,s:'btBox_PinBind_Int',t:'btntxtbox',d:'dsOver.PinBind',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BackFont_Int,s:'btBox_BackFont_Int',t:'btntxtbox',d:'dsOver.BackFont',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_OthPrjCost,s:'btBox_OthPrjCost',t:'btntxtbox',d:'dsOver.OtherCost',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_TwoPhoto_Int,s:'btBox_TwoPhoto_Int',t:'btntxtbox',d:'dsOver.TwoPhoto',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_OnePhoto_Int,s:'btBox_OnePhoto_Int',t:'btntxtbox',d:'dsOver.OnePhoto',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_DesignCost,s:'btBox_DesignCost',t:'btntxtbox',d:'dsOver.DesignCost',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_UDisk_Int,s:'btBox_UDisk_Int',t:'btntxtbox',d:'dsOver.UDisk',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_ScanPage_Int,s:'btBox_ScanPage_Int',t:'btntxtbox',d:'dsOver.ScanPage',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CdRom_Int,s:'btBox_CdRom_Int',t:'btntxtbox',d:'dsOver.CdRom',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_EditPage_Int,s:'btBox_EditPage_Int',t:'btntxtbox',d:'dsOver.EditPage',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_VisitingCard_Int,s:'btBox_VisitingCard_Int',t:'btntxtbox',d:'dsOver.VisitingCard',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbOthPrjName,s:'tbOthPrjName',t:'textbox',d:'dsOver.OtherPrj',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txaMemo,s:'txaMemo',t:'mtextbox',d:'dsOver.Memo',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:task_rowid,s:'task_rowid',t:'textbox',d:'ds.rowid',v:'',f:'',l:'50',k:true,n:true,r:true,w:true},{c:over_rowid,s:'over_rowid',t:'textbox',d:'dsOver.rowid',v:'',f:'',l:'50',k:true,n:true,r:true,w:true},{c:over_PubId,s:'over_PubId',t:'textbox',d:'dsOver.PubId',v:'出版ID',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtAppDate,s:'txtAppDate',t:'textbox',d:'ds.AppDate',v:'申请时间',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_tbProducer,s:'_tbProducer',t:'textbox',d:'ds.Producer',v:'制作人',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_tbAppUser,s:'_tbAppUser',t:'textbox',d:'ds.AppUser',v:'申请人',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_tbAppDep,s:'_tbAppDep',t:'textbox',d:'ds.AppDep',v:'部门',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_ArchBagP_Int,s:'btBox_ArchBagP_Int',t:'btntxtbox',d:'dsOver.ArchBagP',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_ArchBagD_Int,s:'btBox_ArchBagD_Int',t:'btntxtbox',d:'dsOver.ArchBagD',v:'',f:'',l:'50',k:false,n:true,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'null',data:<%=GetDataSetJson("ds",10000) %>});ds.Bind2Ctrl();
        var dsVol = new dataset({id:'dsVol',grid:'gd',data:<%=GetDataSetJson("dsVol",10000,"") %>});dsVol.Bind2Ctrl();
        var dsOver = new dataset({id:'dsOver',grid:'null',data:<%=GetDataSetJson("dsOver",10000) %>});dsOver.Bind2Ctrl();
        
        var gd = $("#gd_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("dsVol","") %>,
            left:11,top:65,height:87,width:509,multiselect:false,rownumbers:true,dataset:dsVol,caption:"",haveFootBar:false,rowNum:10000,pager:$("#gd_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){gd.RowIndex=gd.getInd(id);gd.ColIndex=ic},
            onPaging:function(pgb){gd.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){gd.OrderByCol(fd,ic,ord,'');}
        }));gd.InitData();
        
    </script>
</body>
</html>
