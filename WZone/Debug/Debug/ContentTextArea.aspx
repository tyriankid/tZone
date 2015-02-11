<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentTextArea.aspx.cs" Inherits="Debug.ContentTextArea" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
<script language="javascript">
    function Save() {
        document.getElementById("Button1").click();
    }
    function wjq(){
		alert("wjq");
    }
</script>
    <form id="form1" runat="server" style=" width:100%;height:100%">
    <div style=" width:100%;height:370px">
        <asp:TextBox ID="RomText" runat="server" Height="100%" TextMode="MultiLine" 
            Width="100%"></asp:TextBox>
            <asp:TextBox ID="tbl" Text="" Visible="false" runat="server"></asp:TextBox>
            <asp:TextBox ID="col" Text="" Visible="false" runat="server"></asp:TextBox>
            <input id="Button1" type="button" value="button" runat="server"  onserverclick="Button1_Click"/>
    </div>
    </form>
</body>
</html>