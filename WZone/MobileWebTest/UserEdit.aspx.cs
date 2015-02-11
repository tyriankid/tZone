using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserEdit : System.Web.UI.Page
{
    SqlHelper db = new SqlHelper();
    DataSet ds = null;
    DataTable dt = null;
    int count=1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string usersinhtml = "";
            count = 0;

            string sql = string.Format(@"SELECT * FROM admins");
            dt = db.GetDataTableBySQL(sql);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                usersinhtml += string.Format(@"{3}id:{0}, UserName:'{1}',  PassWord:'{2}' {4}"
                    , dt.Rows[i][0], dt.Rows[i][1].ToString(), dt.Rows[i][2].ToString(), "{", "}");
                if (dt.Rows.Count - i != 1) usersinhtml += ",";
            }




            divauto.InnerHtml = string.Format(@"
    
        
        
    
        <script>
              function userController($scope) {1}
                  $scope.ID= '';
                  $scope.UserName = '';
                  $scope.PassWord = '';
                  $scope.OldPwd= '';      
                  $scope.users=[{0}
                  
                  ]
                 
                  $scope.edit = true;
                  $scope.error = false;
                  $scope.incomplete = false; 
                  $scope.editUser = function(id) {1}
                  if (id == 'new') {1}
                    $scope.edit = true;
                    $scope.incomplete = true;
                    $scope.UserName = '';
                    {2} else {1}
                    $scope.edit = false;
                    $scope.UserName = $scope.users[id-1].UserName;
                    
                    $scope.OldPwd = $scope.users[id-1].PassWord; 
                  {2}
                {2};
                 
                  $scope.$watch('pwd2',function() {1}$scope.test();{2});
                  $scope.$watch('pwd1',function() {1}$scope.test();{2});
                  $scope.$watch('UserName',function() {1}$scope.test();{2});

                  $scope.test = function() {1}
                      if ($scope.pwd1 !== $scope.pwd2) {1}
                        $scope.error = true;
                        {2} else {1}
                        $scope.error = false;
                      {2}
                      $scope.incomplete = false;
                      if ($scope.edit && (!$scope.UserName.length  ))
                      {1}
                           $scope.incomplete = true;
                      {2}
                      
                    {2};
              {2}
        </script>


        ", usersinhtml, "{", "}");




        }
    }

    class Users
    {
        public int ID { get; set; }
        public string UserName { get; set; }
        public string PassWord { get; set; }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        
            Response.Write("<script>alert('" + username.Value + txtpwdnew2.Value + count+" ');</script>");

            string sqlQ = string.Format(@"select username from admins where username = '{0}'", username.Value);
            dt = db.GetDataTableBySQL(sqlQ);
            if (dt.Rows.Count > 0&& count!=0 )
            {
                string sqlU = string.Format(@"update admins set password='{1}' where username='{0}'", username.Value, txtpwdnew2.Value);
                db.ExecuteBySQL(sqlU);
                count = 0;
                Response.Redirect("UserEdit.aspx");
            }
            else if (!(dt.Rows.Count > 0) && count!=0)
            {
                string sql = string.Format(@"INSERT INTO admins VALUES ('{0}','{1}')", username.Value, txtpwdnew2.Value);
                db.ExecuteBySQL(sql);
                count = 0;
                Response.Redirect("UserEdit.aspx");
            }
        

        
    }
    
}