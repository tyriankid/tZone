<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>
<html>
<head runat="server">
        <meta charset="utf-8" /> 
		<meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>LogIn</title>
        <script type="text/javascript" src="Scripts/angular/angular.min.js"></script>
        <script type="text/javascript" src="scripts/bootstrap/bootstrap.min.js"></script>

        <link type="text/css" href="styles/jqueryui/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
        <link type="text/css" href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <link href="styles/bootstrap/bootstrap.min.css" rel="stylesheet">
        
        

<style>
body 
{
	padding:10px 20px 20px;
	margin:0px;
	font-size:12px;
}
</style>

</head>
<body>
    
        
    <section id="view_login" ng-app="" class="panel panel-default">
            <header class="panel-heading">
                <h4 class="text-center">Welcome</h4>
            </header>
        <form name="form1" id="form1" runat="server" class="bs-example bs-example-form" role="form" novalidate>
            <article style="padding: 30px 50px 10px;">
            
                <div class="input-group"><!--用户名 -->
                    <span class="input-group-addon "  runat="server" id="lbUser">
                    <span class="glyphicon glyphicon-user"  ></span>
                    </span>
                    <input type="text" ID="txtUnm" runat="server" ng-model="user" name="user" class="form-control" placeholder="admin" >
                </div>
                <br />

                <div class="input-group"><!--密码 -->
                    <span class="input-group-addon ">
                    <span class="glyphicon glyphicon-asterisk"  ></span>
                    </span>
                    <asp:TextBox ID="txtPwd" runat="server" ng-model="pwd" class="form-control" placeholder="123456"
                TextMode="Password"></asp:TextBox>
                </div>
                <p id="rtn" runat="server" style="color:red ; padding: 10px" class="text-center" ></p>
                

                <div >
                    <asp:Button ID="btnLogin" runat="server" Text="登陆" onclick="btnLogin_Click" class="btn btn-primary btn-block" />
                </div>

            
            </article>
        </form>
            <footer>
                
            </footer>
            
    </section>
        
        <section id="view_icons" ng-app="">
            <header>
            
            </header>

            <article>
                
            </article>

            <footer>
            
            </footer>
        
        </section>
    
    
    
</body>
</html>
