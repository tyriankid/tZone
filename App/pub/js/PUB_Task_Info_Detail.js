var state="";
function _FormLoad() {
    if(Req("rowid")=="")
    {
        
    }
    else
    {
        txtAppDep.SetText($ONM(_txtAppDep.GetText()));
        txtAppUser.SetText($ONM(_txtAppUser.GetText()));
        txtProducer.SetText($ONM(_txtProducer.GetText()));
        txtTaskUser.SetText($ONM(_txtTaskUser.GetText()));

       // chkarch.SetEnabled(false);
     //   chkOver.SetEnabled(false);
        checkbox1.SetEnabled(false);
       // checkbox2.SetEnabled(false); 已经被去除
        
        state=combox8.GetText();
        var obj=GetData("select userid from vBaseURoleInfo WHERE RoleID='R110' and userid='"+ uid +"'")||[];
        if(txtarch.GetText()=="1")
        {
            $("#label29").text("√");
        }
        if(txtarch.GetText()=="2")
        {
            $("#label29").text("-");
        }
         if(txtover.GetText()=="1")
        {
            $("#label30").text("√");
        }
        if(checkbox2.GetChecked()==false)
        {
            //btnArch.SetEnabled(false);
        }
        if(obj.length>0)
        {
            //btnArch.SetEnabled(true);
        }
        if(combox8.GetText()=="新任务")
        {
            //btnArch.SetEnabled(false);
            button3.SetEnabled(false);
        }
        LbInit();        
    }
     $("#iframe1").attr("src","../PUB/HT_UpFile.aspx?&type=view&rowid=" + Req("rowid") + "&intr=pub");
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
function LbInit(){
    var lb=document.getElementById("lbAllCost");
    var AllCost=0.00;
    //获取总价格
    var sql="select totalcost from dbo.PUB_Account_Info WHERE pubid = '"+Req("rowid")+"'";
    var oData = GetData(sql) || [];
    if(oData.length > 0)
    {
        for(var i=0;i<oData.length;i++)
        {
            AllCost += parseFloat(oData[i].totalcost);
        }
    }
    else
    {
        $(lb).hide();
        return;
    }
    $(lb).text("￥"+AllCost);
    $(lb).css("color","Green");
}

function Caul(){
    dialog.show("PUB_Task_Over_Info.aspx?rowid=" + Req("rowid"),990,690,function(s){
        if(s=="ok")//结算成功之后更改check
        {
          //  chkOver.SetEnabled(true);
          //  chkOver.SetChecked(true);
         //   chkOver.SetEnabled(false);
         $("#label30").text("√");
        }
        jqgrid2.Refresh();
        var sql="SELECT overstate FROM pub_task_info where rowid='"+txtrid.GetText()+"'";
        var oData=GetData(sql) || [];
        if(oData.length > 0)
        {
            if(oData[0].overstate == "1")
            {
              //  chkOver.SetEnabled(true);
              //  chkOver.SetChecked(true);
               // chkOver.SetEnabled(false);
               $("#label30").text("√");
            }
            
            else
            {
              //  chkOver.SetEnabled(true);
              //  chkOver.SetChecked(false);
              //  chkOver.SetEnabled(false);
              $("#label30").text("x");
            }
        }

    });

}
function StateUpdate(){
    var sql = "select userid,username,a.rolename FROM BASE_RoleInfo a LEFT JOIN vBaseURoleInfo b on a.rowid = b.RoleID WHERE b.userID='"+uid+"' AND b.rolename='系统管理员'";
    var oData= GetData(sql) || [];
    //alert(oData[0].rolename+" "+uid+" "+oData[0].userid);
    if(state==combox8.GetText())
    {
        alert("状态没有变动,无法更新!");
        return;
    }
    if(oData.length <= 0)//若不是系统管理员
    {
        if(_txtProducer.GetText()==uinfo)   //如果当前登录用户是任务接收人
        {
            if(combox8.GetText()=="新任务"||combox8.GetText()=="待领取"||combox8.GetText()=="已领取"||combox8.GetText()=="注销")
            {
                alert("无权限修改为此状态");
                return;
            }
        }
        else  //如果当前登录用户不是任务接收人也不是系统管理员
        {
            alert("只有任务接受人和管理员才能更新状态!");
            return;
        }
    }
    state=combox8.GetText();
    
    if(combox8.GetText()=="已领取")//只有更新到已领取状态下才会弹窗
    {
        dialog.show("Pub_UpdateState_User.aspx?defaultuser="+txtAppUser.GetText(),211,98,function(s){
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
                    jqgrid2.Refresh();
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
    else  //直接保存
    {
            Sql.AddCmd("update PUB_Task_Info set state='"+ combox8.GetValue() +"' where rowid='"+ Req("rowid") +"'");
            Sql.AddCmd("insert into PUB_Log_Info(PubID,Message,LogUser,ObjID,Memo)values('"+ Req("rowid") +"','更新状态["+ combox8.GetText() +"]','"+ uname +"','"+ Req("rowid") +"','')");
            ExecSql(function(s){
                if(s!="")
                {
                    alert(s);
                    return;
                }
                else
                {
                    alert("更新成功");
                    jqgrid2.Refresh();
                }
            });
    }
   
}
function ToArh(){
    dialog.show("PUB_Arch_Info_Edit.aspx?rowid=" + Req("rowid"),970,510,function(s){
        if(s=="ok")//归档成功之后更改check
        {
           // chkarch.SetEnabled(true);
          //  chkarch.SetChecked(true);
           // chkarch.SetEnabled(false);
           $("#label29").text("√");
        }
        
            jqgrid2.Refresh();
        var sql="SELECT archstate FROM pub_task_info where rowid='"+txtrid.GetText()+"'";
        var oData=GetData(sql) || [];
        if(oData.length > 0)
        {
            if(oData[0].archstate == "1")
            {
               // chkarch.SetEnabled(true);
               // chkarch.SetChecked(true);
               // chkarch.SetEnabled(false);
               $("#label30").text("√");
            }
             if(oData[0].archstate == "0")
            {
               // chkarch.SetEnabled(true);
               // chkarch.SetChecked(true);
               // chkarch.SetEnabled(false);
               $("#label30").text("x");
            }
            else
            {
               // chkarch.SetEnabled(true);
             //   chkarch.SetChecked(false);
             //   chkarch.SetEnabled(false);
             $("#label30").text("-");
            }
        }
    });
    
}
function PrintReport(){
    var rname="出版委托单(新)";
    Report.name =rname;    
    Report.objid =txtrid.GetText();
    Report.objtype = "bdata";  
    Report.sdate = "2014-12-17"; 
    Report.Show();
}

function DownloadAllFiles() {
    window.open("drawingprns://downpuballfile?type=pub&objid=" + Req("rowid"));
}

function Tools() {
    window.open("tools/TOOLS.zip");
}
