function _FormLoad() {
    Search(true);
    IptInit();
    LbInit(true);
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

function SearchNotAcc () {
    Search(false);
    LbInit(false);
}


function Search(isAcc) {
    //载入jqgrid
    var sql= "SELECT pubid,rowid,appdate,isono,dbo.clip(appdep,':',1) appdep,dbo.clip(appuser,':',1) appuser,";
        sql+="state=(SELECT CASE state WHEN 0 THEN '新任务' WHEN 1 then '制作中' WHEN 2 THEN '质检装订' WHEN 3 THEN '待领取' WHEN 4 THEN '暂停' WHEN 5 THEN '已领取' WHEN 6 THEN '注销' END states FROM dbo.PUB_Task_Info c WHERE c.rowid=a.pubid),";
        sql+="prjname,blackprintcost,colorprintcost,whitecost,colorcost,bindcost,designcost,othercost,totalcost,accountmonth";
        sql+=" FROM  dbo.PUB_Account_Info a WHERE 1=1 ";
        sql += " and (SELECT state FROM dbo.PUB_Task_Info c WHERE c.rowid=a.pubid) <> 6 ";
        if(!isAcc)//查询未记账项目
        {
            sql +=" and accountmonth = ''";
        }
        if(dataEnd.GetText() != "")
        {
            sql +=" and appdate <= '"+dataEnd.GetText()+"'";
        }
        if(btBoxDep.GetText()!="")
        {
            sql +=" and dbo.clip(appdep,':',1) = '"+btBoxDep.GetText()+"'";
        }
        sql +=" order by appdate desc";
    gd.Open(sql);
}
//根据是否记账为参数查找账单的总计价格并显示
function LbInit(isAcc){
    //因为gd的数据载入可能在_formload方法之后,所以不能用读取gd数据的方法将该函数放到_formload函数内
    var lb=document.getElementById("lbAllCost");
    var AllCost=0.00;
    //获取总价格
    var sql="select totalcost,accountmonth from dbo.PUB_Account_Info a where 1=1 and (SELECT state FROM dbo.PUB_Task_Info c WHERE c.rowid=a.pubid) <> 6 ";
    if(!isAcc)//查询未记账项目
    {
        sql +="and accountmonth = ''";
    }
    if(dataEnd.GetText() != "")
    {
        sql +=" and appdate <= '"+dataEnd.GetText()+"'";
    }
    if(btBoxDep.GetText()!="")
    {
        sql +=" and appdep = '"+_btBoxDep.GetText()+"'";
    }
    var oData = GetData(sql) || [];
    if(oData.length >0)
    {
        for(var i=0;i<oData.length;i++)
        {
            AllCost += parseFloat(oData[i].totalcost);
        }
    }
    AllCost=roundFun(AllCost,2);
    $(lb).text(AllCost);
    $(lb).css("color","Green");
}

function IptInit(){
    var sql="SELECT lastmonth,currentmonth FROM dbo.PUB_Account_Setting where isstart = 0";
    var oData = GetData(sql) || [];
    if(oData.length > 0)
    {
        cbAccountDate.SetText(oData[0].currentmonth);
    }
    btBoxDep.SetEnabled(true);
}

//选择部门
function SelectDep(){
    
    var rt=SelObject({type:"d",selcount:1,modal:"div"},function(str){
            
            if(str!="")
            {
                _btBoxDep.SetText(str[0].id+":"+str[0].text);
                btBoxDep.SetText(str[0].text);
            }
        });
    
    
}

function ReSet() {
    btBoxDep.SetText("");
    dataEnd.SetText("");
    Search(true);
    IptInit();
    LbInit(true);
}

function SaveAccountMonth() {
    var count= 0 ;  /*用于判断是否勾选了至少一项信息*/
    var rids="";    /*存放选中项的rowid*/
    for(var i=1 ;i<=gd.RowCount() ;i++)
    {
        if(gd.RowChecked(i)==true)
        {
            count++;
            rids +="," + gd.item("pubid",i);
        }
        if(gd.RowChecked(i)==true && gd.item("accountmonth",i) != "")
        {
            alert("请勿重复提交!");
            return;
        }
    }
    if(count==0)
    {
        alert("请勾选要记账的项目!");
        return;
    }
    

    if(!confirm("是否确认提交?")) return;
    rids=rids.substring(1); //把第一个"," 去掉
    
    Sql.AddCmd("UPDATE dbo.PUB_Account_Info SET AccountMonth = '"+cbAccountDate.GetText()+"' WHERE charindex(pubid,'"+ rids +"')>0"); 
    Sql.AddCmd("UPDATE dbo.PUB_Task_Info SET AccountMonth = '"+cbAccountDate.GetText()+"' WHERE charindex(rowid,'"+ rids +"')>0"); //根据ralation表里的prjid(项目id)删除关系信息
    
    
    ExecSql(function(s){
            if(s=="")
            {
                alert("提交成功!");
                gd.Refresh();
            }
            else
            {
                alert(s);
                return;
            }
        }
    );
    
}

//保留两位小数格式化方法,四舍五入，保留位数为roundDigit 
function   roundFun(numberRound,roundDigit)       
{   
    if   (numberRound>=0)   
    {   
        var tempNumber = parseInt((numberRound * Math.pow(10,roundDigit)+0.5))/Math.pow(10,roundDigit);
        return tempNumber; 
    }   
    else     
    {   
     numberRound1=-numberRound   
     var   tempNumber   =   parseInt((numberRound1   *   Math.pow(10,roundDigit)+0.5))/Math.pow(10,roundDigit);   
     return   -tempNumber;   
    }   
}  
