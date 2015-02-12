<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Task_Info_Edit.aspx.cs" Inherits="PUB_Task_Info_Edit" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.8 Design With 2015-1-20 9:46:19 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务单编辑</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Task_Info_Edit.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="label24" style="position:absolute;top:344px;left:443px;width:113px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">特殊说明</div>    
        <div id="label20" style="position:absolute;top:78px;left:5px;width:83px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">设计阶段：</div>    
        <div id="label1" style="position:absolute;top:15px;left:5px;width:65px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号：</div>    
        <div id="label2" style="position:absolute;top:14px;left:68px;width:35px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">212</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:11px;left:88px" Width="37px" Height="20px" ID="cbIsoNo" ClientInstanceName="cbIsoNo" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="A" Value="A" />        
<dx:ListEditItem Text="B" Value="B" />        
<dx:ListEditItem Text="C" Value="C" />        
<dx:ListEditItem Text="D" Value="D" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){ChangeIsoNo()}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label3" style="position:absolute;top:11px;left:134px;width:17px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">-</div>    
        <div id="label4" style="position:absolute;top:13px;left:141px;width:32px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label"></div>    
        <div id="label5" style="position:absolute;top:11px;left:169px;width:19px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">-</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:10px;left:176px" Width="70px" Height="20px" ID="txtIsoNo" ClientInstanceName="txtIsoNo" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label6" style="position:absolute;top:14px;left:278px;width:43px;height:24px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">部门：</div>    
        <div id="label7" style="position:absolute;top:12px;left:484px;width:48px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">专业：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:9px;left:523px" Width="120px" Height="20px" ID="cbmajor" ClientInstanceName="cbmajor" dsfield="ds.Major" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="-" Value="-" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){MakeMsg(19)}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label8" style="position:absolute;top:47px;left:15px;width:58px;height:24px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请人：</div>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:138px;left:988px" Width="36px" Height="20px" ID="_IsoNo" ClientInstanceName="_IsoNo" runat="server" dsfield="ds.IsoNo" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:136px;left:1043px" Width="21px" Height="20px" ID="_txtdep" ClientInstanceName="_txtdep" runat="server" dsfield="ds.AppDep" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:172px;left:996px" Width="27px" Height="20px" ID="_txtuser" ClientInstanceName="_txtuser" runat="server" dsfield="ds.AppUser" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label9" style="position:absolute;top:13px;left:659px;width:39px;height:26px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">座机：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:9px;left:701px" Width="90px" Height="20px" ID="txtphone" ClientInstanceName="txtphone" runat="server" dsfield="ds.Phone" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){MakeMsg(3)}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label10" style="position:absolute;top:12px;left:805px;width:47px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">手机：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:8px;left:842px" Width="120px" Height="20px" ID="txtmobile" ClientInstanceName="txtmobile" runat="server" dsfield="ds.Mobile" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){MakeMsg(4)}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label11" style="position:absolute;top:45px;left:255px;width:83px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请时间：</div>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:41px;left:315px" Width="90px" Height="20px" ID="appday" ClientInstanceName="appday" dsfield="ds.AppDate" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){MakeMsg(5)}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <dx:ASPxSpinEdit Enabled="true" Display="block" style="position:absolute;top:41px;left:412px" Width="40px" Height="20px" ID="apphh" ClientInstanceName="apphh" dsfield="ds.apphh" MaxValue="40" MinValue="1" Increment="1" NumberType="Integer" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="numspin">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" ButtonClick="function(s,e){}" KeyUp="function(s,e){}" LostFocus="function(s,e){}" NumberChanged="function(s,e){MakeMsg(5)}" />
        </dx:ASPxSpinEdit>    
        <div id="label12" style="position:absolute;top:46px;left:459px;width:28px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">时</div>    
        <dx:ASPxSpinEdit Enabled="true" Display="block" style="position:absolute;top:42px;left:475px" Width="40px" Height="20px" ID="appmm" ClientInstanceName="appmm" dsfield="ds.appmm" MaxValue="60" MinValue="1" Increment="1" NumberType="Integer" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="numspin">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" ButtonClick="function(s,e){}" KeyUp="function(s,e){}" LostFocus="function(s,e){}" NumberChanged="function(s,e){MakeMsg(5)}" />
        </dx:ASPxSpinEdit>    
        <div id="label13" style="position:absolute;top:48px;left:523px;width:16px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">分</div>    
        <div id="label14" style="position:absolute;top:46px;left:578px;width:71px;height:28px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">需要时间：</div>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:41px;left:642px" Width="90px" Height="20px" ID="needday" ClientInstanceName="needday" dsfield="ds.NeedDate" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){MakeMsg(6)}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <dx:ASPxSpinEdit Enabled="true" Display="block" style="position:absolute;top:41px;left:740px" Width="50px" Height="20px" ID="needhh" ClientInstanceName="needhh" dsfield="ds.needhh" MaxValue="60" MinValue="1" Increment="1" NumberType="Integer" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="numspin">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" ButtonClick="function(s,e){}" KeyUp="function(s,e){}" LostFocus="function(s,e){}" NumberChanged="function(s,e){MakeMsg(6)}" />
        </dx:ASPxSpinEdit>    
        <div id="label15" style="position:absolute;top:46px;left:796px;width:30px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">时</div>    
        <dx:ASPxSpinEdit Enabled="true" Display="block" style="position:absolute;top:41px;left:810px" Width="50px" Height="20px" ID="needmm" ClientInstanceName="needmm" dsfield="ds.needmm" MaxValue="60" MinValue="1" Increment="1" NumberType="Integer" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="numspin">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" ButtonClick="function(s,e){}" KeyUp="function(s,e){}" LostFocus="function(s,e){}" NumberChanged="function(s,e){MakeMsg(6)}" />
        </dx:ASPxSpinEdit>    
        <div id="label16" style="position:absolute;top:47px;left:867px;width:28px;height:25px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">分</div>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:204px;left:1004px" Width="46px" Height="20px" ID="appdate" ClientInstanceName="appdate" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:202px;left:1066px" Width="39px" Height="20px" ID="needdate" ClientInstanceName="needdate" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label17" style="position:absolute;top:105px;left:5px;width:64px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务名称：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:103px;left:69px" Width="337px" Height="20px" ID="prjname" ClientInstanceName="prjname" runat="server" dsfield="ds.PrjName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){MakeMsg(12)}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label18" style="position:absolute;top:110px;left:658px;width:50px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">份数：</div>    
        <dx:ASPxSpinEdit Enabled="true" Display="block" style="position:absolute;top:105px;left:702px" Width="89px" Height="20px" ID="txtnum" ClientInstanceName="txtnum" dsfield="ds.CopyCount" MaxValue="10000" MinValue="0" Increment="1" NumberType="Integer" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="numspin">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" ButtonClick="function(s,e){}" KeyUp="function(s,e){}" LostFocus="function(s,e){}" NumberChanged="function(s,e){MakeMsg(13)}" />
        </dx:ASPxSpinEdit>    
        <div id="label19" style="position:absolute;top:105px;left:415px;width:81px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">彩色/黑白：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:104px;left:475px" Width="118px" Height="20px" ID="cbColor" ClientInstanceName="cbColor" dsfield="ds.ColorType" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="-" Value="-" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){ChangeAllTypes(9)}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:132px;left:5px" Width="25px" Height="25px" Text="" ID="button1" ClientInstanceName="button1" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/add.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Add()}"  />
        </dx:ASPxButton>    
    <div id="jq_pos" style="position:absolute; left:5px; top:160px;">
        <table id="jq_grid" onclick="jq.evClick()" ondblclick="jq.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jq_pager" style="text-align:center;display:none"></div>
    </div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:132px;left:44px" Width="25px" Height="25px" Text="" ID="button2" ClientInstanceName="button2" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(23,39).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Del()}"  />
        </dx:ASPxButton>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:74px;left:69px" Width="177px" Height="20px" ID="cbphase" ClientInstanceName="cbphase" dsfield="ds.PhaseType" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="-" Value="-" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){ChangeAllTypes(7)}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label21" style="position:absolute;top:77px;left:274px;width:44px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">类别：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:72px;left:315px" Width="90px" Height="20px" ID="cbtype" ClientInstanceName="cbtype" dsfield="ds.TaskType" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="-" Value="-" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){ChangeAllTypes(8)}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label22" style="position:absolute;top:323px;left:95px;width:65px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">封面要求：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:319px;left:154px" Width="120px" Height="20px" ID="cbcover" ClientInstanceName="cbcover" dsfield="ds.CoverType" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="-" Value="-" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){ChangeAllTypes(10)}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label23" style="position:absolute;top:323px;left:368px;width:63px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">装订方式：</div>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:319px;left:286px" Width="90px" Height="20px" ID="checkbox1" ClientInstanceName="checkbox1" runat="server" Text="脊背印字" dsfield="ds.IsPrint" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){MakeMsg(14)}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:319px;left:436px" Width="120px" Height="20px" ID="cbbook" ClientInstanceName="cbbook" dsfield="ds.BookBindType" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="-" Value="-" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){ChangeAllTypes(11)}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:319px;left:564px" Width="114px" Height="20px" ID="checkbox2" ClientInstanceName="checkbox2" runat="server" Text="需电子归档" dsfield="ds.IsArch" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){MakeMsg(15)}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
