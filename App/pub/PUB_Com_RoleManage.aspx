<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Com_RoleManage.aspx.cs" Inherits="PUB_Com_RoleManage" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.1 Design With 2014-12-10 10:59:56 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>角色管理</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Com_RoleManage.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <dx:ASPxPageControl ID="tab1" ClientInstanceName="tab1" style="position:absolute;top:5px;left:5px;" Width="508px" Height="553px" runat="server" EnableViewState="false" AutoPostBack="false" EnableTabScrolling="true" ctrltype="tab">
            <TabPages><dx:TabPage Name="tab1" Text="角色列表">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                           <div style="width:506px; height:527px; overflow:auto; border:0px solid #AECAF0;position:absolute;top:26px;left:1px">    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:8px;left:6px" Width="70px" Height="25px" Text="添加" ID="btnAddRole" ClientInstanceName="btnAddRole" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/user_add.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){AddRole(0)}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:8px;left:81px" Width="70px" Height="25px" Text="修改" ID="btnEditRole" ClientInstanceName="btnEditRole" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/user_edit.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){AddRole(1)}"  />
        </dx:ASPxButton>    
    <div id="gd_pos" style="position:absolute; left:6px; top:40px;">
        <table id="gd_grid" onclick="gd.evClick()" ondblclick="gd.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="gd_pager" style="text-align:center;display:none"></div>
    </div>
                    </div></dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            <dx:TabPage Name="tab2" Text="角色里的人员">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                           <div style="width:506px; height:527px; overflow:auto; border:0px solid #AECAF0;position:absolute;top:26px;left:1px">    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:8px;left:6px" Width="70px" Height="25px" Text="添加" ID="btnAddUser" ClientInstanceName="btnAddUser" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/user.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){AddData()}"  />
        </dx:ASPxButton>    
    <div id="gdUser_pos" style="position:absolute; left:6px; top:40px;">
        <table id="gdUser_grid" onclick="gdUser.evClick()" ondblclick="gdUser.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="gdUser_pager" style="text-align:center;display:none"></div>
    </div>
                    </div></dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
            <ClientSideEvents TabClick="function(s,e){}" ActiveTabChanging="function(s,e){SwitchTab(s,e)}" ActiveTabChanged="function(s,e){}" BeginCallback="function(s,e){}" EndCallback="function(s,e){}" CallbackError="function(s,e){}" />
        </dx:ASPxPageControl>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [];
        var dsRole = new dataset({id:'dsRole',grid:'gd',data:<%=GetDataSetJson("dsRole",10000,"gd,删除") %>});dsRole.Bind2Ctrl();
        var dsUser = new dataset({id:'dsUser',grid:'gdUser',data:<%=GetDataSetJson("dsUser",10000,"gdUser,删除") %>});dsUser.Bind2Ctrl();
        
        var gd = $("#gd_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("dsRole","gd,删除") %>,
            left:6,top:40,height:454,width:489,multiselect:false,rownumbers:false,dataset:dsRole,caption:"",haveFootBar:false,rowNum:10000,pager:$("#gd_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){gd.RowIndex=gd.getInd(id);gd.ColIndex=ic},
            onPaging:function(pgb){gd.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){gd.OrderByCol(fd,ic,ord,'');}
        }));gd.InitData();
        var gdUser = $("#gdUser_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("dsUser","gdUser,删除") %>,
            left:6,top:40,height:451,width:472,multiselect:false,rownumbers:false,dataset:dsUser,caption:"",haveFootBar:false,rowNum:10000,pager:$("#gdUser_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){gdUser.RowIndex=gdUser.getInd(id);gdUser.ColIndex=ic},
            onPaging:function(pgb){gdUser.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){gdUser.OrderByCol(fd,ic,ord,'');}
        }));gdUser.InitData();
        
    </script>
</body>
</html>
