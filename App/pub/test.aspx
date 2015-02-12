<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.1 Design With 2014-12-17 17:18:17 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>testtest</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/test.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:155px;left:125px" Width="119px" Height="25px" Text="按钮1" ID="button1" ClientInstanceName="button1" runat="server" EnableViewState="false" AutoPostBack="false"  ctrltype="button">
            <ClientSideEvents Click="function(s,e){gg()}"  />
        </dx:ASPxButton>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [];
        
        
    </script>
</body>
</html>
