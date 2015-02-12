<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Price_Viewtest.aspx.cs" Inherits="PUB_Price_Viewtest" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.1 Design With 2014-12-12 14:33:53 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产值统计查询页面test</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Price_Viewtest.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="true" Display="block" style="position:absolute;top:32px;left:622px" Width="123px" Height="20px" ID="btBoxDep" ClientInstanceName="btBoxDep" Text="" dsfield="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/house.png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){SelectDep()}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:32px;left:795px" Width="88px" Height="25px" Text="查询" ID="btnSearch" ClientInstanceName="btnSearch" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(22,00).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){bS()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:77px;left:796px" Width="88px" Height="25px" Text="重置" ID="btnReSet" ClientInstanceName="btnReSet" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_rotate_clockwise.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ReSet()}"  />
        </dx:ASPxButton>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:228px;left:402px" Width="99px" Height="20px" ID="_btBoxDep" ClientInstanceName="_btBoxDep" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:btBoxDep,s:'btBoxDep',t:'btntxtbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:_btBoxDep,s:'_btBoxDep',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true}];
        
        
    </script>
</body>
</html>
