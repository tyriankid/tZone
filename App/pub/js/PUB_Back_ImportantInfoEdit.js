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
    var sql="SELECT pubid,rowid,appdate,isono,dbo.clip(appdep,':',1) appdep,dbo.clip(appuser,':',1) appuser,";
        sql+="prjname,blackprintcost,colorprintcost,whitecost,colorcost,bindcost,designcost,othercost,totalcost,accountmonth";
        sql+=" FROM  dbo.PUB_Account_Info WHERE 1=1 ";
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
    gd.Open(sql);
}
//根据是否记账为参数查找账单的总计价格并显示
function LbInit(isAcc){
    //因为gd的数据载入可能在_formload方法之后,所以不能用读取gd数据的方法将该函数放到_formload函数内
    var lb=document.getElementById("lbAllCost");
    var AllCost=0.00;
    //获取总价格
    var sql="select totalcost,accountmonth from dbo.PUB_Account_Info where 1=1 ";
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

var cMonth;
var lMonth;
function IptInit(){
    var sql="SELECT lastmonth,currentmonth FROM dbo.PUB_Account_Setting where isstart = 0";
    var oData = GetData(sql) || [];
	var cYear=parseInt(oData[0].currentmonth.substring(0,4));
	
    var sqlRtn="select currentmonth from pub_account_setting where currentmonth like '"+cYear+"%' or currentmonth like '"+(cYear-1)+"%' ORDER BY currentmonth desc";
	
    var oDataRtn = GetData(sqlRtn) || [];
    //alert(oData[0].currentmonth.substring(0,4));
    //根据所有的currentmonth给下拉框选项添加项
    cbAccountDate.ClearItems();
    if(oDataRtn.length > 0)
    {
        for(var i =0 ; i < oDataRtn.length;i++)
        {
            cbAccountDate.AddItem(oDataRtn[i].currentmonth,oDataRtn[i].currentmonth);
        }
    }
    cbAccountDate.SetSelectedIndex(0);
    
   

    //tab2 恢复关账
    var sql="SELECT lastmonth,currentmonth FROM dbo.PUB_Account_Setting where isstart = 0";
    var oData = GetData(sql) || [];
    if(oData.length > 0)
    {
        lMonth=oData[0].lastmonth;
        cMonth=oData[0].currentmonth; 
        txtClosed.SetText(cMonth);
        txtLastMonth.SetText(lMonth);
    }
    else//如果查找不到表示为第一次使用该页面
    {
        

    }
    txtClosed.SetEnabled(false);
    txtLastMonth.SetEnabled(false);
    
    
    
    
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

function UnClose(){
    var sqlQ ="SELECT * FROM pub_Account_Setting WHERE currentmonth = '"+lMonth+"'";
    var oData=GetData(sqlQ) || [];
    if(oData.length <= 0)
	{
		alert("没有关账记录可以恢复!");
		return;
	}
    if(!confirm("您正在进行恢复关账操作， 将\r\n待关账月份："+txtClosed.GetText()+"，已关账月份："+txtLastMonth.GetText()+"\r\n恢复至\r\n待关账月份："+oData[0].currentmonth+"，已关账月份："+oData[0].lastmonth+" \r\n确认操作？")) return;
    var sqlD="DELETE FROM pub_Account_Setting WHERE currentMonth = '"+cMonth+"'";
    var sqlU="UPDATE pub_Account_Setting SET isstart = 0 WHERE CurrentMonth = '"+oData[0].currentmonth+"'";

    
    
    Sql.AddCmd(sqlD);
    Sql.AddCmd(sqlU);
    ExecSql(function(s){
                    if(s=="")
                    {
                        alert("恢复关账数据成功!");
                    }
                    else
                    {
                        alert(s);
                        return;
                    }
                });
    IptInit();
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
        if(gd.RowChecked(i)==true && gd.item("accountmonth",i) == cbAccountDate.GetText() )
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



