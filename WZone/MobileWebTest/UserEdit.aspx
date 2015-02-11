<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserEdit.aspx.cs" Inherits="UserEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"  >
<head runat="server">
    <meta charset="utf-8" /> 
		<meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>UserEdit</title>
        <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
        <script type="text/javascript" src="Scripts/angular/angular.min.js"></script>
        <script type="text/javascript" src="scripts/bootstrap/bootstrap.min.js"></script>

         

        <link type="text/css" href="styles/jqueryui/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
        <link type="text/css" href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <link href="styles/bootstrap/bootstrap.min.css" rel="stylesheet">

<style>
.textboxs
{
	
    padding-top: 2px;
    padding-bottom: 2px;
}
.buttons
{
    
    
    padding-left:auto;
    padding-right:auto;
}

</style>

</head>
<body  runat="server" ng-app="" ng-controller="userController"  >
        
        <table class="table table-striped">
          <thead><tr>
            <th>Edit</th>
            <th>Username</th>
            <th>PassWord</th>
          </tr></thead>
          <tbody><tr ng-repeat="user in users">
            <td>
              <button class="btn" ng-click="editUser(user.id)">
              <span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;Edit
              </button>
            </td>
            <td>{{ user.UserName }}</td>
            <td>{{ user.PassWord }}</td>
          </tr></tbody>
        </table>
    
    <form id="form1" runat=server>
        <div id=divauto runat=server>
        <!-- 后台代码生成 -->
        </div>
        <article style='padding: 30px 50px 10px;'  >
            <div class='input-group  textboxs'>
                <input type='text' ID='username' runat='server' ng-model='UserName' ng-hide='!edit' class='form-control' placeholder='用户名'>
                <span class='input-group-addon ' ng-hide='!edit' > </span>
            </div>
            <div class='input-group textboxs' >
                <input type='text' ID='txtpwdold' runat='server' ng-model='OldPwd' ng-disabled='edit' class='form-control' placeholder='输入旧的密码'>
                <span class='input-group-addon ' > OldPwd</span>
            </div>
            <div class='input-group  textboxs'>
                <input type='text' ID='txtpwdnew1' runat='server' ng-model='pwd1' class='form-control' placeholder='输入新密码'>
                <span class='input-group-addon ' > New</span>
            </div>
            <div class='input-group  textboxs'>
                <input type='text' ID='txtpwdnew2' runat='server' ng-model='pwd2' class='form-control' placeholder='再次输入密码'>
                <span class='input-group-addon ' > New</span>
            </div>
            
        </article>
        
        
    
    
        <div  class= " buttons "   style='padding: 30px 50px 10px;' >
        <br />
                <button class="btn btn-success btn-block "  ng-click="editUser('new')" >
                <span  class="glyphicon glyphicon-user"></span>创建新用户
                </button>
                <asp:Button id="btnsave" runat="server" text="保存" ng-disabled='error || incomplete' onclick="btnsave_Click"    class="btn btn-primary btn-block "   
                  />
                
        </div>
    </form>
    
    

</body>
</html>
