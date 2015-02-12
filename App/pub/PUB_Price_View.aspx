<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Price_View.aspx.cs" Inherits="PUB_Price_View" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.5 Design With 2015-1-12 10:11:38 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产值统计查询页面</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Price_View.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
<div id="div1_c" style="position:absolute;top:102px;left:5px;width:640px;height:44px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
<div id="div1" style="position:absolute;top:5px;left:5px;width:641px;height:91px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:16px;left:134px" Width="91px" Height="20px" ID="data1" ClientInstanceName="data1" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <div id="label1" style="position:absolute;top:19px;left:242px;width:21px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">至</div>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:17px;left:262px" Width="91px" Height="20px" ID="data2" ClientInstanceName="data2" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:18px;left:366px" Width="142px" Height="20px" ID="cb1" ClientInstanceName="cb1" runat="server" Text="仅显示未记账的项目" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:41px;left:134px" Width="91px" Height="20px" ID="dataM" ClientInstanceName="dataM" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){GetMonth()}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:66px;left:161px" Width="49px" Height="20px" ID="Part1" ClientInstanceName="Part1" dsfield="" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        <dx:ListEditItem Text="A" Value="A" />        
<dx:ListEditItem Text="B" Value="B" />        
<dx:ListEditItem Text="C" Value="C" />        
<dx:ListEditItem Text="D" Value="D" />        

    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <div id="label2" style="position:absolute;top:68px;left:136px;width:24px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">212</div>    
        <div id="label3" style="position:absolute;top:67px;left:214px;width:7px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">-</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:66px;left:223px" Width="47px" Height="20px" ID="Part2" ClientInstanceName="Part2" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <div id="label9" style="position:absolute;top:67px;left:276px;width:7px;height:23px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">-</div>    
        <dx:ASPxTextBox Enabled="true" Display="block" style="position:absolute;top:66px;left:284px" Width="68px" Height="20px" ID="Part3" ClientInstanceName="Part3" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:114px;left:89px" Width="123px" Height="20px" ID="btBoxDep" ClientInstanceName="btBoxDep" Text="" dsfield="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/house.png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){SelectDep(this)}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:114px;left:508px" Width="123px" Height="20px" ID="btBoxDepMaker" ClientInstanceName="btBoxDepMaker" Text="" dsfield="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(47,06).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){SelectMan2()}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:114px;left:303px" Width="123px" Height="20px" ID="btBoxUser" ClientInstanceName="btBoxUser" Text="" dsfield="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(47,06).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){SelectMan1()}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:6px;left:659px" Width="88px" Height="25px" Text="查询" ID="btnSearch" ClientInstanceName="btnSearch" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(22,00).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){bS()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:36px;left:659px" Width="88px" Height="25px" Text="重置" ID="btnReSet" ClientInstanceName="btnReSet" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/arrow_rotate_clockwise.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ReSet()}"  />
        </dx:ASPxButton>    
    <div id="gd_pos" style="position:absolute; left:5px; top:151px;">
        <table id="gd_grid" onclick="gd.evClick()" ondblclick="gd.evDblclick()" cellpadding="0" cellspacing="0"></table>
        <div id="gd_pager" style="text-align:center;display:block"></div>
    </div>    
        <div id="label5" style="position:absolute;top:126px;left:983px;width:51px;height:11px;text-align:right;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">总计：￥</div>    
        <div id="lbAllCost" style="position:absolute;top:126px;left:1040px;width:52px;height:18px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label"></div>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:58px;left:973px" Width="22px" Height="20px" ID="_btBoxDep" ClientInstanceName="_btBoxDep" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:59px;left:1022px" Width="13px" Height="20px" ID="_btBoxDepMaker" ClientInstanceName="_btBoxDepMaker" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:58px;left:1005px" Width="13px" Height="20px" ID="_btBoxUser" ClientInstanceName="_btBoxUser" runat="server" dsfield="" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:122px;left:659px" Width="196px" Height="25px" Text="将结果导出为Excel文件" ID="btnExcel" ClientInstanceName="btnExcel" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/(08,03).png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Excel()}"  />
        </dx:ASPxButton>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:114px;left:447px" Width="59px" Height="20px" ID="chk_Maker" ClientInstanceName="chk_Maker" runat="server" Text="制作人" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){chkChecked('chk_Maker')}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:116px;left:243px" Width="86px" Height="20px" ID="chk_AppUser" ClientInstanceName="chk_AppUser" runat="server" Text="申请人" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){chkChecked('chk_AppUser')}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:115px;left:35px" Width="62px" Height="20px" ID="chk_AppDep" ClientInstanceName="chk_AppDep" runat="server" Text="部门" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){chkChecked('chk_AppDep')}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:64px;left:33px" Width="104px" Height="20px" ID="chk_IsoNo" ClientInstanceName="chk_IsoNo" runat="server" Text="按出版单号" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){chkChecked('iso')}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:39px;left:33px" Width="110px" Height="20px" ID="chk_Month" ClientInstanceName="chk_Month" runat="server" Text="按记账月份" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){chkChecked('month')}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>    
        <dx:ASPxCheckBox Enabled="true" Display="block" style="position:absolute;top:13px;left:33px" Width="106px" Height="20px" ID="chk_Time" ClientInstanceName="chk_Time" runat="server" Text="按时间范围" dsfield="" EnableViewState="false" AutoPostBack="false" ctrltype="checkbox">
            <ClientSideEvents CheckedChanged="function(s,e){chkChecked('time')}" GotFocus="function(s,e){}" ValueChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxCheckBox>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:data1,s:'data1',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:data2,s:'data2',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:cb1,s:'cb1',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:dataM,s:'dataM',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:Part1,s:'Part1',t:'combox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:Part2,s:'Part2',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:Part3,s:'Part3',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:btBoxDep,s:'btBoxDep',t:'btntxtbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:btBoxDepMaker,s:'btBoxDepMaker',t:'btntxtbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:btBoxUser,s:'btBoxUser',t:'btntxtbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:_btBoxDep,s:'_btBoxDep',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:_btBoxDepMaker,s:'_btBoxDepMaker',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:_btBoxUser,s:'_btBoxUser',t:'textbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:chk_Maker,s:'chk_Maker',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:chk_AppUser,s:'chk_AppUser',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:chk_AppDep,s:'chk_AppDep',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:chk_IsoNo,s:'chk_IsoNo',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:chk_Month,s:'chk_Month',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:chk_Time,s:'chk_Time',t:'checkbox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'gd',data:<%=GetDataSetJson("ds",20,"") %>});ds.Bind2Ctrl();
        
        var gd = $("#gd_grid").jqGrid($.extend(JqGridFixOptions,{
            <%=GetJqGridColumn("ds","") %>,
            left:5,top:151,height:'100%',width:'100%',multiselect:false,rownumbers:false,dataset:ds,caption:"",haveFootBar:true,rowNum:20,pager:$("#gd_pager"),
            evRowClick:'',evRowDblClick:'',evCustomButtonClick:'',onCellSelect:function(id,ic,ct,e){gd.RowIndex=gd.getInd(id);gd.ColIndex=ic},
            onPaging:function(pgb){gd.PageNav(pgb,'');},onSortCol:function(fd,ic,ord){gd.OrderByCol(fd,ic,ord,'');}
        }));gd.InitData();
        
    </script>
</body>
</html>