<iframe id="iframe1" name="iframe1" frameborder="0" scrolling="auto" url="" parms="" style="position:absolute;top:455px;left:5px;width:963px;height:170px;display:block;border:1px solid #A0A0A0;"></iframe><script type="text/javascript">InitIframe('iframe1')</script>    
        <dx:ASPxMemo Enabled="true" Display="block" style="position:absolute;top:358px;left:5px" Width="961px" Height="70px" ID="mtextbox1" ClientInstanceName="mtextbox1" Text="" dsfield="ds.memo" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="mtextbox">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){MakeMsg(16)}" LostFocus="function(s,e){}"/>
        </dx:ASPxMemo>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:630px;left:664px" Width="70px" Height="25px" Text="保存" ID="button3" ClientInstanceName="button3" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(03,00).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Save()}"  />
        </dx:ASPxButton>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:136px;left:1119px" Width="35px" Height="20px" ID="txtrid" ClientInstanceName="txtrid" runat="server" dsfield="ds.rowid" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:76px;left:1046px" Width="29px" Height="20px" ID="_cbtype" ClientInstanceName="_cbtype" runat="server" dsfield="ds.TypeName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:75px;left:995px" Width="28px" Height="20px" ID="_cbphase" ClientInstanceName="_cbphase" runat="server" dsfield="ds.PhaseName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:263px;left:984px" Width="36px" Height="20px" ID="_cbColor" ClientInstanceName="_cbColor" runat="server" dsfield="ds.ColorTypeName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:455px;left:1030px" Width="32px" Height="20px" ID="_cbcover" ClientInstanceName="_cbcover" runat="server" dsfield="ds.CoverName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:457px;left:1073px" Width="30px" Height="20px" ID="_cbbook" ClientInstanceName="_cbbook" runat="server" dsfield="ds.BookBindName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:42px;left:69px" Width="177px" Height="20px" ID="txtuser" ClientInstanceName="txtuser" Text="" dsfield="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton  Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){SelectAppUser()}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){MakeMsg(2)}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:630px;left:899px" Width="70px" Height="25px" Text="返回" ID="button4" ClientInstanceName="button4" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(03,23).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){dialog.close('ok')}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:630px;left:742px" Width="150px" Height="25px" Text="打印任务单" ID="button5" ClientInstanceName="button5" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/book_open.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){PrintReport()}"  />
        </dx:ASPxButton>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:320px;left:1020px" Width="33px" Height="20px" ID="txtTaskuser" ClientInstanceName="txtTaskuser" runat="server" dsfield="ds.TaskUser" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label25" style="position:absolute;top:80px;left:429px;width:54px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">制作人：</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="true" Display="block" style="position:absolute;top:73px;left:475px" Width="118px" Height="20px" ID="txtMaker" ClientInstanceName="txtMaker" Text="" dsfield="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton  Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){SelectMaker()}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:72px;left:701px" Width="90px" Height="20px" ID="combox8" ClientInstanceName="combox8" dsfield="ds.state" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        
    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label26" style="position:absolute;top:78px;left:635px;width:64px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务状态：</div>    
        <div id="label27" style="position:absolute;top:437px;left:442px;width:106px;height:14px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">文件列表</div>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:173px;left:1044px" Width="28px" Height="20px" ID="_txtMaker" ClientInstanceName="_txtMaker" runat="server" dsfield="ds.Producer" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="true" Display="block" style="position:absolute;top:10px;left:315px" Width="120px" Height="20px" ID="txtdep" ClientInstanceName="txtdep" Text="" dsfield="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton  Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){SelectAppDep()}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:cbIsoNo,s:'cbIsoNo',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtIsoNo,s:'txtIsoNo',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbmajor,s:'cbmajor',t:'combox',d:'ds.Major',v:'专业',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_IsoNo,s:'_IsoNo',t:'textbox',d:'ds.IsoNo',v:'出版单号',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtdep,s:'_txtdep',t:'textbox',d:'ds.AppDep',v:'申请部门',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtuser,s:'_txtuser',t:'textbox',d:'ds.AppUser',v:'申请人',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtphone,s:'txtphone',t:'textbox',d:'ds.Phone',v:'座机',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtmobile,s:'txtmobile',t:'textbox',d:'ds.Mobile',v:'手机',f:'',l:'50',k:false,n:true,r:true,w:true},{c:appday,s:'appday',t:'datebox',d:'ds.AppDate',v:'申请时间',f:'',l:'50',k:false,n:true,r:true,w:true},{c:apphh,s:'apphh',t:'numspin',d:'ds.apphh',v:'',f:'',l:'50',k:false,n:false,r:true,w:true},{c:appmm,s:'appmm',t:'numspin',d:'ds.appmm',v:'',f:'',l:'50',k:false,n:false,r:true,w:true},{c:needday,s:'needday',t:'datebox',d:'ds.NeedDate',v:'需要时间',f:'',l:'50',k:false,n:true,r:true,w:true},{c:needhh,s:'needhh',t:'numspin',d:'ds.needhh',v:'',f:'',l:'50',k:false,n:false,r:true,w:true},{c:needmm,s:'needmm',t:'numspin',d:'ds.needmm',v:'',f:'',l:'50',k:false,n:false,r:true,w:true},{c:appdate,s:'appdate',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:needdate,s:'needdate',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:prjname,s:'prjname',t:'textbox',d:'ds.PrjName',v:'项目名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtnum,s:'txtnum',t:'numspin',d:'ds.CopyCount',v:'份数',f:'',l:'50',k:false,n:true,r:true,w:true},{c:cbColor,s:'cbColor',t:'combox',d:'ds.ColorType',v:'出版颜色类别',f:'',l:'50',k:false,n:true,r:true,w:true},{c:cbphase,s:'cbphase',t:'combox',d:'ds.PhaseType',v:'阶段类别',f:'',l:'50',k:false,n:true,r:true,w:true},{c:cbtype,s:'cbtype',t:'combox',d:'ds.TaskType',v:'任务类别',f:'',l:'50',k:false,n:true,r:true,w:true},{c:cbcover,s:'cbcover',t:'combox',d:'ds.CoverType',v:'封面要求类别',f:'',l:'50',k:false,n:true,r:true,w:true},{c:checkbox1,s:'checkbox1',t:'checkbox',d:'ds.IsPrint',v:'是否脊背印字',f:'',l:'50',k:false,n:true,r:true,w:true},{c:cbbook,s:'cbbook',t:'combox',d:'ds.BookBindType',v:'装订方式类别',f:'',l:'50',k:false,n:true,r:true,w:true},{c:checkbox2,s:'checkbox2',t:'checkbox',d:'ds.IsArch',v:'是否需要归档',f:'',l:'50',k:false,n:true,r:true,w:true},{c:mtextbox1,s:'mtextbox1',t:'mtextbox',d:'ds.memo',v:'备注',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtrid,s:'txtrid',t:'textbox',d:'ds.rowid',v:'',f:'',l:'50',k:true,n:true,r:true,w:true},{c:_cbtype,s:'_cbtype',t:'textbox',d:'ds.TypeName',v:'任务类别名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_cbphase,s:'_cbphase',t:'textbox',d:'ds.PhaseName',v:'阶段名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_cbColor,s:'_cbColor',t:'textbox',d:'ds.ColorTypeName',v:'出版颜色',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_cbcover,s:'_cbcover',t:'textbox',d:'ds.CoverName',v:'封面要求名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_cbbook,s:'_cbbook',t:'textbox',d:'ds.BookBindName',v:'装订方式名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtuser,s:'txtuser',t:'btntxtbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtTaskuser,s:'txtTaskuser',t:'textbox',d:'ds.TaskUser',v:'任务发起人',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtMaker,s:'txtMaker',t:'btntxtbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:combox8,s:'combox8',t:'combox',d:'ds.state',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtMaker,s:'_txtMaker',t:'textbox',d:'ds.Producer',v:'制作人',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtdep,s:'txtdep',t:'btntxtbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'null',data:<%=GetDataSetJson("ds",10000) %>});ds.Bind2Ctrl();
        var ds2 = new dataset({id:'ds2',grid:'jq',data:<%=GetDataSetJson("ds2",10000,"") %>});ds2.Bind2Ctrl();
        
        var jq = $("#jq_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds2","") %>,
            left:5,top:160,height:127,width:962,multiselect:false,rownumbers:true,dataset:ds2,caption:"",haveFootBar:false,rowNum:10000,pager:$("#jq_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jq.RowIndex=jq.getInd(id);jq.ColIndex=ic},
            onPaging:function(pgb){jq.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){jq.OrderByCol(fd,ic,ord,'');}
        }));jq.InitData();
        
    </script>
</body>
</html>
