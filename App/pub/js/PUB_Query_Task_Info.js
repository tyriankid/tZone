function _FormLoad() {
     ReSet();
     doChangeNow(); 
}
var t; //timer,用于停止这个timer
var rowC=0;  //gridview的行数,用于判断数据是否已经加载完毕
var rowId="";  //行id,在数据载入完毕之后,存放第一行的id,用于点击页跳转时,循环快速判断下一页第一行的id是否与之相同,当变得不同时,即可第一时间调用函数
var totalC="";  //存放页脚 共***条的innerhtml
var stopNow=0;  //无条件的timer停止,目前使用到的地方有: Query()末尾
function doChangeNow(isRefresh){
    if(isRefresh == "re")
    {
        jq1.Refresh();
        jq1.Clear();
        rowId="";
    }
    //递归此方法,方法一开始便判断gridview里的行数是不是多余2(任何数据都没有的情况下默认有2行)
    t=setTimeout("doChangeNow()",10);  
    rowC=$("[role='row']").length;
    if($("#jq1_grid").find("tr") != null ) //避免报错
    {
        //如果发现有数据载入(rowC>2),并且第一排的id与成功调用了变色方法之后第一行的id是否一致
        if(rowC>2 && rowId!=$("#jq1_grid").find("tr")[1].id  || totalC!=document.getElementById("jq1_pager_right").innerHTML ) 
        {
            rowId=$("#jq1_grid").find("tr")[1].id;   //载入完毕时的rowId
			totalC=document.getElementById("jq1_pager_right").innerHTML;

            //取消timer,执行变色方法和setstate方法
            clearTimeout(t) ;      
            colorInit();
            SetState();
        }
    }
	if(stopNow==1)
	{
		clearTimeout(t) ;  
		stopNow = 0; //执行之后初始化标记
	}
}
/*
function delay(){
    window.setTimeout("colorInit()",800);
}

function Jump(){
    
    t=setTimeout("Jump()",10);
    //alert(rowId+"  "+$("#jq1_grid").find("tr")[1].id);
    
    if(rowId!=$("#jq1_grid").find("tr")[1].id) //当储存的第一行代码与目前的代码不同时,立即执行变色方法.
    {
        rowId=$("#jq1_grid").find("tr")[1].id;
        clearTimeout(t) ;
        colorInit();
        SetState();
    }
    
}
*/

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
    switch (Cmd) {
        case "详情":
            View();
            break;
        case "编辑":
            Edit();
            break;
        default:
            break;
    }
}


function colorInit() {
    
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

}

//编辑
function Edit(){
    if(jq1.RowIndex<1)
    {
        alert("请至少选择一行");
        return;
    }
    if(jq1.item("state")!=0)
    {
        alert("已经接受任务的出版单无法修改");
        return;
    }
    dialog.show("PUB_Task_Info_Edit.aspx?rowid="+jq1.Item("rowid"),983,685,function(s) {
        if(s=="ok")
        {
            doChangeNow("re");
        }
    });
}

//查看
function View(){
     dialog.show("PUB_Task_Info_Detail.aspx?rowid="+jq1.Item("rowid"),1008,745,function(s) {
        if(s=="re")
        {
            
            //window.setTimeout( "colorInit()",300 );
            doChangeNow("re");
        }
    });
}


