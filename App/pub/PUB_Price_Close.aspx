<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Price_Close.aspx.cs" Inherits="PUB_Price_Close" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.1 Design With 2015-1-12 10:46:45 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>关账</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Price_Close.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="label1" style="position:absolute;top:11px;left:16px;width:101px;height:17px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">上期已关账月份</div>    
        <div id="label2" style="position:absolute;top:72px;left:5px;width:112px;height:17px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">设置下期待关账月份</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:36px;left:135px" Width="122px" Height="20px" ID="txtClosed" ClientInstanceName="txtClosed" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:107px;left:37px" Width="222px" Height="25px" Text="关账" ID="btn_Close" ClientInstanceName="btn_Close" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/flag_red.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Close()}"  />
        </dx:ASPxButton>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:69px;left:135px" Width="42px" Height="20px" ID="txtYear" ClientInstanceName="txtYear" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:69px;left:201px" Width="56px" Height="20px" ID="cbMonth" ClientInstanceName="cbMonth" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="01" Value="01" />        
<dx:ListEditItem Text="02" Value="02" />        
<dx:ListEditItem Text="03" Value="03" />        
<dx:ListEditItem Text="04" Value="04" />        
<dx:ListEditItem Text="05" Value="05" />        
<dx:ListEditItem Text="06" Value="06" />        
<dx:ListEditItem Text="07" Value="07" />        
<dx:ListEditItem Text="08" Value="08" />        
<dx:ListEditItem Text="09" Value="09" />        
<dx:ListEditItem Text="10" Value="10" />        
<dx:ListEditItem Text="11" Value="11" />        
<dx:ListEditItem Text="12" Value="12" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label3" style="position:absolute;top:75px;left:183px;width:12px;height:15px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">年</div>    
        <div id="label4" style="position:absolute;top:75px;left:268px;width:12px;height:15px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">月</div>    
        <div id="labelcurre" style="position:absolute;top:41px;left:16px;width:101px;height:17px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">本期待关账月份</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:6px;left:135px" Width="122px" Height="20px" ID="txtLastMonth" ClientInstanceName="txtLastMonth" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:txtClosed,s:'txtClosed',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtYear,s:'txtYear',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbMonth,s:'cbMonth',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtLastMonth,s:'txtLastMonth',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true}];
        
        
    </script>
</body>
</html>
