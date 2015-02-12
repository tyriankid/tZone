<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Task_Arch.aspx.cs" Inherits="PUB_Task_Arch" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.1 Design With 2014-12-22 11:48:04 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务管理归档页面</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Task_Arch.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="label1" style="position:absolute;top:12px;left:11px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号</div>    
        <div id="labelBindType" style="position:absolute;top:191px;left:267px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">装订方式</div>    
        <div id="labelRequire" style="position:absolute;top:193px;left:11px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">封面要求</div>    
        <div id="labelSp" style="position:absolute;top:191px;left:721px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">特殊说明</div>    
        <div id="labelCount" style="position:absolute;top:41px;left:395px;width:35px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">份数</div>    
        <div id="labelMonth" style="position:absolute;top:12px;left:827px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">记账月份</div>    
        <div id="labelProducer" style="position:absolute;top:12px;left:672px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">制作人</div>    
        <div id="labelAppUser" style="position:absolute;top:14px;left:529px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请人</div>    
        <div id="labelMajor" style="position:absolute;top:11px;left:395px;width:33px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">专业</div>    
        <div id="labeldep" style="position:absolute;top:11px;left:201px;width:36px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">部门</div>    
        <div id="labelTaskName" style="position:absolute;top:42px;left:12px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务名称</div>    
        <dx:ASPxMemo Enabled="true" Display="block" style="position:absolute;top:41px;left:533px" Width="437px" Height="136px" ID="tbaSp" ClientInstanceName="tbaSp" Text="" dsfield="ds.Memo" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="mtextbox">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxMemo>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:188px;left:163px" Width="126px" Height="20px" ID="cbIsBackFont" ClientInstanceName="cbIsBackFont" runat="server" Text="脊背印字" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:187px;left:406px" Width="128px" Height="20px" ID="cbArch" ClientInstanceName="cbArch" runat="server" Text="需电子归档" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:8px;left:69px" Width="120px" Height="20px" ID="tbIsoNo" ClientInstanceName="tbIsoNo" runat="server" dsfield="ds.PubId" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:8px;left:241px" Width="147px" Height="20px" ID="tbAppDep" ClientInstanceName="tbAppDep" runat="server" dsfield="ds.AppDep" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:9px;left:727px" Width="84px" Height="20px" ID="tbProducer" ClientInstanceName="tbProducer" runat="server" dsfield="ds.Producer" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:9px;left:580px" Width="84px" Height="20px" ID="tbAppUser" ClientInstanceName="tbAppUser" runat="server" dsfield="ds.AppUSer" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:8px;left:437px" Width="84px" Height="20px" ID="tbMajor" ClientInstanceName="tbMajor" runat="server" dsfield="ds.Major" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:8px;left:886px" Width="84px" Height="20px" ID="tbMonth" ClientInstanceName="tbMonth" runat="server" dsfield="ds.AccountMonth" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:36px;left:69px" Width="320px" Height="20px" ID="tbTaskName" ClientInstanceName="tbTaskName" runat="server" dsfield="ds.PrjName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:188px;left:67px" Width="84px" Height="20px" ID="tbRequire" ClientInstanceName="tbRequire" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:187px;left:329px" Width="61px" Height="20px" ID="tbBindType" ClientInstanceName="tbBindType" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:37px;left:438px" Width="82px" Height="20px" ID="tbCount" ClientInstanceName="tbCount" runat="server" dsfield="ds.CopyCount" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
    <div id="gd_pos" style="position:absolute; left:11px; top:65px;">
        <table id="gd_grid" onclick="gd.evClick()" ondblclick="gd.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="gd_pager" style="text-align:center;display:none"></div>
    </div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:630px;left:679px" Width="94px" Height="25px" Text="保存" ID="btnSave" ClientInstanceName="btnSave" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(45,16).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Save()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:630px;left:781px" Width="94px" Height="25px" Text="重置" ID="btnReSet" ClientInstanceName="btnReSet" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_rotate_clockwise.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ReSet()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:630px;left:884px" Width="94px" Height="25px" Text="返回" ID="btnCancel" ClientInstanceName="btnCancel" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(47,25).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){dialog.close('')}"  />
        </dx:ASPxButton>    
<iframe id="iframe1" name="iframe1" frameborder="0" scrolling="auto" url="" parms="" style="position:absolute;top:243px;left:14px;width:962px;height:318px;display:block;border:1px solid #A0A0A0;"></iframe><script type="text/javascript">InitIframe('iframe1')</script>    
        <div id="label12" style="position:absolute;top:220px;left:434px;width:78px;height:17px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">电子归档</div>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:tbaSp,s:'tbaSp',t:'mtextbox',d:'ds.Memo',v:'特殊说明',f:'',l:'50',k:false,n:true,r:true,w:true},{c:cbIsBackFont,s:'cbIsBackFont',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbArch,s:'cbArch',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:tbIsoNo,s:'tbIsoNo',t:'textbox',d:'ds.PubId',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:tbAppDep,s:'tbAppDep',t:'textbox',d:'ds.AppDep',v:'部门',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbProducer,s:'tbProducer',t:'textbox',d:'ds.Producer',v:'制作人',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbAppUser,s:'tbAppUser',t:'textbox',d:'ds.AppUSer',v:'申请人',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbMajor,s:'tbMajor',t:'textbox',d:'ds.Major',v:'专业',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbMonth,s:'tbMonth',t:'textbox',d:'ds.AccountMonth',v:'记账月份',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbTaskName,s:'tbTaskName',t:'textbox',d:'ds.PrjName',v:'任务名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:tbRequire,s:'tbRequire',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:tbBindType,s:'tbBindType',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:tbCount,s:'tbCount',t:'textbox',d:'ds.CopyCount',v:'份数',f:'',l:'50',k:false,n:true,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'null',data:<%=GetDataSetJson("ds",10000) %>});ds.Bind2Ctrl();
        var dsVol = new dataset({id:'dsVol',grid:'gd',data:<%=GetDataSetJson("dsVol",10000,"") %>});dsVol.Bind2Ctrl();
        
        var gd = $("#gd_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("dsVol","") %>,
            left:11,top:65,height:87,width:509,multiselect:false,rownumbers:true,dataset:dsVol,caption:"",haveFootBar:false,rowNum:10000,pager:$("#gd_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){gd.RowIndex=gd.getInd(id);gd.ColIndex=ic},
            onPaging:function(pgb){gd.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){gd.OrderByCol(fd,ic,ord,'');}
        }));gd.InitData();
        
    </script>
</body>
</html>
