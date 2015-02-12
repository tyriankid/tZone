function _FormLoad() {
    IptInit();
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

//控件初始化
var cMonth;
var lMonth;
function IptInit() {
    var sql="SELECT lastmonth,currentmonth FROM dbo.PUB_Account_Setting where isstart = 0";
    var oData = GetData(sql) || [];
    if(oData.length > 0)
    {
        lMonth=oData[0].lastmonth;
        cMonth=oData[0].currentmonth; 
        txtClosed.SetText(cMonth);
    }
    else//如果查找不到表示为第一次使用该页面
    {
        

    }
    txtClosed.SetEnabled(false);
    txtLastMonth.SetEnabled(false);
    
    if(cMonth.substring(5,7) == "12")
    {
        txtYear.SetText(parseFloat(cMonth.substring(0,4))+1);
        cbMonth.SetValue(01);
    }
    else
    {
        txtYear.SetText(cMonth.substring(0,4));
        cbMonth.SetValue(parseFloat(cMonth.substring(5,7))+1);
    }
    
    txtLastMonth.SetText(lMonth);
}

function Close(){
    if(!confirm("您正在进行关账操作，关账月份："+txtClosed.GetText()+"，关账之后将不可取消！请确认！")) return;
    var sqlUpdate ="UPDATE dbo.PUB_Account_Setting SET isstart = 1 WHERE isstart = 0";
    if((txtYear.GetText()+"-"+cbMonth.GetText()) <= cMonth)//不能重复
    {
        alert("重复!");
        return;
    }
    var sql="INSERT INTO dbo.PUB_Account_Setting (currentmonth,lastmonth,isstart) ";
        sql+="VALUES('"+txtYear.GetText()+"-"+cbMonth.GetText()+"','"+cMonth+"',0)";
    Sql.AddCmd(sqlUpdate);
    Sql.AddCmd(sql);
    ExecSql(function(s){
                    if(s=="")
                    {
                        alert("关账成功!");
                    }
                    else
                    {
                        alert(s);
                        return;
                    }
                });
    IptInit();
}