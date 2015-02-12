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
    
    


    //----------------
    var idk;
    var c=0; //拉长效果计数器
    $(document).ready(function()
    {
        
        /*点击控件拉长效果*/
        $("table.dxeButtonEdit_Aqua").click(
            function(){
				var bt=event.srcElement.id;
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
                
                if(c==0 && cc==0){idk=getId(event.srcElement.id);}/*获取触发事件控件的ID并调用过滤方法*/
                if(idk == "" || bt==idk ||  c>0|| idk.substring(0,5)!="btBox"){return;}
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
                //alert(c+" "+cc);
                
            });
        /*控件失去焦点还原效果*/
        $("input").blur(
            function(){
                /*cc是单击按钮出现计算器出现的计数器,用来控制在计算器上操作时失去焦点不还原长度*/
                try
                {
                
                if(cc>0 || idk.substring(0,5)!="btBox" || idk == ""){return;} 
                $("#"+idk).animate({width:'60px'},"normal");
                $("#"+idk+"_B0").fadeIn();
                $("#"+idk+"_I").css("width","29px");
                c=0;
                }
                catch(err)
                {
                    /*点击返回按钮后idk会为空,但是input失去焦点后会用到idk 此时不作任何处理*/
                }
                //alert(c+" "+cc);
            });
        
         /*输入限制*/
        $("table.dxeButtonEdit_Aqua").keypress(
            function(){
                regInput(this,String.fromCharCode(event.keyCode));
        });
        
    });



    if(over_rowid.GetText() == "") {Init();} //如果没有数据,则初始化
    
    IptInit();
    VolQuery();
    roleInit();

    
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

 //载入卷册信息表
function VolQuery(){
    var sql="SELECT ordidx,VolTitle,CopyCount,ColorType,ColorTypeName FROM dbo.PUB_Vol_Info WHERE 1=1";
    sql += " and pubid = '" + Req("rowid") + "' order by ordidx";
    gd.Open(sql);
}
function roleInit() {
    var sql = "SELECT userid,username,a.rolename FROM BASE_RoleInfo a LEFT JOIN vBaseURoleInfo b on a.rowid = b.RoleID WHERE b.userid='"+uid+"' AND b.rolename='系统管理员'";
    var oData = GetData(sql) || [];
    //alert(oData.length + " " +uid);
    if( !(oData.length > 0 || $OID(_tbProducer.GetText()) == uid ) || !tbMonth.GetText() == "") //如果不是管理员,或者不是当前制作人,不允许保存,已经记账也无法保存
    {
        btnSave.SetEnabled(false);
    }
}

function Save(){
    //非空判断
    if(isNull())
    {
        return;
    }
    if(over_rowid.GetText().length ==32) //update
    {
        dsOver.Update(Data);
        var msg="修改结算信息";
    }
    else if(over_rowid.GetText() == "" ) //insert
    {
        over_PubId.SetText(Req("rowid"));
        over_rowid.SetText(GUID());
        dsOver.Insert(Data);
        var msg="结算";
    }
    var sql="update dbo.PUB_Task_Info SET overstate = 1 WHERE rowid = '"+Req("rowid")+"'";  //更新主表是否已结账状态 1代表已结算 其余代表未结算
    var sqlLog="INSERT INTO pub_log_info (pubid,message,loguser,objid) VALUES ('"+Req("rowid")+"','"+msg+"','"+uname+"','"+Req("rowid")+"')";
    //Sql.AddCmd(sql);
    //Sql.AddCmd(sqlLog);
    //先保证成功保存,再保存日志信息
    ExecSql(sql,function(s){
        if(s == "")
        {
            //alert("保存成功!");
            //dialog.close("ok");
        }
        else
        {
            alert(s);
            return;
        }
    });

    ExecSql(sqlLog,function(s){
        if(s == "")
        {
            //alert("保存成功!");
            //dialog.close("ok");
        }
        else
        {
            alert(s);
            return;
        }
    });

}
//重置方法
function ReSet() {
    Init();
    tbOthPrjName.SetText("");
    txaMemo.SetText("");
}

