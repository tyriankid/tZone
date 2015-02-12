function _FormLoad() {
    jq1.Open(GetInitSql(false));
    jq2.Open(GetInitSql(true));
    

    doChangeNow();
}

var t; //timer,用于停止这个timer
var rowC1=0;  
var rowC2=0;
var rowId1="";  
var rowId2="";
function doChangeNow(e){
    if(e == "re1")
    {
        jq1.Clear();
        rowId1="";
    }
    if(e == "re2")
    {
        jq2.Clear();
        rowId2="";
    }
    if(e == "re")
    {
        jq1.Clear();jq2.Clear();
        rowId1=""; rowId2="";
    }
    t=setTimeout("doChangeNow()",10);  

    //rowC=$("[role='row']").length;
    rowC1=jq1.RowCount();
    rowC2=jq2.RowCount();
    if($("#jq1_grid").find("tr")[1] != null && $("#jq2_grid").find("tr") != null) //避免报错
    {
		/*2015-01-23 begin bugfix:当我的任务里为空时不执行变色的问题*/
		if(rowC1>0 && document.getElementById("jq2_pager_right").innerHTML.indexOf("无数据显示") >0 && rowId1!=$("#jq1_grid").find("tr")[1].id)
		{
			rowId1=$("#jq1_grid").find("tr")[1].id;
			clearTimeout(t) ;      
            colorInit();
            SetState();
		}
		/*2015-01-23 end*/
        if(rowC1>0 && rowC2>0 && (rowId1!=$("#jq1_grid").find("tr")[1].id || rowId2!=$("#jq2_grid").find("tr")[1].id)  ) 
        {
				rowId1=$("#jq1_grid").find("tr")[1].id;
				rowId2=$("#jq2_grid").find("tr")[1].id;
			
            
            clearTimeout(t) ;      
            colorInit();
            SetState();
        }
    }
}

