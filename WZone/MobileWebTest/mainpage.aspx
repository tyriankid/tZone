<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mainpage.aspx.cs" Inherits="mainpage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

        <meta charset="utf-8" /> 
		<meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>Icons</title>
        <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
        <script type="text/javascript" src="Scripts/angular/angular.min.js"></script>
        <script type="text/javascript" src="scripts/bootstrap/bootstrap.min.js"></script>

         

        <link type="text/css" href="styles/jqueryui/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
        <link type="text/css" href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <link href="styles/bootstrap/bootstrap.min.css" rel="stylesheet">
        
<style>
body 
{
	
    padding-top: 0px;
    padding-left: 0px;
}
btns
{
    padding-bottom:10px;
}

</style>

</head>
<body>
    <form id="form1" runat="server">
<nav class="navbar navbar-default" role="navigation">
   <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" 
         data-target="#example-navbar-collapse">
         <span class="sr-only">切换导航</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">我的主页</a>
   </div>
   <div class="collapse navbar-collapse" id="example-navbar-collapse">
      <ul class="nav navbar-nav">
         <li class="active"><a href="#">iOS</a></li>
         <li><a href="#">SVN</a></li>
         <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               Java <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
               <li><a href="#">jmeter</a></li>
               <li><a href="#">EJB</a></li>
               <li><a href="#">Jasper Report</a></li>
               <li class="divider"></li>
               <li><a href="#">分离的链接</a></li>
               <li class="divider"></li>
               <li><a href="#">另一个分离的链接</a></li>
            </ul>
         </li>
      </ul>
   </div>
</nav>
    <div>
        <a href="UserEdit.aspx" class="list-group-item">个人信息编辑<span class="badge">></span></a>
        <a href="#" class="list-group-item">测试</a>
        <a href="#" class="list-group-item">人员信息浏览</a>
        <a href="#" class="list-group-item">开发中....</a>
    </div>

    <div style="padding: 10px 30px 10px ;" content="width=device-width,initial-scale=1">
        <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-user"  ></span> 
        </button>
        <button type="button" class="btn btn-default btn-lg ">
        <span class="glyphicon glyphicon-paperclip"></span> 
        </button>
        <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-search"></span>
        </button>
        <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-cloud"></span>
        </button>
        <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-upload"></span>
        </button>
        <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-comment"></span>
        </button>
        <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-cutlery"></span>
        </button>
        <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-eye-open"></span>
        </button>
        <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-file"></span>
        </button>
        <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-dashboard"></span>
        </button>

    </div>
    
    </form>
</body>
</html>
