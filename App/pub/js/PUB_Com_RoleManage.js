var blnClk = false;
var lstid = "";
function _FormLoad() {
    ResizeCtrl("tab1",-1,0);
    gd.Resize(-1,0);
}

//流程保存操作调用的方法
function _SaveForm() {
    
}

//流程提交操作调用的方法
function _SubmitForm() {
    
}

//流程提交成功回调方法(obj.wfid,obj.nodeid,obj.sopt)
function _SubmitCallback(obj) {
    
}

//JqGrid命令列调用方法
function JqGrid_CommandBtnsExec(oGrid, iRow, Cmd) {
    if (oGrid === gd) {
        if (Cmd === "删除") DelRole();
    } else {
        if (Cmd === "删除") DelUser();
    }
}

function SwitchTab(s,e) {
    if (e.tab.index === 1) {
        if (gd.RowIndex > 0) {
            if (lstid !== gd.item("rowid")) {
                lstid = gd.item("rowid");
                gdUser.OpenAsyn("select roleid,userid,username from vBaseURoleInfo where roleid='" + lstid + "'",function(){});               
            }
        }
        if (blnClk) return;
        blnClk = true;
        window.setTimeout(function() {gdUser.Resize(0,0);},100);
    }
}

function AddData() {
    if (lstid === "") {
        alert("请选择一个角色");
        return;
    }
    SelObject({type:"u",selcount:0},function(s){
        if (s !== "") {
            var sql = "select ";
            for (var i=0; i<s.length; i++) {
                if (sql !== "select ") sql += " union all select ";
                sql += "'" + s[i].id + "' u,'" + lstid + "' r"
            }
            sql= "insert into BASE_User_Role(userid,roleid) select * from (" + sql + ") T";
            ExecSql(sql,function(s) {
                if (s === "") {
                    gdUser.Refresh();
                } else {
                    alert("添加用户失败，原因：\n\n" + s);
                }
            });
        }
    });
}

function DelRole() {
    if (!confirm("确定要删除选定的角色吗？")) return;
    var sql = "delete from BASE_User_Role where roleid='" + gd.item("rowid") + "'";
    sql += ";delete from BASE_RoleInfo where rowid='" + gd.item("rowid") + "'";
    ExecSql(sql,function(s) {
        if (s === "") {
            lstid = "";
            gdUser.Clear();
            gd.Refresh();
        } else {
            alert("删除失败，原因：\n\n" + s);
        }
    });
}

function DelUser() {

    if (!confirm("确定要移除选定的用户吗？")) return;
    var sql = "delete from BASE_User_Role where userid='" + gdUser.item("userid") + "' and roleid='" + gdUser.item("roleid") + "'";
    ExecSql(sql,function(s) {
        if (s === "") {
            gdUser.Refresh();
        } else {
            alert("删除失败，原因：\n\n" + s);
        }
    });
}

function AddRole(s) {
    if (s == 0) {
        dialog.show("PUB_Com_RoleUserEdit.aspx?pid=R109&roleid=&rolename=&memo=", 300, 200, function(s){
            if (s == "OK") {
                gd.Refresh();
            }
        });
    }else {
        if (gd.RowIndex === 0) {
            alert("请选择要修改的角色！");
            return;
        }
        dialog.show("PUB_Com_RoleUserEdit.aspx?pid=R109&roleid=" + gd.item("rowid") + "&rolename=" + gd.item("rolename") + "&memo=" + gd.item("memo"), 300, 200, function(s){
            if (s == "OK") {
                gd.Refresh();
            }
        });
    }
}