function Delay(){
    window.setTimeout(function(){colorInit();},800);
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
var isMine=true;
function GetInitSql(isMine) {
/*
    var sql = "SELECT tasktype,typename,(needdate+' '+needhh+':'+needmm)needdates,(appdate+' '+apphh+':'+appmm)appdates,dbo.clip(a.AppDep,':',1)AppDeps,";
        sql+="isono,prjname,phasename,dbo.clip(a.AppUser,':',1)AppUsers,";
        sql+="CASE txt WHEN '新任务' THEN '<font style=color:orange;>'+'新任务'+'</font>' WHEN '待领取' THEN '<font style=color:green;>'+'待领取'+'</font>' WHEN '暂停' THEN '<font style=color:red;>'+'暂停'+'</font>' WHEN '已领取' THEN '<font style=color:grey;>'+'已领取'+'</font>' WHEN '注销' THEN '<font style=color:grey;>'+'注销'+'</font>'END txt,";
        sql+="CASE archstate WHEN 0 THEN '<font style=color:red;>'+'*'+'</font>' WHEN 1 THEN '√' END archstate,";
        sql+="CASE overstate WHEN 0 THEN '<font style=color:red;>'+'*'+'</font>' WHEN 1 THEN '√' END overstate,";
        sql+="dbo.clip(a.Producer,':',1)Producers,rowid,appdep from PUB_Task_Info a ";
        sql+="left join (select txt,val from _Base_DictData where typeid='44E456BCD438441CA314A3F600A54059')b on a.state=b.val";
*/
    var sql="SELECT AccountMonth,state,tasktype,typename,CASE WHEN LEN(needdate+' '+needhh+':'+needmm)>12 THEN (needdate+' '+needhh+':'+needmm)  END needdates,CASE WHEN LEN(appdate+' '+apphh+':'+appmm)>12 THEN (appdate+' '+apphh+':'+appmm)   END appdates,dbo.clip(a.AppDep,':',1)AppDeps,";
        sql+="isono,prjname,phasename,dbo.clip(a.AppUser,':',1)AppUsers,";
        sql+="CASE txt WHEN '新任务' THEN '<font style=color:orange;>'+'新任务'+'</font>' WHEN '待领取' THEN '<font style=color:green;>'+'待领取'+'</font>' WHEN '暂停' THEN '<font style=color:red;>'+'暂停'+'</font>' WHEN '已领取' THEN '<font style=color:grey;>'+'已领取'+'</font>' WHEN '注销' THEN '<font style=color:grey;>'+'注销'+'</font>' else txt END txt,";
        sql+="CASE archstate WHEN 0 THEN '<font style=color:red;>'+'x'+'</font>' WHEN 1 THEN '√' when 2 then '-' END archstate,";
        sql+="CASE overstate WHEN 0 THEN '<font style=color:red;>'+'x'+'</font>' WHEN 1 THEN '√' END overstate,";
        sql+="CASE WHEN LEN(needhh+needmm+apphh+appmm)>=4 THEN ";
        sql+="CASE WHEN DATEDIFF(mi,GETDATE(),CAST((needdate+'  '+needhh+':'+needmm)AS DATETIME))  < (SELECT warningstep FROM dbo.PUB_Warring_Setting) THEN 1 ELSE 0 END ";
        sql+="else -1 END isout,dbo.clip(a.Producer,':',1)Producers,rowid,appdep from PUB_Task_Info a ";
        sql+="left join (select txt,val from _Base_DictData where typeid='44E456BCD438441CA314A3F600A54059')b on a.state=b.val";
        if(isMine)
        {
            sql+=" where a.Producer='"+uinfo+"'";
        }
        sql+=" ORDER BY state asc,appdate DESC,CAST(apphh AS INT) DESC,CAST(appmm AS INT) DESC";
    return sql;
}
function colorInit() 
        {
            var rows=$("#jq1_grid").find("tr");
                for(var i = 0;i<=jq1.RowCount();i++)
                {    
                    //alert(jq1.Item("needdates",i));
                    if(jq1.Item("txt",i) == null) 
                    {
                        //为空不处理,避免报错
                    }
                    else if(jq1.Item("txt",i).indexOf("注销")>0  || jq1.Item("txt",i).indexOf("已领取")>0)
                    {
                        rows.eq(i).css("color","grey");
                    }
                    if(jq1.Item("isout",i)=="1" && (jq1.Item("txt",i).indexOf("新任务")>0 || jq1.Item("txt",i) == "制作中" || jq1.Item("txt",i) =="质检装订"  ))
                    {
                        //获取单行所有的td
                        var td =rows.eq(i).find("td");
                        //索引为3的td里是 需要时间 字段，设置为红色即可
                        td.eq(3).css("color","red");

                        //rows.eq(i).css("color","red");
                    }
                }
            var rows2=$("#jq2_grid").find("tr");
                //alert(jq2.RowCount()+" "+jq1.RowCount()+" "+uinfo+" "+GetInitSql(true));
                for(var j = 0;j<=jq2.RowCount();j++)
                {    
                    
                    if(jq2.Item("txt",j) == null) 
                    {
                        //为空不处理,避免报错
                    }
                    else if(jq2.Item("txt",j).indexOf("注销")>0  || jq2.Item("txt",j).indexOf("已领取")>0)
                    {
                        rows2.eq(j).css("color","grey");
                    }
                    if(jq2.Item("isout",j)=="1" && (jq2.Item("txt",j).indexOf("新任务")>0 || jq2.Item("txt",j) == "制作中"  || jq2.Item("txt",j) =="质检装订"  ))
                    {
                        //获取单行所有的td
                        var td2 =rows2.eq(j).find("td");
                        //索引为3的td里是 需要时间 字段，设置为红色即可
                        td2.eq(3).css("color","red");
                        //rows2.eq(j).css("color","red");
                    }
                }
            SetState();   
			//alert($("#jq2_grid").find("tr")[1].id);
        }

//JqGrid命令列调用方法
function JqGrid_CommandBtnsExec(oGrid, iRow, Cmd) {
    if(oGrid==jq1)
    {
        if(Cmd=="详情")
        {
            
            View();
        }
        if(Cmd=="编辑")
        {
            Edit();
        }
        if(Cmd=="接受任务")
        {
            GetQue();
        }
    }
     if(oGrid==jq2)
    {
        if(Cmd=="详情")
        {
            
            View2();
        }
       
    }
}
//新建
function Add() {
    dialog.show("PUB_Task_Info_Edit.aspx",1008,709,function(s) {
        if(s=="ok")
        {
            jq1.Refresh();
            jq2.Refresh();
            doChangeNow("re");
            //window.setTimeout( "colorInit()",800 );
        }
    });
}
//编辑
function Edit(){
    if(jq1.RowIndex<1)
    {
        alert("请至少选择一行");
        return;
    }
    if(jq1.item("accountmonth")!="")
    {
        alert("已记账的任务无法再修改!");
        return;
    }
    dialog.show("PUB_Task_Info_Edit.aspx?rowid="+jq1.Item("rowid"),983,685,function(s) {
        if(s=="ok")
        {
            jq1.Refresh();
            jq2.Refresh();
            doChangeNow("re");
        }
    });
}
//删除
function Del(){
    if(jq1.RowIndex<1)
    {
        alert("请至少选择一行");
        return;
    }
     if(jq1.item("state")!=0)
    {
        alert("非新建状态的信息无法删除");
        return;
    }
    if(!confirm("是否确定删除?")) return;
     Sql.AddCmd("update PUB_Task_Info set state=6 where rowid='"+ jq1.Item("rowid") +"'");
  
    

    ExecSql(function(s){
        if(s=="")
        {
            alert("删除成功");
            jq1.Refresh();
            window.setTimeout( "colorInit()",800 );
        }
        else
        {
            alert(s);
            return;
        }
    });

}
//查看
function View(){
     dialog.show("PUB_Task_Info_Detail.aspx?rowid="+jq1.item("rowid"),1008,745,function(s) {
        if(s=="re")
        {
            jq1.Refresh();
            doChangeNow("re1");
        }
    });
}
function View2(){
     dialog.show("PUB_Task_Info_Detail.aspx?rowid="+jq2.item("rowid"),1008,745,function(s) {
        if(s=="re")
        {
            jq2.Refresh();
            doChangeNow("re2");
        }
    });
}
function GetQue(){
    if(jq1.item("state")==0)
    {
        Sql.AddCmd("update PUB_Task_Info set state=1,Producer='"+ uinfo +"' where rowid='"+ jq1.Item("rowid") +"'");
        Sql.AddCmd("insert into PUB_Log_Info(PubID,Message,LogUser,ObjID)Values('"+ jq1.item("rowid") +"','领取任务','"+ uname +"','"+ jq1.item("rowid") +"')");
        ExecSql(function(s){
            if(s=="")
            {
                alert("领取成功");
                jq2.Refresh();
                jq1.Refresh();
                window.setTimeout("colorInit()",800);
            }
            else
            {
                alert(s);
                return;
            }
        });
    }
    else
    {
        alert("该状态任务无法接受");
    }
}
function SetState() {
    for(var i = 0; i < jq1.RowCount(); i++) {
    //alert(jq1.item("state",i+1));
        if (jq1.item("state",i+1) == "0"){   
                $("input[value=接受任务]").eq(i).attr("disabled","");
                }
            else {
                $("input[value=接受任务]").eq(i).attr("disabled","disabled");
            
        }
        if(jq1.item("accountmonth",i+1)==""){
                $("input[value=编辑]").eq(i).attr("disabled","");
        }
        else{
                $("input[value=编辑]").eq(i).attr("disabled","disabled");
        }
    }
}