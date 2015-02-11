var div;
var rtn = 0; 
function _FormLoad() {
    //计算器载入--------------------
    div=document.getElementById("div1");
    var inHTML="<table width='180' border='1' cellspacing='1' cellpadding='0' id='calculate'> <thead > <tr> <td colspan='4' align='right'><input id='calculate_outPut' value='0' disabled='disabled'></td> </tr> </thead> <tbody id='calculate_num'> <tr> <td><label> <input type='button' name='button' id='button' value='7' _type='num' /> </label></td> <td><input type='button' value='8' _type='num' /></td> <td><input type='button' value='9' _type='num' /></td> <td><input type='button' value='/' _type='op' /></td> </tr> <tr> <td><input type='button' value='4' _type='num' /></td> <td><input type='button' value='5' _type='num' /></td> <td><input type='button' value='6' _type='num' /></td> <td><input type='button' value='*' _type='op' /></td> </tr> <tr> <td><input type='button' value='1' _type='num' /></td> <td><input type='button' value='2' _type='num' /></td> <td><input type='button' value='3' _type='num' /></td> <td><input type='button' value='-' _type='op' /></td> </tr> <tr> <td><input type='button' value='0' _type='num' /></td>";
    inHTML +=" <td><input type='button' value='+/-' _type='+/-' /></td> <td><input type='button' value='.' _type='.' /></td> <td><input type='button' value='+' _type='op' /></td> </tr> <tr> <td  id='debug'><input type='button' value='back' _type='bs' /></td><td  id='ok'><input type='button' value='ok' _type='ok' /></td> <td><input type='button' value='C' _type='cls' /></td> <td><input type='button' value='=' _type='eval' /></td> </tr> </tbody> </table> ";
    inHTML += "  <style> #calculate { line-height: 30px; text-align: center; font-size: 16px; font-weight: bold; } #calculate tbody input{ width: 100%; height: 30px; font: bold 12px/1em 'Microsoft yahei'; } #calculate tbody td{ width: 25%; border: none; } #calculate_outPut{ font-size: 20px; letter-spacing:2px; background:#fff; height: 30px; border: none; text-align: right; width: 100%; } </style>";
      
    div.innerHTML=inHTML;          //初始化计算器的div 填充html元素
    $(div).css("border","none");   //给div设置无边框样式
    innerJS();                     //初始化计算器js
	$(div).hide();                 //隐藏计算器
	//计算器载入完毕----------------
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

function divLost(){
	var div=document.getElementById("div1");
    $(div).hide();
}



//点击获得计算器方法(仅限于ButtonTextBox控件)
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
    $(div).show();
    var loc=$("#"+idk).offset();//获取被点击控件坐标坐标
    var width=$("#"+idk).width(); //获取被点击控件的宽度
    div.style.left = loc.left+width+5;
    div.style.top = loc.top;
	innerJS(idk);
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
        //��֤num1,num2��Ϊ���� 
        num1=Number(num1); 
        num2=Number(num2); 
        //�����ڲ�����,����num1; 
        if(!op)return num1; 
        //ƥ�����㹫ʽ 
        if(!operateExp[op])return 0; 
        return operateExp[op](num1,num2); 
    } 
//��ʾ��� 
var calculate_outPut=document.getElementById("calculate_outPut"); 
//������� 
var calculate_num=document.getElementById("calculate_num"); 
var result=0;//������ 
var isReset=false;//�Ƿ��������� 
var operation;//������ 
//������ʾ����ֵ 
function setScreen(num){ 
calculate_outPut.value=num; 
} 
//��ȡ��ʾ����ֵ 
function getScreen(){ 
return calculate_outPut.value; 
} 
//��ӵ����� 
calculate_num.onclick=function(e){ 
    var ev = e || window.event; 
    var target = ev.target || ev.srcElement; 
    if(target.type=="button"){ 
        var mark=target.getAttribute("_type");//��ȡ��ǰ���button���Զ�������ԡ� 
        var value=target.value;//��ȡ��ǰ��ֵ 
        var num=getScreen();//��ȡ��ǰ���ֵ 
        if(mark==='bs'){//�˸�� 
            if(num==0)return; 
            var snum=Math.abs(num).toString(); 
            if(snum.length<2) 
            setScreen(0); 
            else 
            setScreen(num.toString().slice(0,-1)); 
            } 
        if(mark==='num'){//���ּ� 
            if(num==='0'||isReset){//�в���������ʾ��Ϊ0 
                setScreen(value); 
                isReset=false; 
                return; 
                } 
            setScreen(num.toString().concat(value)); 
            } 
        if(mark==="."){//С���� 
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
        if(mark==="+/-"){//������ 
            setScreen(-num); 
            } 
        if(mark==="op"){//���������ǲ���������Ƶ�һ�������� 
            if(isReset)return; 
            isReset=true; 
            if(!operation){ 
                result=+num; 
                operation=value; 
                return; 
                } 
            result=operateNum(result,num,operation); 
            setScreen(result); 
            operation=value; 
            } 
        if(mark==="cls"){//���� 
            result=0; 
            setScreen(result); 
            isReset=false; 
            } 
        if(mark==="eval"){ 
            if(!operation)return; 
            result=operateNum(result,num,operation); 
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
		                    val = CtrlList[i].c.SetText(rtn);
							
		                }
		        }
		    }
			rtn=0;
			
			$(div).hide();
            setScreen(0);
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



