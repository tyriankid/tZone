﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Price_Account_View.aspx.cs" Inherits="PUB_Price_Account_View" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.1 Design With 2015-1-16 10:47:40 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产值统计记账页面</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Price_Account_View.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
<div id="div1" style="position:absolute;top:6px;left:5px;width:424px;height:70px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
        <div id="lbEndDate" style="position:absolute;top:20px;left:11px;width:65px;height:15px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">截止日期</div>    
        <div id="lbDep" style="position:absolute;top:54px;left:10px;width:65px;height:15px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">部门</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="true" Display="block" style="position:absolute;top:50px;left:98px" Width="100px" Height="20px" ID="btBoxDep" ClientInstanceName="btBoxDep" Text="" dsfield="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/house.png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){SelectDep()}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:15px;left:98px" Width="100px" Height="20px" ID="dataEnd" ClientInstanceName="dataEnd" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:15px;left:230px" Width="178px" Height="25px" Text="查询未记账项目" ID="btnSearch" ClientInstanceName="btnSearch" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/zoom.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){SearchNotAcc ()}"  />
        </dx:ASPxButton>    
        <div id="label3" style="position:absolute;top:54px;left:449px;width:127px;height:16px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">将勾选的项目计入</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:50px;left:582px" Width="99px" Height="20px" ID="cbAccountDate" ClientInstanceName="cbAccountDate" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        
    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label4" style="position:absolute;top:54px;left:695px;width:52px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">期账单</div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:49px;left:750px" Width="161px" Height="25px" Text="提交" ID="btnConfirm" ClientInstanceName="btnConfirm" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/accept.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){SaveAccountMonth()}"  />
        </dx:ASPxButton>    
    <div id="gd_pos" style="position:absolute; left:5px; top:84px;">
        <table id="gd_grid" onclick="gd.evClick()" ondblclick="gd.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="gd_pager" style="text-align:center;display:none"></div>
    </div>    
        <div id="label5" style="position:absolute;top:57px;left:979px;width:49px;height:16px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">总计: ￥</div>    
        <div id="lbAllCost" style="position:absolute;top:57px;left:1031px;width:56px;height:22px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label"></div>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:11px;left:449px" Width="18px" Height="20px" ID="_btBoxDep" ClientInstanceName="_btBoxDep" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:48px;left:230px" Width="177px" Height="25px" Text="重置" ID="btnReSet" ClientInstanceName="btnReSet" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_rotate_clockwise.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ReSet()}"  />
        </dx:ASPxButton>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:btBoxDep,s:'btBoxDep',t:'btntxtbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:dataEnd,s:'dataEnd',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbAccountDate,s:'cbAccountDate',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:_btBoxDep,s:'_btBoxDep',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'gd',data:<%=GetDataSetJson("ds",10000,"") %>});ds.Bind2Ctrl();
        
        var gd = $("#gd_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds","") %>,
            left:5,top:84,height:'100%',width:'100%',multiselect:true,rownumbers:false,dataset:ds,caption:"",haveFootBar:false,rowNum:10000,pager:$("#gd_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){gd.RowIndex=gd.getInd(id);gd.ColIndex=ic},
            onPaging:function(pgb){gd.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){gd.OrderByCol(fd,ic,ord,'');}
        }));gd.InitData();
        
    </script>
</body>
</html>
