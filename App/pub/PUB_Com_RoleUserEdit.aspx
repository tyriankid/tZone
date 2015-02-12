<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Com_RoleUserEdit.aspx.cs" Inherits="PUB_Com_RoleUserEdit" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.1 Design With 2014-12-10 10:59:03 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户角色编辑</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Com_RoleUserEdit.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="label1" style="position:absolute;top:20px;left:20px;width:62px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">角色名称：</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:17px;left:79px" Width="200px" Height="20px" ID="txtName" ClientInstanceName="txtName" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label2" style="position:absolute;top:48px;left:43px;width:56px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">备注：</div>    
        <dx:ASPxMemo Enabled="true" Display="block" style="position:absolute;top:48px;left:79px" Width="200px" Height="82px" ID="txtMemo" ClientInstanceName="txtMemo" Text="" dsfield="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="mtextbox">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxMemo>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:146px;left:126px" Width="70px" Height="25px" Text="保存" ID="btnSave" ClientInstanceName="btnSave" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(45,16).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){SaveUser()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:146px;left:212px" Width="70px" Height="25px" Text="关闭" ID="btnClose" ClientInstanceName="btnClose" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/cancel.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){dialog.close();}"  />
        </dx:ASPxButton>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:txtName,s:'txtName',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtMemo,s:'txtMemo',t:'mtextbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true}];
        
        
    </script>
</body>
</html>
