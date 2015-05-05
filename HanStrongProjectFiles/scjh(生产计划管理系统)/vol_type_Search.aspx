<%@ Page Language="C#" AutoEventWireup="true" CodeFile="vol_type_Search.aspx.cs" Inherits="vol_type_Search" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.3 Design With 2015-4-29 11:09:46 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>卷册分类统计查询</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/vol_type_Search.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
<div id="div1" style="position:absolute;top:5px;left:5px;width:679px;height:41px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:35px;left:946px" Width="109px" Height="20px" ID="txtStart" ClientInstanceName="txtStart" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:17px;left:122px" Width="120px" Height="20px" ID="dateStart" ClientInstanceName="dateStart" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <div id="label1" style="position:absolute;top:21px;left:20px;width:94px;height:18px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版开始日期：</div>    
        <div id="label2" style="position:absolute;top:22px;left:261px;width:94px;height:18px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版结束日期：</div>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:18px;left:364px" Width="120px" Height="20px" ID="dateEnd" ClientInstanceName="dateEnd" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:16px;left:517px" Width="71px" Height="25px" Text="查询" ID="btn_Search" ClientInstanceName="btn_Search" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(22,00).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Search()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:16px;left:592px" Width="71px" Height="25px" Text="重置" ID="btn_ReSet" ClientInstanceName="btn_ReSet" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_rotate_clockwise.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ReSet()}"  />
        </dx:ASPxButton>    
    <div id="jq_pos" style="position:absolute; left:5px; top:78px;">
        <table id="jq_grid" onclick="jq.evClick()" ondblclick="jq.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jq_pager" style="text-align:center;display:none"></div>
    </div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:51px;left:5px" Width="95px" Height="25px" Text="打印报表" ID="btn_PrintReport" ClientInstanceName="btn_PrintReport" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/printer.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){PrintReport()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:51px;left:104px" Width="101px" Height="25px" Text="刷新查询" ID="btn_ReSearch" ClientInstanceName="btn_ReSearch" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_refresh.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ReSearch()}"  />
        </dx:ASPxButton>    
        <div id="label3" style="position:absolute;top:55px;left:213px;width:359px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:none;" dsfield="" ctrltype="label">如果当天的卷册数量有变动,请点击刷新查询以获取最新信息</div>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:txtStart,s:'txtStart',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:dateStart,s:'dateStart',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:dateEnd,s:'dateEnd',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'jq',data:<%=GetDataSetJson("ds",10000,"") %>});ds.Bind2Ctrl();
        
        var jq = $("#jq_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds","") %>,
            left:5,top:78,height:188,width:678,multiselect:false,rownumbers:false,dataset:ds,caption:"",haveFootBar:false,rowNum:10000,pager:$("#jq_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jq.RowIndex=jq.getInd(id);jq.ColIndex=ic},
            onPaging:function(pgb){jq.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){jq.OrderByCol(fd,ic,ord,'');}
        }));jq.InitData();
        
    </script>
</body>
</html>
