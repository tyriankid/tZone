function _FormLoad() {
    /*
    var rl= document.getElementById("rd1");
    var rl2 = document.getElementById("rd2");
    $(rl).css("border","none");
    $(rl2).css("border","none");
    */
    Search();
    IptInit();
    LbInit();
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
function bS() {
    Search();
    LbInit();
}
function Search() {
    var sql = "SELECT appdate,IsoNo,dbo.clip(appdep,':',1) appdep,dbo.clip(appuser,':',1) appuser,prjname,SUBSTRING((stuff((SELECT  ',' + voltitle FROM dbo.PUB_Vol_Info b WHERE b.pubid=a.pubid FOR XML PATH('')),1,1,'')),1,23) AS voltitle,";
        sql += "producer=(SELECT dbo.clip(producer,':',1)producer FROM dbo.PUB_Task_Info c WHERE c.rowid=a.pubid),blackprintcost,colorprintcost,";
        sql += "states=(SELECT CASE state WHEN 0 THEN '新任务' WHEN 1 then '制作中' WHEN 2 THEN '质检装订' WHEN 3 THEN '待领取' WHEN 4 THEN '暂停' WHEN 5 THEN '已领取' WHEN 6 THEN '注销' END states FROM dbo.PUB_Task_Info c WHERE c.rowid=a.pubid),"
        sql += "whitecost,colorcost,bindcost,designcost,othercost,totalcost,accountmonth from dbo.pub_account_info a where 1=1 ";
        sql += sqlWhere();
        sql +=" order by appdate desc";
    gd.Open(sql);
}

function sqlWhere() {
    var sql="";
		sql += " and (SELECT state FROM dbo.PUB_Task_Info c WHERE c.rowid=a.pubid) <> 6 ";
		if(data1.GetEnabled() == true && data1.GetText()!="")
        {
            sql += " and appdate >= '"+data1.GetText()+"'";
        }
        if(data2.GetEnabled() == true && data2.GetText()!="")
        {
            sql += " and appdate <= '"+data2.GetText()+"'";
        }
        if(dataM.GetEnabled() == true && dataM.GetText()!="")
        {
            sql +=" and accountmonth = '"+GetMonth()+"'";
        }
        if(Part1.GetText()!="" && Part1.GetEnabled() == true)
        {
            var sqlpart;
            sqlpart=" and isono like '212"+Part1.GetText()+"-%'";
            if(Part2.GetText()!="")
            {
                sqlpart=" and isono like '212"+Part1.GetText()+"-"+Part2.GetText()+"%'";
            }
            if(Part3.GetText()!="")
            {
                sqlpart=" and isono like '212"+Part1.GetText()+"-"+Part2.GetText()+"-"+Part3.GetText()+"'";
            }
            sql +=sqlpart;
        }
        if(btBoxDep.GetText()!="" && btBoxDep.GetEnabled() == true)
        {
            sql +=" and appdep = '"+_btBoxDep.GetText()+"'";
        }
        if(btBoxUser.GetText()!="" && btBoxUser.GetEnabled() == true)
        {
            sql +=" and appuser = '"+_btBoxUser.GetText()+"'";
        }
        if(btBoxDepMaker.GetText()!="" && btBoxDepMaker.GetEnabled() == true)
        {
            sql +=" and (SELECT producer FROM dbo.PUB_Task_Info c WHERE c.rowid=a.pubid) = '"+_btBoxDepMaker.GetText()+"'";
        }
        if(cb1.GetChecked())
        {
            sql +=" and accountmonth =''";
        }
        return sql;
}
//记账月份控件值改变方法
function GetMonth() {
    //按格式YYYY-MM取值
    var month =dataM.GetText().substring(0,dataM.GetText().length-3);
    return month;
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
//选择人物
function SelectMan1(){
    var rt=SelObject({type:"u",selcount:1,modal:"div"},function(str){
            if(str!="")
            {
                _btBoxUser.SetText(str[0].id+":"+str[0].text);
                btBoxUser.SetText(str[0].text);
            }
        });
}
function SelectMan2(){
    var rt=SelObject({type:"u",selcount:1,modal:"div"},function(str){
            if(str!="")
            {
                _btBoxDepMaker.SetText(str[0].id+":"+str[0].text);
                btBoxDepMaker.SetText(str[0].text);
            }
        });
}

//控件载入
function IptInit() {
    //rd1.SetSelectedIndex(0);
    //rd2.SetSelectedIndex(0);
    //IndexChanged();
    btBoxDep.SetEnabled(false);
    btBoxUser.SetEnabled(false);
    btBoxDepMaker.SetEnabled(false);
    data1.SetEnabled(false); data2.SetEnabled(false);
    dataM.SetEnabled(false);
    Part1.SetEnabled(false); Part2.SetEnabled(false); Part3.SetEnabled(false);
}
//根据是否记账为参数查找账单的总计价格并显示
function LbInit(){
    //因为gd的数据载入可能在_formload方法之后,所以不能用读取gd数据的方法将该函数放到_formload函数内
    var lb=document.getElementById("lbAllCost");
    var AllCost=0.00;
    //获取总价格
    var sql="select * from dbo.PUB_Account_Info a where 1=1 ";
    sql += sqlWhere();
    var oData = GetData(sql) || [];
    if(oData.length > 0)
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
//重置
function ReSet() {
    for (var i=0; i<CtrlList.length; i++) {
           switch(CtrlList[i].t) {
                  case "textbox":
                  case "btntxtbox":
                  case "datebox":
                          CtrlList[i].c.SetText("");
           }
    }
    cb1.SetChecked(false);
    bS();
}
//导出excel文件
function Excel() {
    var sql = "select appdate,IsoNo,dbo.clip(appdep,':',1) appdep,dbo.clip(appuser,':',1) appuser,prjname,stuff((SELECT  ',' + voltitle FROM dbo.PUB_Vol_Info b WHERE b.pubid=a.pubid FOR XML PATH('')),1,1,'') AS voltitle,";
        sql += "producer=(SELECT dbo.clip(producer,':',1)producer FROM dbo.PUB_Task_Info c WHERE c.rowid=a.pubid),blackprintcost,colorprintcost,";
        sql += "whitecost,colorcost,bindcost,designcost,othercost,totalcost,accountmonth from dbo.pub_account_info a where 1=1 ";
        sql += sqlWhere();
    var _ExOption = null;
    _ExOption = {sql:sql, fldname:"appdate,isono,appdep,appuser,prjname,voltitle,producer,blackprintcost,colorprintcost,whitecost,colorcost,bindcost,designcost,othercost,totalcost,accountmonth", fldesc:"日期,单号,部门,申请人,项目名称,卷册号,制作人,黑白打印,彩色打印,白图,彩图,装订,设计制作,杂件,合计,记账月份", fldict:"", xlsdesc:"任务记账信息表"};
    ExportExcel(_ExOption);
}

//radiobutton的选项改变方法
function IndexChanged(){
    //alert(rd1.GetSelectedIndex());
    //var chosenIndex1 = rd1.GetSelectedIndex();
    //var chosenIndex2 = rd2.GetSelectedIndex();
    switch(chosenIndex1) {
        case 0:
                data1.SetEnabled(true); data2.SetEnabled(true);
                dataM.SetEnabled(false); Part1.SetEnabled(false); Part2.SetEnabled(false); Part3.SetEnabled(false);
                break;
        case 1:
                dataM.SetEnabled(true);
                data1.SetEnabled(false); data2.SetEnabled(false); Part1.SetEnabled(false); Part2.SetEnabled(false); Part3.SetEnabled(false);
                break;
        case 2:
                Part1.SetEnabled(true); Part2.SetEnabled(true); Part3.SetEnabled(true);
                dataM.SetEnabled(false); data1.SetEnabled(false); data2.SetEnabled(false);
                break;
    }
    
    /*
    switch(chosenIndex2) {
        case 0:
                btBoxDep.SetEnabled(true);
                btBoxUser.SetEnabled(false); btBoxDepMaker.SetEnabled(false);
                break;
        case 1:
                btBoxUser.SetEnabled(true);
                btBoxDep.SetEnabled(false); btBoxDepMaker.SetEnabled(false);
                break
        case 2:
                btBoxDepMaker.SetEnabled(true);
                btBoxDep.SetEnabled(false); btBoxUser.SetEnabled(false);
                break;
    }
    */
}

//chkbox选中的方法
function chkChecked(e) {
    switch(e){
        case "chk_AppDep":
            chk_AppUser.SetChecked(false); chk_Maker.SetChecked(false);
            chk_AppDep.SetChecked(true);
            break;
        case  "chk_AppUser":
            chk_AppDep.SetChecked(false); chk_Maker.SetChecked(false);
            chk_AppUser.SetChecked(true);
            break;
        case "chk_Maker":
            chk_AppDep.SetChecked(false); chk_AppUser.SetChecked(false);
            chk_Maker.SetChecked(true);
            break;
        case "time":
            chk_Month.SetChecked(false); chk_IsoNo.SetChecked(false);
            chk_Time.SetChecked(true);
            break;
        case "month":
            chk_Time.SetChecked(false); chk_IsoNo.SetChecked(false);
            chk_Month.SetChecked(true);
            break;
        case "iso":
            chk_Time.SetChecked(false); chk_Month.SetChecked(false);
            chk_IsoNo.SetChecked(true);
            break;
    }
    if(chk_Time.GetChecked())
    {
        data1.SetEnabled(true); data2.SetEnabled(true);
        dataM.SetEnabled(false); Part1.SetEnabled(false); Part2.SetEnabled(false); Part3.SetEnabled(false);
        chk_Month.SetChecked(false); chk_IsoNo.SetChecked(false);
    }
    if(chk_Month.GetChecked())
    {
        dataM.SetEnabled(true);
        data1.SetEnabled(false); data2.SetEnabled(false); Part1.SetEnabled(false); Part2.SetEnabled(false); Part3.SetEnabled(false);
        chk_IsoNo.SetChecked(false); chk_Time.SetChecked(false);
    }
    if(chk_IsoNo.GetChecked())
    {
        Part1.SetEnabled(true); Part2.SetEnabled(true); Part3.SetEnabled(true);
        data1.SetEnabled(false); data2.SetEnabled(false); dataM.SetEnabled(false);
        chk_Month.SetChecked(false);chk_Time.SetChecked(false);
    }


    if(chk_AppDep.GetChecked())
    {
        btBoxDep.SetEnabled(true);
        btBoxUser.SetEnabled(false); btBoxDepMaker.SetEnabled(false);
        chk_AppUser.SetChecked(false); chk_Maker.SetChecked(false);
    }
    if(chk_AppUser.GetChecked())
    {
        btBoxUser.SetEnabled(true);
        btBoxDep.SetEnabled(false); btBoxDepMaker.SetEnabled(false);
        chk_AppDep.SetChecked(false); chk_Maker.SetChecked(false);
    }
    if(chk_Maker.GetChecked())
    {
        btBoxDepMaker.SetEnabled(true);
        btBoxDep.SetEnabled(false); btBoxUser.SetEnabled(false);
        chk_AppDep.SetChecked(false); chk_AppUser.SetChecked(false);
    }
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
