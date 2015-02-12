<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_User_Task_Info.aspx.cs" Inherits="PUB_User_Task_Info" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.5 Design With 2015-1-23 11:28:30 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>普通用户任务单列表</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_User_Task_Info.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="label2" style="position:absolute;top:362px;left:5px;width:68px;height:31px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">所有任务</div>    
        <div id="label1" style="position:absolute;top:7px;left:5px;width:80px;height:20px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">我的任务</div>    
    <div id="jq1_pos" style="position:absolute; left:5px; top:23px;">
        <table id="jq1_grid" onclick="jq1.evClick()" ondblclick="jq1.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jq1_pager" style="text-align:center;display:block"></div>
    </div>    
    <div id="jq2_pos" style="position:absolute; left:5px; top:380px;">
        <table id="jq2_grid" onclick="jq2.evClick()" ondblclick="jq2.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jq2_pager" style="text-align:center;display:block"></div>
    </div>    
        <dx:ASPxButton Enabled="true" Display="none" style="position:absolute;top:590px;left:23px" Width="70px" Height="25px" Text="新建" ID="button1" ClientInstanceName="button1" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/add.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Add()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="none" style="position:absolute;top:591px;left:97px" Width="70px" Height="25px" Text="注销" ID="button2" ClientInstanceName="button2" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(23,39).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Del()}"  />
        </dx:ASPxButton>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [];
        var ds = new dataset({id:'ds',grid:'jq2',data:<%=GetDataSetJson("ds",20,"jq2,详情,接受任务") %>});ds.Bind2Ctrl();
        var ds2 = new dataset({id:'ds2',grid:'jq1',data:<%=GetDataSetJson("ds2",20,"jq1,详情") %>});ds2.Bind2Ctrl();
        
        var jq1 = $("#jq1_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds2","jq1,详情") %>,
            left:5,top:23,height:283,width:'100%',multiselect:false,rownumbers:true,dataset:ds2,caption:"",haveFootBar:true,rowNum:20,pager:$("#jq1_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jq1.RowIndex=jq1.getInd(id);jq1.ColIndex=ic},
            onPaging:function(pgb){jq1.PageNav(pgb,doChangeNow());},onSortCol:function(fd,ic,ord){jq1.OrderByCol(fd,ic,ord,'');}
        }));jq1.InitData();
        var jq2 = $("#jq2_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds","jq2,详情,接受任务") %>,
            left:5,top:380,height:'100%',width:'100%',multiselect:false,rownumbers:true,dataset:ds,caption:"",haveFootBar:true,rowNum:20,pager:$("#jq2_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jq2.RowIndex=jq2.getInd(id);jq2.ColIndex=ic},
            onPaging:function(pgb){jq2.PageNav(pgb,doChangeNow());},onSortCol:function(fd,ic,ord){jq2.OrderByCol(fd,ic,ord,'');}
        }));jq2.InitData();
        
    </script>
</body>
</html>
