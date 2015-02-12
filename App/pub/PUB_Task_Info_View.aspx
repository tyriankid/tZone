<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Task_Info_View.aspx.cs" Inherits="PUB_Task_Info_View" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.2 Design With 2014-12-17 16:51:08 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务单详情</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Task_Info_View.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="label24" style="position:absolute;top:493px;left:417px;width:113px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">特殊说明</div>    
        <div id="label20" style="position:absolute;top:130px;left:750px;width:83px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">设计阶段：</div>    
        <div id="label1" style="position:absolute;top:10px;left:5px;width:69px;height:22px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号：</div>    
        <div id="label6" style="position:absolute;top:10px;left:377px;width:43px;height:24px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">部门：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:5px;left:432px" Width="120px" Height="20px" ID="txtdep" ClientInstanceName="txtdep" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label7" style="position:absolute;top:10px;left:583px;width:48px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">专业：</div>    
        <div id="label8" style="position:absolute;top:43px;left:17px;width:58px;height:24px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请人：</div>    
        <div id="label9" style="position:absolute;top:43px;left:377px;width:39px;height:26px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">座机：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:38px;left:432px" Width="120px" Height="20px" ID="txtphone" ClientInstanceName="txtphone" runat="server" dsfield="ds.Phone" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label10" style="position:absolute;top:43px;left:583px;width:47px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">手机：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:38px;left:633px" Width="120px" Height="20px" ID="txtmobile" ClientInstanceName="txtmobile" runat="server" dsfield="ds.Mobile" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label11" style="position:absolute;top:73px;left:5px;width:83px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请时间：</div>    
        <div id="label12" style="position:absolute;top:73px;left:225px;width:28px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">时</div>    
        <div id="label13" style="position:absolute;top:73px;left:294px;width:16px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">分</div>    
        <div id="label14" style="position:absolute;top:73px;left:377px;width:71px;height:28px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">需要时间：</div>    
        <div id="label15" style="position:absolute;top:73px;left:577px;width:30px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">时</div>    
        <div id="label16" style="position:absolute;top:73px;left:645px;width:28px;height:25px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">分</div>    
        <div id="label17" style="position:absolute;top:130px;left:5px;width:64px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务名称：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:128px;left:74px" Width="292px" Height="20px" ID="prjname" ClientInstanceName="prjname" runat="server" dsfield="ds.PrjName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label18" style="position:absolute;top:130px;left:376px;width:50px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">份数：</div>    
        <div id="label19" style="position:absolute;top:130px;left:562px;width:81px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">彩色/黑白：</div>    
    <div id="jq_pos" style="position:absolute; left:5px; top:158px;">
        <table id="jq_grid" onclick="jq.evClick()" ondblclick="jq.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jq_pager" style="text-align:center;display:none"></div>
    </div>    
        <div id="label21" style="position:absolute;top:10px;left:784px;width:42px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">类别：</div>    
        <div id="label22" style="position:absolute;top:294px;left:5px;width:65px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">封面要求：</div>    
        <div id="label23" style="position:absolute;top:294px;left:390px;width:63px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">装订方式：</div>    
        <dx:ASPxCheckBox Enabled="false" Display="block" style="position:absolute;top:294px;left:246px" Width="90px" Height="20px" ID="checkbox1" ClientInstanceName="checkbox1" runat="server" Text="脊背印字" dsfield="ds.IsPrint" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="false" Display="block" style="position:absolute;top:294px;left:636px" Width="114px" Height="20px" ID="checkbox2" ClientInstanceName="checkbox2" runat="server" Text="需电子归档" dsfield="ds.IsArch" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