function SetState() {
    var sql="select roleid,userid,username from vBaseURoleInfo where roleid='R110' and userid='"+ uid +"'";
    var obj=GetData(sql)||[];
    for(var i = 0; i < jq1.RowCount(); i++) {
    //alert(jq2.item("state",i+1));
        if (obj.length>0){
            
                $("input[value=编辑]").eq(i).attr("disabled","");
                }
            else {
                $("input[value=编辑]").eq(i).attr("disabled","disabled");
            
        }
    }
}
var  sql="";
function Query(){
sql="SELECT tasktype,typename,CASE WHEN LEN(needdate+' '+needhh+':'+needmm)>12 THEN (needdate+' '+needhh+':'+needmm)  END needdates,CASE WHEN LEN(appdate+' '+apphh+':'+appmm)>12 THEN (appdate+' '+apphh+':'+appmm)   END appdates,dbo.clip(a.AppDep,':',1)AppDeps,";
        sql+="isono,prjname,phasename,dbo.clip(a.AppUser,':',1)AppUsers,";
        sql+="CASE txt WHEN '新任务' THEN '<font style=color:orange;>'+'新任务'+'</font>' WHEN '待领取' THEN '<font style=color:green;>'+'待领取'+'</font>' WHEN '暂停' THEN '<font style=color:red;>'+'暂停'+'</font>' WHEN '已领取' THEN '<font style=color:grey;>'+'已领取'+'</font>' WHEN '注销' THEN '<font style=color:grey;>'+'注销'+'</font>' else txt END txt,";
        sql+="CASE archstate WHEN 0 THEN '<font style=color:red;>'+'x'+'</font>' WHEN 1 THEN '√' when 2 then '-' END archstate,";
        sql+="CASE overstate WHEN 0 THEN '<font style=color:red;>'+'x'+'</font>' WHEN 1 THEN '√' END overstate,";
        sql+="CASE WHEN LEN(apphh+appmm+needhh+needmm)>=4 THEN ";
        sql+="CASE WHEN DATEDIFF(mi,GETDATE(),CAST((needdate+'  '+needhh+':'+needmm)AS DATETIME))  < (SELECT warningstep FROM dbo.PUB_Warring_Setting) THEN 1 ELSE 0 END ";
        sql+="else -1 END isout,dbo.clip(a.Producer,':',1)Producers,rowid,appdep from PUB_Task_Info a ";
        sql+="left join (select txt,val from _Base_DictData where typeid='44E456BCD438441CA314A3F600A54059')b on a.state=b.val where 1=1";
    if(txtiso.GetText()!="全部" && txtno.GetText()=="")
    {
        sql+=" and  a.isono like '%212"+ txtiso.GetText() +"-"+ txtyear.GetText() +"%' ";
    }
    if(txtiso.GetText()=="全部" && txtno.GetText()!="")
    {
        sql+=" and  a.isono like '%212"+"_-"+ txtyear.GetText() +"-"+ txtno.GetText() +"%' ";
    }
    if(txtdep.GetText()!="")
    {
        sql+=" and a.appdep like '%"+ txtdep.GetText() +"%' ";
    }
    if(txtpro.GetText()!="")
    {
        sql+=" and  a.major like '%"+ txtpro.GetText() +"%' ";
    }
    if(txtuser.GetText()!="")
    {
        sql+=" and a.appuser like '%"+ txtuser.GetText() +"%' ";
    }
    if(txtphone.GetText()!="")
    {
        sql+=" and a.phone like '%"+ txtphone.GetText() +"%'";
    }
    if(txtmobile.GetText()!="")
    {
        sql+=" and a.mobile like '%"+ txtmobile.GetText() +"%'";
    }
    if(appStr.GetText()!=""&&appEnd.GetText()=="")
    {
        sql+=" and a.appdate>='"+ appStr.GetText() +"' ";
    }
    if(appStr.GetText()==""&&appEnd.GetText()!="")
    {
        sql+=" and a.appdate<='"+ appEnd.GetText() +"' ";
    }
    if(appStr.GetText()!=""&&appEnd.GetText()!="")
    {
        sql+=" and  a.appdate>='"+ appStr.GetText() +"' and a.appdate<'"+ appEnd.GetText() +"' ";
    }
    if(needStr.GetText()!=""&&needEnd.GetText()=="")
    {
        sql+=" and a.NeedDate>='"+ needStr.GetText() +"' ";
    }
    if(needStr.GetText()==""&&needEnd.GetText()!="")
    {
        sql+=" and a.NeedDate<='"+ needEnd.GetText() +"' ";
    }
    if(needStr.GetText()!=""&&needEnd.GetText()!="")
    {
        sql+=" and  a.NeedDate>='"+ needStr.GetText() +"' and a.NeedDate<'"+ needEnd.GetText() +"' ";
    }
    if(cbphase.GetText()!="全部")
    {
        sql+=" and a.PhaseName like '%"+ cbphase.GetText() +"%'";
    }
    if(cbtype.GetText()!="全部")
    {
        sql+=" and a.TypeName like '%"+ cbtype.GetText() +"%'";
    }
    if(txtmaker.GetText()!="")
    {
        sql+=" and a.Producer like '%"+ txtmaker.GetText() +"%'";
    }
    if(cbstate.GetText()!="全部")
    {
        sql+=" and a.state="+ cbstate.GetValue() +" ";
    }
    if(cbcaul.GetValue()!=-1)
    {
        sql+=" and a.ArchState='"+ cbcaul.GetValue +"'";
    }
    if(cbarh.GetValue()!=-1)
    {
        sql+=" and a.OverState='"+ cbarh.GetValue +"'";
    }
    if(txtprjname.GetText()!="")
    {
        sql+=" and a.PrjName like '%"+ txtprjname.GetText() +"%'";
    }
    if(txtsubprj.GetText()!="")
    {
        sql+=" and a.rowid=(select top 1 PubID from PUB_Vol_Info where VolTitle like '%"+ txtsubprj.GetText() +"%')";
    }

    sql+=" ORDER BY state asc,appdate DESC,CAST(apphh AS INT) DESC,CAST(appmm AS INT) DESC";
    
	if(sqlNow==sql){stopNow=1;  return;}//如果查询条件没有变动的情况下触发了Query方法,返回. 并把绝对停止循环设为1
    jq1.Open(sql);
	sqlNow=sql;
}
function ReSet(){
    txtiso.SetSelectedIndex(0);
    txtyear.SetText(S.date.y);
    txtno.SetText("");
    txtdep.SetText("");
    txtpro.SetText("");
    txtuser.SetText("");
    txtphone.SetText("");
    txtmobile.SetText("");
    appStr.SetText("");
    appEnd.SetText("");
    needStr.SetText("");
    needEnd.SetText("");
    cbphase.SetSelectedIndex(0);
    cbtype.SetSelectedIndex(0);
    txtmaker.SetText("");
    cbstate.SetSelectedIndex(0);
    cbcaul.SetSelectedIndex(0);
    cbarh.SetSelectedIndex(0);
    txtprjname.SetText("");
    txtsubprj.SetText("");
    Query();
    
    
}

var sqlNow="";
function search() {
	Query();
	doChangeNow();
}

function res() {
	ReSet();
	doChangeNow();
}