function Data (s) {
    if(s=="")
    {     //更新还是插入,先判断记账表内是否存在该任务的id
         var sqlIsNew = "select pubid from PUB_Account_Info where pubid = '"+over_PubId.GetText()+"'";
         var oData = GetData(sqlIsNew) || [];
         
         if(over_rowid.GetText().length ==32 && oData.length > 0) //update
         {
              
             SaveAccount("update")  //调用根据价格表写入记账信息方法,如果返回true表成功
             
             
         }
         else if(over_rowid.GetText() == "" || oData.length == 0) //insert
         {
             SaveAccount("insert")  //调用根据价格表写入记账信息方法
             
             
         }
        
         //dialog.close("ok");
    }
    else
    {
        alert(s);
        return;
    }
}

//载入页面初始化数字输入框
function Init() {
     for (var i=0; i<CtrlList.length; i++) {
               switch(CtrlList[i].t) {
                      case "btntxtbox":
                      if(CtrlList[i].s.substring(CtrlList[i].s.length-4,CtrlList[i].s.length) === "_Int") //控件后面加_Int代表是int类型
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
//控件初始化
function IptInit() {
    var sql = "select isprint,isarch from pub_task_info where rowid = '"+ Req("rowid") +"'";
    var oData= GetData(sql) || [];
    if(oData.length > 0  )
    {
        if(oData[0].isprint === "1")
        {
            cbIsBackFont.SetChecked(true);
        }

        if(oData[0].isarch === "1")
        {
            cbArch.SetChecked(true);
        }
    }
    tbAppDep.SetText($ONM(_tbAppDep.GetText()));
    tbAppUser.SetText($ONM(_tbAppUser.GetText()));
    tbProducer.SetText($ONM(_tbProducer.GetText()));
    tbAppDep.SetEnabled(false);
    tbAppUser.SetEnabled(false);
    tbProducer.SetEnabled(false);
    cbIsBackFont.SetEnabled(false);
    cbArch.SetEnabled(false);
}
//根据价格表写入记账信息
function SaveAccount(type){
    //获取数量
    
    var bpc = new ActiveXObject("Scripting.Dictionary");
    var colN="";var colV="";
    var sql="select * from PUB_Over_Info where pubid = '"+ Req("rowid") +"'";
    var oData = GetData(sql) || [];
    //根据价格表获取单价
    var bpp = new ActiveXObject("Scripting.Dictionary");
    var colPN="";var colPV="";

    var sqlPrice="SELECT TOP 1 * FROM dbo.PUB_Base_Price WHERE pricedate <= '"+ txtAppDate.GetText() +"' ORDER BY pricedate desc" //根据任务的申请时间获取
    var oDataPrice =GetData(sqlPrice) || [];

    //填充至dictionary
     for (var i=0; i<CtrlList.length; i++) {
               switch(CtrlList[i].t) {
                      case "btntxtbox":
                              colN=CtrlList[i].d.toLowerCase().substring(CtrlList[i].d.indexOf(".")+1); //该控件对应的字段名
                              if(oData.length > 0)
                            {
                                colV=oData[0][colN];            //结算信息表字段里的值(数量)
                            }
                            if(oDataPrice.length > 0)
                            {
                                colPV=oDataPrice[0][colN];      //价格表字段里的值(单价)
                            }
                            bpc.Add(colN,colV);  //填充dictionary,读取方法:alert(bpc.item(字段名))
                            bpp.Add(colN,colPV)  //填充dictionary
                     }
         }
     
    //开始计算
    //黑白打印blackprintcost 包含字段ba4s ba4d ba3s ba3d ba3plus
    var rtn1 = calm(bpc.item("ba4s"),bpp.item("ba4s"));
    var rtn2 = calm(bpc.item("ba4d"),bpp.item("ba4d"));
    var rtn3 = calm(bpc.item("ba3s"),bpp.item("ba3s"));
    var rtn4 = calm(bpc.item("ba3d"),bpp.item("ba3d"));
    var rtn5 = calm(bpc.item("ba3plus"),bpp.item("ba3plus"));
    //alert(bpc.item("ba4s")+"*"+bpp.item("ba4s")+"="+rtn1);
    
    var rtnB=roundFun((rtn1+rtn2+rtn3+rtn4+rtn5),2);
    //alert(rtn1+" "+rtn2+" "+rtn3+" "+rtn4+" "+rtn5+" "+rtnB);
    

    //彩色打印colorprintcost 包含字段ca4s ca4d ca3s ca3d ca3plus
    var rtnC1 = calm(bpc.item("ca4s"),bpp.item("ca4s"));
    var rtnC2 = calm(bpc.item("ca4d"),bpp.item("ca4d"));
    var rtnC3 = calm(bpc.item("ca3s"),bpp.item("ca3s"));
    var rtnC4 = calm(bpc.item("ca3d"),bpp.item("ca3d"));
    var rtnC5 = calm(bpc.item("ca3plus"),bpp.item("ca3plus"));
    var rtnC=roundFun((rtnC1+rtnC2+rtnC3+rtnC4+rtnC5),2);

    //彩图(彩色写真)colorcost 包含字段ca2 ca1 ca0
    var rtnCA1 = calm(bpc.item("ca1"),bpp.item("ca1"));
    var rtnCA2 = calm(bpc.item("ca2"),bpp.item("ca2"));
    var rtnCA3 = calm(bpc.item("ca0"),bpp.item("ca0"));
    var rtnCA = roundFun((rtnCA1+rtnCA2+rtnCA3),2);

    //白图(工程图)whitecost 包含字段pa4 pa3 pa2 pa1 pa0
    var rtnPA1 = calm(bpc.item("pa0"),bpp.item("pa0"));
    var rtnPA2 = calm(bpc.item("pa1"),bpp.item("pa1"));
    var rtnPA3 = calm(bpc.item("pa2"),bpp.item("pa2"));
    var rtnPA4 = calm(bpc.item("pa3"),bpp.item("pa3"));
    var rtnPA5 = calm(bpc.item("pa4"),bpp.item("pa4"));
    var rtnPA = roundFun((rtnPA1+rtnPA2+rtnPA3+rtnPA4+rtnPA5),2);

    //装订bindecost 包含字段gluebind backfont pinbind addprint
    var rtnPin1 = calm(bpc.item("gluebind"),bpp.item("gluebind"));
    var rtnPin2 = calm(bpc.item("backfont"),bpp.item("backfont"));
    var rtnPin3 = calm(bpc.item("pinbind"),bpp.item("pinbind"));
    var rtnPin4 = calm(bpc.item("addprint"),bpp.item("addprint"));
    var rtnPin = roundFun((rtnPin1+rtnPin2+rtnPin3+rtnPin4),2);

    //设计制作designcost 包含字段composingpage editpage scanpage 加上 控件btBoxDesignCost的值
    var rtnDes1 = calm(bpc.item("composingpage"),bpp.item("composingpage"));
    var rtnDes2 = calm(bpc.item("editpage"),bpp.item("editpage"));
    var rtnDes3 = calm(bpc.item("scanpage"),bpp.item("scanpage"));
    var rtnDes4 = parseFloat(btBox_DesignCost.GetText());
    var rtnDes = roundFun((rtnDes1+rtnDes2+rtnDes3+rtnDes4),2);

    //杂件othercost 包含字段 visitingcard cdrom udisk onephoto twophoto archbag  (新增2个)archbagp archbagd加上 控件btBoxOthPrjCost 的值
    var rtnOth1 = calm(bpc.item("visitingcard"),bpp.item("visitingcard"));
    var rtnOth2 = calm(bpc.item("cdrom"),bpp.item("cdrom"));
    var rtnOth3 = calm(bpc.item("udisk"),bpp.item("udisk"));
    var rtnOth4 = calm(bpc.item("onephoto"),bpp.item("onephoto"));
    var rtnOth5 = calm(bpc.item("twophoto"),bpp.item("twophoto"));
    var rtnOth6 = calm(bpc.item("archbag"),bpp.item("archbag"));
    var rtnOth8 = calm(bpc.item("archbagd"),bpp.item("archbagd"));
    var rtnOth9 = calm(bpc.item("archbagp"),bpp.item("archbagp"));
    var rtnOth7 = parseFloat(btBox_OthPrjCost.GetText());
    var rtnOth = roundFun((rtnOth1+rtnOth2+rtnOth3+rtnOth4+rtnOth5+rtnOth6+rtnOth7+rtnOth8+rtnOth9),2);
    
    //合计
    var rtnTotal =roundFun((rtnB+rtnC+rtnPA+rtnCA+rtnPin+rtnDes+rtnOth),2);
    //alert(rtnB+" "+rtnC+" "+rtnCA+" "+rtnPA+" "+rtnPin+" "+rtnDes+" "+rtnOth);
    //alert(rtnTotal);

    //debugger;
    //写入数据库
    var sqlIn="";
    if(type == "insert")
    {
        sqlIn= "insert into dbo.PUB_Account_Info (pubid,isono,appdate,appuser,appdep,prjname,accountmonth,blackprintcost,";
        sqlIn+="ColorPrintCost,WhiteCost,ColorCost,BindCost,designcost,othercost,TotalCost)";
        sqlIn+="values('"+over_PubId.GetText()+"','"+ tbIsoNo.GetText() +"','"+txtAppDate.GetText()+"','"+_tbAppUser.GetText()+"','"+_tbAppDep.GetText()+"','"+tbTaskName.GetText()+"'";
        sqlIn+=",'"+tbMonth.GetText()+"',"+rtnB+","+rtnC+","+rtnPA+","+rtnCA+","+rtnPin+","+rtnDes+","+rtnOth+","+rtnTotal+")";
    }
    else if(type == "update")
    {
        sqlIn="update dbo.PUB_Account_Info set pubid ='"+over_PubId.GetText()+"',isono='"+ tbIsoNo.GetText() +"',appdate='"+txtAppDate.GetText()+"',";
        sqlIn+="appuser='"+_tbAppUser.GetText()+"',appdep='"+_tbAppDep.GetText()+"',";
        sqlIn+="prjname='"+tbTaskName.GetText()+"',accountmonth='"+tbMonth.GetText()+"',blackprintcost="+rtnB+",colorprintcost="+rtnC+",whitecost="+rtnPA+",";
        sqlIn+="colorcost="+rtnCA+",bindcost="+rtnPin+",designcost="+rtnDes+",othercost="+rtnOth+",totalcost="+rtnTotal+" ";
        sqlIn+=" where pubid = '"+over_PubId.GetText()+"'";
    }
    
     ExecSql(sqlIn,function(s){
                    if(s == ""){   
                       alert("保存成功!");
                    }
                    else{
                        alert(s);
                        return;
                    }
                });
}
//乘法计算
function calm (num1,num2){
    var rtn=num1 * num2;
    return roundFun(rtn,2);
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
                        if(CtrlList[i].s.substring(CtrlList[i].s.length-4,CtrlList[i].s.length) === "_Int"){ isInt=true ;} else { isInt=false;}
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
                                if((REGnum.test(str) && CtrlList[i].c.GetText().length <= 7) || str==0)
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
var cc=0; //计算器载入计数器
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
    
    var loc=$("#"+idk).offset();//获取被点击控件坐标坐标
    var width=$("#"+idk).width(); //获取被点击控件的宽度
    if(idk==="btBox_BA3" || idk==="btBox_CA3" || idk==="btBox_PA0" || idk==="btBox_ArchBagP_Int")
    {
        div.style.left = loc.left;
        div.style.top = loc.top+20;
    }
    else
    {
    div.style.left = loc.left+width+15;
    div.style.top = loc.top;
    }

    $(div).toggle(100);
    innerJS(idk);
    //点击控件按钮把控件里的值赋给计算器
    var calculate_outPut=document.getElementById("calculate_outPut"); 
    
    if($F(idk)!= "0.00" )
    {
        calculate_outPut.value=$F(idk); 
    }
    cc++;
}

function innerJS (idk) {

var operateExp={ 
    '+':function(num1,num2){return num1+num2;}, 
    '-':function(num1,num2){return num1-num2;}, 
    '*':function(num1,num2){return num1*num2;}, 
    '/':function(num1,num2){return num2===0?0:num1/num2;} 
} 
//���㺯�� 
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
            if(result.toString().length>6  && result.toString().indexOf(".")>0 ){    //控制结果的长度 无限小数时做一个缩减
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
                        if(CtrlList[i].s.substring(CtrlList[i].s.length-4,CtrlList[i].s.length) === "_Int") //如果是正整数控件
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
}




function   roundFun(numberRound,roundDigit)   //四舍五入，保留位数为roundDigit     
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
                if(CtrlList[i].s.substring(CtrlList[i].s.length-4,CtrlList[i].s.length) === "_Int"){ isInt=true ;} else { isInt=false;}
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



//点击ButtonTextBox控件过滤控件id
function getId(idk) {
    var rtn=idk;
            if(idk.substring(idk.length - 3,idk.length)==="Img")
            {
                 rtn=idk.substring(0,idk.length-3-3);
            }
            else if(idk.substring(idk.length - 3,idk.length)==="_B0")
            {
                 rtn=idk.substring(0,idk.length-3);
            }
            else if(idk.substring(idk.length - 2,idk.length)==="_I")
            {
                 rtn=idk.substring(0,idk.length-2);
            }
    return rtn;
}

