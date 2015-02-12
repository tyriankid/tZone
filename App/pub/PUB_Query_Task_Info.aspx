<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Query_Task_Info.aspx.cs" Inherits="PUB_Query_Task_Info" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.4 Design With 2015-1-20 15:33:23 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务单查询结果列表</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Query_Task_Info.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
<div id="div1" style="position:absolute;top:5px;left:5px;width:1000px;height:130px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
    <div id="jq1_pos" style="position:absolute; left:5px; top:142px;">
        <table id="jq1_grid" onclick="jq1.evClick()" ondblclick="jq1.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jq1_pager" style="text-align:center;display:block"></div>
    </div>    
        <div id="label1" style="position:absolute;top:18px;left:25px;width:83px;height:10px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号：</div>    
        <div id="label2" style="position:absolute;top:16px;left:90px;width:24px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">212</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:12px;left:115px" Width="55px" Height="20px" ID="txtiso" ClientInstanceName="txtiso" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="全部" Value="全部" />        
<dx:ListEditItem Text="A" Value="A" />        
<dx:ListEditItem Text="B" Value="B" />        
<dx:ListEditItem Text="C" Value="C" />        
<dx:ListEditItem Text="D" Value="D" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label3" style="position:absolute;top:16px;left:177px;width:13px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">—</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:12px;left:191px" Width="60px" Height="20px" ID="txtyear" ClientInstanceName="txtyear" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label4" style="position:absolute;top:16px;left:256px;width:13px;height:22px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">—</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:12px;left:269px" Width="90px" Height="20px" ID="txtno" ClientInstanceName="txtno" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label5" style="position:absolute;top:17px;left:376px;width:46px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">部门：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:12px;left:415px" Width="90px" Height="20px" ID="txtdep" ClientInstanceName="txtdep" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label6" style="position:absolute;top:18px;left:518px;width:56px;height:15px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">专业：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:12px;left:559px" Width="90px" Height="20px" ID="txtpro" ClientInstanceName="txtpro" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label7" style="position:absolute;top:49px;left:37px;width:60px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请人：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:45px;left:92px" Width="90px" Height="20px" ID="txtuser" ClientInstanceName="txtuser" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label8" style="position:absolute;top:15px;left:665px;width:49px;height:15px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">座机：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:12px;left:704px" Width="90px" Height="20px" ID="txtphone" ClientInstanceName="txtphone" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label9" style="position:absolute;top:16px;left:808px;width:49px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">手机：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:12px;left:848px" Width="142px" Height="20px" ID="txtmobile" ClientInstanceName="txtmobile" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label10" style="position:absolute;top:48px;left:199px;width:80px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请时间：</div>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:44px;left:269px" Width="90px" Height="20px" ID="appStr" ClientInstanceName="appStr" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <div id="label11" style="position:absolute;top:48px;left:366px;width:18px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">—</div>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:44px;left:384px" Width="90px" Height="20px" ID="appEnd" ClientInstanceName="appEnd" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <div id="label12" style="position:absolute;top:47px;left:495px;width:62px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">需要时间：</div>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:44px;left:559px" Width="90px" Height="20px" ID="needStr" ClientInstanceName="needStr" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <div id="label13" style="position:absolute;top:47px;left:669px;width:26px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">—</div>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:44px;left:704px" Width="90px" Height="20px" ID="needEnd" ClientInstanceName="needEnd" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <div id="label14" style="position:absolute;top:79px;left:25px;width:66px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">设计阶段：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:75px;left:92px" Width="90px" Height="20px" ID="cbphase" ClientInstanceName="cbphase" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="全部" Value="全部" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label15" style="position:absolute;top:79px;left:221px;width:41px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">类别：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:75px;left:269px" Width="90px" Height="20px" ID="cbtype" ClientInstanceName="cbtype" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="全部" Value="全部" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label16" style="position:absolute;top:81px;left:367px;width:54px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">制作人：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:78px;left:415px" Width="90px" Height="20px" ID="txtmaker" ClientInstanceName="txtmaker" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label17" style="position:absolute;top:82px;left:515px;width:82px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务状态：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:78px;left:576px" Width="90px" Height="20px" ID="cbstate" ClientInstanceName="cbstate" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="全部" Value="全部" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label18" style="position:absolute;top:84px;left:679px;width:66px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">归档状态：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:78px;left:738px" Width="90px" Height="20px" ID="cbarh" ClientInstanceName="cbarh" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="全部" Value="-1" />        
<dx:ListEditItem Text="√" Value="1" />        
<dx:ListEditItem Text="x" Value="0" />        
<dx:ListEditItem Text="-" Value="2" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label19" style="position:absolute;top:82px;left:838px;width:72px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">结算状态：</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:78px;left:901px" Width="90px" Height="20px" ID="cbcaul" ClientInstanceName="cbcaul" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="全部" Value="-1" />        
<dx:ListEditItem Text="√" Value="1" />        
<dx:ListEditItem Text="x" Value="0" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label20" style="position:absolute;top:111px;left:24px;width:68px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务名称：</div>    
        <div id="label21" style="position:absolute;top:110px;left:500px;width:88px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">卷册号/子项：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:106px;left:93px" Width="385px" Height="20px" ID="txtprjname" ClientInstanceName="txtprjname" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:107px;left:577px" Width="415px" Height="20px" ID="txtsubprj" ClientInstanceName="txtsubprj" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:8px;left:1017px" Width="90px" Height="25px" Text="查询" ID="button1" ClientInstanceName="button1" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(22,00).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){search()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:38px;left:1017px" Width="90px" Height="25px" Text="清空" ID="button2" ClientInstanceName="button2" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(25,00).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){res()}"  />
        </dx:ASPxButton>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:txtiso,s:'txtiso',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtyear,s:'txtyear',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtno,s:'txtno',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtdep,s:'txtdep',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtpro,s:'txtpro',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtuser,s:'txtuser',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtphone,s:'txtphone',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtmobile,s:'txtmobile',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:appStr,s:'appStr',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:appEnd,s:'appEnd',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:needStr,s:'needStr',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:needEnd,s:'needEnd',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbphase,s:'cbphase',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbtype,s:'cbtype',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtmaker,s:'txtmaker',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbstate,s:'cbstate',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbarh,s:'cbarh',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbcaul,s:'cbcaul',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtprjname,s:'txtprjname',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtsubprj,s:'txtsubprj',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true}];
        var ds2 = new dataset({id:'ds2',grid:'jq1',data:<%=GetDataSetJson("ds2",20,"jq1,详情,编辑") %>});ds2.Bind2Ctrl();
        
        var jq1 = $("#jq1_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds2","jq1,详情,编辑") %>,
            left:5,top:142,height:'100%',width:'100%',multiselect:false,rownumbers:true,dataset:ds2,caption:"",haveFootBar:true,rowNum:20,pager:$("#jq1_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jq1.RowIndex=jq1.getInd(id);jq1.ColIndex=ic},
            onPaging:function(pgb){jq1.PageNav(pgb,doChangeNow());},onSortCol:function(fd,ic,ord){jq1.OrderByCol(fd,ic,ord,'');}
        }));jq1.InitData();
        
    </script>
</body>
</html>
