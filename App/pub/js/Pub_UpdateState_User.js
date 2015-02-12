function _FormLoad() {
    txtuser.SetText(Req("defaultuser"));
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
function BtnOk()
{
    var str="{'username':'"+txtuser.GetText()+"'}";
       if(str=="")
    {
        alert("更新人不能为空");
        return;
    }
    //str=str.substring(1);
    str=eval("(["+str+"])");
    dialog.close(str);
}