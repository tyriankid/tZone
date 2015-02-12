function _FormLoad() {
    
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

function Save() {
    var time = npTime.GetText();
    if (time == null) {
        alert("请输入预警时间！");
        return;
    }

    if (txtRowid.GetText() !== "") {
        ds.Update(Data);
    } else {
        txtRowid.SetText(GUID());
        ds.Insert(Data);
    }
}

function Data(s){
    if(s==""){
        alert("保存成功");
    } else {
        alert(s);
        return;
    }
}
