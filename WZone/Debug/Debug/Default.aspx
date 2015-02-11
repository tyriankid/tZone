<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Debug._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <asp:TextBox ID="txtId" runat="server" Width="236px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="打印三类科技项目报表" />
    <asp:Button ID="btnContent" runat="server" onclick="btnContent_Click" 
        Text="ContentTextArea" />
    
    <asp:Button ID="btnPricesReport" runat="server" Text="打印科研费用登记报表" 
        onclick="btnPricesReport_Click" />
    
    <asp:Button ID="btnDivShow" runat="server" onclick="btnDivShow_Click" 
        Text="计算器" />
    
    <div>
    
    </div>
    </form>
</body>
</html>
