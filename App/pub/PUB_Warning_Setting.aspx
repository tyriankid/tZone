<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Warning_Setting.aspx.cs" Inherits="PUB_Warning_Setting" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.1 Design With 2015-1-6 13:57:53 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>预警设置</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Warning_Setting.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="label1" style="position:absolute;top:30px;left:31px;width:108px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">预警时间设置：</div>    
        <dx:ASPxSpinEdit Enabled="true" Display="block" style="position:absolute;top:25px;left:115px" Width="67px" Height="20px" ID="npTime" ClientInstanceName="npTime" dsfield="ds.WarningStep" MaxValue="500" MinValue="1" Increment="1" NumberType="Integer" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="numspin">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" ButtonClick="function(s,e){}" KeyUp="function(s,e){}" LostFocus="function(s,e){}" NumberChanged="function(s,e){}" />
        </dx:ASPxSpinEdit>    
        <div id="label2" style="position:absolute;top:29px;left:198px;width:39px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">分钟</div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:22px;left:238px" Width="107px" Height="25px" Text="保存" ID="button1" ClientInstanceName="button1" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(45,16).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Save()}"  />
        </dx:ASPxButton>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:166px;left:52px" Width="61px" Height="20px" ID="txtRowid" ClientInstanceName="txtRowid" runat="server" dsfield="ds.rowid" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:npTime,s:'npTime',t:'numspin',d:'ds.WarningStep',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtRowid,s:'txtRowid',t:'textbox',d:'ds.rowid',v:'',f:'',l:'50',k:true,n:true,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'null',data:<%=GetDataSetJson("ds",10000) %>});ds.Bind2Ctrl();
        
        
    </script>
</body>
</html>
