<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Arch_Info_Edit.aspx.cs" Inherits="PUB_Arch_Info_Edit" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.3 Design With 2015-1-12 15:12:54 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务单电子归档</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Arch_Info_Edit.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="label24" style="position:absolute;top:232px;left:722px;width:113px;height:19px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">特殊说明</div>    
        <div id="label1" style="position:absolute;top:11px;left:12px;width:49px;height:22px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号</div>    
        <div id="label6" style="position:absolute;top:9px;left:210px;width:28px;height:21px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">部门</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:5px;left:244px" Width="147px" Height="20px" ID="txtdep" ClientInstanceName="txtdep" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label7" style="position:absolute;top:10px;left:403px;width:34px;height:16px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">专业</div>    
        <div id="label8" style="position:absolute;top:11px;left:535px;width:48px;height:20px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">申请人</div>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:55px;left:1006px" Width="21px" Height="20px" ID="_txtdep" ClientInstanceName="_txtdep" runat="server" dsfield="ds.AppDep" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:55px;left:1039px" Width="22px" Height="20px" ID="_txtuser" ClientInstanceName="_txtuser" runat="server" dsfield="ds.AppUser" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label17" style="position:absolute;top:39px;left:10px;width:54px;height:18px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">任务名称</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:34px;left:72px" Width="320px" Height="20px" ID="prjname" ClientInstanceName="prjname" runat="server" dsfield="ds.PrjName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label18" style="position:absolute;top:42px;left:411px;width:28px;height:18px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">份数</div>    
    <div id="jq_pos" style="position:absolute; left:5px; top:70px;">
        <table id="jq_grid" onclick="jq.evClick()" ondblclick="jq.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="jq_pager" style="text-align:center;display:none"></div>
    </div>    
        <div id="label22" style="position:absolute;top:235px;left:5px;width:52px;height:16px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">封面要求</div>    
        <div id="label23" style="position:absolute;top:234px;left:272px;width:63px;height:17px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">装订方式</div>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:231px;left:186px" Width="77px" Height="20px" ID="checkbox1" ClientInstanceName="checkbox1" runat="server" Text="脊背印字" dsfield="ds.IsPrint" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:229px;left:445px" Width="114px" Height="20px" ID="checkbox2" ClientInstanceName="checkbox2" runat="server" Text="需电子归档" dsfield="ds.IsArch" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