<iframe id="iframe1" name="iframe1" frameborder="0" scrolling="auto" url="" parms="" style="position:absolute;top:365px;left:5px;width:890px;height:116px;display:block;border:1px solid #A0A0A0;"></iframe><script type="text/javascript">InitIframe('iframe1')</script>    
        <dx:ASPxMemo Enabled="false" Display="block" style="position:absolute;top:512px;left:5px" Width="890px" Height="67px" ID="mtextbox1" ClientInstanceName="mtextbox1" Text="" dsfield="ds.memo" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="mtextbox">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxMemo>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:728px;left:604px" Width="70px" Height="25px" Text="返回" ID="button4" ClientInstanceName="button4" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(03,23).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){dialog.close()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:728px;left:200px" Width="70px" Height="25px" Text="结算" ID="button6" ClientInstanceName="button6" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_down.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Caul()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:728px;left:305px" Width="70px" Height="25px" Text="归档" ID="button5" ClientInstanceName="button5" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(20,42).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ToArh()}"  />
        </dx:ASPxButton>    
        <div id="label25" style="position:absolute;top:590px;left:417px;width:88px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务日志</div>    
    <div id="jqgrid2_pos" style="position:absolute; left:5px; top:613px;">
        <table id="jqgrid2_grid" onclick="jqgrid2.evClick()" ondblclick="jqgrid2.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jqgrid2_pager" style="text-align:center;display:none"></div>
    </div>    
        <div id="label26" style="position:absolute;top:102px;left:212px;width:52px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">状态：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:99px;left:256px" Width="102px" Height="20px" ID="combox8" ClientInstanceName="combox8" dsfield="ds.state" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        
    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:99px;left:373px" Width="70px" Height="25px" Text="更新" ID="button7" ClientInstanceName="button7" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_rotate_anticlockwise.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){StateUpdate()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:728px;left:413px" Width="150px" Height="25px" Text="打印任务单" ID="button8" ClientInstanceName="button8" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/book_open.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){PrintReport()}"  />
        </dx:ASPxButton>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:5px;left:74px" Width="290px" Height="20px" ID="txtisono" ClientInstanceName="txtisono" runat="server" dsfield="ds.IsoNo" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:5px;left:633px" Width="120px" Height="20px" ID="txtmaj" ClientInstanceName="txtmaj" runat="server" dsfield="ds.Major" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:5px;left:827px" Width="70px" Height="20px" ID="txttype" ClientInstanceName="txttype" runat="server" dsfield="ds.TypeName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:38px;left:74px" Width="200px" Height="20px" ID="txtuser" ClientInstanceName="txtuser" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:69px;left:74px" Width="90px" Height="20px" ID="txtappdate" ClientInstanceName="txtappdate" runat="server" dsfield="ds.AppDate" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:69px;left:179px" Width="40px" Height="20px" ID="txtapphh" ClientInstanceName="txtapphh" runat="server" dsfield="ds.apphh" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:69px;left:243px" Width="40px" Height="20px" ID="txtappmm" ClientInstanceName="txtappmm" runat="server" dsfield="ds.appmm" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:69px;left:432px" Width="92px" Height="20px" ID="txtneeddate" ClientInstanceName="txtneeddate" runat="server" dsfield="ds.NeedDate" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:69px;left:539px" Width="32px" Height="20px" ID="txtneedhh" ClientInstanceName="txtneedhh" runat="server" dsfield="ds.needhh" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:69px;left:600px" Width="37px" Height="20px" ID="txtneedmm" ClientInstanceName="txtneedmm" runat="server" dsfield="ds.needmm" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:128px;left:432px" Width="60px" Height="20px" ID="txtcopycount" ClientInstanceName="txtcopycount" runat="server" dsfield="ds.CopyCount" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:128px;left:633px" Width="78px" Height="20px" ID="txtcolortype" ClientInstanceName="txtcolortype" runat="server" dsfield="ds.ColorTypeName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label23" style="position:absolute;top:73px;left:750px;width:82px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务发起人：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:69px;left:827px" Width="70px" Height="20px" ID="txttaskuser" ClientInstanceName="txttaskuser" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label24" style="position:absolute;top:102px;left:17px;width:57px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">制作人：</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:99px;left:74px" Width="96px" Height="20px" ID="txtproducer" ClientInstanceName="txtproducer" runat="server" dsfield="ds.Producer" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxCheckBox Enabled="false" Display="block" style="position:absolute;top:102px;left:505px" Width="124px" Height="20px" ID="chkArchState" ClientInstanceName="chkArchState" runat="server" Text="电子归档" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="false" Display="block" style="position:absolute;top:102px;left:630px" Width="59px" Height="20px" ID="chkOverState" ClientInstanceName="chkOverState" runat="server" Text="结算" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <div id="label25" style="position:absolute;top:102px;left:750px;width:83px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">记账月份：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:99px;left:827px" Width="70px" Height="20px" ID="txtaccountmonth" ClientInstanceName="txtaccountmonth" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:128px;left:827px" Width="70px" Height="20px" ID="txtphase" ClientInstanceName="txtphase" runat="server" dsfield="ds.PhaseName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:292px;left:74px" Width="120px" Height="20px" ID="txtcover" ClientInstanceName="txtcover" runat="server" dsfield="ds.CoverName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:292px;left:456px" Width="120px" Height="20px" ID="txtbookbind" ClientInstanceName="txtbookbind" runat="server" dsfield="ds.BookBindName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label27" style="position:absolute;top:343px;left:417px;width:79px;height:22px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">文件列表</div>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:38px;left:766px" Width="30px" Height="20px" ID="_txtdep" ClientInstanceName="_txtdep" runat="server" dsfield="ds.AppDep" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:37px;left:807px" Width="32px" Height="20px" ID="_txtuser" ClientInstanceName="_txtuser" runat="server" dsfield="ds.AppUser" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:txtdep,s:'txtdep',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtphone,s:'txtphone',t:'textbox',d:'ds.Phone',v:'座机',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtmobile,s:'txtmobile',t:'textbox',d:'ds.Mobile',v:'手机',f:'',l:'50',k:false,n:true,r:true,w:true},{c:prjname,s:'prjname',t:'textbox',d:'ds.PrjName',v:'项目名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:checkbox1,s:'checkbox1',t:'checkbox',d:'ds.IsPrint',v:'是否脊背印字',f:'',l:'50',k:false,n:true,r:true,w:true},{c:checkbox2,s:'checkbox2',t:'checkbox',d:'ds.IsArch',v:'是否需要归档',f:'',l:'50',k:false,n:true,r:true,w:true},{c:mtextbox1,s:'mtextbox1',t:'mtextbox',d:'ds.memo',v:'备注',f:'',l:'50',k:false,n:true,r:true,w:true},{c:combox8,s:'combox8',t:'combox',d:'ds.state',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtisono,s:'txtisono',t:'textbox',d:'ds.IsoNo',v:'出版单号',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtmaj,s:'txtmaj',t:'textbox',d:'ds.Major',v:'专业',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txttype,s:'txttype',t:'textbox',d:'ds.TypeName',v:'任务类别名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtuser,s:'txtuser',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtappdate,s:'txtappdate',t:'textbox',d:'ds.AppDate',v:'申请时间',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtapphh,s:'txtapphh',t:'textbox',d:'ds.apphh',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtappmm,s:'txtappmm',t:'textbox',d:'ds.appmm',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtneeddate,s:'txtneeddate',t:'textbox',d:'ds.NeedDate',v:'需要时间',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtneedhh,s:'txtneedhh',t:'textbox',d:'ds.needhh',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtneedmm,s:'txtneedmm',t:'textbox',d:'ds.needmm',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtcopycount,s:'txtcopycount',t:'textbox',d:'ds.CopyCount',v:'份数',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtcolortype,s:'txtcolortype',t:'textbox',d:'ds.ColorTypeName',v:'出版颜色',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txttaskuser,s:'txttaskuser',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtproducer,s:'txtproducer',t:'textbox',d:'ds.Producer',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:chkArchState,s:'chkArchState',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:chkOverState,s:'chkOverState',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtaccountmonth,s:'txtaccountmonth',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtphase,s:'txtphase',t:'textbox',d:'ds.PhaseName',v:'阶段名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtcover,s:'txtcover',t:'textbox',d:'ds.CoverName',v:'封面要求名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtbookbind,s:'txtbookbind',t:'textbox',d:'ds.BookBindName',v:'装订方式名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtdep,s:'_txtdep',t:'textbox',d:'ds.AppDep',v:'申请部门',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtuser,s:'_txtuser',t:'textbox',d:'ds.AppUser',v:'申请人',f:'',l:'50',k:false,n:true,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'null',data:<%=GetDataSetJson("ds",10000) %>});ds.Bind2Ctrl();
        var ds2 = new dataset({id:'ds2',grid:'jq',data:<%=GetDataSetJson("ds2",10000,"") %>});ds2.Bind2Ctrl();
        var ds3 = new dataset({id:'ds3',grid:'jqgrid2',data:<%=GetDataSetJson("ds3",10000,"") %>});ds3.Bind2Ctrl();
        
        var jq = $("#jq_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds2","") %>,
            left:5,top:158,height:98,width:890,multiselect:false,rownumbers:false,dataset:ds2,caption:"",haveFootBar:false,rowNum:10000,pager:$("#jq_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jq.RowIndex=jq.getInd(id);jq.ColIndex=ic},
            onPaging:function(pgb){jq.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){jq.OrderByCol(fd,ic,ord,'');}
        }));jq.InitData();
        var jqgrid2 = $("#jqgrid2_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds3","") %>,
            left:5,top:613,height:72,width:890,multiselect:false,rownumbers:false,dataset:ds3,caption:"",haveFootBar:false,rowNum:10000,pager:$("#jqgrid2_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jqgrid2.RowIndex=jqgrid2.getInd(id);jqgrid2.ColIndex=ic},
            onPaging:function(pgb){jqgrid2.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){jqgrid2.OrderByCol(fd,ic,ord,'');}
        }));jqgrid2.InitData();
        
    </script>
</body>
</html>
