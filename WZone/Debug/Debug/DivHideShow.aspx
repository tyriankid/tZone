<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DivHideShow.aspx.cs" Inherits="Debug.DivHideShow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>显示隐藏计算器</title>
    <script type="text/javascript" src="res/js.lib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="res/js.lib/ria-base.js"></script>
</head>



<body>





    <form id="form1" runat="server">
    <br />
    <input type="text" id="txt1" onkeypress = "checkValue(name);">
    <div id="div1" style="position:absolute;top:382px;left:1060px;width:122px;height:165px;display:block;border:1px solid #A0A0A0;overflow:auto "></div> 
    
    <asp:TextBox ID="TextBox1" runat="server" onkeypress = "checkValue(name);" onclick ="SetV(this)"></asp:TextBox>
    </form>
    <script type="text/javascript">
        //计算器载入--------------------
        div = document.getElementById("div1");
        var inHTML = "<table width='120' border='1' cellspacing='1' cellpadding='0' id='calculate'> <thead > <tr> <td colspan='4' align='right'><input id='calculate_outPut' value='0' disabled='disabled'></td> </tr> </thead> <tbody id='calculate_num'> <tr> <td><label> <input type='button' name='button' id='button' value='7' _type='num' /> </label></td> <td><input type='button' value='8' _type='num' /></td> <td><input type='button' value='9' _type='num' /></td> <td><input type='button' value='/' _type='op' /></td> </tr> <tr> <td><input type='button' value='4' _type='num' /></td> <td><input type='button' value='5' _type='num' /></td> <td><input type='button' value='6' _type='num' /></td> <td><input type='button' value='*' _type='op' /></td> </tr> <tr> <td><input type='button' value='1' _type='num' /></td> <td><input type='button' value='2' _type='num' /></td> <td><input type='button' value='3' _type='num' /></td> <td><input type='button' value='-' _type='op' /></td> </tr> <tr> <td><input type='button' value='0' _type='num' /></td>";
        inHTML += " <td><input type='button' value='+/-' _type='+/-' /></td> <td><input type='button' value='.' _type='.' /></td> <td><input type='button' value='+' _type='op' /></td> </tr> <tr> <td  id='debug'><input type='button' value='<-' _type='bs' /></td><td  id='ok'><input type='button' value='ok' _type='ok' /></td> <td><input type='button' value='C' _type='cls' /></td> <td><input type='button' value='=' _type='eval' /></td> </tr> </tbody> </table> ";
        inHTML += "  <style> #calculate {  line-height: 30px; text-align: center; font-size: 16px; font-weight: bold; } #calculate tbody input{ width: 100%; height: 22px; font: bold 12px/1em 'Microsoft yahei'; } #calculate tbody td{ width: 25%; border: none; } #calculate_outPut{ font-size: 20px; letter-spacing:2px; background:#fff; height: 25px; border: none; text-align: right; width: 100%; } </style>";

        div.innerHTML = inHTML;          //初始化计算器的div 填充html元素
        $(div).css("border", "none");   //给div设置无边框样式
        $(div).css("z-index", "9999");
        $(div).css("background-color", "White");
        innerJS();              //初始化计算器js
        $(div).hide();                 //隐藏计算器
        //计算器载入完毕----------------
        var iptIndex = -1; //用来装被点击控件在Ctrllist里的index
        function innerJS(idk) {

            var operateExp = {
                '+': function(num1, num2) { return num1 + num2; },
                '-': function(num1, num2) { return num1 - num2; },
                '*': function(num1, num2) { return num1 * num2; },
                '/': function(num1, num2) { return num2 === 0 ? 0 : num1 / num2; }
            }
            var operateNum = function(num1, num2, op) {
                if (!(num1 && num2)) return;
                num1 = Number(num1);
                num2 = Number(num2);
                if (!op) return num1;
                if (!operateExp[op]) return 0;
                return operateExp[op](num1, num2);
            }
            var calculate_outPut = document.getElementById("calculate_outPut");
            var calculate_num = document.getElementById("calculate_num");
            var result = 0;
            var isReset = false;
            var operation;
            function setScreen(num) {
                calculate_outPut.value = num;
            }
            function getScreen() {
                return calculate_outPut.value;
            }
            calculate_num.onclick = function(e) {
                var ev = e || window.event;
                var target = ev.target || ev.srcElement;
                if (target.type == "button") {
                    var mark = target.getAttribute("_type");
                    var value = target.value;
                    var num = getScreen();
                    if (mark === 'bs') {
                        if (num == 0) return;
                        var snum = Math.abs(num).toString();
                        if (snum.length < 2)
                            setScreen(0);
                        else
                            setScreen(num.toString().slice(0, -1));
                    }
                    if (mark === 'num') {
                        if (num === '0' || isReset) {
                            setScreen(value);
                            isReset = false;
                            return;
                        }
                        setScreen(num.toString().concat(value));
                    }
                    if (mark === ".") {
                        var hasPoint = num.toString().indexOf(".") > -1;
                        if (hasPoint) {
                            if (isReset) {
                                setScreen("0" + value);
                                isReset = false;
                                return;
                            }
                            return;
                        }
                        setScreen(num.toString().concat(value));
                    }
                    if (mark === "+/-") {
                        setScreen(-num);
                    }
                    if (mark === "op") {
                        if (isReset) return;
                        isReset = true;
                        if (!operation) {
                            result = +num;
                            operation = value;
                            return;
                        }
                        result = operateNum(result, num, operation);
                        setScreen(result);
                        operation = value;
                    }
                    if (mark === "cls") {
                        result = 0;
                        setScreen(result);
                        isReset = false;
                    }
                    if (mark === "eval") {
                        if (!operation) return;
                        result = operateNum(result, num, operation);
                        if (result == null) {
                            return;
                        }
                        if (result.toString().length > 8) {    //控制结果的长度 无限小数时做一个缩减
                            result = result.toString().substring(0, 8);
                        }
                        setScreen(result);
                        operation = null;
                        isReset = false;
                    }
                    if (mark === "ok") {
                        rtn = getScreen();
                        rtn = roundFun(rtn, 2);
                        for (var i = 0; i < CtrlList.length; i++) {
                            if (CtrlList[i].s.toLowerCase() === idk.toLowerCase()) {

                                switch (CtrlList[i].t) {
                                    case "textbox":
                                    case "btntxtbox":
                                    case "datebox":
                                    case "mtextbox":
                                    case "numspin":
                                        iptIndex = i;
                                        if (CtrlList[i].s.substring(CtrlList[i].s.length - 2, CtrlList[i].s.length) === "_I") //如果是正整数控件
                                        {
                                            if (REGnum.test(rtn) || rtn === 0) //如果得出的结果是正整数,则赋值给控件
                                            {
                                                CtrlList[i].c.SetText(rtn);
                                            }
                                            else {
                                                alert("必须填入正整数!");
                                                return;
                                            }
                                        }
                                        else   //如果是浮点数控件
                                        {
                                            if (REG.test(rtn)) //如果得出的结果是数字(包括正负浮点),则赋值给控件
                                            {
                                                CtrlList[i].c.SetText(rtn);
                                            }
                                            else {
                                                alert("必须填入数字!");
                                                return;
                                            }
                                        }

                                }
                            }
                        }
                        rtn = 0;
                        $(div).fadeOut();
                        setScreen(0);
                    }
                }

            }

            //setScreen(CtrlList[iptIndex].c.GetText()); 

            //alert(CtrlList[iptIndex].c.GetText());
            //alert("d");
        }
    </script>
    
    <script type="text/javascript">
        //-----------------------------------------------------输入限制-----------------------------------------------------
        function checkValue(name) {
            if (event.srcElement.name == name || event.srcElement.name.indexOf(name) == event.srcElement.name.length - name.length) {
                if (String.fromCharCode(event.keyCode).search(/^(-$|-\d*|-\d*\.|-\d*\.\d*|0|\d*|\d*\.|\d*\.\d*)$/) == -1) event.returnValue = false;
            }
        }
    </script>
    
    <script>
        //点击获得计算器方法(仅限于ButtonTextBox控件)
        function SetV(e) {

            //获取被点击控件的ID(仅限于ButtonTextBox)
            var idk = event.srcElement.id;
            if (idk.substring(idk.length - 3, idk.length) === "Img") {
                idk = idk.substring(0, idk.length - 3 - 3);
            }
            else if (idk.substring(idk.length - 3, idk.length) === "_B0") {
                idk = idk.substring(0, idk.length - 3);
            }
            $(div).fadeIn();
            var loc = $("#" + idk).offset(); //获取被点击控件坐标坐标
            var width = $("#" + idk).width(); //获取被点击控件的宽度
            alert(loc + " " + width);
            div.style.left = loc.left + width + 5;
            
            div.style.top = loc.top;
            innerJS(idk);
            //点击控件按钮把控件里的值赋给计算器
            var calculate_outPut = document.getElementById("calculate_outPut");
            //calculate_outPut.value = $F(idk);
        }
    </script>
    
    <script>
        

        //保留两位小数格式化方法,四舍五入，保留位数为roundDigit 
        function roundFun(numberRound, roundDigit) {
            if (numberRound >= 0) {
                var tempNumber = parseInt((numberRound * Math.pow(10, roundDigit) + 0.5)) / Math.pow(10, roundDigit);
                return tempNumber;
            }
            else {
                numberRound1 = -numberRound
                var tempNumber = parseInt((numberRound1 * Math.pow(10, roundDigit) + 0.5)) / Math.pow(10, roundDigit);
                return -tempNumber;
            }
        }  
    
    </script>


</body>
</html>
