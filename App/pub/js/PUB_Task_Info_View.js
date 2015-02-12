function _FormLoad() {
    /*if(Req("rowid")=="")
    {
        
    }
    else
    {
        txtdep.SetText($ONM(_txtdep.GetText()));
        txtuser.SetText($ONM(_txtuser.GetText()));
        
        var obj=GetData("select userid from vBaseURoleInfo WHERE RoleID='R110' and userid='"+ uid +"'")||[];
		alert(checkbox2.GetChecked());
        if(checkbox2.GetChecked()==false)
        {
            button5.SetEnabled(false);
        }
        if(obj.length>0)
        {
            button5.SetEnabled(true);
        }
    }
     $("#iframe1").attr("src","../PUB/HT_UpFile.aspx?&type=view&rowid=" + Req("rowid") + "&intr=pub");*/
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


function Caul(){
    dialog.show("PUB_Task_Over_Info.aspx?rowid=" + Req("rowid"),990,690,function(s){});

}
function StateUpdate(){
    if(txtProducer.GetText()==uinfo)
    {
        if(combox8.GetText()=="新任务"||combox8.GetText()=="待领取"||combox8.GetText()=="已领取"||combox8.GetText()=="注销")
        {
            alert("无权限修改为此状态");
            return;
        }
    }
    dialog.show("Pub_UpdateState_User.aspx",211,98,function(s){
    if(s.length>0&&s!="_null")
    {
    Sql.AddCmd("update PUB_Task_Info set state='"+ combox8.GetValue() +"' where rowid='"+ Req("rowid") +"'");
    Sql.AddCmd("insert into PUB_Log_Info(PubID,Message,LogUser,ObjID,Memo)values('"+ Req("rowid") +"','更新状态["+ combox8.GetText() +"]','"+ s[0].username +"','"+ Req("rowid") +"','')");
    ExecSql(function(s){
        if(s!="")
        {
            alert(s);
            return;
        }
        else
        {
            alert("更新成功");
        }
    });
    }
    else
    {
        alert("返回人员为空,更新失败");
        return;
    }
    });
   
}
function ToArh(){
    dialog.show("PUB_Arch_Info_Edit.aspx?rowid=" + Req("rowid"),990,690,function(s){});
    
}
function PrintReport(){
    var rname="出版委托单(新)";
    Report.name =rname;    
    Report.objid =txtrid.GetText();
    Report.objtype = "bdata";  
    Report.sdate = "2014-12-17"; 
    Report.Show();
}