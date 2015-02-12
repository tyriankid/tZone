function _FormLoad() {
    
        txtdep.SetText($ONM(_txtdep.GetText()));
        txtAppUser.SetText($ONM(_txtuser.GetText()));
        txtProducer.SetText($ONM(_txtmaker.GetText()));
        var sql = "select userid,username,a.rolename FROM BASE_RoleInfo a LEFT JOIN vBaseURoleInfo b on a.rowid = b.RoleID WHERE b.userID='"+uid+"' AND b.rolename='系统管理员'";
        var oData= GetData(sql) || [];

        if(oData.length <= 0)//若不是系统管理员
        {
        if(_txtmaker.GetText()!=uinfo )
        {
            
             $("#iframe1").attr("src","../PUB/HT_UpFile.aspx?&type=view&rowid="+txtrid.GetText()+"&intr=arh");
        }
        else
        {
            // alert();
             $("#iframe1").attr("src","../PUB/HT_UpFile.aspx?&type=add&rowid="+txtrid.GetText()+"&intr=arh");
        }
        }
        else
        {
            $("#iframe1").attr("src","../PUB/HT_UpFile.aspx?&type=add&rowid="+txtrid.GetText()+"&intr=arh");
        }
    
     //屏蔽按钮
    checkbox1.SetEnabled(false);
    checkbox2.SetEnabled(false);
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
function DownloadAllFiles() {
    window.open("drawingprns://downpuballfile?type=pub&objid=" + Req("rowid"));
}

function Tools() {
    window.open("tools/TOOLS.zip");
}

