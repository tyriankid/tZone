
function _FormLoad() {
    
    VolQuery();

}

var baseid="";

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

 //载入卷册信息表
function VolQuery(){
    var sql="SELECT VolTitle,CopyCount,ColorType,ColorTypeName FROM dbo.PUB_Vol_Info WHERE 1=1";
    gd.Open(sql);
}

function Init() {
     $("#iframe1").attr("src","../pub/HT_UpFile.aspx?rowid="+baseid);
}




