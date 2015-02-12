var div;
var rtn = 0; 
function _FormLoad() {
    //计算器载入--------------------
    div=document.getElementById("div1");
    var inHTML="<table width='120' border='1' cellspacing='1' cellpadding='0' id='calculate'> <thead > <tr> <td colspan='4' align='right'><input id='calculate_outPut' value='0' disabled='disabled'></td> </tr> </thead> <tbody id='calculate_num'> <tr> <td><label> <input type='button' name='button' id='button' value='7' _type='num' /> </label></td> <td><input type='button' value='8' _type='num' /></td> <td><input type='button' value='9' _type='num' /></td> <td><input type='button' value='/' _type='op' /></td> </tr> <tr> <td><input type='button' value='4' _type='num' /></td> <td><input type='button' value='5' _type='num' /></td> <td><input type='button' value='6' _type='num' /></td> <td><input type='button' value='*' _type='op' /></td> </tr> <tr> <td><input type='button' value='1' _type='num' /></td> <td><input type='button' value='2' _type='num' /></td> <td><input type='button' value='3' _type='num' /></td> <td><input type='button' value='-' _type='op' /></td> </tr> <tr> <td><input type='button' value='0' _type='num' /></td>";
    inHTML +=" <td><input type='button' value='<-' _type='bs' /></td> <td><input type='button' value='.' _type='.' /></td> <td><input type='button' value='+' _type='op' /></td> </tr> <tr> <td  id='debug'><input type='button' value='x' _type='x' /></td><td  id='ok'><input type='button' value='ok' _type='ok' /></td> <td><input type='button' value='C' _type='cls' /></td> <td><input type='button' value='=' _type='eval' /></td> </tr> </tbody> </table> ";
    inHTML += "  <style> #calculate {  line-height: 30px; text-align: center; font-size: 16px; font-weight: bold; } #calculate tbody input{ width: 100%; height: 22px; font: bold 12px/1em 'Microsoft yahei'; } #calculate tbody td{ width: 25%; border: none; } #calculate_outPut{ font-size: 20px; letter-spacing:2px; background:#fff; height: 25px; border: none; text-align: right; width: 100%; } </style>";
      
    div.innerHTML=inHTML;          //初始化计算器的div 填充html元素
    $(div).css("border","none");   //给div设置无边框样式
    $(div).css("z-index" ,"9999");
    $(div).css("background-color","White");
    innerJS();                     //初始化计算器js
    $(div).hide();                 //隐藏计算器
    //计算器载入完毕----------------
    //说明字体红色
    var lb=document.getElementById("lbInfo");
    $(lb).css("color","Red");
    
        
    NumsInit();
    cbInit();
    roleInit();

    
    var idk;
    var c=0;
    $(document).ready(function()
    {
        /*点击控件拉长效果*/
        $("table.dxeButtonEdit_Aqua").click(
            function(){
                var bt=event.srcElement.id;//获取触发事件的控件id

                if(c>0 && cc>0)
                {//如果动画效果载入了一次 ,计算器目前为显示状态时再度触发click事件(cc>0),则隐藏计算器. 并将计算器加载计数器归零   
                    
                    $(div).hide();
                    cc=0;
                    
                    $("#"+idk).animate({width:'60px'},"normal");
                    $("#"+idk+"_B0").fadeIn();
                    $("#"+idk+"_I").css("width","29px");
                    c=0;
                    if(bt.substring(bt.length,bt.length-2)=="_I"){return;}//如果是点击了文本框处,将计算器缩回,不继续操作.
                }    
                
                
                if(c==0 && cc==0){idk=getId(event.srcElement.id);}//获取触发事件控件的ID并调用过滤方法
                if(idk == "" || bt==idk|| c>0 || idk.substring(0,5)!="btBox"){return;} //bt==idk为点击到了非文本框和按钮的部位,这种情况不允许触发事件
                var len= ($F(idk).length);
                $("#"+idk+"_I").css("width","29px");
                if(len > 4)
                {
                    $("#"+idk+"_B0").fadeOut(10);
                }
                else
                {
                    $("#"+idk+"_B0").fadeOut();
                }
                $("#"+idk+"_B0").fadeOut();
                $("#"+idk).stop(true,true).animate({width:'70px'},"normal");
                $("#"+idk+"_I").css("width","100%");
                c++;
                /*点击控件按钮得到计算器*/
                
                if(bt.substring(bt.length - 3,bt.length)==="_B0" || bt.substring(bt.length - 3,bt.length)==="Img")
                {
                    SetV(this);
                }
                
            });
        /*控件失去焦点还原效果*/
        $("input").blur(
            function(){
                /*cc是单击按钮出现计算器出现的计数器,用来控制在计算器上操作时失去焦点不还原长度*/
                
                if(cc>0 || idk.substring(0,5)!="btBox" || idk == ""){return;} 
                $("#"+idk).animate({width:'60px'},"normal");
                $("#"+idk+"_B0").fadeIn();
                $("#"+idk+"_I").css("width","29px");
                c=0;
                
            });
        
         /*输入限制*/
        $("table.dxeButtonEdit_Aqua").keypress(
            function(){
                regInput(this,String.fromCharCode(event.keyCode));
        });

    });
    
    

}
/*
var c=0;
var t;
function timedCount(idk) {
    c=c+1;
    t=setTimeout("timedCount('"+idk+"')",600);

    if(c>=2)
    {
        
        $("#"+idk+"_I").css("width","29px");
        $("#"+idk+"_B0").fadeOut();
        $("#"+idk).stop(true,true).animate({width:'70px'},"normal");
        $("#"+idk+"_I").css("width","100%");
        clearTimeout(t) ;
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
    
}

//通过角色进行权限处理
function roleInit() {
    var sql = "select userid,username,a.rolename FROM BASE_RoleInfo a LEFT JOIN vBaseURoleInfo b on a.rowid = b.RoleID WHERE b.userID='"+uid+"' AND b.rolename='财务人员'";
    var oData= GetData(sql) || [];
    //alert(oData[0].rolename+" "+uid+" "+oData[0].userid);
    if(oData.length <= 0)//非财务人员不得进行修改处理
    {
        
            btnReSet.SetEnabled(false);
            btnAdd.SetEnabled(false);
            btnEdit.SetEnabled(false);
            btnDelete.SetEnabled(false);
        
    }
}
//下拉框选项改变方法
function cbChange(){
    var str=""; //用来装每个控件对应的字段名
    //获取所有字段信息
    var sql="select * FROM dbo.PUB_Base_Price where  priceDate = '"+ cbDate.GetText() +"' ";
    var oData= GetData(sql) || [];
    for (var j=0; j<CtrlList.length;j++)
    {
        switch(CtrlList[j].t) {
                case "btntxtbox":
                case "mtextbox":
                case "textbox":
                //alert(CtrlList[j].d);
                str = CtrlList[j].s.toLowerCase().substring(CtrlList[j].s.indexOf("_")+1,CtrlList[j].s.length) ;  //获取控件对应的字段名
                     if(oData.length > 0)
                     {
                     //alert(str);
                        CtrlList[j].c.SetText(UnSqlEscape(oData[0][str]));

                     }      
         }
    }
    dataChose.SetEnabled(false);
    dataChose.SetText("");
    btnAdd.SetEnabled(false);
}

function Save(type){
    //非空判断
    if(isNull())
    {
        return;
    }
    //添加
    if(type === "add")
    {
        //重复判断
        var sql="SELECT pricedate FROM dbo.PUB_Base_Price";
        var oData= GetData(sql) || [];
        if(oData.length > 0){
            for(var i=0;i<oData.length;i++)
            {    
                if(dataChose.GetText() == "") //如果没有选择日期,判断当天录入是否重复
                {
                    if(oData[i].pricedate.toString() === GetDate("YYYY-MM-DD")) //如果重复
                    {
                        alert("一天之内不能重复添加!");
                        return;
                    }
                }
                else   //如果选择了日期,判断选择的日期是否重复
                {
                    if(oData[i].pricedate.toString() === dataChose.GetText()) //如果重复
                    {
                        alert("请勿重复添加!");
                        return;
                    }
                }
            }
        }
        
        if(dataChose.GetText() == "")
        {
            cbDate.SetText(GetDate("YYYY-MM-DD"));
        }
        else
        {
            cbDate.SetText(dataChose.GetText());
        }
        txt_rowid.SetText(GUID());
        ds.Insert(Data);
        cbInit(); //添加成功后cb更新
    }
    //编辑
    else if(type === "edit")
    {
        //非空判断
        isNull();
        if(cbDate.GetText() === ""){alert("请选择一项!");return;}
        var strUpdate = "";
        var sqlUpdate= "update PUB_Base_Price set ";
        for (var j=0; j<CtrlList.length;j++)
        {
            switch(CtrlList[j].t) {
                    case "btntxtbox":
                        strUpdate = CtrlList[j].s.toLowerCase().substring(CtrlList[j].s.indexOf("_")+1,CtrlList[j].s.length) ;  //获取控件对应的字段名
                        sqlUpdate+= ""+ strUpdate + "=" +   CtrlList[j].c.GetText() ;
                        if(33 - j != 1){  sqlUpdate+=",";  }
             }
             
        }
        
        sqlUpdate += "Memo = '"+ SqlEscape(txa_Memo.GetText()) +"'" ;   //备注栏的信息
        sqlUpdate += " where pricedate = '"+ cbDate.GetText() +"'";  //条件
        
        //更新数据库
        ExecSql(sqlUpdate,function(s){
                    if(s == ""){   
                        alert("编辑成功");
                    }
                    else{
                        alert(s);
                        return;
                    }
                });

        //编辑成功后刷新页面
        cbChange();
    }
}

function Delete() {
    if(cbDate.GetText() === ""){alert("请选择一项!");return;}
    var sql="delete from dbo.PUB_Base_Price where pricedate = '"+ cbDate.GetText() +"'";
    if(!confirm("是否确认删除")) return;
    ExecSql(sql,function(s){
            if(s=="")
            {
                alert("删除成功!");
                //成功后刷新页面元素
                NumsInit();
                cbInit();
                txa_Memo.SetText("");
            }
            else
            {
                alert(s);
                return;
            }
        }
    );
}

function Data (s) {
    if(s=="")
    {
         alert("保存成功");
         //dialog.close("ok");
    }
    else
    {
        alert(s);
        return;
    }
}

//reset
function ReSet() {
    NumsInit();
    cbInit();
    txa_Memo.SetText("");
}
//数字框初始化
function NumsInit() {
    //初始化数字输入框
    for (var i=0; i<CtrlList.length; i++) {
           switch(CtrlList[i].t) {
                  case "btntxtbox":
                  if(CtrlList[i].s.substring(CtrlList[i].s.length-2,CtrlList[i].s.length) === "_I") //控件后面加_I代表是int类型
                  {
                        CtrlList[i].c.SetText("0");
                  }
                  else
                  {
                        CtrlList[i].c.SetText("0.00");
                  }
           }
    }
}
//下拉框初始化
function cbInit() {
    //初始化cbdate,读取所有的定价日期
    cbDate.ClearItems();
    var sql="SELECT pricedate FROM dbo.PUB_Base_Price";
    var oData= GetData(sql) || [];
    if(oData.length > 0){
        for(var i=0;i<oData.length;i++)
        {
            cbDate.AddItem(oData[i].pricedate);
        }
    }
}

//excel导出
function Excel() {
    if(cbDate.GetText() == "")
    {
        alert("请选择一项!");
        return;
    }
    var sql="select * from pub_base_price where pricedate = '"+cbDate.GetText()+"'";
    var _ExOption = null;
    _ExOption = {sql:sql, fldname:"pricedate,ba4s,ba4d,ba3s,ba3d,ba3plus,ca4s,ca4d,ca3s,ca3d,ca3plus,ca2,ca1,ca0,pa4,pa3,pa2,pa1,pa0,gluebind,backfont,pinbind,addprint,composingpage,editpage,scanpage,visitingcard,cdrom,udisk,onephoto,twophoto,archbag", fldesc:"定价日期,A4单面(黑白),A4双面(黑白),A3单面(黑白),A3双面(黑白),A3+(黑白),A4单面(彩),A4双面(彩),A3单面(彩),A3双面(彩),A3+(彩),A2(卫片),A1(卫片),A0(卫片),A4(工程图),A3(工程图),A2(工程图),A1(工程图),A0(工程图),胶装,脊背字对位,钉装,加晒,排版,编辑,扫描,名片,光盘,U盘,1寸相片,2寸相片,档案袋", fldict:"", xlsdesc:"产值统计价格表"};
    ExportExcel(_ExOption);
}


//-----------------------------------------------------输入限制-----------------------------------------------------
var REG=/^(-$|-\d*|-\d*\.|-\d*\.\d*|0|\d*|\d*\.|\d*\.\d*)$/ ;     //只允许数字和小数点的正则
var REGnum=/^[0-9]*[1-9][0-9]*$/ ; //正整数
var isInt;
function regInput(obj,inputStr) {
    //获取被点击控件的ID(仅限于ButtonTextBox)
        var idk=event.srcElement.id;
        
        obj = $E(idk);
        var docSel = document.selection.createRange();
        if (docSel.parentElement().tagName != "INPUT") return false;
        
        oSel = docSel.duplicate();
        oSel.text = "";
        var srcRange = obj.createTextRange();
        oSel.setEndPoint("StartToStart", srcRange);
        var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length);
        
        idk=idk.substring(0,idk.length-2);
        for (var i=0; i<CtrlList.length; i++) {
                if (CtrlList[i].s.toLowerCase() === idk.toLowerCase()) {
                    switch(CtrlList[i].t) {
                        case "btntxtbox":
                        if(CtrlList[i].s.substring(CtrlList[i].s.length-2,CtrlList[i].s.length) === "_I"){ isInt=true ;} else { isInt=false;}
                            if(!isInt)
                            {
                                if(REG.test(str) && CtrlList[i].c.GetText().length <= 7)
                                {
                                }
                                else
                                {    
                                    
                                    
                                    event.keyCode=null;
                                    
                                }
                            }
                            else
                            {
                                if(REGnum.test(str) && CtrlList[i].c.GetText().length <= 7)
                                {
                                }
                                else
                                {
                                    event.keyCode=null;
                                }
                            }
                        }
                }
        }
}

//-------------------------------------------------------------------------------------------------------------------
//点击获得计算器方法(仅限于ButtonTextBox控件)
var cc=0;
function SetV(e) {

    //获取被点击控件的ID(仅限于ButtonTextBox)
    var idk=event.srcElement.id;
    if(idk.substring(idk.length - 3,idk.length)==="Img")
    {
         idk=idk.substring(0,idk.length-3-3);
    }
    else if(idk.substring(idk.length - 3,idk.length)==="_B0")
    {
         idk=idk.substring(0,idk.length-3);
    }
    $(div).fadeIn();
    var loc=$("#"+idk).offset();//获取被点击控件坐标坐标
    var width=$("#"+idk).width(); //获取被点击控件的宽度
    div.style.left = loc.left+width+15;
    div.style.top = loc.top;
    innerJS(idk);
    //点击控件按钮把控件里的值赋给计算器
    var calculate_outPut=document.getElementById("calculate_outPut");
    if($F(idk)!= "0.00") 
    {
        calculate_outPut.value=$F(idk); 
    }
    cc++;
}

var iptIndex =-1; //用来装被点击控件在Ctrllist里的index
function innerJS (idk) {

var operateExp={ 
    '+':function(num1,num2){return num1+num2;}, 
    '-':function(num1,num2){return num1-num2;}, 
    '*':function(num1,num2){return num1*num2;}, 
    '/':function(num1,num2){return num2===0?0:num1/num2;} 
} 
var operateNum=function(num1,num2,op){ 
        if(!(num1&&num2))return; 
        num1=Number(num1); 
        num2=Number(num2); 
        if(!op)return num1; 
        if(!operateExp[op])return 0; 
        return operateExp[op](num1,num2); 
    } 
var calculate_outPut=document.getElementById("calculate_outPut"); 
var calculate_num=document.getElementById("calculate_num"); 
var result=0;
var isReset=false;
var operation;
function setScreen(num){ 
calculate_outPut.value=num; 
} 
function getScreen(){ 
return calculate_outPut.value; 
} 
calculate_num.onclick=function(e){ 
    var ev = e || window.event; 
    var target = ev.target || ev.srcElement; 
    if(target.type=="button"){ 
        var mark=target.getAttribute("_type");
        var value=target.value;
        var num=getScreen();
        if(mark==='bs'){
            if(num==0)return; 
            var snum=Math.abs(num).toString(); 
            if(snum.length<2) 
            setScreen(0); 
            else 
            setScreen(num.toString().slice(0,-1)); 
            } 
        if(mark==='num'){ 
            if(num==='0'||isReset){
                setScreen(value); 
                isReset=false; 
                return; 
                } 
            setScreen(num.toString().concat(value)); 
            } 
        if(mark==="."){
            var hasPoint=num.toString().indexOf(".")>-1; 
            if(hasPoint){ 
                if(isReset){ 
                    setScreen("0"+value); 
                    isReset=false; 
                    return; 
                    } 
                return; 
                } 
            setScreen(num.toString().concat(value)); 
            } 
        if(mark==="x"){
            rtn=0;
            $(div).fadeOut();
            setScreen(0);
            cc=0;
        }
        if(mark==="+/-"){
            setScreen(-num); 
            } 
        if(mark==="op"){
            //debugger;
            if(isReset)return; 
            isReset=true; 
            if(!operation){ 
                result=+num; 
                operation=value; 
                return; 
                } 
            
            if(result == null)
            {
                return;
            }
            result=operateNum(result,num,operation); 
            
            setScreen(result); 
            operation=value; 
            } 
        if(mark==="cls"){
            result=0; 
            setScreen(result); 
            isReset=false; 
            } 
        if(mark==="eval"){ 
            
            if(!operation)return; 
            result=operateNum(result,num,operation); 
            if(result == null)
            {
                result="Error";  //bug解决: 点击按钮获取计算器并将空间的数据传递到计算器之后,直接点运算符之后一旦点击运算符就会出现undefined, 经过处理后则不会.
            }
            if(result.toString().length>8 ){    //控制结果的长度 无限小数时做一个缩减
                result=result.toString().substring(0,8);
            }
            setScreen(result); 
            operation=null; 
            isReset=false; 
            } 
        if(mark==="ok"){
        
            rtn=getScreen();
            rtn=roundFun(rtn,2);
            for (var i=0; i<CtrlList.length; i++) {
                if (CtrlList[i].s.toLowerCase() === idk.toLowerCase()) {
                
                    switch(CtrlList[i].t) {
                        case "textbox":
                        case "btntxtbox":
                        case "datebox":
                        case "mtextbox":
                        case "numspin":
                        iptIndex = i;
                        if(CtrlList[i].s.substring(CtrlList[i].s.length-2,CtrlList[i].s.length) === "_I") //如果是正整数控件
                        {
                            if(REGnum.test(rtn) || rtn === 0) //如果得出的结果是正整数,则赋值给控件
                            {
                                CtrlList[i].c.SetText(rtn);
                            }
                            else
                            {
                                alert("必须填入正整数!");
                                return;
                            }
                        }
                        else   //如果是浮点数控件
                        {
                            if(REG.test(rtn)) //如果得出的结果是数字(包括正负浮点),则赋值给控件
                            {
                                CtrlList[i].c.SetText(rtn);
                            }
                            else
                            {
                                alert("必须填入数字!");
                                return;
                            }
                        }
                            
                    }
                }
            }
            rtn=0;
            $(div).fadeOut();
            setScreen(0);
            cc=0;
            }
        }
        
    }
    
    //setScreen(CtrlList[iptIndex].c.GetText()); 
    
    //alert(CtrlList[iptIndex].c.GetText());
    //alert("d");
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
//非空判断
function isNull(){
    for (var i=0; i<CtrlList.length; i++) {
         switch(CtrlList[i].t) {
                case "btntxtbox":

                if(CtrlList[i].c.GetText() === "")
                {
                    alert("不允许漏填!");
                    return true;
                }
                if(CtrlList[i].s.substring(CtrlList[i].s.length-2,CtrlList[i].s.length) === "_I"){ isInt=true ;} else { isInt=false;}
                            if(!isInt)
                            {
                                if(REG.test(CtrlList[i].c.GetText()))
                                {
                                }
                                else
                                {
                                    alert(CtrlList[i].c.GetText()+"是非法输入");
                                    return true;
                                }
                            }
                            else
                            {
                                if(REGnum.test(CtrlList[i].c.GetText()) || CtrlList[i].c.GetText()=="0" )
                                {
                                }
                                else
                                {
                                    alert(CtrlList[i].c.GetText()+"是非法输入");
                                    return true;
                                }
                            }
                
         }
    }
    return false;
} 
//字符过滤(方法来自ria-base.js)
function SqlEscape(s) {
    var rtn = s;
    rtn = rtn.Replace("'", "`");
    rtn = rtn.Replace("\r\n", "^");
    rtn = rtn.Replace("&", "%#;");
    rtn = rtn.Replace("+", "%*;");
    return rtn;
}
function UnSqlEscape(s) {
    if (s === undefined || s === null) return "";
    var rtn = s;
    rtn = rtn.Replace("`", "'");
    rtn = rtn.Replace("^", "\r\n");
    rtn = rtn.Replace("%#;", "&");
    rtn = rtn.Replace("%*;", "+");
    return rtn;
}


//点击ButtonTextBox控件过滤控件id
function getId(idk) {
    var rtn=idk;
            if(idk.substring(idk.length - 3,idk.length)==="Img")  //点击到了按钮里的图片
            {
                 rtn=idk.substring(0,idk.length-3-3);
            }
            else if(idk.substring(idk.length - 3,idk.length)==="_B0")  //点击按钮
            {
                 rtn=idk.substring(0,idk.length-3);
            }
            else if(idk.substring(idk.length - 2,idk.length)==="_I")  //点击文本框
            {
                 rtn=idk.substring(0,idk.length-2);
            }
            
    return rtn;
}