<iframe id="iframe1" name="iframe1" frameborder="0" scrolling="auto" url="" parms="" style="position:absolute;top:287px;left:5px;width:952px;height:156px;display:block;border:1px solid #A0A0A0;"></iframe><script type="text/javascript">InitIframe('iframe1')</script>    
        <dx:ASPxMemo Enabled="false" Display="block" style="position:absolute;top:35px;left:547px" Width="415px" Height="180px" ID="mtextbox1" ClientInstanceName="mtextbox1" Text="" dsfield="ds.memo" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="mtextbox">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxMemo>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:17px;left:1007px" Width="107px" Height="20px" ID="txtrid" ClientInstanceName="txtrid" runat="server" dsfield="ds.rowid" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:235px;left:1019px" Width="32px" Height="20px" ID="_cbcover" ClientInstanceName="_cbcover" runat="server" dsfield="ds.CoverName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:236px;left:1075px" Width="30px" Height="20px" ID="_cbbook" ClientInstanceName="_cbbook" runat="server" dsfield="ds.BookBindName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:450px;left:865px" Width="94px" Height="25px" Text="返回" ID="button4" ClientInstanceName="button4" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(47,25).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){dialog.close('re')}"  />
        </dx:ASPxButton>    
        <div id="label23" style="position:absolute;top:7px;left:756px;width:37px;height:21px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">制作人</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:55px;left:1073px" Width="22px" Height="20px" ID="_txtmaker" ClientInstanceName="_txtmaker" runat="server" dsfield="ds.Producer" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label24" style="position:absolute;top:268px;left:425px;width:49px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">电子归档</div>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:5px;left:71px" Width="132px" Height="20px" ID="txtIsoNo" ClientInstanceName="txtIsoNo" runat="server" dsfield="ds.IsoNo" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:5px;left:448px" Width="84px" Height="20px" ID="txtMajor" ClientInstanceName="txtMajor" runat="server" dsfield="ds.Major" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:36px;left:448px" Width="85px" Height="20px" ID="txtCount" ClientInstanceName="txtCount" runat="server" dsfield="ds.CopyCount" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:5px;left:591px" Width="143px" Height="20px" ID="txtAppUser" ClientInstanceName="txtAppUser" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:5px;left:806px" Width="157px" Height="20px" ID="txtProducer" ClientInstanceName="txtProducer" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:230px;left:68px" Width="98px" Height="20px" ID="cbcover" ClientInstanceName="cbcover" runat="server" dsfield="ds.CoverName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="false" Display="block" style="position:absolute;top:230px;left:340px" Width="87px" Height="20px" ID="cbbook" ClientInstanceName="cbbook" runat="server" dsfield="ds.BookBindName" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:259px;left:839px" Width="120px" Height="25px" Text="下载全部文件" ID="button2" ClientInstanceName="button2" runat="server" EnableViewState="false" AutoPostBack="false"  ctrltype="button">
            <ClientSideEvents Click="function(s,e){DownloadAllFiles()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:259px;left:734px" Width="100px" Height="25px" Text="工具下载" ID="button3" ClientInstanceName="button3" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/wrench.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Tools()}"  />
        </dx:ASPxButton>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:txtdep,s:'txtdep',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:_txtdep,s:'_txtdep',t:'textbox',d:'ds.AppDep',v:'申请部门',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtuser,s:'_txtuser',t:'textbox',d:'ds.AppUser',v:'申请人',f:'',l:'50',k:false,n:true,r:true,w:true},{c:prjname,s:'prjname',t:'textbox',d:'ds.PrjName',v:'项目名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:checkbox1,s:'checkbox1',t:'checkbox',d:'ds.IsPrint',v:'是否脊背印字',f:'',l:'50',k:false,n:true,r:true,w:true},{c:checkbox2,s:'checkbox2',t:'checkbox',d:'ds.IsArch',v:'是否需要归档',f:'',l:'50',k:false,n:true,r:true,w:true},{c:mtextbox1,s:'mtextbox1',t:'mtextbox',d:'ds.memo',v:'备注',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtrid,s:'txtrid',t:'textbox',d:'ds.rowid',v:'',f:'',l:'50',k:true,n:true,r:true,w:true},{c:_cbcover,s:'_cbcover',t:'textbox',d:'ds.CoverName',v:'封面要求名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_cbbook,s:'_cbbook',t:'textbox',d:'ds.BookBindName',v:'装订方式名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:_txtmaker,s:'_txtmaker',t:'textbox',d:'ds.Producer',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtIsoNo,s:'txtIsoNo',t:'textbox',d:'ds.IsoNo',v:'出版单号',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtMajor,s:'txtMajor',t:'textbox',d:'ds.Major',v:'专业',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtCount,s:'txtCount',t:'textbox',d:'ds.CopyCount',v:'份数',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txtAppUser,s:'txtAppUser',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:txtProducer,s:'txtProducer',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cbcover,s:'cbcover',t:'textbox',d:'ds.CoverName',v:'封面要求名称',f:'',l:'50',k:false,n:true,r:true,w:true},{c:cbbook,s:'cbbook',t:'textbox',d:'ds.BookBindName',v:'装订方式名称',f:'',l:'50',k:false,n:true,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'null',data:<%=GetDataSetJson("ds",10000) %>});ds.Bind2Ctrl();
        var ds2 = new dataset({id:'ds2',grid:'jq',data:<%=GetDataSetJson("ds2",10000,"") %>});ds2.Bind2Ctrl();
        
        var jq = $("#jq_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds2","") %>,
            left:5,top:70,height:121,width:533,multiselect:false,rownumbers:false,dataset:ds2,caption:"",haveFootBar:false,rowNum:10000,pager:$("#jq_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){jq.RowIndex=jq.getInd(id);jq.ColIndex=ic},
            onPaging:function(pgb){jq.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){jq.OrderByCol(fd,ic,ord,'');}
        }));jq.InitData();
        
    </script>
</body>
</html>
