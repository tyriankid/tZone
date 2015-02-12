var roleid = "";
function _FormLoad() {
    roleid = Req("roleid");
    if (roleid !== "") {
        txtName.SetText(Req("rolename"));
        txtMemo.SetText(Req("memo"));
    }
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
    
}

function SaveUser() {
    var rname = txtName.GetText().trim();
    var rmemo = txtMemo.GetText().trim();
    var rtype = "";
    if (rname === "") {
        alert("请输入规范的角色名称");
        return;
    }

    var sql = "";

    if (roleid !== "") {
        sql = "update BASE_Roleinfo set RoleName='" + rname + "',Memo='" + rmemo + "' where rowid='" + roleid + "'";
    }else {
        sql = "insert into BASE_Roleinfo(prowid,RoleName,Memo) values('" + Req("pid") + "','" + rname + "', '" + rmemo + "')";
    }
    ExecSql(sql,function(s){
        if (s === "") {
            alert("保存成功！");
            dialog.close("OK");
        }else {
            alert("保存失败，原因：" + s);
        }
    });
}
