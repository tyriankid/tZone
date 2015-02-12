<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PUB_Price_BasePrice.aspx.cs" Inherits="PUB_Price_BasePrice" %>
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
<!-- Powered By Hanstrong RIA Visual.NET From No.4 Design With 2015-1-23 11:04:40 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>价格表</title>
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/jqui1.7.1/custom.css" />
    <link type="text/css" rel="Stylesheet" href="../../res/js.lib/jqgrid/css/ui.jqgrid.css" />
    <script type="text/javascript" src="../../res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/locale-cn.js"></script>
    <script type="text/javascript" src="../../res/js.lib/jqgrid/jqGrid.min.js"></script>
    <script type="text/javascript" src="../../res/js.lib/ria-base.js"></script>
    <script type="text/javascript" src="js/PUB_Price_BasePrice.js"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
   	        
        <div id="labelZ34cc" style="position:absolute;top:284px;left:956px;width:29px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/个</div>    
<div id="div3" style="position:absolute;top:203px;left:13px;width:970px;height:111px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
        <div id="labelPImg" style="position:absolute;top:141px;left:28px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">工程图 (白,蓝图)</div>    
        <div id="labelCT" style="position:absolute;top:106px;left:28px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">彩色写真(卫片)</div>    
        <div id="labelCP" style="position:absolute;top:81px;left:26px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">彩色打印</div>    
        <div id="labelbwPrint" style="position:absolute;top:53px;left:27px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">黑白打印</div>    
<div id="divPrint" style="position:absolute;top:37px;left:13px;width:969px;height:162px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
        <div id="labelGlueBind" style="position:absolute;top:177px;left:87px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">胶装</div>    
        <div id="label1_c_c" style="position:absolute;top:221px;left:30px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号</div>    
        <div id="labelPA0" style="position:absolute;top:144px;left:831px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A0</div>    
        <div id="labelPA1" style="position:absolute;top:142px;left:655px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A1</div>    
        <div id="labelPA2" style="position:absolute;top:140px;left:459px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A2</div>    
        <div id="labelPA3" style="position:absolute;top:140px;left:268px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3</div>    
        <div id="labelPA4" style="position:absolute;top:143px;left:86px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4</div>    
        <div id="labelCA0" style="position:absolute;top:112px;left:457px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A0</div>    
        <div id="labelCA1" style="position:absolute;top:109px;left:268px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A1</div>    
        <div id="labelCA2" style="position:absolute;top:112px;left:87px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A2</div>    
        <div id="labelCA3" style="position:absolute;top:80px;left:833px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3＋</div>    
        <div id="labelCA3D" style="position:absolute;top:80px;left:655px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3双面</div>    
        <div id="labelCA3S" style="position:absolute;top:80px;left:458px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3单面</div>    
        <div id="labelCA4D" style="position:absolute;top:78px;left:268px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4双面</div>    
        <div id="labelCA4S" style="position:absolute;top:79px;left:85px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4单面</div>    
        <div id="labelBA3" style="position:absolute;top:50px;left:833px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3＋</div>    
        <div id="labelBA3D" style="position:absolute;top:48px;left:655px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3双面</div>    
        <div id="labelBA3S" style="position:absolute;top:51px;left:457px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A3单面</div>    
        <div id="labelBA4D" style="position:absolute;top:51px;left:269px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4双面</div>    
        <div id="labelZ18" style="position:absolute;top:146px;left:782px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelBA4S" style="position:absolute;top:50px;left:84px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">A4单面</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:48px;left:142px" Width="60px" Height="20px" ID="btBox_BA4S" ClientInstanceName="btBox_BA4S" Text="" dsfield="ds.BA4S" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="labelZ25" style="position:absolute;top:217px;left:213px;width:34px;height:13px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/页</div>    
        <div id="labelZ16" style="position:absolute;top:144px;left:399px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ15" style="position:absolute;top:145px;left:213px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ14" style="position:absolute;top:113px;left:585px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ13" style="position:absolute;top:112px;left:399px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ12" style="position:absolute;top:113px;left:213px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ11" style="position:absolute;top:83px;left:957px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ10" style="position:absolute;top:82px;left:782px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ9" style="position:absolute;top:81px;left:585px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ8" style="position:absolute;top:80px;left:399px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ7" style="position:absolute;top:81px;left:213px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ6" style="position:absolute;top:53px;left:958px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ5" style="position:absolute;top:53px;left:782px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ4" style="position:absolute;top:54px;left:585px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ3" style="position:absolute;top:53px;left:399px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ2" style="position:absolute;top:54px;left:213px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:171px;left:142px" Width="60px" Height="20px" ID="btBox_GlueBind" ClientInstanceName="btBox_GlueBind" Text="" dsfield="ds.GlueBind" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:140px;left:887px" Width="60px" Height="20px" ID="btBox_PA0" ClientInstanceName="btBox_PA0" Text="" dsfield="ds.PA0" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:139px;left:710px" Width="60px" Height="20px" ID="btBox_PA1" ClientInstanceName="btBox_PA1" Text="" dsfield="ds.PA1" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:140px;left:514px" Width="60px" Height="20px" ID="btBox_PA2" ClientInstanceName="btBox_PA2" Text="" dsfield="ds.PA2" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:140px;left:326px" Width="60px" Height="20px" ID="btBox_PA3" ClientInstanceName="btBox_PA3" Text="" dsfield="ds.PA3" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:140px;left:142px" Width="60px" Height="20px" ID="btBox_PA4" ClientInstanceName="btBox_PA4" Text="" dsfield="ds.PA4" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:109px;left:514px" Width="60px" Height="20px" ID="btBox_CA0" ClientInstanceName="btBox_CA0" Text="" dsfield="ds.CA0" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:109px;left:326px" Width="60px" Height="20px" ID="btBox_CA1" ClientInstanceName="btBox_CA1" Text="" dsfield="ds.CA1" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:109px;left:142px" Width="60px" Height="20px" ID="btBox_CA2" ClientInstanceName="btBox_CA2" Text="" dsfield="ds.CA2" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:77px;left:887px" Width="60px" Height="20px" ID="btBox_CA3Plus" ClientInstanceName="btBox_CA3Plus" Text="" dsfield="ds.CA3Plus" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:76px;left:710px" Width="60px" Height="20px" ID="btBox_CA3D" ClientInstanceName="btBox_CA3D" Text="" dsfield="ds.CA3D" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:77px;left:514px" Width="60px" Height="20px" ID="btBox_CA3S" ClientInstanceName="btBox_CA3S" Text="" dsfield="ds.CA3S" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:77px;left:326px" Width="60px" Height="20px" ID="btBox_CA4D" ClientInstanceName="btBox_CA4D" Text="" dsfield="ds.CA4D" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:77px;left:142px" Width="60px" Height="20px" ID="btBox_CA4S" ClientInstanceName="btBox_CA4S" Text="" dsfield="ds.CA4S" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:48px;left:887px" Width="60px" Height="20px" ID="btBox_BA3Plus" ClientInstanceName="btBox_BA3Plus" Text="" dsfield="ds.BA3Plus" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:47px;left:710px" Width="60px" Height="20px" ID="btBox_BA3D" ClientInstanceName="btBox_BA3D" Text="" dsfield="ds.BA3D" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:48px;left:514px" Width="60px" Height="20px" ID="btBox_BA3S" ClientInstanceName="btBox_BA3S" Text="" dsfield="ds.BA3S" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:48px;left:326px" Width="60px" Height="20px" ID="btBox_BA4D" ClientInstanceName="btBox_BA4D" Text="" dsfield="ds.BA4D" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
