<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintPricesReport.aspx.cs" Inherits="Debug.PrintPricesReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>PricesWordShow</title>
    <script src="../res/js.lib/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../res/js.lib/ria-base.js" type="text/javascript"></script>
    
    <script type="text/javascript" language="ecmascript">
    
        var prjid = Req("prjid");
        
    </script>
    
</head>
<body>
    <object id= "WebOffice1" height="520" width="100%" style="LEFT: 0px; TOP: 0px" classid="clsid:E77E049B-23FC-4DB8-B756-60529A35FAD5" codebase="WebOffice.ocx#Version=6,0,5,0">  
        <param name="_Version" value="65536"/>  
        <param name="_ExtentX" value="2646"/>  
        <param name="_ExtentY" value="1323"/>  
        <param name="_StockProps" value="0"/>
    </object>

    <script type="text/javascript" language="javascript">
        var word = document.getElementById("WebOffice1");
        //word.IsShowToolMenu=true;
        //word.ToolBars=true;
        //word.Menubar=true;  
        //word.OpenFromURL("/arh/app/arh/rpt/NopiXls.aspx?volid=" + volid)
        //alert("/app/arh/rpt/NopiXls.aspx?tbl=" + tbl+"&ptbl=" + ptbl+"&xlsid="+xlsid+"&whval="+whval+"&v1="+v1+"&v2="+v2+"&v3="+v3, "xls");
        document.all.WebOffice1.LoadOriginalFile("/PrintPricesReportWord.aspx?prjid=" + prjid,"xls");
        //alert(prjid);
        //dialog.show("NopiXls.aspx?tbl=" + tbl+"&ptbl=" + ptbl+"&xlsid="+xlsid+"&whval="+whval+"&v1="+v1+"&v2="+v2+"&v3="+v3, 400,510,function(s){});
    </script>
</body>
</html>