<div id="div1" style="position:absolute;top:382px;left:1060px;width:122px;height:165px;display:block;border:1px solid #A0A0A0;overflow:auto"></div>    
        <div id="labelZ24" style="position:absolute;top:173px;left:784px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/Kg</div>    
        <div id="labelZ21" style="position:absolute;top:176px;left:399px;width:30px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/本</div>    
        <div id="labelZ23" style="position:absolute;top:176px;left:585px;width:33px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/本</div>    
        <div id="labelZ20" style="position:absolute;top:177px;left:213px;width:33px;height:13px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/本</div>    
        <div id="labelZ19" style="position:absolute;top:145px;left:958px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <div id="labelZ17" style="position:absolute;top:145px;left:585px;width:16px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:214px;left:142px" Width="60px" Height="20px" ID="btBox_ComposingPage" ClientInstanceName="btBox_ComposingPage" Text="" dsfield="ds.ComposingPage" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="labelAddPrint" style="position:absolute;top:176px;left:652px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">加晒</div>    
        <div id="labelPinBind" style="position:absolute;top:176px;left:458px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">订装</div>    
        <div id="labelBackFont1" style="position:absolute;top:175px;left:257px;width:65px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">脊背字对位</div>    
        <div id="labelBind" style="position:absolute;top:178px;left:28px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">装订</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:281px;left:514px" Width="60px" Height="20px" ID="btBox_ArchBag" ClientInstanceName="btBox_ArchBag" Text="" dsfield="ds.ArchBag" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:170px;left:710px" Width="60px" Height="20px" ID="btBox_AddPrint" ClientInstanceName="btBox_AddPrint" Text="" dsfield="ds.AddPrint" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:171px;left:514px" Width="60px" Height="20px" ID="btBox_PinBind" ClientInstanceName="btBox_PinBind" Text="" dsfield="ds.PinBind" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:171px;left:326px" Width="60px" Height="20px" ID="btBox_BackFont" ClientInstanceName="btBox_BackFont" Text="" dsfield="ds.BackFont" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="label1_c_c_c" style="position:absolute;top:221px;left:30px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">出版单号</div>    
        <div id="labelDesign" style="position:absolute;top:220px;left:29px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">设计制作</div>    
        <div id="labelMemo" style="position:absolute;top:326px;left:20px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">备注</div>    
        <div id="labelArchBag" style="position:absolute;top:283px;left:460px;width:45px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">档案袋(小)</div>    
        <div id="labelTwoPhoto" style="position:absolute;top:280px;left:268px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">2寸相片</div>    
        <div id="labelOnePhoto" style="position:absolute;top:283px;left:86px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">1寸相片</div>    
        <div id="labelUDisk" style="position:absolute;top:249px;left:458px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">U盘</div>    
        <div id="labelScanPage" style="position:absolute;top:220px;left:458px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">扫描</div>    
        <div id="labelCdRom" style="position:absolute;top:251px;left:268px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">光盘</div>    
        <div id="labelEditPage" style="position:absolute;top:217px;left:268px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">编辑</div>    
        <div id="labelVisitingCard" style="position:absolute;top:252px;left:89px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">名片</div>    
        <div id="labelComposingPage" style="position:absolute;top:219px;left:93px;width:43px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">排版</div>    
        <div id="labelOther" style="position:absolute;top:253px;left:30px;width:57px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">杂件</div>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:280px;left:326px" Width="60px" Height="20px" ID="btBox_TwoPhoto" ClientInstanceName="btBox_TwoPhoto" Text="" dsfield="ds.TwoPhoto" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:281px;left:142px" Width="60px" Height="20px" ID="btBox_OnePhoto" ClientInstanceName="btBox_OnePhoto" Text="" dsfield="ds.OnePhoto" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:248px;left:514px" Width="60px" Height="20px" ID="btBox_UDisk" ClientInstanceName="btBox_UDisk" Text="" dsfield="ds.UDisk" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:214px;left:514px" Width="60px" Height="20px" ID="btBox_ScanPage" ClientInstanceName="btBox_ScanPage" Text="" dsfield="ds.ScanPage" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:247px;left:326px" Width="60px" Height="20px" ID="btBox_CdRom" ClientInstanceName="btBox_CdRom" Text="" dsfield="ds.CdRom" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:213px;left:326px" Width="60px" Height="20px" ID="btBox_EditPage" ClientInstanceName="btBox_EditPage" Text="" dsfield="ds.EditPage" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:248px;left:142px" Width="60px" Height="20px" ID="btBox_VisitingCard" ClientInstanceName="btBox_VisitingCard" Text="" dsfield="ds.VisitingCard" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="labelZ32" style="position:absolute;top:284px;left:213px;width:31px;height:13px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/张</div>    
        <div id="labelZ31" style="position:absolute;top:251px;left:584px;width:82px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/个(折合A4)</div>    
        <div id="labelZ27" style="position:absolute;top:218px;left:585px;width:77px;height:16px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/张(折合A4)</div>    
        <div id="labelZ30" style="position:absolute;top:250px;left:399px;width:37px;height:13px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/张</div>    
        <div id="labelZ26" style="position:absolute;top:216px;left:399px;width:34px;height:13px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/页</div>    
        <div id="labelZ29" style="position:absolute;top:250px;left:213px;width:30px;height:13px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/盒</div>    
        <div id="labelZ33" style="position:absolute;top:283px;left:399px;width:33px;height:16px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/张</div>    
        <div id="labelZ34" style="position:absolute;top:284px;left:585px;width:31px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/个</div>    
        <dx:ASPxMemo Enabled="true" Display="block" style="position:absolute;top:343px;left:12px" Width="972px" Height="103px" ID="txa_Memo" ClientInstanceName="txa_Memo" Text="" dsfield="ds.Memo" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="mtextbox">
             <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxMemo>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:457px;left:789px" Width="94px" Height="25px" Text="删除" ID="btnDelete" ClientInstanceName="btnDelete" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/page_delete.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Delete()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:457px;left:892px" Width="94px" Height="25px" Text="导出" ID="btnExcel" ClientInstanceName="btnExcel" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/page_excel.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Excel()}"  />
        </dx:ASPxButton>    
        <div id="labeSetPriceDay" style="position:absolute;top:12px;left:16px;width:76px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">历史定价日期</div>    
        <dx:ASPxComboBox Enabled="true" Display="block" style="position:absolute;top:8px;left:97px" Width="99px" Height="20px" ID="cbDate" ClientInstanceName="cbDate" dsfield="ds.PriceDate" DropDownStyle="DropDownList" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="combox">
    <Items>
        
    </Items>
    <ClientSideEvents BeginCallback="function(s,e){}" CallbackError="function(s,e){}" EndCallback="function(s,e){}" GotFocus="function(s,e){}" ButtonClick="function(s,e){}" DropDown="function(s,e){}" CloseUp="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" SelectedIndexChanged="function(s,e){cbChange()}" LostFocus="function(s,e){}" />
        </dx:ASPxComboBox>    
        <dx:ASPxButton Enabled="false" Display="block" style="position:absolute;top:457px;left:685px" Width="94px" Height="25px" Text="编辑" ID="btnEdit" ClientInstanceName="btnEdit" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/page_edit.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Save('edit')}"  />
        </dx:ASPxButton>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:457px;left:583px" Width="94px" Height="25px" Text="新建" ID="btnAdd" ClientInstanceName="btnAdd" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/page_add.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){Save('add')}"  />
        </dx:ASPxButton>    
        <dx:ASPxTextBox Enabled="true" Display="none" style="position:absolute;top:25px;left:1025px" Width="66px" Height="20px" ID="txt_rowid" ClientInstanceName="txt_rowid" runat="server" dsfield="ds.rowid" Text="" EnableViewState="false" AutoPostBack="false" ctrltype="textbox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxTextBox>    
        <dx:ASPxDateEdit Enabled="true" Display="block" style="position:absolute;top:8px;left:287px" Width="89px" Height="20px" ID="dataChose" ClientInstanceName="dataChose" dsfield="" MaxDate="" MinDate="" EditFormatString="yyyy-MM-dd" defaultval="" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="datebox">
            <ClientSideEvents GotFocus="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" DateChanged="function(s,e){}" LostFocus="function(s,e){}"/>
        </dx:ASPxDateEdit>    
        <div id="label99" style="position:absolute;top:13px;left:207px;width:75px;height:17px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">新建定价日期</div>    
        <div id="lbInfo" style="position:absolute;top:5px;left:386px;width:479px;height:25px;text-align:left;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">要新建价格单,先选择新建定价日期.如果没有选择,点击新建按钮时则默认为当天日期; 价格单不能被编辑.如果要更改只能新建</div>    
        <dx:ASPxButton Enabled="true" Display="block" style="position:absolute;top:457px;left:480px" Width="94px" Height="25px" Text="清空" ID="btnReSet" ClientInstanceName="btnReSet" runat="server" EnableViewState="false" AutoPostBack="false" Image-Url="../../res/icons/page_refresh.png" ctrltype="button">
            <ClientSideEvents Click="function(s,e){ReSet()}"  />
        </dx:ASPxButton>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:282px;left:887px" Width="60px" Height="20px" ID="btBox_ArchBagD" ClientInstanceName="btBox_ArchBagD" Text="" dsfield="ds.ArchBagD" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <dx:ASPxButtonEdit Enabled="true" ReadOnly="false" Display="block" style="position:absolute;top:281px;left:710px" Width="60px" Height="20px" ID="btBox_ArchBagP" ClientInstanceName="btBox_ArchBagP" Text="" dsfield="ds.ArchBagP" runat="server" EnableViewState="false" AutoPostBack="false" ctrltype="btntxtbox">
            <Buttons>
                 <dx:EditButton Image-Url="../../res/icons/(03,09).png" Text="" />
            </Buttons>
            <ClientSideEvents GotFocus="function(s,e){}" ButtonClick="function(s,e){}" KeyDown="function(s,e){}" KeyPress="function(s,e){}" KeyUp="function(s,e){}" TextChanged="function(s,e){}" LostFocus="function(s,e){}" />
        </dx:ASPxButtonEdit>    
        <div id="labelArchBagD" style="position:absolute;top:282px;left:839px;width:46px;height:29px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">档案袋(大)</div>    
        <div id="labelArchBagP" style="position:absolute;top:282px;left:659px;width:51px;height:21px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">档案袋(皮面)</div>    
        <div id="labelZ34c" style="position:absolute;top:285px;left:783px;width:31px;height:13px;text-align:center;font-size:9pt;background:#FFFFFF;display:block;" dsfield="" ctrltype="label">元/个</div>
    </form>

    <script type="text/javascript">
        <%=SetClientUserInfo()%>
        var CtrlList = [{c:btBox_BA4S,s:'btBox_BA4S',t:'btntxtbox',d:'ds.BA4S',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_GlueBind,s:'btBox_GlueBind',t:'btntxtbox',d:'ds.GlueBind',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA0,s:'btBox_PA0',t:'btntxtbox',d:'ds.PA0',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA1,s:'btBox_PA1',t:'btntxtbox',d:'ds.PA1',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA2,s:'btBox_PA2',t:'btntxtbox',d:'ds.PA2',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA3,s:'btBox_PA3',t:'btntxtbox',d:'ds.PA3',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PA4,s:'btBox_PA4',t:'btntxtbox',d:'ds.PA4',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA0,s:'btBox_CA0',t:'btntxtbox',d:'ds.CA0',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA1,s:'btBox_CA1',t:'btntxtbox',d:'ds.CA1',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA2,s:'btBox_CA2',t:'btntxtbox',d:'ds.CA2',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA3Plus,s:'btBox_CA3Plus',t:'btntxtbox',d:'ds.CA3Plus',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA3D,s:'btBox_CA3D',t:'btntxtbox',d:'ds.CA3D',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA3S,s:'btBox_CA3S',t:'btntxtbox',d:'ds.CA3S',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA4D,s:'btBox_CA4D',t:'btntxtbox',d:'ds.CA4D',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CA4S,s:'btBox_CA4S',t:'btntxtbox',d:'ds.CA4S',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BA3Plus,s:'btBox_BA3Plus',t:'btntxtbox',d:'ds.BA3Plus',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BA3D,s:'btBox_BA3D',t:'btntxtbox',d:'ds.BA3D',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BA3S,s:'btBox_BA3S',t:'btntxtbox',d:'ds.BA3S',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BA4D,s:'btBox_BA4D',t:'btntxtbox',d:'ds.BA4D',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_ComposingPage,s:'btBox_ComposingPage',t:'btntxtbox',d:'ds.ComposingPage',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_ArchBag,s:'btBox_ArchBag',t:'btntxtbox',d:'ds.ArchBag',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_AddPrint,s:'btBox_AddPrint',t:'btntxtbox',d:'ds.AddPrint',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_PinBind,s:'btBox_PinBind',t:'btntxtbox',d:'ds.PinBind',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_BackFont,s:'btBox_BackFont',t:'btntxtbox',d:'ds.BackFont',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_TwoPhoto,s:'btBox_TwoPhoto',t:'btntxtbox',d:'ds.TwoPhoto',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_OnePhoto,s:'btBox_OnePhoto',t:'btntxtbox',d:'ds.OnePhoto',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_UDisk,s:'btBox_UDisk',t:'btntxtbox',d:'ds.UDisk',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_ScanPage,s:'btBox_ScanPage',t:'btntxtbox',d:'ds.ScanPage',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_CdRom,s:'btBox_CdRom',t:'btntxtbox',d:'ds.CdRom',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_EditPage,s:'btBox_EditPage',t:'btntxtbox',d:'ds.EditPage',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_VisitingCard,s:'btBox_VisitingCard',t:'btntxtbox',d:'ds.VisitingCard',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:txa_Memo,s:'txa_Memo',t:'mtextbox',d:'ds.Memo',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:cbDate,s:'cbDate',t:'combox',d:'ds.PriceDate',v:'',f:'',l:'50',k:false,n:false,r:true,w:true},{c:txt_rowid,s:'txt_rowid',t:'textbox',d:'ds.rowid',v:'',f:'',l:'50',k:true,n:true,r:true,w:true},{c:dataChose,s:'dataChose',t:'datebox',d:'',f:'',l:-1,v:'',k:false,n:false,r:true,w:true},{c:btBox_ArchBagD,s:'btBox_ArchBagD',t:'btntxtbox',d:'ds.ArchBagD',v:'',f:'',l:'50',k:false,n:true,r:true,w:true},{c:btBox_ArchBagP,s:'btBox_ArchBagP',t:'btntxtbox',d:'ds.ArchBagP',v:'',f:'',l:'50',k:false,n:true,r:true,w:true}];
        var ds = new dataset({id:'ds',grid:'null',data:<%=GetDataSetJson("ds",10000) %>});ds.Bind2Ctrl();
        
        
    </script>
</body>
</html>
