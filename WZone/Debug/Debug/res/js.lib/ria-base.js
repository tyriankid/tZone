//**************>>>>>>  旧版本JS兼容接口  <<<<<<*******************/
var httpUrlRoot = "", rup = "", ajaxhandle = "", _domain = "", _iis_vdir = "";
var gBlnIsSetAccExec = false, gBlnIsHiddenExec = false;      //是否进行过访问权限处理,  是否进行过隐藏处理
Object.extend = function(src, ext) {
  for (var p in ext) src[p] = ext[p];
  return src;
}
//字符串扩展属性和方法
Object.extend(String.prototype, {
    Trim : function() {
        return this.trim();
    },
    trim : function() {
        return this.replace(/(^[\s]*)|([\s]*$)/g,"");
    },
    Replace : function(oldChar,newChar) {
        var charlist = ["+", "?", "$", "*", "\\", "^"];
        var rtn_s = "";
        for (var i=0; i<charlist.length; i++) {
            if (oldChar.indexOf(charlist[i]) > -1) {
                var arrTemp = this.split(oldChar);
                var rtn_s = arrTemp[0];
                for (var i=1; i<arrTemp.length; i++) rtn_s += newChar + arrTemp[i];
                return rtn_s;
            }
        }
        rtn_s = this.replace(new RegExp(oldChar,"gm"),newChar);
        return rtn_s;
    },
    Bytelen : function() {
        return this.replace(/[^\x00-\xff]/g,"**").length;
    },
    Escape : function() {
        return Escape(this);
    },
    UnEscape : function() {
        return UnEscape(this);
    },
    XmlEscape : function() {
        return XmlEscape(this);
    },
    EncodeSql : function() {
        var rtn = this.Replace("'","''");
        rtn = rtn.Replace("&","^");
        rtn = rtn.Replace("<","＜");
        rtn = rtn.Replace(">","＞");
        return "'" + rtn + "'";
    }
});

function DngAttEscape(s) {
    var rtn = s;
    rtn = rtn.Replace("'", "%qt;");
    rtn = rtn.Replace("\"", "%dqt;");
    rtn = rtn.Replace("+", "%jh;");
    return rtn;
}

function DngAttUnEscape(s) {
    var rtn = s;
    rtn = rtn.Replace("%qt;", "'");
    rtn = rtn.Replace("%dqt;", "\"");
    rtn = rtn.Replace("%jh;", "+");
    return rtn;
}

function XmlEscape(s) {
    var rtn = s;
    rtn = rtn.Replace("<", "&lt;");
    rtn = rtn.Replace(">", "&gt;");
    rtn = rtn.Replace("&", "&amp;");
    rtn = rtn.Replace("+", "%jh;");
    rtn = rtn.Replace("'", "%qt;");
    rtn = rtn.Replace("\"", "%dqt;");
    return rtn;
}
function UnXmlEscape(s) {
    var rtn = s;
    rtn = rtn.Replace("&lt;", "<");
    rtn = rtn.Replace("&gt;", ">");
    rtn = rtn.Replace("&amp;", "&");
    rtn = rtn.Replace("%jh;", "+");
    rtn = rtn.Replace("%qt;", "'");
    rtn = rtn.Replace("%dqt;", "\"");
    return rtn;
}

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

function Escape(s) {
    var rtn = s;
    rtn = rtn.Replace("'", "‘");
    rtn = rtn.Replace("\"", "“");
    rtn = rtn.Replace("<", "《");
    rtn = rtn.Replace(">", "》");
    rtn = rtn.Replace("&", "＆");
    rtn = rtn.Replace("+", "＋");
    return rtn;
}

function UnEscape(s) {
    var rtn = s;
    rtn = rtn.Replace("‘", "'");
    rtn = rtn.Replace("“", "\"");
    rtn = rtn.Replace("《", "<");
    rtn = rtn.Replace("》", ">");
    rtn = rtn.Replace("＆", "&");
    rtn = rtn.Replace("＋", "+");
    return rtn;
}

function DisableBodyMenu() {
    try {
        event.cancelBubble = true
        event.returnValue = false;
        return false;
    } catch(e) {}
}


//获取控件对象
function $E(ctrlID) {
    var oCtrl = null;
    return document.getElementById(ctrlID);    //浏览器的接口方法不区分大小写
    //return $("#"+ctrlID).get(0);             //Jquery的选择器区分大小写
}
//获取控件的值
function $V(ctrlID,val) {
    var val = null;
    for (var i=0; i<CtrlList.length; i++) {
        if (CtrlList[i].s.toLowerCase() === ctrlID.toLowerCase()) {
            switch(CtrlList[i].t) {
                case "textbox":
                case "btntxtbox":
                case "datebox":
                case "mtextbox":
                case "numspin":
                    val = UnSqlEscape(val);
                    try {CtrlList[i].c.SetText(val);} catch(e){}
                    break;
                case "checkbox":
                    if (val === "1" || val === 1) val = true;
                    else val = false;
                    CtrlList[i].c.SetValue(val);
                    break;
                case "listbox":
                    if (val !== "") {
                        if (CtrlList[i].c.selectionMode === 0) {
                            CtrlList[i].c.SetValue(val);
                        } else {
                            arrTemp = val.split(",");
                            CtrlList[i].c.SelectValues(arrTemp);
                        }
                    }
                    break;
                case "radiolist":
                    CtrlList[i].c.SetValue(val);
                    break;
                case "combox":
                    SelectItemByVal(CtrlList[i].c,val);
                    break;
                case "htmledit":
                    try {CtrlList[i].c.SetHtml(val);} catch(e){}
                    break;
            }
        }
    }
}
function $F(ctrlID) {
    var val = null;
    for (var i=0; i<CtrlList.length; i++) {
        if (CtrlList[i].s.toLowerCase() === ctrlID.toLowerCase()) {
            switch(CtrlList[i].t) {
                case "textbox":
                case "btntxtbox":
                case "datebox":
                case "mtextbox":
                case "numspin":
                    val = CtrlList[i].c.GetText();
                    break;
                case "checkbox":
                    val = CtrlList[i].c.GetValue();
                    if (val === null) val = false;
                    if (val === true) val = "1";
                    else val = "0";
                    break;
                case "listbox":
                    val = CtrlList[i].c.GetSelectedValues();
                    break;
                case "radiolist":
                case "combox":
                    val = CtrlList[i].c.GetValue();
                    break;
                case "htmledit":
                    val = CtrlList[i].c.GetHtml();
                    break;
            }
        }
    }
    return val;
    var obj = document.getElementById(ctrlID);
    var strTemp = obj.value;
    try {
        if (strTemp == "######") {
            strTemp = $(obj).attr("hv");
        }else {
            if (obj.tagName=="SELECT") {
               if (obj.getAttribute("hv") != null)
                  strTemp = $(obj).attr("hv");
               else
                  if (obj.getAttribute("edit") != null) strTemp = document.getElementById(ctrlID+"_combox_edit").value;
            } else if (obj.tagName=="DIV") {
               if ($(obj).children("input").attr("checked")) strTemp = $(obj).attr("truevalue");
               else strTemp = $(obj).attr("falsevalue");
            } else if (obj.tagName == "FIELDSET") {
               $(obj).find("input[type='radio']").each(function() {
                   if (this.checked) {
                      strTemp = this.value;
                      return false;
                   }
               });
            }
        }
        return strTemp;
    }catch(e) {return "";}
}

////////AJAX
var oWFAjax = {
    asyn : true,
    rtype : "POST",
    cBackFun : "",
    ReqGetData : function(ExecUrl,ExecData) {
        return ajax.run(ExecUrl, ExecData, oWFAjax.cBackFun, oWFAjax.rtype, true);
    },
    Exec : function(ExecUrl,ExecData) {
        return ajax.run(ExecUrl, ExecData, oWFAjax.cBackFun, oWFAjax.rtype, true);
    }
}

//////数据库操作
var Sql = {
    _sqlCmd : [],
    AddCmd : function(strSqlCmd) {
        this._sqlCmd[this._sqlCmd.length] = strSqlCmd.Replace("+","^AddPlus;");
    },
    add : function(strSql) {
        this.AddCmd(strSql);
    },
    clear : function() {
        this._sqlCmd = [];
    }
};
function ExecSql() {  //sqlCmd
    var argCount = arguments.length;
    var strSQL = "";
    var CallBack = null;

    if (argCount === 0) {  //同步执行事务处理
        if (Sql._sqlCmd.length === 0) return "无SQL命令，系统无法执行";
        for (var i=0; i<Sql._sqlCmd.length; i++) {
           strSQL += Sql._sqlCmd[i];
           if (i<Sql._sqlCmd.length-1) strSQL += "^NewCmd;";
        }
    } else if (argCount === 1) {   //同步执行一条SQL或异步执行事务处理
        var argType = typeof(arguments[0]);
        if (argType === "string") {
            if (arguments[0] === "") {
                Sql.clear();
                return "无SQL命令，系统无法执行";
            }
            strSQL = arguments[0];
            strSQL = strSQL.Replace("+","^AddPlus;");
        } else if (argType === "function") {
            if (Sql._sqlCmd.length < 2) {
				Sql._sqlCmd.push("select 0");
               // Sql.clear();
               // return "事务处理至少要求2条SQL命令";
            }
            for (var i=0; i<Sql._sqlCmd.length; i++) {
               strSQL += Sql._sqlCmd[i];
               if (i<Sql._sqlCmd.length-1) strSQL += "^NewCmd;";
            }
            CallBack = arguments[0];
        } else {
            Sql.clear();
            return "参数类型错误";
        }
    } else {   //异步执行一条SQL
        if (argCount > 2) {Sql._sqlCmd = [];return "ExecSql方法最多只能有2个参数";}
        if (typeof(arguments[0]) !== "string") {Sql._sqlCmd = [];return "非法的SQL命令";}
        if (typeof(arguments[1]) !== "function") {Sql._sqlCmd = [];return "非法的回调函数";}
        if (arguments[0] === "") {Sql._sqlCmd = [];return "无SQL命令，系统无法执行";}
        strSQL = arguments[0];
        strSQL = strSQL.Replace("+","^AddPlus;");
        CallBack = arguments[1];
    }
    Sql._sqlCmd = [];
    var tmp = strSQL.toLowerCase();
    if (tmp.indexOf("select ") === -1 && tmp.indexOf("exec ") === -1 && tmp.indexOf("update ") === -1 && tmp.indexOf("delete ") === -1 && tmp.indexOf("insert ") === -1) return "非法的SQL命令";
    if (CallBack === null) return ajax.run(rup + "/app/handle.aspx",{cmd:"execsql",sql:strSQL});
    else ajax.run(rup + "/app/handle.aspx",{cmd:"execsql",sql:strSQL},CallBack);
    /*
    sqlCmd = sqlCmd || "";
    if (sqlCmd !== "") {
        sqlCmd = sqlCmd.Replace("+","^AddPlus;");
    }else {
        if (Sql._sqlCmd.length === 0) return "SQL命令为空";
        for (var i=0; i<Sql._sqlCmd.length; i++) {
           sqlCmd += Sql._sqlCmd[i];
           if (i<Sql._sqlCmd.length-1) sqlCmd += "^NewCmd;";
        }
    }
    ;
    oWFAjax.asyn = false;
    return oWFAjax.ReqGetData(httpUrlRoot + "/app/handle.aspx","cmd=execsql&sql="+sqlCmd);
    */
}
function EncodeSql(strSql) {
    var rtn = strSql;
    rtn = rtn.Replace("'","''");
    rtn = rtn.Replace("&","^");
    rtn = rtn.Replace("<","＜");
    rtn = rtn.Replace(">","＞");
    return "'" + rtn + "'";
}

function GetData(sqlCmd,CallBack) {
    CallBack = CallBack || "";
    try {
        sqlCmd = sqlCmd.Replace("+","^AddPlus;");
        if (typeof(CallBack) !== "function") {
            var rtn = ajax.run(rup + "/app/handle.aspx", {cmd:"getjsondata",sql:sqlCmd})
            //alert(rtn);
            if (rtn === "") return null;
            if (rtn.substring(0,7) === "([{err:") {
                var obj = eval(rtn);
                alert("加载数据错误，原因：\n\n" + obj[0].err);
                obj = null;
                return null;
            }
            return eval(rtn);
        } else {
            ajax.run(rup + "/app/handle.aspx", {cmd:"getjsondata",sql:sqlCmd}, function(s){
                if (s.substring(0,7) === "([{err:") {
                    var obj = eval(s);
                    alert("加载数据错误，原因：\n\n" + obj[0].err);
                    obj = null;
                } else {
                    CallBack(s);
                }
            });
        }
    } catch(e) {
        return null;
    }
}

//////获取32位GUID
function GetGUID(asyn) {return GUID(asyn);}
function GUID(asyn) {
    asyn = asyn || false;
    if (asyn) {
        var urlpars = "cmd=guid";
        oWFAjax.asyn = false;
        return oWFAjax.ReqGetData(ajaxhandle,urlpars);
    } else {
       var guid = "";
       for (var i=1; i<=8; i++) guid += (((1+Math.random())*0x10000)|0).toString(16).substring(1);
       return guid.toUpperCase();
    }
}

//////解析URL的参数值，相当于C#的 Request.QueryString的功能
_url = {
   param : function(item) {
      item = item || ""; if (item=="") return "";
      var _url = window.location.href;
      var _lowerUrl = _url.toLowerCase();
      var _lowerItem = item.toLowerCase()+"=";
      item += "=";
      var arrTemp;
      var strItemValue = "";
      arrTemp = _lowerUrl.split("?"+_lowerItem);
      if (arrTemp.length == 2) {
         arrTemp = _url.split("?"+item);
         strItemValue = this._GetItemValue(arrTemp[1]);
      }else {
         arrTemp = _lowerUrl.split("&"+_lowerItem);
         if (arrTemp.length == 2) {
             arrTemp = _url.split("&"+item);
             strItemValue = this._GetItemValue(arrTemp[1]);
         }
      }
      _url=null;_lowerUrl=null;_lowerItem=null;arrTemp=null;
      return strItemValue;
   },
   _GetItemValue : function(itemnext) {
       var arrTemp = itemnext.split("=");
       var strTemp = "";
       var posIndex
       var arrLen=arrTemp.length;
       for (var i=0; i<arrLen; i++) {
          posIndex = arrTemp[i].lastIndexOf("&");
          if (posIndex > -1) {
             strTemp += arrTemp[i].substring(0,posIndex);
             break;
          }else {
             strTemp += arrTemp[i];
             strTemp += i<arrLen-1?"=":"";
          }
       }
       arrTemp=null;posIndex=null;arrLen=null;
       return strTemp;
   } // asdf&b=asdf
}
function Req(urlParam) {
    var val = "";
    try {
        val = _url.param(urlParam);
    }catch(e) {
        val = ""
    }
    return val;
}

//////Cookie操作
function _cookie(name, value, options) {
    if (typeof value != 'undefined') {
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
}
function SetCookie(key,val,saveday) {
    key = key || "";
    val = val || "";
    saveday = saveday || 1;
    if (key === "" || val === "") return;
    if (isNaN(saveday)) saveday = 1;
    _cookie(_domain + "." + _iis_vdir + "." + key, null);
    _cookie(_domain + "." + _iis_vdir + "." + key, val, {expires: saveday, path: "/"+_iis_vdir, domain: _domain});
}
function GetCookie(key) {
    key = key || "";
    if (key == "") return "";
    var r = _cookie(_domain + "." + _iis_vdir + "." + key);
    if (r === null) r = "";
    return r;
}
function DelCookie(key) {
    key = key || "";
    if (key == "") return;
    return _cookie(_domain + "." + _iis_vdir + "." + key, null);
}



//////实用小函数
function MD5(srcChar) {
    var urlpars = "cmd=md5&srcchar="+srcChar;
    oWFAjax.asyn = false;
    return oWFAjax.ReqGetData(ajaxhandle,urlpars);
}
//汉字拼音字典
function getpy(str){
    var result="";
    try {
        if (typeof(str)!="string") str = new String(str);
        var tmp = 65536 + getAsc(str);
        var uc=str.charCodeAt(0);
        if (uc<128){
            if ((uc>=65&&uc<=90)||(uc>=97&&uc<=122)||(uc>=48&&uc<=57)) return str.toUpperCase();
            else return "";
        }
        if(tmp>=45217&&tmp<=45252) {
        result= "A"
        }else if(tmp>=45253&&tmp<=45760) {
        result= "B"
        }else if(tmp>=45761&&tmp<=46317) {
        result= "C"
        }else if(tmp>=46318&&tmp<=46825) {
        result= "D"
        }else if(tmp>=46826&&tmp<=47009) {
        result= "E"
        }else if(tmp>=47010&&tmp<=47296) {
        result= "F"
        }else if(tmp>=47297&&tmp<=47613) {
        result= "G"
        }else if(tmp>=47614&&tmp<=48118) {
        result= "H"
        }else if(tmp>=48119&&tmp<=49061) {
        result= "J"
        }else if(tmp>=49062&&tmp<=49323) {
        result= "K"
        }else if(tmp>=49324&&tmp<=49895) {
        result= "L"
        }else if(tmp>=49896&&tmp<=50370) {
        result= "M"
        }else if(tmp>=50371&&tmp<=50613) {
        result= "N"
        }else if(tmp>=50614&&tmp<=50621) {
        result= "O"
        }else if(tmp>=50622&&tmp<=50905) {
        result= "P"
        }else if(tmp>=50906&&tmp<=51386) {
        result= "Q"
        }else if(tmp>=51387&&tmp<=51445) {
        result= "R"
        }else if(tmp>=51446&&tmp<=52217) {
        result= "S"
        }else if(tmp>=52218&&tmp<=52697) {
        result= "T"
        }else if(tmp>=52698&&tmp<=52979) {
        result= "W"
        }else if(tmp>=52980&&tmp<=53640) {
        result= "X"
        }else if(tmp>=53689&&tmp<=54480) {
        result= "Y"
        }else if(tmp>=54481&&tmp<=62289) {
        result= "Z"
        }else{
        result="";
        }
    }catch(e) {result="error";}
    return result;
}
function $RND() {
   return (new Date()).getTime();
}
function GetRndID() {
   return (new Date()).getTime();
}


//获取当前站点的根路径
function GetSiteRoot(){
    var strFullPath=window.document.location.href;
    var strPath=window.document.location.pathname;
    var pos=strFullPath.indexOf(strPath);
    var prePath=strFullPath.substring(0,pos);
    var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
    return(prePath+postPath);
}

//获取当前登录用户的顶级部门
function GetRootDep() {
		var arrTemp = uatt.split(",");
		var strTemp = "";
		var TtrTemp="";
		var DepInfo = {id:'',name:''};
		for (var i=0; i<arrTemp.length; i++) {
			if (arrTemp[i].substring(0,1) == "D" && arrTemp[i].indexOf("(兼)") < 0) {
				strTemp = arrTemp[i];
				break;
			}
		}
		if (strTemp != "") {
			arrTemp = strTemp.split(":");
			DepInfo.id = arrTemp[0].substring(0,4);
			DepInfo.name = arrTemp[1].substring(0,arrTemp[1].indexOf("/"));
		}
		else{                                                 //PYC修改 2012-04-25  为添加出版流程解决兼职人员部门不显示修改
			TtrTemp= arrTemp[0].split(":");
			DepInfo.id = TtrTemp[0].substring(0,4);
			DepInfo.name = TtrTemp[1].substring(0,TtrTemp[1].indexOf("/"));
		}
    return DepInfo;
}

//全局变量赋值
httpUrlRoot = GetSiteRoot();
rup = httpUrlRoot;
ajaxhandle = rup + "/app/handle.aspx?psd=";
var _varTemp = rup.split("/");
_iis_vdir = _varTemp[_varTemp.length-1];
_domain = document.domain;
/*
//此段代码好像没什么作用，暂时注释  2011 - 01 - 12
_varTemp = Req("psd");
if (_varTemp != "") {
    SetCookie("$$PSD",_varTemp);
} else {
    _varTemp = GetCookie("$$PSD");
    if (_varTemp == null) _varTemp = "";
}
ajaxhandle += _varTemp;
*/
_varTemp = null;

//设置模态窗体的标题
function DlgWinCaption(strTitle) {
  var strSpace = "　";  // = "%A0";
  for (var i=0;i<50;i++) strSpace += "　";
  document.title = strTitle + strSpace;  //unescape(sHexA0);
}
//获取编号
function GetBH(part1,part2,part3,part4,BHLen) {
  var bh = "";
  part1=part1||"";
  if (part1 == "") return bh;
  part2=part2||"";
  part3=part3||"";
  part4=part4||"";
  BHLen=BHLen||3;

  var urlpars = "cmd=getbh&part1="+part1+"&part2="+part2+"&part3="+part3+"&part4="+part4+"&bhlen="+BHLen;
  oWFAjax.asyn = false;
  return oWFAjax.ReqGetData(ajaxhandle,urlpars);
}
//全部替换
function $RP(srcStr,subChar,repChar) {
    return srcStr.Replace(subChar,repChar);
}

//获取汉字拼音的首字母
function GetChnFPY(strChnChar) {
  var strTemp = "";
  for (var i=0; i<strChnChar.length; i++) {
    strTemp += getpy(strChnChar.substr(i,1));
  }
  return strTemp;
}
//获取表单ID
function $FID() {
  var urlFile = window.location.pathname;
  var i = urlFile.indexOf("hsform/");
  urlFile = urlFile.substring(i+7);
  var i = urlFile.indexOf(".");
  urlFile = urlFile.substring(0,i);
  return urlFile;
}

//解析用户信息的姓名
function GetObjName(objlist) {
    return $ONM(objlist);
}
function GetObjID(objlist) {
    return $OID(objlist);
}
function $ONM(strObjInfo) {
  var i,j;
  var strRtn = "";
  var tmpArr = strObjInfo.split(',');
  for (i=0; i<tmpArr.length; i++) {
     j = tmpArr[i].indexOf(':');
     if (j>0) {
        strRtn += "," + tmpArr[i].substring(j+1);
     } else {
        strRtn += "," + tmpArr[i];
     }
  }
  if (strRtn != "") strRtn = strRtn.substring(1);
  return strRtn;
}

//解析用户信息的ID
function $OID(strObjInfo) {
  var i,j;
  var strRtn = "";
  var tmpArr = strObjInfo.split(',');
  for (i=0; i<tmpArr.length; i++) {
     j = tmpArr[i].indexOf(':');
     if (j>0) {
        strRtn += "," + tmpArr[i].substring(0,j);
     } else {
        strRtn += "," + tmpArr[i];
     }
  }
  if (strRtn != "") strRtn = strRtn.substring(1);
  return strRtn;
}

//获取服务器的时间
function GetDate(dateformat) {
    return sysDate(dateformat);
}
function sysDate(dateformat) {
   try {
      dateformat = dateformat || "yyyy-mm-dd";
      var oDate = GetData("select YMD,YYMMDD,YMDH from vSYSRID");
      if (oDate.length == 0) return "";
      switch(dateformat) {
          case "yymmdd" : return oDate[0].ymd;
          case "yyyy-mm-dd hh:mm" : return oDate[0].ymdh.substring(0,16);
          case "yyyy-mm-dd hh:mm:ss" : return oDate[0].ymdh;
          default : return oDate[0].yymmdd;
      }
   } catch(e) {
      return "";
   }
}

////////////////////////////////////////////////////////////
//  seltype: user,obj,mix     选人、选对象、混合       默认为选人
//  expnode: dep,role,job,grp 默认展开什么类型的树枝   默认为部门
//  done:sel,cfg              当前是做什么操作：选择、配置人员，默认为选择
//  objid:DID,RID,JID,GID     如果时做配置操作，此参数必须得有
//  ctrlID                    存放返回值的控件ID，一般显示选择对象的名字
//                            如果控件为列表框则对象ID和名称都可以存放其中
//                            如果控件为文本框则需要一个隐藏的文本框，以存放对象的ID信息，文本框的ID为"_"+ctrlID
//  rtnCount                  允许选择对象的个数
////////////////////////////////////////////////////////////
function SelectObj(JsonArg) {
  //seltype,itype,done,objid,ctrlID
  //参数检查
  if ("&user,obj,mix".indexOf(JsonArg.seltype) < 1) JsonArg.seltype = "user";
  if ("&dep,role,job,grp".indexOf(JsonArg.expnode) < 1) JsonArg.expnode = "dep";
  if ("&sel,cfg".indexOf(JsonArg.done) < 1) JsonArg.done = "sel";
  if (JsonArg.done == 'cfg' && (JsonArg.objid == '' || JsonArg.objid == undefined)) return;
  if (JsonArg.ctrlID == '' || JsonArg.ctrlID == undefined) return;
  try {
    if (JsonArg.rtnCount == undefined) {
      JsonArg.rtnCount = 1;
    }else {
      if (JsonArg.rtnCount + 1 > 100) JsonArg.rtnCount = 0;
    }
  }catch(e) {
    JsonArg.rtnCount = 1;
  }

  //alert(JsonArg.seltype);alert(JsonArg.expnode);alert(JsonArg.done);alert(JsonArg.objid);alert(JsonArg.ctrlID);alert(JsonArg.rtnCount);
  var selFilePath = httpUrlRoot + "/admin/selectuser.htm?id=1390";
  var oCtrl = $E(JsonArg.ctrlID);
  var i=0;
  var ctrlType = oCtrl.tagName.toUpperCase();
  var strJSON = "{pars:{},obj:[";
  if (ctrlType == "SELECT") {
      for (i=0; i<oCtrl.options.length; i++) {
        strJSON += "{id:'"+oCtrl.options[i].value+"',name:'"+oCtrl.options[i].text+"'},";
      }
      strJSON = strJSON.substring(0,strJSON.length-1) + "]}";
  }else {
      var tmpArr;
      var strTemp = "";
      var j;
      strTemp = oCtrl.value;
      if ($E("_"+JsonArg.ctrlID)) strTemp = $E("_"+JsonArg.ctrlID).value;
      tmpArr = strTemp.split(',');
      for (i=0; i<tmpArr.length; i++) {
        j = tmpArr[i].indexOf(':');
        if (j>0) {
          strJSON += "{id:'"+tmpArr[i].substring(0,j)+"',name:'"+tmpArr[i].substring(j+1)+"'},";
        } else {
          strJSON += "{id:'"+tmpArr[i]+"',name:'"+tmpArr[i]+"'},";
        }
      }
      strJSON = strJSON.substring(0,strJSON.length-1) + "]}";
  }

  if (strJSON == "{pars:{},obj:]}") strJSON = "{pars:{},obj:[]}";
  var parJson = strJSON.evalJSON();
  parJson.pars = JsonArg;
  var strRtn = window.showModalDialog(selFilePath,parJson,"status:no;help:no;dialogHeight:380px;dialogWidth:580px");
  if (strRtn=="" || strRtn == undefined) return "NULL";
  try {
    var oJSON = strRtn.evalJSON();
    var strName="";
    var strIDName="";

    if (ctrlType == "SELECT") {
      ClearItem(oCtrl);
      for (i=0; i<oJSON.obj.length; i++) {
        oCtrl.AddItem(oJSON.obj[i].id,oJSON.obj[i].name);
      }
    }else {
      for (i=0; i<oJSON.obj.length; i++) {
        strName += oJSON.obj[i].name + ",";
        strIDName += oJSON.obj[i].id+":"+oJSON.obj[i].name + ",";
      }
      strName = strName.substring(0,strName.length-1);
      strIDName = strIDName.substring(0,strIDName.length-1);
      if (oCtrl.value == strName) return "NULL";
      oCtrl.value = strName
      if ($E("_"+JsonArg.ctrlID)) {
        $E("_"+JsonArg.ctrlID).value = strIDName;
      }
    }
    return "OK";
  }catch(e) {
    alert("程序发生异常, 原因:\n\n" + e.description);
    return "NULL";
  }
}
function SetComboxValue(id,val) {
    $("#"+id).val(val);
    try{($("#"+id+"_combox_edit").val(val));}catch(e){}
}

//////文件上传
//返回JSON格式[{objid:'',filename:'',filevpath:'',filesize:''}]
function UploadFile(objid) {
    return uploadfile(objid);
}
function uploadfile(objid) {
    var upfile = showModalDialog(httpUrlRoot+"/swfupload/uploadfrm.htm",objid,"status:no;help:no;dialogHeight:240px;dialogWidth:580px");
    //2014-07-08 zhaoxin 换一个显示方式，解决IE9以上浏览器选择文件按钮无显示的问题
    //var upfile = showModelessDialog(httpUrlRoot + "/swfupload/uploadfrm.htm", objid, "status:no;help:no;dialogHeight:240px;dialogWidth:580px");
   var arrTemp,strJSON;
   try {
       if (upfile.length==0) return [];
       else {
           strJSON = "";
           for (var i=0; i<upfile.length; i++) {
               arrTemp = upfile[i].split("/");
               strJSON += ",{objid:'" + arrTemp[1] + "',filename:'" + arrTemp[2] + "',";
               strJSON += "filevpath:'" + upfile[i].replace("/"+arrTemp[3],"") + "',filesize:'" + arrTemp[3] + "'}";
           }
           strJSON = "([" + strJSON.substring(1) + "])";
       }
       return eval(strJSON);
   }catch(e) {
       return [];
   }
}
function UpdateFile(ofile) {
    try {
        if (ofile.length > 0) {
            var sqlCmd = "insert into Base_FileList (objid,filename,filevpath,filesize,uploaduser) select * from ({FILESQL}) T";
            var fileSql = "select ";
            for (var i=0; i<ofile.length; i++) {
                if (fileSql != "select ") fileSql += " union all select ";
                fileSql += "'" + ofile[i].objid + "' F1,";
                fileSql += "'" + ofile[i].filename + "' F2,";
                fileSql += "'" + ofile[i].filevpath + "' F3,";
                fileSql += "'" + ofile[i].filesize + "' F4,";
                fileSql += "'" + uname + "' F5";
            }
            sqlCmd = sqlCmd.replace("{FILESQL}",fileSql);
            var rtn = ExecSql(sqlCmd);
            if (rtn != "") {
                alert(rtn);
                return false;
            } else {
                return true;
            }
        } else {
            alert("没有文件被上传");
            return false;
        }
    } catch(e) {
        alert("写入文件信息出错, 原因: \n" + e.message);
        return false;
    }

}



function SetSession(key,val) {
    try {
        if (arguments.length != 2) return false;
        else {
            oWFAjax.asyn = false;
            var rtn = oWFAjax.Exec(ajaxhandle,"cmd=setsession&key=" + key + "&val=" + val);
            if (rtn == "") return true;
            else return false;
        }
    }catch(e) {
        return false;
    }
}

function GetSession(key) {
    try {
        if (arguments.length != 1) return "";
        else {
            oWFAjax.asyn = false;
            var rtn = oWFAjax.Exec(ajaxhandle,"cmd=getsession&key=" + key);
            if (rtn.indexOf("发生异常")>0) return "";
            else return rtn;
        }
    }catch(e) {
        return "";
    }
}

Report = {
    name:'',objid:'',objtype:'flow',sdate:'',frompage:'',version:'',
    reset: function() {
        this.name = "";
        this.objid = "";
        this.objtype = "flow";
        this.sdate = "";
        this.frompage = "";
        this.version = "";
    },
    Design : function(RptID,RptName,ModName) {
        if (arguments.length != 3) {
            alert("请指定报表ID和名称");
            return;
        } else {
            if (typeof(RptID) != "string" || typeof(RptName) != "string" || typeof(ModName) != "string" || RptID.length != 32 || RptName.Trim() == "" || ModName == "") {
                alert("报表ID或名称或模块编号不正确");
                return;
            }
        }
        window.open(httpUrlRoot + "/report/rptdesign.aspx?rid=" + RptID + "&rn=" + escape(RptName) + "&modname=" + ModName);
    },
    Show: function() {
        try {
            if (this.objid == "") {
                //alert("业务数据ID没有赋值, 无法打开报表!　");
                //return;
            }
            if (this.objtype!="flow") {
                if (this.name == "" || this.sdate == "") {
                    alert("对于非流程报表, 必须指定报表名称和业务数据的创建日期!　");
                    return;
                }
            }
            var urlparam = "cmd=showrpt&name=" + this.name + "&sdate=" + this.sdate + "&wfid=";
            if (this.objtype==="flow") urlparam += this.objid;
            oWFAjax.asyn = false;
            var rptid = oWFAjax.Exec(ajaxhandle,urlparam);
            if (rptid == "") alert("获取报表失败, 请确认该报表是否存在!");
            else if (rptid.indexOf("发生异常")>0) alert("打开报表出错, 原因:\n" + rptid);
            else window.open(httpUrlRoot + "/report/rptview.aspx?rptid=" + rptid + "&objid=" + this.objid); // + "&wfid=" + this.wfid);
            this.reset();
        }catch(e) {
            alert("打开报表出错, 原因:\n" + e.message);
        }
    },
    //2012-04-19 15:05 赵欣 添加 原始归档时调用此方法获得报表ID*************************
    GetReportID: function() {
        try {
            if (this.objtype!="flow") {
                if (this.name == "" || this.sdate == "") {
                    alert("对于非流程报表, 必须指定报表名称和业务数据的创建日期!　");
                    return;
                }
            }
            var urlparam = "cmd=showrpt&name=" + this.name + "&sdate=" + this.sdate + "&wfid=";
            if (this.objtype==="flow") urlparam += this.objid;
            oWFAjax.asyn = false;
            var rptid = oWFAjax.Exec(ajaxhandle,urlparam);
            this.reset();
            return rptid;
        }catch(e) {
            alert("获得报表ID出错, 原因:\n" + e.message);
        }
    }
    //********************************************************************************
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 * 兼容eform中的函数
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * */
function bill_onclick(execFun) {eval(execFun);}
function bill_onkeydown(execFun) {eval(execFun);}
function $eform(strCmd) {if (strCmd == "选择日期") {$DT();}}
function InsertSql(sqlCmd) {return ExecSql(sqlCmd);}
function InsertSqls(sqlCmd) {
    sqlCmd = sqlCmd.Replace("</NO><NO>","^NewCmd;");
    sqlCmd = sqlCmd.Replace("<NO>","");
    sqlCmd = sqlCmd.Replace("</NO>","");
    sqlCmd = sqlCmd.Replace("</no><no>","^NewCmd;");
    sqlCmd = sqlCmd.Replace("<no>","");
    sqlCmd = sqlCmd.Replace("</no>","");
    sqlCmd = sqlCmd.Replace("+","^AddPlus;");
    return ExecSql(sqlCmd);
}
function SelectSql(sqlCmd) {
    sqlCmd = sqlCmd.Replace("+","^AddPlus;");
    oWFAjax.asyn = false;
    return oWFAjax.ReqGetData(ajaxhandle,"cmd=selectsql&sql="+sqlCmd);
}
function SqlCombo(oCombox,sqlCmd) {
    if (arguments.length != 2) return;
    oCombox.AddItem(sqlCmd);
}
function $DT() {
    var obj = event.srcElement;
    $(obj).datepicker();
    window.setTimeout(function(){obj.blur();obj.focus();},30);
}
function $URL(urlParam) {
    return Req(urlParam);
}
function SelectAll(ds,fg) {ds.SelectAll();}
function RowChecked(ds,ir) {return ds.RowChecked(ir)}

function SetChkboxVal(oChk,val) {
    if (oChk.attr("truevalue") == val) oChk.children("input").attr("checked",true);
    else oChk.children("input").attr("checked",false);
}

var IMMsg = {recvUser:"",html:"",sms:""};
function SendMsg() {
    if (IMMsg.recvUser=="" || IMMsg.html=="" || IMMsg.sms=="") {
        alert("接收人、消息内容以及短信内容不能为空");
        IMMsg = {recvUser:"",html:"",sms:""};
        return;
    }
    var postdata = "cmd=sendmsg";
    postdata += "&user=" + IMMsg.recvUser;
    postdata += "&sms=" + IMMsg.sms;
    postdata += "&txt=" + IMMsg.html.Replace("<","＜").Replace(">","＞").Replace("&","＆");
    var rtn = oWFAjax.Exec(ajaxhandle,postdata);
    IMMsg = {recvUser:"",html:"",sms:""};
}

var IMSDK = {
    SendMsg : function(parms) {
       parms = parms || null; // {msg:"",url:"",obj:""}
       if (parms === null) return;
       try {
           parms.url = parms.url.Replace("&","%70");
       } catch(e) {
           parms = $.extend(parms,{url:""});
       }
       parms = $.extend(parms,{cmd:"sendimmsg"});
       ajax.run(ajaxhandle,parms,function(s) {alert(s)});
   },
   AddUser : function(id,name) {
       var postdata = "cmd=addimuser&id=" + id + "&name=" + name;
       oWFAjax.asyn = false;
       var rtn = oWFAjax.Exec(ajaxhandle,postdata);
   },
   DelUser : function(id) {
       var postdata = "cmd=delimuser&id=" + id;
       oWFAjax.asyn = false;
       var rtn = oWFAjax.Exec(ajaxhandle,postdata);
   },
   UptUser : function(id,name) {
       var postdata = "cmd=uptimuser&id=" + id + "&name=" + name;
       oWFAjax.asyn = false;
       var rtn = oWFAjax.Exec(ajaxhandle,postdata);
   },
   UptPwd : function(password,lgname) {
       lgname = lgname || ulogname;
       var postdata = {cmd:"uptimpwd", logid:lgname, pwd:password};
       var rtn = ajax.run(ajaxhandle,postdata);
       return rtn;
   },
   UptLogID : function(old_id,new_id) {
       if (new_id === "") {
            alert("登录帐号不能为空");
            return;
       }
       var s = Validate(new_id, "abcstr");
       if (s !== "") {
           alert("登录帐号"+s);
           return;
       }
       var postdata = {cmd:"uptimaccount", oid:old_id, nid:new_id};
       var rtn = ajax.run(ajaxhandle,postdata);
       if (rtn === "ERR") {
           return "修改登录名失败，请重新登录后再试！"
       } else {
           return "";
       }
   },
   UptUst : function(lgname,state) {
       var postdata = {cmd:"uptimust", logid:lgname, st:state};
       var rtn = ajax.run(ajaxhandle,postdata);
   },
   DisUser : function(uid,did) {
       var postdata = "cmd=disimuser&uid=" + uid + "&did=" + did;
       oWFAjax.asyn = false;
       return oWFAjax.Exec(ajaxhandle,postdata);
   },
   RemUser : function(uid,did) {
       var postdata = "cmd=remimuser&uid=" + uid + "&did=" + did;
       oWFAjax.asyn = false;
       return oWFAjax.Exec(ajaxhandle,postdata);
   },
   AddDep : function(id,name,pid) {
       pid = pid || "0000";
       var postdata = "cmd=addimdep&id=" + id + "&name=" + name + "&pid=" + pid;
       oWFAjax.asyn = false;
       return oWFAjax.Exec(ajaxhandle,postdata);
   },
   DelDep : function(id) {
       var postdata = "cmd=delimdep&id=" + id;
       oWFAjax.asyn = false;
       var rtn = oWFAjax.Exec(ajaxhandle,postdata);
   },
   UptDep : function(id,name) {
       var postdata = "cmd=uptimdep&id=" + id + "&name=" + name;
       oWFAjax.asyn = false;
       return oWFAjax.Exec(ajaxhandle,postdata);
   },
   MoveDep : function(id,pid) {
       var postdata = "cmd=mveimdep&id=" + id + "&pid=" + pid;
       oWFAjax.asyn = false;
       return oWFAjax.Exec(ajaxhandle,postdata);
   }
}

function OpenQryCmd(qryCmdName,qryDs) {
    qryCmdName = qryCmdName || "";
    if (qryCmdName == "") {
        alert("查询名称不能为空");
        return;
    }
    qryDs = qryDs || null;
    if (qryDs == null) {
        location.href = httpUrlRoot+"/application/hsform/hss32/qryappgrid.aspx?qrycmd=" + escape(qryCmdName) + "&rnd="+$RND();
    } else {
        var sql = Show(httpUrlRoot+"/application/hsform/hss32/qryappform.aspx?rnd="+$RND(),485,475,{cmd:qryCmdName,dataset:qryDs});
        if (sql != "") qryDs.Open(sql);
    }
}

var oEventObj = null;
var gdExt = {
     RowID : 0,
     Binded : false,
     GetCType : function() {
         var rtn = this.ctype;
         if (rtn) {
             return rtn;
         } else {
             return this.getGridParam("ctype");
         }
     },
     Open : function(sqlCmd,cpage,ajaxURL) {
         ajaxURL = ajaxURL || ajaxhandle;
         if (ajaxURL.indexOf("?") < 0) ajaxURL += "?req=jqgrid";
         if (sqlCmd != undefined && sqlCmd != "Refresh") {
            if (typeof(sqlCmd)!="string") return;
            sqlCmd = sqlCmd.Trim();
            if (sqlCmd=="" || !(sqlCmd.indexOf("select ")>-1 || sqlCmd.indexOf("exec ")>-1)) return;
         }else {
            sqlCmd = "";
         }
         this.Binded = false;
         sqlCmd = sqlCmd.Replace("+","^AddPlus;");
         if (this.GetCType() == "grid") {
             cpage = cpage || 1;
             var pda = this.getGridParam("postData");
             if(pda.sql == undefined) this.appendPostData({sql:sqlCmd});
             else {if (sqlCmd != "") pda.sql = sqlCmd;}
             //this.postData.sidx = "";
             this.clearGridData();this.setGridParam({url:ajaxURL + "&cmd=getdsdata&dsid="+this.getGridParam("csid"),page:cpage,sortname:""}).trigger('reloadGrid');
         }else {
             oWFAjax.asyn = false;
             var JsonData = oWFAjax.Exec(ajaxhandle + "&cmd=getdsdata&dsid="+this.csid,"sql="+sqlCmd);
             if (JsonData == "") this.data = {page:0,total:0,records:0,rows:[]};
             else try {this.data = eval("(" + JsonData + ")");}catch(e){this.data = {page:0,total:0,records:0,rows:[]};}
         }
         this.RowIndex = 0;
         this.Bind2Ctrl();
     },
     PageIndex : function() {
         if (this.GetCType() == "grid")
             return this.getGridParam("page");
         else
             return 0;
     },
     Refresh : function() {
         if (this.GetCType() == "grid") {
             var cpage = this.getGridParam("page");
             this.Open("Refresh",cpage);
         }
     },
     Clear : function() {
         if (this.GetCType() == "grid") this.clearGridData();
         else this.data.rows = [];
     },
     Display : function(tf) {
         try{
             if (tf == undefined) tf = true;
             var view = tf ? "block" : "none";
             if (this.GetCType() == "grid") $("#"+this.csid+"_pos").css("display",view);
         }catch(e) {}
     },
     Bind2Ctrl : function(intRowIndex) {
         try{
             if (this.GetCType()=="dataset") {if (this.data.rows.length==0) return;}
             else {if (this.RowCount()==0) return;}
             var oDataSet = this;
             var fieldValue = "";
             intRowIndex = intRowIndex || 1;
             if (intRowIndex == 0 || intRowIndex>this.RowCount()) return;
             $("*[dataset='"+this.csid+"']").each(function(){
                  try{fieldValue=oDataSet.Item(this.getAttribute("field"),intRowIndex);}catch(e){fieldValue="";}
                  if (fieldValue=="null" || fieldValue==null) fieldValue="";
                  if (this.tagName == "DIV") {  //复选框
                     if ($(this).attr("truevalue") == fieldValue) $(this).children("input").attr("checked",true);
                     else $(this).children("input").attr("checked",false);
                  } else if (this.tagName == "FIELDSET") {  //单选按钮
                     try{
                         var oRd = this;
                         $(this).find("input[type='radio']").each(function(){
                            if (this.value == fieldValue) {
                                this.checked = true;
                                try{$(oRd).attr("value",fieldValue);}catch(e){}
                                return false;
                            }
                         });
                     }catch(e){}
                  }else {   //(多行)文本框, (下拉)列表框
                     if (this.getAttribute("refuse") == null) {
                         if (this.tagName == "SELECT") { //$.browser.version == 6.0 &&
                             try{
                                 if ($(this).attr("edit") == "true") {
                                    var vallist = this.GetValList(",");
                                    if (vallist.indexOf(fieldValue) == -1) $("<option value="+fieldValue+">"+fieldValue+"</option>").appendTo($(this));
                                 }
                             }catch(e){}
                             window.setTimeout("SetComboxValue('"+this.id+"','"+fieldValue+"')",50);
                             try{this.fireEvent('onchange');}catch(e){}
                         } else {
                             $(this).val(fieldValue);
                         }
                       /*
                       var editAtt = "";
                       try{editAtt = $(this).attr("edit");}catch(e){editAtt = ""}
                       this.value = fieldValue;
                       if (editAtt == "true" && this.selectedIndex == -1) $("#"+this.id+"_combox_edit").val(fieldValue);
                       else {if (this.tagName=="SELECT") try{this.fireEvent('onchange');}catch(e){}}
                       */
                     }else {
                        this.setAttribute("hv",fieldValue);
                        this.value = "######";
                     }
                  }
             });
             oDataSet = null;//this.Binded=true;
         }catch(e){}
     },
     RowCount : function() {
         if (this.GetCType() == "grid") {
             return this[0].rows.length - 1; //document.getElementById(this.getGridParam("csid")+"_viewport").rows.length;
         }else {
             return this.data.rows.length;
         }
     },
     ColCount : function() {return this.getGridParam("colNames").length;},
     Cell : function(iR,iC) {
         try {
             if (this.ctype != "grid") return "";
             iR = iR || 0;
             iC = iC || 0;
             if (iR == 0 || iC == 0) return "";
             if (this.rownumbers) iC++;
             if (this.multiselect) iC++;
             iR--;iC=this._OffsetColIndex(iC);
             var rtn = "" ,tmp = "";
             try{tmp=this.colModel[iC].edittype;}catch(e){tmp=""}
             $("#"+this.csid+"_viewport").find("tr").each(function(i){
                if (i==iR) {
                    rtn=$(this.cells[iC]).attr("slv");
                    if (rtn == undefined) {
                        rtn="";
                        if(tmp!="select" && tmp!="checkbox") rtn = $(this.cells[iC]).text();
                        else {if(tmp=="checkbox") rtn=$(this.cells[iC]).children().get(0).checked?"1":"0";}
                        if(rtn=="") rtn=$(this.cells[iC]).children().eq(0).val();
                    }
                    if (rtn == "_nill") rtn = "";
                    return;
                }
             });return rtn;
         }catch(e) {
             return "";
         }
     },
     Item : function(fldName,iR) {
         try {
             if (arguments.length==0) return "";
             if (typeof(fldName) != "string") return "";
             iR = iR || 0;
             if(typeof(iR) != "number") return "";
             if(iR<0||iR>this.RowCount()) return "";
             fldName = fldName.toLowerCase();
             var iC = this._GetColIndexByFldName(fldName);
             if (iC == -1) return "";
             var rtn = "" ,tmp = "";
             if (this.GetCType() == "grid") {
                 var colModel = this.getGridParam("colModel");
                 if (iR==0) {
                     iR=this.getGridParam('selrow');
                     if(!iR)return ""
                 }
                 try{tmp=colModel[iC].edittype;}catch(e){tmp=""}
                 $("#"+this.getGridParam("csid")+"_viewport").find("tr").each(function(i){
                    if (i==iR) {
                        if ($(this.cells[iC]).children().eq(0).attr("tagName") == undefined) {
                            rtn = $(this.cells[iC]).html().Replace("&nbsp;","");
                            return false;
                        }
                        rtn=$(this.cells[iC]).attr("slv");
                        if (rtn == undefined) {
                            rtn="";
                            if(tmp!="select" && tmp!="checkbox") {
                                rtn = $(this.cells[iC]).html();
                                if (rtn.indexOf("<")>-1) rtn = $(this.cells[iC]).text();
                                else rtn = rtn.Replace("&nbsp;","");
                            }else {
                                if(tmp=="checkbox") rtn=$(this.cells[iC]).children().get(0).checked?"1":"0";
                            }
                            if(rtn=="") rtn=$(this.cells[iC]).children().eq(0).val();
                        }
                        if (rtn == "_nill") rtn = "";
                        return false;
                    }
                 });return rtn.trim();
             }else {
                 if (iR>0) iR--;
                 rtn = this.data.rows[iR].cell[iC];
                 return rtn.trim();
             }
         }catch(e) {alert(e.message);return "";}
     },
     SetValue : function(iR,fldNameOrColIndex,Val) {
         var fldName;
         try {
             if (typeof(iR) != "number") return "";
             if (arguments.length != 3) return;
             Val += "";
             if (typeof(fldNameOrColIndex) == "string") {
                 fldName = fldNameOrColIndex.toLowerCase();
                 var iC = this._GetColIndexByFldName(fldName);
                 if (this.ctype != "grid") {
                     if (iC > -1) {
                         if (iR > 0) iR--;
                         this.data.rows[iR].cell[iC] = Val;
                         iR++;this.Bind2Ctrl(iR);return;
                     }
                 } else {
                     iR--;
                     $("#"+this.csid+"_viewport").find("tr").each(function(i){
                         if (i==iR) {$(this.cells[iC]).html(Val);return;}
                     });return;
                 }
             } else {
                 if (this.ctype == "grid") {
                     if (this.rownumbers) fldNameOrColIndex++;
                     if (this.multiselect) fldNameOrColIndex++;
                     iR--;fldNameOrColIndex=this._OffsetColIndex(fldNameOrColIndex);
                     $("#"+this.csid+"_viewport").find("tr").each(function(i){
                         if (i==iR) {if (fldNameOrColIndex>this.cells.length-1) {alert("赋值失败, 原因: 列序号溢出");return;}$(this.cells[fldNameOrColIndex]).html(Val);return;}
                     });return;
                 }else {
                     if (fldNameOrColIndex > 0) fldNameOrColIndex--;
                     if (iR > 0) iR--;
                     this.data.rows[iR].cell[fldNameOrColIndex] = Val;
                     iR++;this.Bind2Ctrl(iR);
                     return;
                 }
             }
         }catch(e) {alert("赋值失败, 原因:\n" + e.message);}
     },
     SelectRow : function(iR) {
         try {
             if (this.multiselect) {
                 var offsetCol = 0;
                 if (this.rownumbers) offsetCol++;
                 var oChk = document.getElementById(this.csid+"_viewport").rows[iR-1].cells[offsetCol].childNodes[0];
                 oChk.click(); //if (oChk.checked = !oChk.checked;this.setSelection(iR);
             }else {
                 this.setSelection(iR);
             }
         }catch(e) {}
     },
     ClearSel : function() {
         try {
             this.resetSelection();
         }catch(e) {}
     },
     SelectAll : function() {
         try {
             if (this.multiselect) {
                 var offsetCol = 0;
                 var oRows = document.getElementById(this.csid+"_viewport").rows;
                 var oChk;
                 if (this.rownumbers) offsetCol++;
                 for (var i=0; i<oRows.length; i++) {
                     oChk = oRows[i].cells[offsetCol].childNodes[0];
                     oChk.checked = !oChk.checked;
                 }
             }
         }catch(e) {}
     },
     RowChecked : function(iR) {
         try {
             iR = iR || 0;
             if (iR == 0 || typeof(iR) != "number") return false;
             var offsetCol = 0;
             if (this.rownumbers) offsetCol++;
             if (this.multiselect) {
                 return document.getElementById(this.csid+"_viewport").rows[iR-1].cells[offsetCol].childNodes[0].checked;
             }
         }catch(e) {
             return false;
         }
     },
     RowSel : function() {
         try {
             var id = this.getGridParam('selrow');
             if (id) return true;
             else return false;
         }catch(e) {
             return false;
         }
     },
     AddRow : function(RowData) {
         try {
             RowData = RowData || {};
             var nid = document.getElementById(this.csid+"_viewport").rows.length+1;
             nid +="";
             this.addRowData(nid,RowData);
         }catch(e) {}
     },
     DelRow : function(irow) {
         try {
             //var edom = $(event.srcElement).parent();
             //if (edom.attr("tagName").toLowerCase() == "td") edom.trigger("click");
             irow = irow || this.getGridParam("selrow");
             if (isNaN(irow)) {
                 alert("请选择要删除的行");
                 return;
             }
             this.delRowData(irow);
             this.RowIndex = 0;
         }catch(e) {
             alert("移除行出错, 原因:\n\n" + e.message);
         }
     },
     _OffsetColIndex : function(iC) {
         try {
             var j = 0, k = 0;
             var cModel = this.getGridParam("colModel");
             for (var i=0; i<cModel.length; i++) {
                 if (cModel[i].hidden) j++;
                 else k++;
                 if (k==iC) {iC+=j-1;break;}
             }
             return iC;
         }catch(e) {
             return iC;
         }
     },
     _GetFldNameByColIndex : function(iC) {
         try {
             var j = 0;
             var fldName = "";
             var cModel = this.getGridParam("colModel");
             for (var i=0; i<cModel.length; i++) {
                 if (!cModel[i].hidden) j++
                 if (j == iC) {fldName=cModel[i].name;break;}
             }
             return fldName;
         }catch(e) {
             return ""
         }
     },
     _GetColIndexByFldName : function(fldName) {
         try {
             var cModel = null;
             if (this.GetCType() === "grid") cModel = this.getGridParam("colModel");
             else cModel = this.colModel;
             for (var i=0; i<cModel.length; i++) {
                 if (cModel[i].name == fldName) return i
             }
             return -1;
         }catch(e) {
             return -1;
         }
     },
     onclick : function() {
         var oGrid = this;
         EventType = event.type;
         oEventObj = event.srcElement;
         window.setTimeout(function(){oGrid._ExecClickFun()},250);
     },
     ondblclick : function() {
         EventType = event.type;
         var oClkObj = event.srcElement;
         try{
             var colIndex, oEditObj = null;
             if (oClkObj.tagName != "TD") {
                 oEditObj = $(oClkObj);
                 oClkObj = $(oClkObj).parent();
                 colIndex = oClkObj.attr("cellindex");
             }else {
                 colIndex = oClkObj.cellIndex;
                 oEditObj = $(oClkObj).find("textarea,select,input");
             }
             this.RowIndex = $(oEventObj).parent().attr("rowindex") + 1;
             if (oEditObj.attr("class")!="hasDatepicker") this._ExecColumnClickFun("dbclick",colIndex);
         }catch(e){alert("鼠标双击执行失败, 原因:　\n" + e.message);}
     },
     oncelledit : function(name,irow,icol) {
         this.RowIndex = irow + 1;
         if(this.colModel[icol].click.indexOf("$DT()")>-1) $("#"+irow+"_"+name).datepicker();
         if(this.colModel[icol].edittype == "select") {
             var cModel = this.getGridParam("colModel");
             var jsCode = cModel[icol].onchange;
             if (jsCode == undefined) jsCode="";
             else jsCode = jsCode.Trim();
             $("#"+irow+"_"+name).bind("change",function() {try{$(this).parent().attr("slv",this.value);if(jsCode!="")eval(jsCode)}catch(e){}});
         }
     },
     _ExecClickFun : function() {
         try{
             var colIndex, oEditObj = null;
             if (EventType=="click") {
                 if (oEventObj.tagName != "TD") {
                     oEditObj = $(oEventObj);
                     oEventObj = $(oEventObj).parent();
                     colIndex = oEventObj.attr("cellindex");
                 }else {
                     colIndex = oEventObj.cellIndex;
                     oEditObj = $(oEventObj).find("textarea,select,input");
                 }
                 this.RowIndex = $(oEventObj).parent().attr("rowindex") + 1;
                 if (oEditObj.attr("class")!="hasDatepicker") this._ExecColumnClickFun("click",colIndex);
             }
         }catch(e){alert("鼠标单击执行失败, 原因:　\n" + e.message);}
     },
     _ExecColumnClickFun : function(eventType,colIndex) {
         var errmsg = "";
         try{
             errmsg = eventType=="click"?"单击":"双击";
             var columnCount = this.getGridParam("colNames").length;
             var cModel = this.getGridParam("colModel");
             var i, j=0;
             var jsCode = "";
             for (i=0;i<columnCount;i++) {
                 if (!cModel[i].hidden) {
                     if (colIndex == i-j) {
                         if (eventType == "click") jsCode = cModel[i].click;
                         else jsCode = cModel[i].dbclick;
                         if (jsCode == undefined) return;
                         jsCode = jsCode.Trim();
                         if (jsCode != "") eval(jsCode);
                     }
                 }else {
                     j++;
                 }
             }
         }catch(e) {alert("鼠标"+errmsg+"事件执行失败, 原因:　\n" + e.message);}
     },
     Insert : function() {
         //此版本只考虑一个数据集只对应一个数据库表的情况，并且数据集中定义的字段名与数据库表中的字段名相同
         //不做从数据库中获取表的字段与数据集中的字段进行比对的操作
         try {
             var fldCfg = eval("GridHeader." + this.csid + ".ColumnConfig");
             var sqlCmd = "insert into " + this.tables + "({FieldList}) values({ValueList})";
             var fldList = "";
             var valList = "";
             if (this.ctype == 'dataset') {
                 $("*[dataset='"+this.csid+"']").each(function(){
                      fldList += "," + $(this).attr("field");
                      valList += ",'" + $(this).val() + "'";
                      if (this.tagName == "DIV") {  //复选框

                      } else if (this.tagName == "FIELDSET") {  //单选按钮

                      }else {   //(多行)文本框, (下拉)列表框

                      }
                 });
             } else {
                 alert("暂时不支持表格数据的更新");
                 return false;
             }
             fldList = fldList.substring(1);
             valList = valList.substring(1);
             sqlCmd = sqlCmd.replace("{FieldList}",fldList).replace("{ValueList}",valList);
             var rtn = ExecSql(sqlCmd);
             if (rtn != "") {
                 alert(rtn);
                 return false;
             } else {
                 return true;
             }
         } catch(e) {
             alert("新增数据异常, 原因: \n" + e.message);
             return false;
         }
     },
     Delete : function(irow) {
         if (this.RowCount()==0) {
             alert("数据集中没有数据, 无需删除!　");
             return false;
         }
         if (this.tables == "") {
             alert("数据集设计中没有指定包含的表名, 无法删除!　");
             return false;
         }
         try {
             if (!confirm("确认要删除当前信息吗?")) {
                 return false;
             }
             var rtn = "";
             var fldCfg = eval("GridHeader." + this.csid + ".ColumnConfig");
             var sqlCmd = "delete from " + this.tables + " where {MatchValue}";
             var sqlWhere = "1=1";

             if (this.ctype == 'dataset') {
                 for (var i=0; i<fldCfg.length; i++) {
                     if (fldCfg[i].pkey)  sqlWhere += " and " + fldCfg[i].name + "='" + this.data.rows[0].cell[i] + "'"
                 }
                 if (sqlWhere == "1=1") {
                     alert("数据集中没有设置主键, 无法执行删除操作!　");
                     return false;
                 }
                 sqlCmd = sqlCmd.replace("{MatchValue}",sqlWhere);
                 rtn = ExecSql(sqlCmd);
                 if (rtn == "") {
                     $(document.body).html("<div style='color:red; font-size:12pt;text-align:center;padding-top:60px;'>当前信息已成功删除!</div>");
                     return true;
                 } else {
                     alert(rtn);
                     return false;
                 }
             } else {
                 var strTemp = "";
                 irow = irow || this.RowIndex;
                 irow = irow / 1;
                 if (isNaN(irow)) {
                     alert("指定的行号无效, 无法执行删除操作");
                     return false;
                 } else {
                     if (irow < 1) {
                         alert("指定的行号无效, 无法执行删除操作");
                         return false;
                     } else {
                         var tmp = irow + " ";
                         if (tmp.indexOf(".")>-1) {
                             alert("指定的行号无效, 无法执行删除操作");
                             return false;
                         }
                     }
                 }
                 for (var i=0; i<fldCfg.length; i++) {
                     if (fldCfg[i].pkey)  {
                         strTemp = this.Item(fldCfg[i].name,irow);
                         if (strTemp != "") sqlWhere += " and " + fldCfg[i].name + "='" + strTemp + "'";
                     }
                 }
                 if (sqlWhere == "1=1") {
                     alert("数据集中没有设置主键, 无法执行删除操作!　");
                     return false;
                 }
                 sqlCmd = sqlCmd.replace("{MatchValue}",sqlWhere);
                 rtn = ExecSql(sqlCmd);
                 if (rtn == "") {
                     this.Refresh();
                     return true;
                 } else {
                     alert(rtn);
                     return false;
                 }
             }
         } catch(e) {
             alert("删除数据异常, 原因: \n" + e.message);
             return false;
         }
     },
     Update : function() {
         try {
             var fldCfg = eval("GridHeader." + this.csid + ".ColumnConfig");
             var sqlCmd = "update " + this.tables + " set {FldValList} where {MatchValue}";
             var fvList = "";
             var sqlWhere = "1=1";
             if (this.ctype == 'dataset') {
                 for (var i=0; i<fldCfg.length; i++) {
                     if (fldCfg[i].pkey)  sqlWhere += " and " + fldCfg[i].name + "='" + this.data.rows[0].cell[i] + "'"
                 }
                 if (sqlWhere == "1=1") {
                     alert("数据集中没有设置主键, 无法执行更新操作!　");
                     return false;
                 }
                 $("*[dataset='"+this.csid+"']").each(function(){
                      fvList += "," + $(this).attr("field") + "='" + encodeURIComponent($(this).val()) + "'";
                      if (this.tagName == "DIV") {  //复选框

                      } else if (this.tagName == "FIELDSET") {  //单选按钮

                      }else {   //(多行)文本框, (下拉)列表框

                      }
                 });
                 fvList = fvList.substring(1);
                 sqlCmd = sqlCmd.replace("{FldValList}",fvList);
                 sqlCmd = sqlCmd.replace("{MatchValue}",sqlWhere);
             } else {
                 alert("暂时不支持表格数据的更新");
                 return false;
             }
             var rtn = ExecSql(sqlCmd);
             if (rtn != "") {
                 alert(rtn);
                 return false;
             } else {
                 return true;
             }
         } catch(e) {
             alert("更新数据异常, 原因: \n" + e.message);
             return false;
         }
     },
     MoveFirst:function() {},MoveLast:function() {},MoveNext:function() {},MovePrev:function() {},MoveTo:function() {}
}

//************************>>>>>>  旧版兼容接口代码结束  <<<<<<****************************************


//////Combox，Listbox 批量添加选项
function AddItems(o,SqlCmd,CallBack) {
    CallBack = CallBack || null;
    if (CallBack !== null) {
        if (typeof(CallBack) !== "function") CallBack = null;
    }
    ajax.run(ajaxhandle,{cmd:"getcomboxopt",sql:SqlCmd},function(rspdata) {AddItems_CallBack(o,rspdata,CallBack)});
}
function AddItems_CallBack(o,items,CallBack) {
    if (items.substring(0,1) !== "[") return;
    items = $.evalJSON(items);
    for (var i=0; i<items.length; i++) {
       o.AddItem(items[i].t,items[i].v);
    }
    if (items.length > 0) o.SetSelectedIndex(0);
    if (CallBack !== null) CallBack();
    items = null;
}

//////扩展Jquery函数
jQuery.extend({
    rnd : function() {
        return (new Date()).getTime();
    },
    evalJSON: function(strJson) {
        try {
            return eval("(" + strJson + ")");
        } catch(e) {
            return null;
        }
    },
    toJSON: function(object) {
        var type = typeof object;
        if ('object' == type) {
            if (Array == object.constructor) type = 'array';
            else if (RegExp == object.constructor) type = 'regexp';
            else type = 'object';
        }
        switch (type) {
            case 'undefined':
            case 'unknown':
              return;
              break;
            case 'function':
            case 'boolean':
            case 'regexp':
              return object.toString();
              break;
            case 'number':
              return isFinite(object) ? object.toString() : 'null';
              break;
            case 'string':
              return '"' + object.replace(/(\\|\")/g, "\\$1").replace(/\n|\r|\t/g, function() {
                var a = arguments[0];
                return (a == '\n') ? '\\n': (a == '\r') ? '\\r': (a == '\t') ? '\\t': ""
              }) + '"';
              break;
            case 'object':
              if (object === null) return 'null';
              var results = [];
              for (var property in object) {
                var value = jQuery.toJSON(object[property]);
                if (value !== undefined) results.push(jQuery.toJSON(property) + ':' + value);
              }
              return '{' + results.join(',') + '}';
              break;
            case 'array':
              var results = [];
              for (var i = 0; i < object.length; i++) {
                var value = jQuery.toJSON(object[i]);
                if (value !== undefined) results.push(value);
              }
              return '[' + results.join(',') + ']';
              break;
        }
    }
});

//浏览器模态窗口
//dlgPos:1左上, 2左中, 3左下, 4中上, 5中下, 6右上, 7右中, 8右下，不传值就居中
function Show(url,width,height,arguData,dlgPos) {
    if (arguments.length < 1) {
        alert("参数不足，无法打开窗口");
        return "_NILL";
    }
    var left = 3;
    var top = 3;
    var screenWidth = window.screen.availWidth;
    var screenHeight = window.screen.availHeight;

    width = width || 400;
    height = height || 300;
    arguData = arguData || "";
    dlgPos = dlgPos || 0;
    if (width > screenWidth) {width = screenWidth;dlgPos=0;}
    if (height > screenHeight) {height = screenHeight;dlgPos=0;}
    switch(dlgPos) {
        case 2:
           top = parseInt((screenHeight-height)/2);break;
        case 3:
           top = screenHeight-height;break;
        case 4:
           left = parseInt((screenWidth-width)/2);break;
        case 5:
           left = parseInt((screenWidth-width)/2);
           top = screenHeight-height-3;break;
        case 6:
           left = screenWidth-width;break;
        case 7:
           left = screenWidth-width;
           top = parseInt((screenHeight-height)/2);break;
        case 8:
           left = screenWidth-width;
           top = screenHeight-height;break;
    }

    left = left || -10000;top = top || -10000;
    if (isNaN(left)) left = -10000;if (isNaN(top)) top = -10000;
    left = left - 0;top = top - 0;
    var rtn = "";
    var rnd = (new Date()).getTime();
    if (url.indexOf("?")>0) url += "&rnd=" + rnd;
    else url += "?rnd=" + rnd;
    if (dlgPos==0) rtn = window.showModalDialog(url,arguData,"dialogHeight:" + height + "px;dialogWidth:" + width + "px;center:1;help:0;status:0");
    else rtn = window.showModalDialog(url,arguData,"dialogLeft:" + left + "px;dialogTop:" + top + "px;dialogHeight:" + height + "px;dialogWidth:" + width + "px;center:0;help:0;status:0");
    if (rtn == undefined) rtn = "";
    return rtn;
}

/************************************************************
 *                                                          *
 *                       JqGrid扩展                         *
 *                                                          *
 ************************************************************/
JqGridFixOptions = {
    url:null,
    ctype:"grid",
    //mtype:"POST",
    async:true,
    datatype:"json",
    gridview:true,
    forceFit:false,
    altRows:true,
    cellEdit:true,
    cellsubmit:'clientArray',
    viewrecords:true
}
var EventType = "";
var __gd = null;
try {
    $.jgrid.extend({
        _BindDataSet : null, _sfld : "", _sord : "", //_sfld排序字段，_sord排序方式  （点击列头排序回调时用）
        RowIndex : 0,
        ColIndex : 0,
        IsQueryData : false,
        InitData : function() {
            this.RowIndex = 0;
            if (this._BindDataSet === null) this._BindDataSet = this.getGridParam("dataset");
            if (this._BindDataSet === "") {
                this._BindDataSet = null;
                __gd = this[0];
                ajax.run(rup + "/app/handle.aspx?cmd=getjqgriddata&"+location.search.substring(1),{formid:pageid},function(s) {
                    if (s.substring(0,1) === "{") {
                        __gd.addJSONData($.evalJSON(s));
                    } else {
                        if (s !== "") alert("加载列表数据失败, 原因:\n\n" + s);
                    }
                    __gd = null;
                });
            } else {
                this[0].addJSONData(this._BindDataSet.data);
            }
        },
        open : function(SqlCmd) {
            this.Open(SqlCmd);
        },
        Open : function(SqlCmd) {
            this.RowIndex = 0;
            SqlCmd = SqlCmd || "";
            var pd = this.getPostData();
            if (pd.sql) {
                this.setPostDataItem("sql",SqlCmd);
            } else {
                this.appendPostData({sql : SqlCmd});
            }
            this._sfld = ""; this._sord = "";
            this._LoadJsonDataFromDataSet(this.getPostData());
        },
        OpenAsyn : function(SqlCmd,CallBack) {
            if (arguments.length === 0) {
                alert("缺少回调函数, 无法执行");
                return;
            } else if (arguments.length ===1 ) {
                if (typeof(arguments[0]) === "function") {
                    SqlCmd = "";
                    CallBack = arguments[0];
                } else {
                    alert("缺少回调函数, 无法执行");
                    return;
                }
            } else {
                if (typeof(CallBack) !== "function") {
                    alert("缺少回调函数, 无法执行");
                    return;
                }
                SqlCmd = SqlCmd || "";
            }
            this.RowIndex = 0;
            var pd = this.getPostData();
            if (pd.sql) {
                this.setPostDataItem("sql",SqlCmd);
            } else {
                this.appendPostData({sql : SqlCmd});
            }
            this._sfld = ""; this._sord = "";
            pd = this.getPostData();
            pd.page = 1;
            this._LoadJsonDataFromDataSet(pd,CallBack);
        },
        Reload : function() {
            this.RowIndex = 0;
        },
        Refresh : function(CallBack) {
            this.RowIndex = 0;
            if (location.pathname.toLowerCase().indexOf("gridengine.aspx") > 0) {
                var _whval = "";
                if (__ResetFilter) {
                    _whval = __QryWhval;
                } else {
                    if (__InitFilter !== "" && __QryWhval !== "") {
                        if (__InitFilter.indexOf(" and ")>0 || __InitFilter.indexOf(" or ")>0) {
                            _whval = "(" + __InitFilter + ") and ";
                        } else {
                            _whval = __InitFilter + " and ";
                        }
                        _whval += __QryWhval;
                    } else {
                        if (__InitFilter !== "") {
                            _whval = __InitFilter;
                        } else {
                            _whval = __QryWhval;
                        }
                    }
                }
                var pd = this.getPostData();
                if (pd._tbl === undefined) this.appendPostData({_tbl : __TableName});
                if (pd._fld === undefined) this.appendPostData({_fld : __OutputFields});
                if (pd._cvdf === undefined) this.appendPostData({_cvdf : __ConvertDictFields});
                if (pd._wh) {
                    this.setPostDataItem("_wh",_whval);
                } else {
                    this.appendPostData({_wh : _whval});
                }//alert(this.getPostDataItem("_wh"));
                pd = this.getPostData();
                if (__blnReloadData) pd.page = 1;
                var _$gd = this;
                ajax.run("gehandle.aspx",pd,function(s) {
                    if (s.substring(0,1) === "{") {
                        s = $.parseJSON(s);
                        _$gd[0].addJSONData(s);
                        $("div[f='c']").append(__ColumnCmdHTML);
                    } else {
                        _$gd.clearGridData();
                        if(s === "") return;
                        alert("加载数据异常，原因：\n\n" + s);
                    }
                });
                return;
            }
            this.IsQueryData = false;
            if (this._BindDataSet === null) {
                __gd = this;
                ajax.run(rup + "/app/handle.aspx?cmd=getjqgriddata&"+location.search.substring(1),{formid:pageid},function(s) {
                    if (s.substring(0,1) === "{") {
                        __gd.clearGridData();
                        __gd[0].addJSONData($.evalJSON(s));
                    } else {
                        if (s !== "") alert("加载列表数据异常, 原因:\n\n" + s);
                    }
                    __gd = null;
                });
            } else {
                this._LoadJsonDataFromDataSet(this.getPostData(),CallBack);
            }
        },
        Clear : function() {
            this.RowIndex = 0;
            this.clearGridData();
        },
        Search : function(whereVal) {

        },
        PageIndex : function() {
            return this.getGridParam("page");
        },
        PageNav : function(pgBtn,CallBack) {
            this.RowIndex = 0;
            this.setPostDataItem("page",this.getGridParam("page"));
            this._sfld = ""; this._sord = "";
            if (location.pathname.toLowerCase().indexOf("gridengine.aspx") > 0) {
                __blnReloadData = false;
				var pd = this.getPostData();
				if (pd.sidx == "" && __SortOrd !== "") {
				    var arrOrdCol = __SortOrd.split(",");
					arrOrdCol[0] = arrOrdCol[0].trim();
					var _iloc = arrOrdCol[0].indexOf(" ");
					if (_iloc === -1) {
                        this.setPostDataItem("sidx",arrOrdCol[0]);
					    this.setPostDataItem("sord","asc");
					} else {
                        this.setPostDataItem("sidx",arrOrdCol[0].substring(0,_iloc));
					    this.setPostDataItem("sord",arrOrdCol[0].substring(_iloc + 1));
					}
					arrOrdCol = null;
				}
				pd = null;
                this.Refresh();
                return;
            }
            if (this._BindDataSet === null) {
                var postdata = this.getPostData();
                __gd = this;
                if (this.IsQueryData === false) {
                    postdata = $.extend(postdata,{formid:pageid});
                    ajax.run(rup + "/app/handle.aspx?cmd=getjqgriddata&"+location.search.substring(1),postdata,function(s) {
                        if (s.substring(0,1) === "{") {
                            __gd.clearGridData();
                            __gd[0].addJSONData($.evalJSON(s));
                        } else {
                            if (s !== "") alert("加载列表数据失败, 原因:\n\n" + s);
                        }
                        __gd = null;
                    });
                } else {
                    postdata = $.extend(postdata,{formid:pageid,pagenav:1});
                    ajax.run(rup + "/app/handle.aspx?cmd=qryjqgriddata&"+location.search.substring(1),postdata,function(s) {
                        if (s === "") return;
                        if (s.substring(0,1) === "{") {
                            __gd.clearGridData();
                            __gd[0].addJSONData($.evalJSON(s));
                        } else {
                            if (s !== "") alert("加载列表数据失败, 原因:\n\n" + s);
                        }
                        __gd = null;
                    });
                }
            } else {
                this._LoadJsonDataFromDataSet(this.getPostData(),CallBack);
            }
        },
        OrderByCol : function(fd,ic,ord,CallBack) {
            this.RowIndex = 0;
            this.setPostDataItem("sidx",fd);
            this.setPostDataItem("sord",ord);
            //this._sfld = fd; this._sord = ord;  这两个变量好像没什么作用，暂时注释
            //引擎表单没有绑定Dataset，需要单独处理
            if (location.pathname.indexOf("GridEngine.aspx") > 0) {
                var _whval = "";
                if (__ResetFilter) {
                    _whval = __QryWhval;
                } else {
                    if (__InitFilter !== "" && __QryWhval !== "") {
                        if (__InitFilter.indexOf(" and ")>0 || __InitFilter.indexOf(" or ")>0) {
                            _whval = "(" + __InitFilter + ") and ";
                        } else {
                            _whval = __InitFilter + " and ";
                        }
                        _whval += __QryWhval;
                    } else {
                        if (__InitFilter !== "") {
                            _whval = __InitFilter;
                        } else {
                            _whval = __QryWhval;
                        }
                    }
                }//alert(_whval);
                var pd = this.getPostData();
                if (pd._tbl === undefined) this.appendPostData({_tbl : __TableName});
                if (pd._fld === undefined) this.appendPostData({_fld : __OutputFields});
                if (pd._cvdf === undefined) this.appendPostData({_cvdf : __ConvertDictFields});
                if (pd._wh) {
                    this.setPostDataItem("_wh",_whval);
                } else {
                    this.appendPostData({_wh : _whval});
                }//alert(this.getPostDataItem("_wh"));
                pd = this.getPostData();
                var _$gd = this;
                ajax.run("gehandle.aspx",pd,function(s) {
                    if (s.substring(0,1) === "{") {
                        s = $.parseJSON(s);
                        _$gd[0].addJSONData(s);
                        $("div[f='c']").append(__ColumnCmdHTML);
                    } else {
                        _$gd.clearGridData();
                        if(s === "") return;
                        alert("加载数据异常，原因：\n\n" + s);
                    }
                });
                return;
            }
            this._LoadJsonDataFromDataSet(this.getPostData(),CallBack);
        },
        _LoadJsonDataFromDataSet : function(postdata,CallBack) {
            CallBack = CallBack || "";
            this._BindDataSet.LoadJqGridData(postdata,CallBack);
        },

        GetRowIndex : function() {
            var ir = this.getInd(this.getGridParam("selrow"));
            if (ir === false) ir = -1;
            return ir;
        },
        getRowid : function() {return this.getGridParam("selrow")},
        GetRowid : function() {return this.getGridParam("selrow")},
        rowCount : function() {return this[0].rows.length-1},
        RowCount : function() {return this[0].rows.length-1},
        MoveRow : function(upordown) {this.moveRow(upordown);},
        moveRow  : function(upordown) {
            upordown = upordown || "up";
            var curRowIndex = this.GetRowIndex();
            if (curRowIndex < 0) return {curRow:-1, goalRow:-1};
            var _icol = this.uptcell();
            //this.saveCell(curRowIndex,icol);
            //this.restoreCell(curRowIndex,icol);
            var goalRowIndex = 0;
            var arrRowID = this.getDataIDs();
            if (_icol < 0) _icol = this[0].rows[0].cells.length - 1;
            if (upordown === "up") {
                if (curRowIndex === 1) goalRowIndex = arrRowID.length;
                else goalRowIndex = curRowIndex - 1;
            } else {
                if (curRowIndex === arrRowID.length) goalRowIndex = 1;
                else goalRowIndex = curRowIndex + 1;
            }
            var curRowData = this.getRowData(arrRowID[curRowIndex-1]);
            var goalRowData = this.getRowData(arrRowID[goalRowIndex-1]);
            this.setRowData(arrRowID[curRowIndex-1],goalRowData);
            this.setRowData(arrRowID[goalRowIndex-1],curRowData);
            $(this[0].rows[goalRowIndex].cells[_icol]).trigger("click");
            curRowData = null;
            goalRowData = null;
            return {curRow:curRowIndex, goalRow:goalRowIndex};
        },
        Item : function(icol,irow) {
            if (arguments.length < 1) return null;
            else if (arguments.length === 1) return this.item(icol);
            else return this.item(icol,irow);
        },
        item : function(icol,irow) {
            var rowid = "";
            if (arguments.length < 1) return null;
            else if (arguments.length == 1) rowid = this.getGridParam("selrow");
            else {
                if (irow < 1 || irow > this.rowCount()) return null;
                rowid = this.getDataIDs()[irow-1];
            }
            var rtn = "";
            if (typeof(icol) === "number") {
                if (this.getGridParam("rownumbers")) icol++;
                if (this.getGridParam("multiselect")) icol++;
            } else {
                var _colModel = this.getGridParam("colModel");
                for (var i=0; i<_colModel.length; i++) {
                    if (icol.toLowerCase() === _colModel[i].name.toLowerCase()) {
                        icol = i;
                        break;
                    }
                }
                _colModel = null;
            }
            rtn = this.getCell(rowid,icol);
            if (rtn === false) rtn = null;
            return rtn;
        },
        Cell : function(ir,ic,val) {
            if (arguments.length === 2) return this.cell(ir,ic);
            else if (arguments.length === 3) return this.cell(ir,ic,val);
            else return "";
        },
        cell : function(ir,ic,val) {
            var blnSetVal = false;
            if (arguments.length === 3) blnSetVal = true;
            try {
                if (isNaN(ir) || isNaN(ic)) return "";
                if (ic < 1 || ir < 1 || ir > this[0].rows.length-1) return "";
                var ioffset = -1;
                if (this.getGridParam("rownumbers")) ioffset++;
                if (this.getGridParam("multiselect")) ioffset++;
                ic += ioffset;
                if (ic > this[0].rows[0].cells.length-1) return "";
                var rowid = this.getDataIDs()[ir-1];
                if (blnSetVal === false) {
                    var rtn = this.getCell(rowid,ic);
                    if (rtn === false) rtn = "";
                    return rtn;
                } else {
                    this.setCell(rowid,ic,val);
                }
            } catch(e) {
                return "";
            }
        },
        SetValue : function(ir,ic,val) {
            if (arguments.length !== 3) return;
            this.cell(ir,ic,val);
        },
        RowChecked : function(ir) {
            try {
                if (!this.getGridParam("multiselect")) return false;
                if (isNaN(ir)) return false;
                if (ir < 1) return false;
                var chkCol = 0;
                if (this.getGridParam("rownumbers")) chkCol++;
                return $(this[0].rows[ir].cells[chkCol]).children("input").eq(0).attr("checked");
            }catch(e) {
                return false;
            }
        },
		 CheckRow : function(ir) {
        try {
            if (isNaN(ir)) return false;
            if (ir < 1) return false;
            this.setSelection(this.getDataIDs()[ir-1],false);
        } catch(e) {}
       },
        AddRow : function(rowdata, idx) {
            rowdata = rowdata || {};
            idx = idx || 0;
            if (isNaN(idx)) idx = 0;
            var rowid = $.rnd();
            rowid += RandNum() + idx;
            this.addRowData(rowid,rowdata);
        },
        DelRow : function(ir) {
            ir = ir || 9999;
            if (isNaN(ir)) return;
            if (ir < 1) return;
            var rowid = "";
            var arrID = this.getDataIDs();
            if (ir === 9999) rowid = this.getGridParam("selrow");
            else rowid = arrID[ir-1];
            this.delRowData(rowid);
            arrID = null;
        },
        ResetCell : function() {return this.uptcell();},
        UptCell : function() {return this.uptcell();},
        uptcell : function() {
            try {
                var _irow = this.GetRowIndex();
                var _gd = this;
                var _colModel = this.getGridParam("colModel");
                var cellChilds = null;
                var startCellIndex = 0;
                var rtnCellIndex = -1;
                if (this.getGridParam("rownumbers")) startCellIndex++;
                if (this.getGridParam("multiselect")) startCellIndex++;
                $(this[0].rows[_irow]).children().each(function(i){
                    if (i < startCellIndex) return;
                    if (_colModel[i].editable) {
                        cellChilds = $(this).children();
                        if (cellChilds.length === 0) return;
                        //alert($(this).css("background-color"));
                        if ($(this).css("background-color") === "#ffef8f") {  //jqui1.7.1 #fbec88, jqui1.8.11 #ffef8f
                            _gd.saveCell(_irow,i);
                            rtnCellIndex = i;
                            return false;
                        }
                    }
                });
                _colModel = null;
                cellChilds = null;
                return rtnCellIndex;
            } catch(e) {
                alert(e.message);
                return -1;
            }
        },
        Resize : function(iw,ih) {
            if (iw > -1) {
                if (iw === 0) {
                    var w = $(this[0]).parent().parent().parent().parent().parent().parent().width();
                    if (w === 0) w = $(document).width();
                    if (w === 0) return;
                    iw = w - this.getGridParam("left") - 10;
                }
                $(this[0]).parent().parent().parent().parent().css("width",iw+"px");
                $(this[0]).parent().parent().parent().parent().find("div[class='ui-jqgrid-bdiv']").eq(0).css("width",iw+"px");
                $(this[0]).parent().parent().parent().parent().find("div[class='ui-jqgrid-hbox']").eq(0).css("width",iw+"px");
                $(this[0]).parent().parent().parent().parent().children().each(function(i){
                    $(this).css("width",iw+"px");
                });
                $(this[0]).parent().parent().parent().children("div").each(function(i){
                    if (i>0) $(this).css("width",iw+"px");
                });
                iw -= 18;
                $(this[0]).parent().parent().parent().find("table").each(function(){
                   $(this).css("width",iw+"px");
                });
            }
	        if (ih > -1) {
                if (ih === 0) {
                    var h = $(this[0]).parent().parent().parent().parent().parent().parent().height();
                    if (h === 0) h = $(document).height();
                    if (h === 0) return;
                    ih = h - this.getGridParam("top") - 10;
                    ih -= 25;
                    if (this.getGridParam("rowNum") !== 10000) ih -= 27;
                    try {if (__hideNavBar && location.href.indexOf("&_self=FRM")>0) ih -= 27;}catch(e){}
                }
                $(this[0]).parent().parent().parent().parent().find("div[class='ui-jqgrid-bdiv']").eq(0).css("height",ih+"px");
            }

        },
        evClick : function() {
            var o = $(event.srcElement);
            var g = this;
            EventType = event.type;
            window.setTimeout(function(){g._ExecClick_CallBack(o)},300);
        },
        evDblclick : function() {
             var o = $(event.srcElement);
             EventType = event.type;
             try {
                var funCallBack = this.getGridParam("evRowDblClick");
                if (typeof(funCallBack) !== "function") return;
                this._ExecRowClick(o,funCallBack);
            } catch(e) {
                //alert("行双击调用失败, 原因:\n\n" + e.message);
            }
        },
        _ExecClick_CallBack : function(o) {
            try {
                g = null;
                if (EventType !== "click") return;
                var funCallBack = this.getGridParam("evRowClick");
                if (typeof(funCallBack) !== "function") return;
                this._ExecRowClick(o,funCallBack);
            } catch(e) {
                //alert("行单击调用失败, 原因:\n\n" + e.message);
            }
        },
        _ExecRowClick : function(o,clkCallBack) {
            var intRowIndex = 0, intCellCount = 0;
            var intColIndex = 0, _icol = 0;
            var strColField = "";
            var oColModel = this.getGridParam("colModel");

            if (o.attr("tagName").toLowerCase() === "td") {
                intRowIndex = o.parent().attr("rowIndex");
                intCellCount = o.parent().get(0).cells.length;
                intColIndex = o.attr("cellIndex");
                o = null;
            } else {
                var oTD = o.parent();
                if (oTD.attr("tagName").toLowerCase() !== "td") oTD = o.parent().parent();
                if (oTD.attr("tagName").toLowerCase() !== "td") oTD = o.parent().parent().parent();
                if (oTD.attr("tagName").toLowerCase() !== "td") return;
                intRowIndex = oTD.parent().attr("rowIndex");
                intCellCount = oTD.parent().children().length;
                intColIndex = oTD.attr("cellIndex");
                oTD = null;
            }
            /* //有的IE版本没有统计隐藏列
            _icol = intColIndex;
            //if (intCellCount !== oColModel.length) {
                for (var i=0; i<oColModel.length; i++) {
                    if (i <= intColIndex) {
                        if (oColModel[i].hidden) intColIndex++;
                    }
                    break;
                }
            //}
            //if (this.getGridParam("rownumbers")) startCellIndex++;
            //if (this.getGridParam("multiselect")) startCellIndex++;
            */
            strColField = oColModel[intColIndex].name;
            oColModel = null;
            clkCallBack(intRowIndex,strColField,o);
        },
        _ExecColumnCommand : function(grid,btn) {
            var irow = $(btn).parent().parent().attr("rowIndex");
            var scmd = $(btn).val();
            $(btn).parent().trigger("click");
            try {
                JqGrid_CommandBtnsExec(grid, irow, scmd);
            } catch(e) {}
        },
        GetColumn : function() {
            var colModel = this.getGridParam("colModel");
            var colCaption = this.getGridParam("colNames");
            var min = 0, m = colModel.length;
            if (this.getGridParam("rownumbers")) min++;
            if (this.getGridParam("multiselect")) min++;
            var flden = "", fldcn = "";
            for (var i=min; i<m; i++) {
                if (colModel[i].hidden) continue;
                if (colModel[i].name === "__colcmd") continue;
                if (colModel[i].name === "rowid") continue;
                flden += "," + colModel[i].name;
                fldcn += "," + colCaption[i];
            }
            flden = flden.substring(1);
            fldcn = fldcn.substring(1);
            colModel = null;
            colCaption = null;
            return {fldname:flden, fldesc:fldcn};
        },
        ExportXls : function(dtSql,xlsDesc,fldCovDict) {
            if (this.RowCount() === 0) {
                alert("没有数据，无需导出！");
                return;
            }
            dtSql = dtSql || "";
            xlsDesc = xlsDesc || "导出Excel";
            fldCovDict = fldCovDict || "";
            if (dtSql === "") {
                alert("查询语句为空，无法导出");
                return;
            }//var pd = this.getPostData();
            var arrColumn = this.GetColumn();
            var _ExOption = {sql:dtSql, fldname:arrColumn.fldname, fldesc:arrColumn.fldesc, fldict:fldCovDict, xlsdesc:xlsDesc};
            arrColumn = null;
            ExportExcel(_ExOption);
        }
    });
} catch(e) {}

//自定义JqGrid单元格编辑模式：文本框，多行文本框，下拉框，日期框
var _gBlnDateJsLoaded = false;
var gdExtEditor = {
    TextBox : {
        c : function(v,opt) {
            $("body").append("<input id='__jqgd_extctrl' ctrltype='textbox' tpye=text value=\"" + v + "\" />");
            o = $("#__jqgd_extctrl");
            window.setTimeout(function() {gdExtEditor.SetCtrlHehavior(o,v)},100);
            return o.get(0);
        },
        v : function(e) {
            return $(e).val();
        }
    },
    MemoBox : {
        c : function(v,opt) {
            $("body").append("<textarea id='__jqgd_extctrl' ctrltype='memobox' rows='3' wrap='hard'>" + v + "</textarea>");
            o = $("#__jqgd_extctrl");
            window.setTimeout(function() {gdExtEditor.SetCtrlHehavior(o,v)},100);
            return o.get(0);
        },
        v : function(e) {
            return $(e).val();
        }
    },
    ComboBox : {
        c : function(v,opt) {
            var optHTML = "";
			
			//optHTML+="<option:selected value=></option>";
            for (var i=0; i<opt.list.length; i++) optHTML += "<option value=" + opt.list[i].v + ">" + opt.list[i].t + "</option>";
            $("body").append("<select id='__jqgd_extctrl' ctrltype='combox'>" + optHTML + "</select>");
            o = $("#__jqgd_extctrl");
            window.setTimeout(function() {gdExtEditor.SetCtrlHehavior(o,v)},100);
            return o.get(0);
        },
        v : function(e) {
            $(e).parent().parent().attr("__sel_val",$(e).val());
            return $(e).find("option:selected").text();
        }
    },
    DateBox : {
        c : function(v,opt) {
            if (_gBlnDateJsLoaded === false) {
                $.getScript(rup + "/res/js.lib/jqui/js/jquery.ui.core.min.js");
                $.getScript(rup + "/res/js.lib/jqui/js/jquery.ui.datepicker.min.js");
                _gBlnDateJsLoaded = true;
            }
            $("body").append("<input id='__jqgd_extctrl' ctrltype='datebox' type=text value='" + v + "' readonly=1 />");
            o = $("#__jqgd_extctrl");
            window.setTimeout(function() {gdExtEditor.SetCtrlHehavior(o,v);o.datepicker();},100);
            return o.get(0);
        },
        v : function(e) {
            return $(e).val();
        }
    },
    SetCtrlHehavior : function(o,v) {
        o.css("width","100%").css("font-size","9pt").css("font-family","Tahoma,宋体");
        switch(o.attr("ctrltype")) {
            case "textbox":
            case "datebox":
                o.css("border","0px").css("height","19px").css("line-height","19px");
                break;
            case "memobox":
                o.css("border-width","1px 0px 0px 1px").css("line-height","17px");
                break;
            case "combox":
                o.css("height","21px");
                var _v = o.parent().parent().attr("__sel_val");
                if (_v) {
                    o.val(_v);
                } else {
                    o.val(v);
                }
                break;
        }
        o.focus();
    }
}


/************************************************************
 *                                                          *
 *                         数据集类                         *
 *                                                          *
 ************************************************************/
var dataset = function(opts) {
    with(opts) {
        this.id = id;
        this.grid = grid;
        //this.page = page;
        this.data = data;
        this.fields = fields;
    }
    this.SqlCmd = "";
    this._BindGrid = null;
    this.RowCount = function() {
        try {
            if (this.data === null) return 0;
            if (this.data.rows[0].id === "") return 0;
            return this.data.rows.length;
        } catch(ex) {
            return 0;
        }
    },

    this.Bind2Ctrl = function(irow) {
        if (arguments.length === 0 && this.grid !== "null") return;
        if (this.data === null) dataset._IniTempData(this);
        dataset._Bind2Ctrl(this,irow);
    },

    this.item = function(fldName,irow) {
        irow = irow || 1;
        return dataset._item(this,fldName,irow);
    },

    this.Item = function(fldName,irow) {
        irow = irow || 1;
        return dataset._item(this,fldName,irow);
    },

    this.LoadJqGridData = function(postdata,CallBack) {
        if (this.grid === "null") return;
        if (this._BindGrid === null) this._BindGrid = eval(this.grid);
        dataset._LoadJqGridData(this, postdata, CallBack);
    },

    this.Open = function(sqlcmd,callback) {this.open(sqlcmd,callback)},
    this.open = function(sqlcmd,callback) {
        sqlcmd = sqlcmd || "";
        callback = callback || "";
        if (sqlcmd === "") return;
        var rows = "";
        if (this.grid === "null") rows = 10000;
        else {
            if (this._BindGrid === null) this._BindGrid = eval(this.grid);
            rows = this._BindGrid.getGridParam("rowNum");
        }
        this.SqlCmd = sqlcmd;
        dataset._LoadJqGridData(this, {sql:sqlcmd,rows:rows,page:1,sord:"",sidx:""},callback);
    },

    this.Insert = function(callback) {
        callback = callback || "";
        var rtn = "";
        var irow = 0;
        if (this.data === null) dataset._IniTempData(this);
        if (this._BindGrid === null) {
            rtn = dataset._Add(this,callback);
            if (typeof(callback) !== "function") return rtn;
        } else {
            //绑定Grid的数据保存
        }
    },

    this.Update = function(callback) {
        callback = callback || "";
        var rtn = "";
        var irow = 0;
        //if (this._BindGrid === null) {
            rtn = dataset._Upt(this,callback);
            if (typeof(callback) !== "function" && callback !== null) return rtn;
        //} else {
        //    irow = this._BindGrid.RowIndex;
        //}
    },

    this.Delete = function(callback) {
        if (!confirm("提醒！！！\n\n确定要删除记录吗？")) return;
        callback = callback || "";
        var rtn = "";
        var irow = 0;
        if (this._BindGrid === null) {
            rtn = dataset._Del(this,callback);
            if (typeof(callback) !== "function" && callback !== null) return rtn;
        } else {
            irow = this._BindGrid.GetRowIndex();
        }
    }
}

//初始化空数据
dataset._IniTempData = function(obj) {
   var rowdata = [{id:"",cell:[]}];
   for (var i=0; i<obj.fields.length; i++) {
       rowdata[0].cell.push("");
   }
   obj.data = {page:1,total:1,records:1,rows:rowdata};
},

//数据集的（公共）静态方法
dataset._LoadJqGridData = function(obj,postdata,CallBack) {
    CallBack = CallBack || "";
    postdata = $.extend(postdata,{req:"ajax",cmd:"loadjqgddata",dsid:obj.id});
    ReqUrl = location.pathname.substring(location.pathname.lastIndexOf("/")+1) + location.search;
    ajax.run(ReqUrl,postdata,function(rpd) {dataset._AfterLoadJqGridData(obj,rpd,CallBack)});
    return;
    if (CallBack === "") {
        var RspData = ajax.run(ReqUrl,postdata);
        dataset._AfterLoadJqGridData(obj,RspData,CallBack)
    } else {
        ajax.run(ReqUrl,postdata,function(rpd) {dataset._AfterLoadJqGridData(obj,rpd,CallBack)});
    }
}
dataset._AfterLoadJqGridData = function(obj,RspData,CallBack) {
    if (RspData.substring(0,1) !== "{") {
        if (RspData === "relogin" || RspData === "err" || RspData === "null") {
            try {obj._BindGrid.clearGridData();} catch(e){}
        } else {
            alert("加载数据异常, 原因:\n\n" + RspData);
        }
        if (CallBack !== "") CallBack(null);
        return;
    }
    obj.data =  $.evalJSON(RspData);
    try {
        obj._BindGrid.clearGridData();
        obj._BindGrid[0].addJSONData(obj.data);
    } catch(ex) {}
    if (CallBack === "") return;

    try {
        if (obj._BindGrid === null) {
            CallBack();
        } else {
            if (obj._BindGrid._sfld == "") CallBack();
            else CallBack(obj._BindGrid._sfld,obj._BindGrid._sord);
        }
    } catch(e){
        //alert("执行回调函数异常, 原因:\n\n" + e.message);
    }
}

var _cbCtrl = [];
dataset._Bind2Ctrl = function(obj,irow) {
    irow = irow || 1;
    if (isNaN(irow)) return;
    //irow--;
    if (irow < 0) return;
    SetCtrlDisplayAndUserAcc();
    var FieldName = ""; val = null;
    var arrTemp = null;
    for (var i=0; i<CtrlList.length; i++) {
        if (CtrlList[i].d.substring(0,obj.id.length) === obj.id) {
            FieldName = CtrlList[i].d.substring(obj.id.length + 1);
            val = dataset._item(obj,FieldName,irow);
            switch(CtrlList[i].t) {
                case "textbox":
                case "btntxtbox":
                case "datebox":
                case "mtextbox":
                case "numspin":
                    val = UnSqlEscape(val);
                    try {CtrlList[i].c.SetText(val);} catch(e){}
                    break;
                case "checkbox":
                    if (val === "1" || val === 1) val = true;
                    else val = false;
                    CtrlList[i].c.SetValue(val);
                    break;
                case "listbox":
                    if (val !== "") {
                        if (CtrlList[i].c.selectionMode === 0) {
                            CtrlList[i].c.SetValue(val);
                        } else {
                            arrTemp = val.split(",");
                            CtrlList[i].c.SelectValues(arrTemp);
                        }
                    }
                    break;
                case "radiolist":
                    CtrlList[i].c.SetValue(val);
                    break;
                case "combox":
                    var o = CtrlList[i].c.FindItemByValue(val);
                    var iSelIndex = 0;
                    if (o !== null) {
                        iSelIndex = o.index;
                        o = null;
                        _cbCtrl.push({o:CtrlList[i].c,iv:iSelIndex});
                    } else {
                        CtrlList[i].c.SetValue(val);
                    }
                case "htmledit":
                    try {CtrlList[i].c.SetHtml(val);} catch(e){}
                    break;
            }
        }
    }
    if (_cbCtrl.length > 0) window.setTimeout(function(){
        for (var i=0; i<_cbCtrl.length; i++) _cbCtrl[i].o.SetSelectedIndex(_cbCtrl[i].iv);
        _cbCtrl = [];
    },0);
    arrTemp = null;
}
function SelectItemByVal(oCombox,val,Callback) {
    if (typeof(val) === "number") {oCombox.SetSelectedIndex(val);return;}
    Callback = Callback || "";
    window.setTimeout(function() {FocusComboxItemByValue(oCombox,val,Callback);},6);
}

function FocusComboxItemByValue(o,val,Callback) {
    var objItem = o.FindItemByValue(val);
    var iSelIndex = -1;
    if (objItem !== null) iSelIndex = objItem.index;
    objItem = null;
    o.SetSelectedIndex(iSelIndex);
    if (typeof(Callback) === "function") Callback(val);
}
function TreeSearch(oTree, whval) {
    if (whval.trim() === "") {
        alert("请输入查询条件");
        return;
    }
    oTree.PerformCustomCallback(whval);
}

dataset._item = function(obj,fldName,irow) {
    irow = irow || 1;
    try {
        if (obj._BindGrid !== null) irow = obj._BindGrid.RowIndex;
    } catch(e){}
    if (isNaN(irow)) return "";
    irow--;
    if (irow < 0) return "";
    for (var i=0; i<obj.fields.length; i++) {
        if (fldName === obj.fields[i]) {
            return obj.data.rows[irow].cell[i];
        }
    }
}

dataset._SetField = function(obj,fldName,val,irow) {
    if (arguments.length < 3) return;
    irow = irow || 1;
    if (isNaN(irow)) return "";
    irow--;
    if (irow < 0) return "";
    for (var i=0; i<obj.fields.length; i++) {
        if (fldName === obj.fields[i]) {
            obj.data.rows[irow].cell[i] = val;
            return;
        }
    }
}

dataset._Add = function(obj,callback) {
    callback = callback || "";
    return dataset._SaveData("ds.insert",obj,callback);
}

dataset._Del = function(obj,callback) {
    callback = callback || "";
    return dataset._SaveData("ds.delete",obj,callback);
}

dataset._Upt = function(obj,callback) {
    callback = callback || "";
    return dataset._SaveData("ds.update",obj,callback);
}

dataset._SaveData = function(cmd,obj,callback) {
    var blnIsChange = false;
    var FieldName = "", val = null, submitdata = "req:'ajax',cmd:'" + cmd + "',dsid:'" + obj.id + "'";
    var validResult = "", errValidMsg = "";
    var KeyFields = "";
    for (var i=0; i<CtrlList.length; i++) {
        if (CtrlList[i].d.substring(0,obj.id.length) === obj.id) {
            FieldName = CtrlList[i].d.substring(obj.id.length + 1);
            switch(CtrlList[i].t) {
                case "textbox":
                case "btntxtbox":
                case "datebox":
                case "mtextbox":
                case "numspin":
                    val = CtrlList[i].c.GetText();
                    val = SqlEscape(val);
                    break;
                case "checkbox":
                    val = CtrlList[i].c.GetValue();
                    if (val === null) val = false;
                    if (val === true) val = "1";
                    else val = "0";
                    break;
                case "listbox":
                    val = CtrlList[i].c.GetSelectedValues();
                    break;
                case "radiolist":
                case "combox":
                    val = CtrlList[i].c.GetValue();
                    break;
                case "htmledit":
                    val = CtrlList[i].c.GetHtml();
                    break;
            }

            if (val !== null) {
                if ((!CtrlList[i].n || CtrlList[i].k) && val === "") {
                    if (CtrlList[i].k && CtrlList[i].c.GetClientVisible() === false) validResult = "";
                    else validResult = "为主键或必填项，需输入有效的数据";
                } else {
                    validResult = Validate(val + "",CtrlList[i].f);
                }
                if (validResult !== "") {
                    errValidMsg += "\n    " + CtrlList[i].v + "：" + validResult;
                } else {
                    if (CtrlList[i].k) {
                         KeyFields += ",old_" + FieldName + ":\"" + dataset._item(obj,FieldName) + "\"";
                    }
                    try {dataset._SetField(obj,FieldName,val);} catch(ex) {}
                    blnIsChange = true;
                }
            } else {
                if ((!CtrlList[i].n || CtrlList[i].k) && val === "") {
                    validResult = "为主键或必填项， 不能为空";
                    errValidMsg += "\n    " + CtrlList[i].v + "：" + validResult;
                } else {
                    dataset._SetField(obj,FieldName,"");
                    blnIsChange = true;
                }
            }
        }
    }
    callback = callback || "";
    var asyn = false;
    var rsptxt = "";
    if (typeof(callback) === "function") asyn = true;
    if (errValidMsg !== "") {
        rsptxt = "数据验证失败：\n" + errValidMsg;
        if (asyn) alert(rsptxt);
    } else {
        if (blnIsChange === false) {
            rsptxt = "数据没有发生改变, 无需保存";
        } else {
            for (var i=0; i<obj.fields.length; i++) {
                submitdata += "," + obj.fields[i] + ":'" + obj.data.rows[0].cell[i] + "'";  //字段名:值（注意特殊字符的处理）
            }
            //alert(KeyFields);
            //alert(submitdata);
            submitdata = $.evalJSON("{" + submitdata + "}");
            if (KeyFields !== "") submitdata = $.extend(submitdata,$.evalJSON("{" + KeyFields.substring(1) + "}"));
            ReqUrl = location.pathname.substring(location.pathname.lastIndexOf("/")+1) + location.search;
            if (asyn) ajax.run(ReqUrl, submitdata, callback);
            else rsptxt = ajax.run(ReqUrl, submitdata);
        }
    }
    if (!asyn) return rsptxt;
}

/*>>>********************  数据集类定义结束  *********************<<<*/



/************************************************************
 *                                                          *
 *                           AJAX类                         *
 *                                                          *
 统一调用接口：ajax.run(arguments)
 _url : 请求地址（必须）
 _data : 提交的数据（必须）
 callback : 回调函数（可选, 空则同步执行AJAX, 默认为空）
 mtype :  数据提交方式（可选, 空则POST）
 compatible : 是否兼容旧版的接口（可选, 空则不兼容）
 ************************************************************/
ajax = {
    _LoadingHTML : "",
    ProcessData : true,
    run : function(_url, _data, callback, mtype, compatible) {
        if (arguments.length < 2) {
            alert("参数不足, 无法运行!");
            return "err";
        }

        callback = callback || "";
        mtype = mtype || "POST";
        compatible = compatible || false;
        var asyn = true;
        if (typeof(callback) !== "function") asyn = false;
        var rtnMsg = "";

        $.ajax({
            async : asyn,
            type : "POST",
            url : _url,
            processData : ajax.ProcessData,
            data: _data,
            global : false,
            cache : false,
            beforeSend:function(xhr) {
                ajax.ShowLoading(xhr);
            },
            success:function(rsptxt) {
                ajax.HideLoading();
                if (rsptxt.indexOf("e>用户登录</t") > 0) {
                    window.top.location = rup + "/login.aspx";
                    rtnMsg = "relogin";
                    return;
                }
                if (asyn === true) {
                    if (rtnMsg === "relogin") return;
                    if (compatible) callback("{RespTxt:\"" + rsptxt + "\",Success:true}");
                    else callback(rsptxt);
                } else {
                    rtnMsg = rsptxt;
                }
            },
            complete:function(xhr, sta) {
                ajax.HideLoading();
            },
            error:function(xhr, sta, err) {  //xhr.responseXML, xhr.statusText, xhr.status 500
                rtnMsg = "err";
                var s = xhr.responseText.split("</title>")[0];
                s = s.substring(s.indexOf("title>")+6);
                s = "系统发生异常, 原因：\n\n" + s;
                ajax.HideLoading();
                alert(s);
            }
        });
        if (asyn === false) return rtnMsg;
    },

    ShowLoading : function(xhr) {
        if (this._LoadingHTML === "") {
            var dw = $(document).width();
            var dh = $(document).height();
            var tw = 288;
            var th = 68;
            var pt = th / 2;
            pt -= 15;
            var iLeft = (dw - tw) / 2;
            var iTop = (dh - th) / 2;
            var loadingGif = "<img src='" + rup + "/res/images/ajaxloading.gif' />";
            this._LoadingHTML = "<div id='ajaxLoading' style='position:absolute; left:" + iLeft + "px; top:" + iTop + "px;width:" + tw + "px; height:" + th + "px; padding-top:" + pt + "px;";
            this._LoadingHTML += "text-align:center; font-size:9pt; background-color:#F4F4F4; z-index:9999; border:1px solid #69A1BF; color:#EB9004; filter:alpha(opacity=88);'>" + loadingGif + "&nbsp;数据处理中，请稍候……</div>";
            $("body").append(this._LoadingHTML);
        } else {
            $("#ajaxLoading").css("display","block");
        }
    },

    HideLoading : function() {
        $("#ajaxLoading").css("display","none");
    }
}
/*>>>********************  AJAX类定义结束  *********************<<<*/

//数据格式验证
function Validate(s, f){
    var blnFlag = true;
    var strMsg = "";
	switch(f){
	    case "":
	    case "any":blnFlag = true;break;
		case "numstr":blnFlag = /^\d+$/.test(s);strMsg="必需全部为数字";break;
		case "int": blnFlag = /^-?[1-9]\d*$/.test(s);strMsg="不是一个有效的整数";break;
		case "+int":blnFlag = /^[1-9]\d*|0$/.test(s);strMsg="不是一个有效的正整数";break;
		case"cnstr":blnFlag = /^[\u4e00-\u9f5a]+$/.test(s);strMsg="必需全部为中文字符";break;
		case"enstr":blnFlag = /^[A-Za-z0-9=_+,.?:;/|!@#%)(-]+$/.test(s);strMsg="不能包含中文和以下特殊字符：~ $ ^ & * { } [ ] \ > < ' \" ";break;
		case"aBcstr":blnFlag = /^[A-Za-z]+$/.test(s);strMsg="必需全部为英文字母(大小写均可)";break;
		case"ABCstr":blnFlag = /^[A-Z]+$/.test(s);strMsg="必需全部为大写英文字母";break;
		case"abcstr":blnFlag = /^[a-z]+$/.test(s);strMsg="必需全部为小写英文字母";break;
		case"df1":blnFlag = /^(-?\d+)\.\d{1}$/.test(s);strMsg="不是有效的一位小数";break;
		case"df2":blnFlag = /^(-?\d+)\.\d{2}$/.test(s);strMsg="不是有效的两位小数";break;
		case"df3":blnFlag = /^(-?\d+)\.\d{3}$/.test(s);strMsg="不是有效的三位小数";break;
		case"mob":blnFlag = /^1[3,5,8]\d{9}$/.test(s);strMsg="不是有效的手机号码";break;
		case"tel":blnFlag = /0\d{2}-[1-9]{1}[0-9]{7}|0\d{3}-[1-9]{1}[0-9]{6,7}/.test(s);strMsg="不是有效的座机号码";break;
		case"card":
		    if(str.length==15) blnFlag = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/.test(s);
			else blnFlag = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/.test(s);
			strMsg="不是有效的身份证号码";
			break;
		case"ip":blnFlag = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/.test(s);strMsg="IP地址无效";break;
		case"mail":blnFlag = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(s);strMsg="不是有效的邮箱地址";break;
		case"date":blnFlag = /^\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2]\d|3[0-1])$/.test(s);strMsg="不是有效的日期格式(例:2005-08-25)";break;
	}
	if (blnFlag) strMsg = "";
	return strMsg;
}

//设置控件的隐藏行为和访问权限
function SetCtrlDisplayAndUserAcc(exectype) {
    try {
        if (!gBlnIsHiddenExec) {
            $("table[Display='none']").each(function(){
                //$(this).css("display","none");
                eval($(this).attr("id") + ".SetClientVisible(false)");
            });
            gBlnIsHiddenExec = true;
        }
        if (exectype === 1) return;
        if (!gBlnIsSetAccExec) {
            for (var i=0; i<CtrlList.length; i++) {
                if (CtrlList[i].r === false) {
                    CtrlList[i].c.SetVisible(false);
                } else {
                    if (CtrlList[i].w === false) CtrlList[i].c.SetEnabled(false);
                }
            }
            gBlnIsSetAccExec = true;
        }
    } catch(e) {}
}

//IFRAME初始化
function InitIframe(ifrmid) {
    try {
        var oFrame = $("#" + ifrmid);
        var url = oFrame.attr("url");
        if (url === "") return;
        if (url.indexOf("?") > -1) url += "&";
        else url += "?";
        var parms = oFrame.attr("parms");
        if (parms !== "") {
            parms = UnXmlEscape(parms);
            var oParms = $.evalJSON(parms);
            for (var i=0; i<oParms.length; i++) {
                url += oParms[i].k + "=";
                if (oParms[i].v.indexOf("Req(")>-1) url += eval(oParms[i].v) + "&";
                else url += oParms[i].v + "&";
            }
        }
        url += "__rnd=" + $RND();
        oFrame.attr("src",url);
    } catch(e) {}
}
function ResizeCtrl(ctrlid,iw,ih) {
    var obj = $("#" + ctrlid);
    iw = iw || 0;
    ih = ih || 0;
    var ioffset = 10;
    if (iw > -1) {
        if (iw === 0) {
            var w = obj.parent().width();
            var frmx = obj.css("left").toLowerCase().replace("px","");
            obj.width(w - frmx - ioffset);
            iw = w - frmx - ioffset;
        } else {
            obj.css("width",iw + "px");
        }
        if (obj.attr("ctrltype") == "tab") {
            iw = iw - 2;
            obj.find("div[id^='"+ctrlid+"_C']").each(function(){
                $(this).children("div").eq(0).css("width",iw+"px");
            });
        }
    }
    if (ih > -1) {
        if (ih === 0) {
            var h = obj.parent().height();
            if (h === 0) h = $(document).height();
            var frmy = obj.css("top").toLowerCase().replace("px","");
            if (Req("_self") !== "") ioffset += 30;
            obj.height(h - frmy - ioffset);
            ih = h - frmy - ioffset
        } else {
            obj.css("height",ih + "px");
        }
        if (obj.attr("ctrltype") == "tab") {
            ih = ih - 25;
            obj.find("div[id^='"+ctrlid+"_C']").each(function(){
                $(this).children("div").eq(0).css("height",ih+"px");
            });
        }
    }
}

/************************************************************
 *                                                          *
 *                  弹层模拟模态对话窗口                    *
 *                                                          *
 ************************************************************/
dialog = {
    _dialog : null,
    _dialogArguments : null,
    _callback : null,
    _frmCsr : "",
    _window : window.top,
    show : function(url,w,h,data,callback) {
        if (arguments.length < 3) {
            alert("参数不足无法调用");
            return;
        } else {
            if (arguments.length === 4) {
                if (typeof(data) === "function") {
                    this._dialogArguments = null;
                    this._callback = data;
                } else {
                    this._dialogArguments = data;
                    this._callback = null;
                }
            } else {
                this._dialogArguments = data;
                this._callback = null;
                if (typeof(callback) === "function") this._callback = callback;
            }
        }
        this._frmCsr = "";
        this._GetIFrameCSR();
        this._frmCsr = this._frmCsr.substring(1);
        var _urlIdx = url.indexOf("?");
        var _urlpath = url;
        var _urlsearch = "";
        if (_urlIdx > 0) {
            _urlpath = url.substring(0,_urlIdx);
            _urlsearch = url.substring(_urlIdx);
        }
        //相对URL路径解析到绝对路径
        if (_urlpath.indexOf(":/") === -1) {
            var arrTemp = location.pathname.split("/");
            var pathTotalCount = arrTemp.length - 1;   //总路径个数
            var arrTemp1 = _urlpath.split("..");
            var vpathCount = arrTemp1.length - 1       //URL中的虚拟路径(..)层数
            _urlpath = "";
            for (var i=0; i<pathTotalCount-vpathCount; i++) {
                _urlpath += arrTemp[i] + "/";
            }
            _urlpath += arrTemp1[vpathCount].replace("/","");
            arrTemp = null;
            arrTemp1 = null;
        }
        url = _urlpath + _urlsearch;

        //var dialogFromIFrameName = Req("_self");
        //if (dialogFromIFrameName === "") dialogFromIFrameName =  window.name; //"dataview";
        var rnd = (new Date()).getTime();
        rnd = "FRM" + rnd;
        if (url.indexOf("?") === -1) url += "?"
        else url += "&";
        //url += "_parent=" + dialogFromIFrameName + "&_self=" + rnd;
        url += "_parent=" + this._frmCsr + "&_self=" + rnd;

        var dialogHTML = "<div id=\"" + rnd + "\" title=\"";
        //if (url.indexOf("swfupload/downfile.aspx")>0) {
        //    dialogHTML += "下载文件";
        //} else {
            dialogHTML += "表单读取中, 请稍候...";
        //}
        dialogHTML += "\" style=\"padding:0px; OVERFLOW:hidden;\">";
        dialogHTML += "<iframe id=\""+rnd+"_page\" name=\"" + rnd + "\" frameborder=\"0\" scrolling=\"auto\" src=\"\" width=\"100%\" style=\"height:"+h+"px;\"></iframe></div>";

        window.top.$("body").append(dialogHTML);
        window.top.$("#"+rnd+"_page").attr("src",url);
        this._dialog = window.top.$( "#"+rnd ).dialog({
            width: w,
			height: h,
			modal: true,
            resize : function(event, ui) {
                $(this).children("iframe").height($(this).height());
            }
		});
    },
    _GetIFrameCSR : function(frm) {
        frm = frm || window.self;
        if (frm !== window.top) this._frmCsr += "^" + frm.name;
        if (frm.parent !== window.top)  this._GetIFrameCSR(frm.parent);
    },
    //获取对话框传递的任意类型数据
    argument : function() {
        var rtn = null;
        try {
            var dialogFrom = Req("_parent");
            var arrTemp = dialogFrom.split("^");
            for (var i=arrTemp.length-1; i>-1; i--) {
                if (arrTemp[i].trim() === "") continue;
                if (arrTemp[i] === "flow") this._window = this._window.frames[4];
                else if (arrTemp[i] === "form") this._window = this._window.frames[2];
                else this._window = this._window.frames[arrTemp[i]];
            }
            rtn = this._window.dialog._dialogArguments;
        } catch(e) {
            rtn = null;
        }
        return rtn;
    },
    //关闭对话框
    close : function(ReturnData) {
        ReturnData = ReturnData || "_null";
        var dialogFrom = Req("_parent");
        if (this._window === window.top) {
            var arrTemp = dialogFrom.split("^");
            for (var i=arrTemp.length-1; i>-1; i--) {
                if (arrTemp[i].trim() === "") continue;
                if (arrTemp[i] === "flow") this._window = this._window.frames[4];
                else if (arrTemp[i] === "form") this._window = this._window.frames[2];
                else this._window = this._window.frames[arrTemp[i]];
            }
        }
        this._window.dialog._dialog.dialog("close");
        var callback_fun = this._window.dialog._callback;
        if (callback_fun !== null) callback_fun(ReturnData);
    },

    //对于JS的消息框和确认框暂时没有必要改造
    alert : function() {},
    confrim : function() {},
    prompt : function(InputTip) {}
    //buttons: [{text: "确定",click: function() { $(this).dialog("close");}},{text: "取消",click: function() { $(this).dialog("close");}}],
}

/************************************************************
 *                                                          *
 *                      流程引擎相关功能                    *
 *                                                          *
 ************************************************************/
flow = {
    CommandTag : "__flow_",
    SubmitOption : "",
    _wfmid : "",
    _BussTable : "",
    _BussRowid : "",
    BSSQL : [],
    LoadFlowToolbar : function() {
        if (Req("_execflowtask") == "") return;
        var blnSelf = false;
        var blnView = false;
        if (Req("_execflowtask") === "view") blnView = true;
        if (Req("nid").indexOf("pSLF") > 0) blnSelf = true;
        var submitDisabled = "";
        var saveDisabled = "";
        var backDisabled = "";
        if (blnView) {
            saveDisabled = "disabled=1";
            submitDisabled = "disabled=1";
            backDisabled = "disabled=1";
        }
        if (blnSelf) {
            saveDisabled = "disabled=1";
            backDisabled = "disabled=1";
        }
        var vpath = "../../";
        if (location.href.lastIndexOf("/word.aspx?") > 0) vpath = "../";
        var tlbarHTML = "<div id=\"__FlowExecToolbar\" class=\"ui-widget-header ui-corner-all\">";
        tlbarHTML += "<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + vpath + "res/js.lib/jqui/themes/cupertino/jquery.ui.all.css\">";
        tlbarHTML += "<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + vpath + "res/js.lib/jqui/themes/com.css\">";
        tlbarHTML += "<script src=\"" + vpath + "res/js.lib/jqui/js/jquery.ui.core.min.js\"" + "></" + "script>";
        tlbarHTML += "<script src=\"" + vpath + "res/js.lib/jqui/js/jquery.ui.widget.min.js\"" + "></" + "script>";
        tlbarHTML += "<script src=\"" + vpath + "res/js.lib/jqui/js/jquery.ui.button.min.js\"" + "></" + "script>";
        tlbarHTML += "<table border='0' cellpadding='0' cellspacing='0'><tr><td width='490px'>";
        tlbarHTML += "<button id=\""+this.CommandTag+"return\">返回</button>";
        tlbarHTML += "<button id=\""+this.CommandTag+"save\" "+saveDisabled+">保存</button>";
        tlbarHTML += "<button id=\""+this.CommandTag+"submit\" "+submitDisabled+">提交任务</button>";
        tlbarHTML += "<button id=\""+this.CommandTag+"back\" "+backDisabled+">撤销</button>";
        tlbarHTML += "<button id=\""+this.CommandTag+"rundraw\">流程运行图</button>";
        tlbarHTML += "<button id=\""+this.CommandTag+"help\">帮助</button></td>";
        tlbarHTML += "<td>";
        //if (blnSelf === false) tlbarHTML += "<input type=\"checkbox\" id=\""+this.CommandTag+"CycleSubmit\" /><label style=\"color:#FF9C3C;\" for=\""+this.CommandTag+"CycleSubmit\">提交阅办</label>";
        var opts = GetSession("NodeSubmitOption"); //"同意,不同意"; //
        if (opts !== "") {
            var arrTemp = opts.split("^");
            tlbarHTML += "　提交选项：<span id=\""+this.CommandTag+"NodeOptions\">";
            for (var i=0; i<arrTemp.length; i++) {
		        tlbarHTML += "<input type=\"radio\" id=\"opt\"" + i + " name=\"NodeOptions\" v=\"" + arrTemp[i] + "\"";
		        if (i === 0) tlbarHTML += " checked ";
		        tlbarHTML += " /><label for=\"opt\"" + i + ">" + arrTemp[i] + "</label>";
		    }
		    arrTemp = null;
		}
		tlbarHTML += "</td></tr></table></div>";
        /*  将body下直属的控件往下移动30像素  */
        var itop = 0;
        var obj = null;
        $("form").eq(0).children().each(function() {
            return false;
            try{
                obj = $(this);
                itop = obj.css("top").toLowerCase().replace("px","")  - 0;
                itop += 30;
                obj.css("top", itop + "px");
            }catch(e){}
        });
        obj = null;
        /*******************************************************/
        if (vpath == "../") {
            $("#_fwtb").html(tlbarHTML);
        } else {
		    $("body").append(tlbarHTML);
		}
		this._EffectToolBar();
    },
    _EffectToolBar : function() {
        $("#"+this.CommandTag+"return").button({icons:{primary:"ui-icon-circle-triangle-w"}}).click(function(){flow.FlowDoneAction(this);});
    	$("#"+this.CommandTag+"save").button({icons:{primary:"ui-icon-disk"}}).click(function(){flow.FlowDoneAction(this);});
		$("#"+this.CommandTag+"submit").button({icons:{primary:"ui-icon-check"}}).click(function(){flow.FlowDoneAction(this);});
		$("#"+this.CommandTag+"back").button({icons:{primary:"ui-icon-circle-close"}}).click(function(){flow.FlowDoneAction(this);});
		$("#"+this.CommandTag+"rundraw").button({icons:{primary:"ui-icon-image"}}).click(function(){flow.FlowDoneAction(this);});
		//$("#"+this.CommandTag+"donelist").button().click(function(){flow.FlowDoneAction(this);});
		//$("#"+this.CommandTag+"nodetip").button().click(function(){flow.FlowDoneAction(this);});
		$("#"+this.CommandTag+"help").button({icons:{primary:"ui-icon-help"}}).click(function(){flow.FlowDoneAction(this);});
		$("#"+this.CommandTag+"CycleSubmit").click(function(){flow.FlowDoneAction(this);});
		$("#"+this.CommandTag+"NodeOptions").click(function(){flow.FlowDoneAction(this);});

        var fadeSpeed = 200, fadeTo = 0.5, topDistance = 30;
        var topbarME = function() { $('#__FlowExecToolbar').fadeTo(fadeSpeed,1); }, topbarML = function() { $('#__FlowExecToolbar').fadeTo(fadeSpeed,fadeTo); };
        var inside = false;
        $(window).scroll(function() {
            position = $(window).scrollTop();
            if(position > topDistance && !inside) {
                topbarML();
                $('#__FlowExecToolbar').bind('mouseenter',topbarME);
                $('#__FlowExecToolbar').bind('mouseleave',topbarML);
                inside = true;
            }
            else if (position < topDistance){
                topbarME();
                $('#__FlowExecToolbar').unbind('mouseenter',topbarME);
                $('#__FlowExecToolbar').unbind('mouseleave',topbarML);
                inside = false;
            }
        });
    },
    GoBack : function() {
        if (window.top.location.href.indexOf("IMMsgNote.aspx") > 0) {
            window.top.close();
            return;
        }
        var _url = document.referrer;
        if (_url.indexOf(".aspx?") > 0) _url += "&";
        else _url += "?";
        _url += "___rnd=" + $RND();
        location.href = _url;
    },
    FlowDoneAction : function(o) {
        act = o.id;
        act = act.replace(this.CommandTag,"");
        switch(act) {
            case "return":
                flow.GoBack();
                break;
            case "save":
                this.SaveData();
                break;
            case "submit":
                this.SubmitForm("CallBySelf");
                break;
            case "back":
                this.BackNode();
                break;
            case "rundraw":
                this.Monitor();
                break;
            case "help":
                this.SeeNodeHelp();
                break;
            case "CycleSubmit":
                break;
            case "NodeOptions":
                if ($(event.srcElement).attr("tagName") == "LABEL") return;
                var blnSetOption = false;
                $(o).children("input").each(function() {
                    if ($(this).attr("checked")) {
                        blnSetOption = true;
                        flow.SubmitOption = $(this).attr("v");
                        return false;
                    }
                });
                break;
        }
    },
    //启动流程（在业务列表表单中调用）
    StartFlow : function(TableName, RecordRowid, CallBack) {
        //flow._BussTable = TableName,
        flow._BussRowid = RecordRowid,
        CallBack = CallBack || "";
        ajax.run(rup + "/app/handle.aspx",{cmd:"startflow",tbl:TableName,rid:RecordRowid},function(s){
            var json = s+"";
            s = $.evalJSON(json);
            try {
                if (s.err !== "") {
                    alert(s.err.Replace("^","\n"));
                    return;
                }
            } catch(e) {
                alert("服务器返回的数据格式不正确");
                return;
            }
            s.BSSQL = flow.BSSQL;
            if (s.nodes.rows[0].cell.length === 2) {
                dialog.show(rup + "/app/hss32/FlowSelect.aspx",360,230,s,function(r) {
                    if (r.length === 32) {
                        flow._wfmid = r;
                        ajax.run(rup + "/app/handle.aspx",{cmd:"submitflow",wfmid:r},function(rsp){
                            var json = rsp+"";
                            rsp = $.evalJSON(json);
                            try {
                                if (rsp.err !== "") {
                                    alert(rsp.err.Replace("^","\n"));
                                    return;
                                }
                            } catch(e) {
                                alert("服务器返回的数据格式不正确");
                                return;
                            }
                            var params = "?_wfmid=" + flow._wfmid + "&_rid=" + flow._BussRowid;  // + "&_tbl=" + flow._BussTable
                            dialog.show(rup + "/app/hss32/FlowNodeSubmit.aspx" + params,500,390,rsp,function(r) {
                                if (typeof(CallBack) === "function") {
                                    if (r === "_null") CallBack("fail");
                                    else CallBack(r);
                                }
                            });
                        });
                    }
                });
            } else {
                var params = "?_wfmid=" + s.nodes.rows[0].cell[4].substring(0,32) + "&_rid=" + flow._BussRowid; // + "&_tbl=" + flow._BussTable
                dialog.show(rup + "/app/hss32/FlowNodeSubmit.aspx" + params,500,390,s,function(r) {
                    if (typeof(CallBack) === "function") {
                        if (r === "_null") CallBack("fail");
                        else CallBack(r);
                    }
                });
            }
        });
    },
    //实例化流程
    InitFlow : function(attsql) {
        var WaitStartNodes = "";
        var DutyUsers = "";
        var strTemp = "";
        var blnErr = false;
        var intUserCount = 0;
        $(gd[0]).find("tr").each(function(i) {
            if (i == 0) return;
            WaitStartNodes += "^" + gd.item("nodeid",i);
            DutyUsers += "^";
            strTemp = "";
            intUserCount = 0;
            $("#execuser_" + i).children().each(function(){
                intUserCount++;
                strTemp += "," + $(this).val() + ":" + $(this).text();
            });
            if (strTemp === "") {
                alert("【"+gd.item("nodename",i)+"】没有执行人, 无法提交");
                blnErr = true;
                return false;
            } else {
                if (intUserCount > gd.item("maxusers",i)-0) {
                    alert("【"+gd.item("nodename",i)+"】最多只允许" + gd.item("maxusers",i) + "个执行人");
                    blnErr = true;
                    return false;
                }
            }
            strTemp = strTemp.substring(1);
            DutyUsers += strTemp;
        });
        if (blnErr === true) return;
        WaitStartNodes = WaitStartNodes.substring(1);
        DutyUsers = DutyUsers.substring(1);
        var doIdea = txtIdea.GetText();
        doIdea = doIdea.replace("\r","").replace("\n","");
        doIdea = doIdea.trim();
        var selIdea = cbIdeaList.GetText();
        if (selIdea !== "") {
            if (doIdea === "") doIdea = selIdea;
            else doIdea = selIdea + "," + doIdea;
        }
        //dt.Rows[0][1].ToString();
        //2012-08-11新增
        attsql = attsql || [];
        var _bssql = "";
        try {
            for (var i=0; i<attsql.length; i++) {
                _bssql += ";" + attsql[i];
            }
            if (_bssql !== "") _bssql = _bssql.substring(1);
        } catch(e) {
            _bssql = "";
        }
        //新增结束
        ajax.run(rup + "/app/handle.aspx",{cmd:"initflow", wfmid:Req("_wfmid"), nmid:WaitStartNodes, wnuser:DutyUsers, sidea:doIdea, rid:Req("_rid"),bssql:_bssql},function(s){
            if (s.substring(0,2) === "OK" || s.indexOf("SendMsgErr:") > -1) {
                var wfid = s.substring(s.length - 32);
                if (s.substring(0,2) === "OK") {
                    alert("流程已成功启动！");
                } else {
                    alert("流程已成功启动，但发送消息通知异常\n\n" + s.replace("SendMsgErr:","").replace(wfid,""));
                }
                dialog.close(wfid);
            } else {
                alert(s.Replace("^","\n"));
            }
        });
    },
    //打开流程任务表单（在待办事项中调用）
    OpenForm : function(flowid,nodeid) {
        if (nodeid.indexOf("pBEG")>0) {
            ajax.run(rup + "/app/handle.aspx",{cmd:"submitnode",wfid:flowid, nid:nodeid, sopt:"", self:"0"},function(s){
                s = $.evalJSON(s);
                try {
                    if (s.err !== "") {
                        alert("查找后继节点失败, 原因:\n\n" + s.err.Replace("^","\n"));
                        return;
                    }
                } catch(e) {
                    alert("后继节点数据异常, 原因:\n\n" + e.message);
                    return;
                }
                dialog.show(rup + "/app/hss32/FlowNodeSubmit.aspx",500,390,s,ReloadTask);
            });
        } else {
            ajax.run(rup + "/app/handle.aspx",{cmd:"opennodeform",wfid:flowid,nid:nodeid},function(s) {
                if (s.indexOf(".aspx") === -1) {
                    alert("打开流程任务失败, 可能原因:\n\n" + s.Replace("^","\n"));
                } else {
                    s += "&_execflowtask=done";
                    if (s.indexOf("hsform/") > -1) location.href = rup + "/application/" + s;
                    else location.href = rup + "/app/" + s;
                }
            });
        }
    },
    //打开流程任务表单（在已办事项中调用）
    ViewForm : function(flowid,nodeid) {
        ajax.run(rup + "/app/handle.aspx",{cmd:"viewnodeform",wfid:flowid,nid:nodeid},function(s) {
            if (s.indexOf("?") == -1) {
                alert("打开流程任务表单失败, 原因:\n\n" + s);
            } else {
                s += "&_execflowtask=view";
                if (s.indexOf("hsform/") > -1) location.href = rup + "/application/" + s;
                else location.href = rup + "/app/" + s;
            }
        });
    },
    //提交流程任务表单（在流程工具栏或表单JS代码中调用，注意前者必须要求表单中包含_SubmitForm()函数且返回布尔值）
    SubmitForm : function(CallType) {
        CallType = CallType || "CallByAppForm";
        var flowid = Req("wfid");
        var nodeid = Req("nid");
        var blnSaveDataFlag = true;
        var opts = "";
        var submitself = "0";    //默认不是提交阅办
        $("#"+this.CommandTag+"NodeOptions").children("input").each(function() {
            if ($(this).attr("checked")) opts = $(this).attr("v");
        });
        if ($("#"+this.CommandTag+"CycleSubmit").attr("checked")) submitself = "1";   //如果阅办Checkbox被选中

        if (CallType === "CallBySelf") {   //在流程工具栏中调用
            try {
                if (nodeid.indexOf("pSLF") === -1) blnSaveDataFlag = _SubmitForm({FlowID:flowid, NodeID:nodeid, SubmitOption:opts});  //阅办人提交时不调用业务表单的保存方法
            } catch(e) {
                blnSaveDataFlag = false;
            }
            if (blnSaveDataFlag === false) {
                //alert("表单数据保存异常, 不能提交任务");
                return;
            }
        }

        ajax.run(rup + "/app/handle.aspx",{cmd:"submitnode",wfid:flowid, nid:nodeid, sopt:opts, self:submitself},function(s){
            //prompt(1,s);
            s = $.evalJSON(s);
            try {
                if (s.err !== "") {
                    switch(s.err) {
                        case "SubmitSelf":
                            dialog.show(rup + "/app/hss32/FlowSubmitSelf.aspx",400,210,s,function(rtn) {
                                if (rtn=="OK") {
                                    flow.GoBack();
                                    //location.href = rup + "/app/hss32/FlowWaitTask.aspx?rnd=" + $RND();
                                }
                            });
                            break;
                        case "BackSelf":
                            dialog.show(rup + "/app/hss32/FlowBackSelf.aspx",330,170,s,function(rtn) {
                                if (rtn=="OK") {
                                    flow.GoBack();
                                    //location.href = rup + "/app/hss32/FlowWaitTask.aspx?rnd=" + $RND();
                                }
                            });
                            break;
                        default:
                            alert("查找后继节点失败, 原因:\n\n" + s.err.Replace("^","\n"));
                            break;
                    }
                    return;
                }
            } catch(e) {
                alert("后继节点数据异常, 原因:\n\n" + e.message);
                return;
            }
            s.BSSQL = flow.BSSQL;
            if (s.end) {
                dialog.show(rup + "/app/hss32/FlowEndNodeSubmit.aspx",798,430,s,function(rtn) {
                    if (typeof(rtn) === "object") {
                        try {_SubmitCallback(rtn);} catch(e){}
                        flow.GoBack();
                        //location.href = rup + "/app/hss32/FlowWaitTask.aspx?rnd=" + $RND();
                    }
                });
            } else {
                dialog.show(rup + "/app/hss32/FlowNodeSubmit.aspx",500,390,s,function(rtn) {
                    if (typeof(rtn) === "object") {
                        try {_SubmitCallback(rtn);} catch(e){}
                        flow.GoBack();
                        //location.href = rup + "/app/hss32/FlowWaitTask.aspx?rnd=" + $RND();
                    }
                });
            }
        });
    },
    //启动后继任务节点并完成当前表单（在提交表单打开的节点列表中调用）
    StartNode : function(attsql) {
        var WaitStartNodes = "";
        var DutyUsers = "";
        var strTemp = "";
        var blnErr = false;
        var intUserCount = 0;
        $(gd[0]).find("tr").each(function(i) {
            if (i == 0) return;
            WaitStartNodes += "^" + gd.item("nodeid",i);
            DutyUsers += "^";
            strTemp = "";
            intUserCount = 0;
            $("#execuser_" + i).children().each(function(){
                intUserCount++;
                strTemp += "," + $(this).val() + ":" + $(this).text();
            });
            if (strTemp === "") {
                alert("【"+gd.item("nodename",i)+"】没有执行人, 无法提交");
                blnErr = true;
                return false;
            } else {
                if (intUserCount > gd.item("maxusers",i)-0) {
                    alert("【"+gd.item("nodename",i)+"】最多只允许" + gd.item("maxusers",i) + "个执行人");
                    blnErr = true;
                    return false;
                }
            }
            strTemp = strTemp.substring(1);
            DutyUsers += strTemp;
        });
        if (blnErr === true) return;
        WaitStartNodes = WaitStartNodes.substring(1);
        DutyUsers = DutyUsers.substring(1);
        var doIdea = txtIdea.GetText();
        doIdea = doIdea.replace("\r","").replace("\n","");
        doIdea = doIdea.trim();
        var selIdea = cbIdeaList.GetText();
        if (selIdea !== "") {
            if (doIdea === "") doIdea = selIdea;
            else doIdea = selIdea + "," + doIdea;
        }
        //2012-08-11新增
        attsql = attsql || [];
        var _bssql = "";
        try {
            for (var i=0; i<attsql.length; i++) {
                _bssql += ";" + attsql[i];
            }
            if (_bssql !== "") _bssql = _bssql.substring(1);
        } catch(e) {
            _bssql = "";
        }
        //新增结束
        ajax.run(rup + "/app/handle.aspx",{cmd:"completenode",wfid:nodedata.wfid,nid:nodedata.nodeid,wnid:WaitStartNodes,wnuser:DutyUsers,sopt:nodedata.sopt,sidea:doIdea, bssql:_bssql},function(s){
            if (s === "OK" || s.indexOf("SendMsgErr:") > -1) {
                if (s === "OK") alert("节点提交成功！");
                else alert("流程任务提交成功，但发送消息通知异常\n\n" + s.replace("SendMsgErr:",""));
                dialog.close(nodedata);
            } else {
                alert(s.Replace("^","\n"));
            }
        });
    },
    GetSubmitOption : function() {
	    var opt = "";
	    $("#"+this.CommandTag+"NodeOptions").children("input").each(function() {
            if ($(this).attr("checked")) opt = $(this).attr("v");
        });
		return opt;
	},
    //结束流程
    EndFlow : function(attsql) {
        var doIdea = txtIdea.GetText();
        doIdea = doIdea.trim();
        var selIdea = cbIdeaList.GetText();
        if (selIdea !== "") {
            if (doIdea === "") doIdea = selIdea;
            else doIdea = selIdea + "," + doIdea;
        }
        var i = 1;
        var m = gd.RowCount();
        var recevSmsUser = "";
        for (i=1; i<=m; i++) {
            if (gd.RowChecked(i)) recevSmsUser += "," + gd.item("uid",i);
        }
        if (recevSmsUser != "") recevSmsUser = recevSmsUser.substring(1);
        //2012-08-11新增
        attsql = attsql || [];
        var _bssql = "";
        try {
            for (var i=0; i<attsql.length; i++) {
                _bssql += ";" + attsql[i];
            }
            if (_bssql !== "") _bssql = _bssql.substring(1);
        } catch(e) {
            _bssql = "";
        }
        //新增结束
        ajax.run(rup + "/app/handle.aspx",{cmd:"endflow",wfid:nodedata.wfid,nid:nodedata.nodeid,sopt:nodedata.sopt,sidea:doIdea,rmsgu:recevSmsUser,bssql:_bssql},function(s){
            if (s === "OK") {
                alert("节点提交成功！");
                dialog.close(nodedata);
            } else {
                alert(s.Replace("^","\n"));
            }
        });
    },

    //收回重办（在已办列表页面中调用）
    UndoNode : function(flowid, nodeid) {
        if (nodeid.indexOf("pSLF")>0) {
            alert("阅办节点不能收回重办");
            return;
        }
        ajax.run(rup + "/app/handle.aspx",{cmd:"retakenode",wfid:flowid,nid:nodeid},function(s){
            if (s === "OK") {
                if (!confirm("任务收回成功，需要立即办理吗？\n\n如果取消，下次可在待办任务中打开")) return;
                flow.OpenForm(flowid,nodeid);
            } else {
                alert(s);
            }
        });
    },

    //节点内提交咨询(FlowSumbmitSelf页面中调用)
    CycleNode : function() {
        var dusers = _recvUsers.GetText();
        if (dusers === "") {
            alert("请选择接收人");
            return;
        }
        var doIdea = txtIdea.GetText();
        doIdea = doIdea.replace("\r","").replace("\n","");
        doIdea = doIdea.trim();
        var selIdea = cbIdeaList.GetText();
        if (selIdea !== "") {
            if (doIdea === "") doIdea = selIdea;
            else doIdea = selIdea + "," + doIdea;
        }
        if (doIdea === "") {
            alert("请填写办理意见");
            return;
        }
        ajax.run(rup + "/app/handle.aspx",{cmd:"cyclenode",wfid:nodedata.wfid,nid:nodedata.nodeid,wnuser:dusers,sidea:doIdea},function(s){
            if (s === "OK") {
                alert("提交成功！");
                dialog.close("OK");
            } else {
                alert("节点内提交失败, 原因：\n\n" + s);
            }
        });
    },

    //返回请求咨询者（FlowBackSelf页面中调用）
    BackSelf : function() {
        var doIdea = txtIdea.GetText();
        doIdea = doIdea.replace("\r","").replace("\n","");
        doIdea = doIdea.trim();
        var selIdea = cbIdeaList.GetText();
        if (selIdea !== "") {
            if (doIdea === "") doIdea = selIdea;
            else doIdea = selIdea + "," + doIdea;
        }
        if (doIdea === "") {
            alert("请填写办理意见");
            return;
        }
        ajax.run(rup + "/app/handle.aspx",{cmd:"backcycle",wfid:nodedata.wfid,nid:nodedata.nodeid,sidea:doIdea},function(s){
            if (s === "OK") {
                dialog.close("OK");
            } else {
                alert("提交失败，原因：\n\n" + s);
            }
        });
    },

    //退回（在待办列表页面或流程表单页面调用）
    BackNode : function(flowid, nodeid) {
        flowid = flowid || Req("wfid");
        nodeid = nodeid || Req("nid");
        if (nodeid.indexOf("pSLF")>0) {
            alert("阅办节点不能退回");
            return;
        }
        if (flowid.length !== 32 || nodeid.length !== 36) {
            alert("流程编号或任务编号有误");
            return;
        }
        var s = prompt("请输入您要回退的原因：","");
        if (s !== null) {
            if (s.trim() === "") {
                alert("回退原因为空，不能完成操作");
                return;
            }
            ajax.run(rup + "/app/handle.aspx",{cmd:"backnode",wfid:flowid,nid:nodeid,sidea:s},function(s){
                if (s === "OK") {
                    flow.GoBack();
                    //location.href = rup + "/app/hss32/FlowWaitTask.aspx?rnd=" + $RND();
                } else {
                    alert(s);
                }
            });
        }
    },

    //流程监控图
    Monitor : function(wfid) {
        wfid = wfid || Req("wfid");
        if (wfid === "") {
            alert("缺少流程实例编号，无法查看");
            return;
        }
        dialog.show(rup + "/app/hss32/FlowMonitor.aspx?wfid=" + wfid,820,530);
    },

    //保存业务表单数据（在流程工具栏中调用，要求业务表单中包含_SaveForm()函数）
    SaveData : function() {
        _SaveForm();
    },


    SeeNodeHelp : function() {
        dialog.show(rup + "/app/hss32/FlowNodeHelp.aspx?nid=" + Req("nid"),353,290);
    }
}

/************************************************************
 *                                                          *
 *                        选择系统对象                      *
 *                                                          *
 ************************************************************/
//cfg = {ctrl:"",type:"d",selcount:1} //type:u表示用户，d表示机构，j表示岗位，z表示职务，r表示角色，x表示混合选择；selcount是允许选择的个数，0表示不限
var __SelObjectCallBack = null;
var __SelObjectOption = null;
function SelObject(opt,callback) {
    opt = opt || {type:"u",selcount:1,modal:"win"};
    var objs = [];
    var _idctrlIndex = -1;
    var i = 0, j = 0;

    //获取当前控件现有的值
    try {
        if (typeof(opt.ctrl) === "string") {
            for (i=0; i<CtrlList.length; i++) {
                if ("_" + opt.ctrl === CtrlList[i].s) _idctrlIndex = i;
                if (opt.ctrl === CtrlList[i].s) {
                    if (CtrlList[i].t === "listbox" || CtrlList[i].t === "combox") {
                        var oItem = null;
                        var m = CtrlList[i].c.GetItemCount();
                        for (j=0; j<m; j++) {
                            oItem = CtrlList[i].c.GetItem(j);
                            objs.push({v:oItem.value,t:oItem.text});
                        }
                        oItem = null;
                        break;
                    }
                }
            }
            if (_idctrlIndex > -1) {
               var arrTemp = CtrlList[_idctrlIndex].c.GetText().split(",");
               for (var i=0; i<arrTemp.length; i++) {
                   if (arrTemp[i] === "") continue;
                   j = arrTemp[i].indexOf(":");
                   objs.push({v:arrTemp[i].substring(0,j),t:arrTemp[i].substring(j+1)});
               }
            }
        }
        opt = $.extend(opt,{obj:objs});
    } catch(e) {
        opt = $.extend(opt,{obj:[]});
    }

    callback = callback || null;
    __SelObjectCallBack = callback
    __SelObjectOption = opt;
    var rtn = null;
    if (opt.modal) {
        if (opt.modal === "win") {
            rtn = Show(rup + "/app/hss32/SelectObj.aspx",660,470,opt);
            SelObjectOver(rtn);
            return rtn;
        }
    }
    dialog.show(rup + "/app/hss32/SelectObj.aspx",660,470,opt,SelObjectOver);
}

function SelObjectOver(rtn) {
    //if (rtn.length === 0) return;
    if (typeof(__SelObjectOption.ctrl) !== "string") {
        if (__SelObjectCallBack !== null) __SelObjectCallBack(rtn);
        return;
    }
    var vlist = "";
    var tlist = "";
    var _idctrlIndex = 0;
    var setID = false;
    var i = 0;

    //获取返回对象（转换为逗号分隔的字符串）
    try {
        for (i=0; i<rtn.length; i++) {
            vlist += "," + rtn[i].id + ":" + rtn[i].text;
            tlist += "," + rtn[i].text;
        }
        if (vlist !== "") {
            vlist = vlist.substring(1);
            tlist = tlist.substring(1);
        }
    } catch(e) {
        return;
    }
    try {
        for (i=0; i<CtrlList.length; i++) {
            if ("_" + __SelObjectOption.ctrl === CtrlList[i].s) _idctrlIndex = i;
            if (__SelObjectOption.ctrl === CtrlList[i].s) {
                if (CtrlList[i].t === "listbox" || CtrlList[i].t === "combox") {
                    for (var j=0; j<rtn.length; j++) {
                        CtrlList[i].c.AddItem(rtn[i].text,rtn[i].id);
                    }
                    if (rtn.length === 0) CtrlList[i].c.ClearItems();
                    break;
                } else {
                    CtrlList[i].c.SetText(tlist);
                    setID = true;
                }
            }
        }
        if (setID === true) CtrlList[_idctrlIndex].c.SetText(vlist);
    } catch(e) {

    }
    if (__SelObjectCallBack !== null) __SelObjectCallBack(rtn);
    __SelObjectCallBack = null;
}

/************************************************************
 *                                                          *
 *                        表单相关操作                      *
 *                                                          *
 暂只适应自动生成的表单
 ************************************************************/
form = {
    save : function(callback) {
        var val = null, postdata = "";
        callback = callback || "";
        postdata = "act=" + Req("act") + "&formid=" + pageid + "&rowid=" + Req("rowid");
        //postdata = {act:Req("act"), formid:pageid, rowid:Req("rowid")};
        var _data = "";
        for (var i=0; i<CtrlList.length; i++) {
            switch(CtrlList[i].t) {
                case "textbox":
                case "btntxtbox":
                case "datebox":
                case "mtextbox":
                case "numspin":
                    val = CtrlList[i].c.GetText();
                    val = val.Replace("\"","“");
                    val = val.Replace("&","＆");
                    val = val.Replace("+","＋");
                    break;
                case "checkbox":
                    val = CtrlList[i].c.GetValue();
                    if (val === null) val = false;
                    if (val === true) val = "1";
                    else val = "0";
                    break;
                case "listbox":
                    val = CtrlList[i].c.GetSelectedValues();
                    break;
                case "radiolist":
                case "combox":
                    val = CtrlList[i].c.GetValue();
                    break;
                case "htmledit":
                    val = CtrlList[i].c.GetHtml();
                    break;
            }
            postdata += "&" + CtrlList[i].s + "=" + val;
        }
        if (typeof(callback) === "function") {
            ajax.run(rup + "/app/handle.aspx?cmd=saveformdata", postdata, callback);
        } else {
            ajax.run(rup + "/app/handle.aspx?cmd=saveformdata", postdata, function(s){
                if (s === "") {
                    alert("数据保存成功");
                } else {
                    alert("数据保存失败，原因：\n\n" + s);
                }
            });
        }
    },
    search : function(JQGrid,KeyWords) {
        KeyWords = KeyWords || "";
        KeyWords = KeyWords.trim();
        if (KeyWords === "") {
            alert("请输入查询关键字");
            return;
        }
        var postdata = {formid:pageid,page:1,kw:KeyWords};
        ajax.run(rup + "/app/handle.aspx?cmd=qryjqgriddata&"+location.search.substring(1),postdata,function(s) {
            if (s === "") return;
            if (s.substring(0,1) === "{") {
                JQGrid.IsQueryData = true;
                JQGrid.clearGridData();
                JQGrid[0].addJSONData($.evalJSON(s));
            } else {
                alert("加载列表数据失败, 原因:\n\n" + s);
            }
        });
    },
    query : function(JQGrid) {
        dialog.show(rup + "/app/hss32/filter.aspx?formid=" + pageid,558,410,function(s) {
            if (s !== "_null") {
                var postdata = {formid:pageid,page:1,wh:s};
                ajax.run(rup + "/app/handle.aspx?cmd=qryjqgriddata&"+location.search.substring(1),postdata,function(s) {
                    if (s === "") {
                        alert("没有查询到任何记录");
                        return;
                    }
                    if (s.substring(0,1) === "{") {
                        JQGrid.IsQueryData = true;
                        JQGrid.clearGridData();
                        JQGrid[0].addJSONData($.evalJSON(s));
                    } else {
                        alert("加载列表数据失败, 原因:\n\n" + s);
                    }
                });
            }
        });
    },
    remove : function(JQGrid,CallBack) {
        if (pageid === "") return;
        if (JQGrid.RowIndex === 0) {
            alert("请选择一条记录");
            return;
        }
        var rowid = JQGrid.item("rowid");
        if (rowid === null) {
            alert("数据列表中缺少记录编号，系统不能执行删除命令");
            return;
        }
        var postdata = {formid:pageid,rid:rowid};
        ajax.run(rup + "/app/handle.aspx?cmd=removerec",postdata,function(s) {
            if (s === "") {
                JQGrid.Refresh();
                if (typeof(CallBack) === "function") CallBack(s);
            } else {
                alert("删除记录异常, 原因:\n\n" + s);
            }
        });
    }
}

function CopyData(tblName) {
    tblName = tblName || "";
    if (tblName === "") {
        alert("参数不足，无法复制");
        return;
    }
    var s = Show(rup + "/app/hss32/copydata.aspx?tbl=" + tblName, 1038, 525);
    return s;
}

function SelForm(modid,callback) {
    modid = modid || "";
    callback = callback || "";
    if (typeof(callback) === "function") {
        dialog.show(rup + "/app/hss32/Form_Select.aspx?modname="+cbxmod.GetValue(),295,510,function(r) {
            if (r !== "_null") callback(r);
        });
    } else {
        return Show(rup + "/app/hss32/Form_Select.aspx?modname="+cbxmod.GetValue(),295,510);
    }
}

function GetIP(callback) {
    callback = callback || "";
    if (typeof(callback) === "function") {
        ajax.run(rup + "/app/handle.aspx?cmd=getcip",null,function(s){callback(s)});
    } else {
        return ajax.run(rup + "/app/handle.aspx?cmd=getcip",null);
    }
}

//获取表名和字段名方法
function SelectTblFld(fg,Callback,modname) {
    modname = modname || "";
    var act = "?modname=" + modname + "&act=";
    if (arguments.length !== 2) return;
    if (typeof(Callback) !== "function") return;
    if (fg === 0 || fg === "t" || fg === "tbl" || fg === "table") act += "st";

    dialog.show("db_seltable.aspx" + act,530,475,function(s) {
        if (s !== "_null") Callback(s);
    });
}

//高级查询（需要对视图或表的字段进行应用特性设置）
function AdvSearch(opt,Callback) {
    var etype = opt.dbtype || "table";
    var ename = opt.dbname || "";
    if (ename === "") {
        alert("缺少视图或表，不能进行查询");
        return;
    }
    dialog.show(rup + "/app/hss32/AdvSearch.aspx?et=" + etype + "&en=" + ename,558,410,function(s) {
        if (s !== "_null") {
            s = s.Replace(" #","'").Replace("# ","'").Replace("#","'").Replace("#","'");
            s = GetWhereSql(s,"Not Contains");
            s = GetWhereSql(s,"Contains");
            s = GetWhereSql(s,"StartsWith");
            s = GetWhereSql(s,"EndsWith");
            s = GetWhereSql(s,"Like");
            s = GetWhereSql(s,"Between");
            if (typeof(Callback) === "function") Callback(s);
        }
    });
}
function GetWhereSql(s,k) {
   var arr = null, arr_1 = null;
   var stmp = "", tmp_1 = "";
   var j = 0;
   if (s.indexOf(k) > -1) {
       arr = s.split(k);
       for (var i=0; i<arr.length; i++) {
           if (arr[i] !== "") {
               if (k === "Like") {
                   if (arr[i].substring(0,2) === " '") {
                       j = arr[i].indexOf("' ");
                       tmp_1 = "Like '%" + arr[i].substring(2,j) + "%' ";
                       stmp +=  tmp_1 + arr[i].substring(j+2);
                   } else {
                       stmp += arr[i];
                   }
               }

               if (k === "Between") {
                   if (arr[i].substring(0,1) === "(") {
                       j = arr[i].indexOf(")");
                       tmp_1 = arr[i].substring(1,j);
                       tmp_1 = tmp_1.replace(",", " AND ");
                       stmp += "Between " + tmp_1 + arr[i].substring(j+1);
                   } else {
                       stmp += arr[i];
                   }
               }

               if (k.indexOf("Contains") > -1) {
                   if (arr[i].substring(0,2) === "([") {
                       j = arr[i].indexOf("')");
                       tmp_1 = arr[i].substring(1,j+1);
                       arr_1 = tmp_1.split(", ");
                       tmp_1 = arr_1[1] + "," + arr_1[0]
                       if (k === "Not Contains") {
                           tmp_1 = " charindex(" + tmp_1 + ")=0 ";
                       } else {
                           tmp_1 = " charindex(" + tmp_1 + ")>0 ";
                       }
                       stmp +=  tmp_1 + arr[i].substring(j+2);
                   } else {
                       stmp += arr[i];
                   }
               }

               if (k.indexOf("With") > -1) {
                   if (arr[i].substring(0,2) === "([") {
                       j = arr[i].indexOf("')");
                       tmp_1 = arr[i].substring(1,j);
                       arr_1 = tmp_1.split(", ");

                       if (k === "StartsWith") {
                           tmp_1 = arr_1[0] + " Like " + arr_1[1] + "%' ";
                       } else {
                           tmp_1 = arr_1[0] + " Like '%" + arr_1[1].substring(1) + "' ";
                       }
                       stmp +=  tmp_1 + arr[i].substring(j+2);
                   } else {
                       stmp += arr[i];
                   }
               }
           }
       }
   } else {
       stmp = s;
   }
   return stmp;
}

function SetQueryFields() {
    dialog.show("db_setqryfld.aspx?et=" + Req("et") + "&en=" + Req("en"),378,450,function(s){
        if (s === "OK") location.reload();
    });
}

AutoComplete = {
    _ctrl : null,
    _sql : "",
    _divHTML : "<div id='___acfrm' onmousedown='AutoComplete.SetValue(-1,this)' style='left:{L};top:{T}px;width:{W};height:{H}px;'>{R}</div>", // onkeyup='AutoComplete.MoveKey()' onblur='AutoComplete.Kill()'
    Load : function(ctrl,sql) {
        event.cancelBubble=true;
        if (ctrl.GetText().trim() === "" || event.keyCode === 13 || event.keyCode === 17) {
            try{$("#___acfrm").hide()} catch(e){}
            return false;
        }
        this._ctrl = ctrl;
        ctrl.LostFocus.AddHandler(function(s,e){
            if ($("#___acfrm").children().length < 13) {
                $("#___acfrm").hide();
            }
        });
        if (event.keyCode === 38 || event.keyCode === 40) {
            if ($('#___acfrm').html()) {
                this.Resize();
                $("#___acfrm").show();
                this.MoveKey(event.keyCode);
				return;
            }
        }
        if (this._sql === sql) {
            this.Resize();
            $("#___acfrm").show();
        } else {
            this.Resize();
            GetData(sql,function(s) {
                AutoComplete._sql = sql;
                if (s !== "") {
                    AutoComplete._LoadDiv(s);
                } else {
                    try {$("#___acfrm").hide();} catch(e) {}
                }
            });
        }
    },
    Resize : function() {
        try {
            var obj = $("#"+this._ctrl.name);
            $("#___acfrm").css("top",obj.css("top").replace("px","") - 0 + obj.height() + 1);
            $("#___acfrm").css("left",obj.css("left"));
            $("#___acfrm").css("width",obj.css("width"));
        } catch(e) {}
    },
    _LoadDiv : function(datalist) {
        var rlist = eval(datalist);
        var spanHTML = "";
        var _v = "";
        var m = rlist.length;
        for (var i=0; i<m; i++) {
            try {_v = rlist[i].v;} catch(e) {_v = "";}
            spanHTML += "<div class='_acsp' v='" + _v + "'>" + rlist[i].t + "</div>";
        }
        rlist = null;
        if ($("#___acfrm").html()) {
            $("#___acfrm").html(spanHTML);
            $("#___acfrm").css("display","block");
        } else {
            var divHTML = AutoComplete._divHTML;
            var obj = $("#"+this._ctrl.name);
            divHTML = divHTML.replace("{T}",obj.css("top").replace("px","") - 0 + obj.height() + 1);
            divHTML = divHTML.replace("{L}",obj.css("left"));
            divHTML = divHTML.replace("{W}",obj.css("width"));
            divHTML = divHTML.replace("{H}","220");
            divHTML = divHTML.replace("{R}",spanHTML);
            obj = null;
            $("body").append(divHTML);
        }
    },
    MoveKey : function(kcode) {
        if (event.keyCode !== 38 && event.keyCode !== 40) return;
        var curIdx = -1, nextIdx = -1;
        var obj = $('#___acfrm').children();
        var m = obj.length - 1;
        obj.each(function(i){
            if ($(this).attr("sel") === "t") {
                curIdx = i;
                return false;
            }
        });
        if (curIdx === -1) {
            curIdx = 0;
            nextIdx = 0;
            obj.eq(curIdx).toggleClass("AcListFocus").attr("sel","t");
        } else {
            if (kcode === 40) {
                nextIdx = curIdx+1;
                if (nextIdx > m) nextIdx = 0;
            } else {
                nextIdx = curIdx-1;
                if (nextIdx < 0) nextIdx = m;
            }
            obj.eq(curIdx).toggleClass("AcListFocus").attr("sel","");
            obj.eq(nextIdx).toggleClass("AcListFocus").attr("sel","t");
            //var t = obj.eq(curIdx).offset().top;
            //if (t > 180) $("#___acfrm").scrollTop(t);
        }
        this.SetValue(nextIdx);
    },
    SetValue : function(FocusRowIndex,oAcDiv) {
        if (FocusRowIndex === -1) {
            var _x = $(event.srcElement);
            if (_x.attr("v")) {
                this._ctrl.SetText($(event.srcElement).text());
                try {
                    eval("_" + this._ctrl.name).SetText($(event.srcElement).attr("v"));
                } catch(e) {}
                this.Kill();
            }
            return;
        }
        var obj = $('#___acfrm').children();
        this._ctrl.SetText(obj.eq(FocusRowIndex).text());
        try {
            eval("_" + this._ctrl.name).SetText(obj.eq(FocusRowIndex).attr("v"));
        } catch(e) {}
        obj = null;
    },
    Kill : function() {
        var obj = $('#___acfrm').children();
        obj.each(function(){
            if ($(this).attr("sel") === "t") {
                $(this).toggleClass("AcListFocus").attr("sel","");
                return false;
            }
        });
        $('#___acfrm').hide();
        this._ctrl.Focus();
    }
}

/*******************************************************************************************/
/*扩展文本框自动匹配方法PYC：20130116修改*/
/******************************************************************************************/
//获取目标文本框上下左右边距，第一个参数目标控件对象，第二个参数，边距标识。
    function mSift_SeekTp(oObj,nDire)
	{
			if(oObj.getBoundingClientRect&&!document.all)
			{
				var oDc=document.documentElement;
				switch(nDire)
				{
					case 0:return oObj.getBoundingClientRect().top+oDc.scrollTop;   //获取上边距
					case 1:return oObj.getBoundingClientRect().right+oDc.scrollLeft;  //获取右边距
					case 2:return oObj.getBoundingClientRect().bottom+oDc.scrollTop; //获取下边距
					case 3:return oObj.getBoundingClientRect().left+oDc.scrollLeft;     //获取左边距
				}
			}
			else
			 {
					if(nDire==1||nDire==3){
					   var nPosition=oObj.offsetLeft;
					}
					else{
						var nPosition=oObj.offsetTop;
					}
			        if(arguments[arguments.length-1]!=0){
						if(nDire==1){
						 nPosition+=oObj.offsetWidth;
						}
						else if(nDire==2){
						 nPosition+=oObj.offsetHeight;
						}
				    }
				   if(oObj.offsetParent!=null){
				    nPosition+=mSift_SeekTp(oObj.offsetParent,nDire,0);
				   }
			       return nPosition;
			  }
	}
	//mSift对象属性方法扩展
    mSift={
				Varsion:'',
				Target:Object,
				TgList:Object,
				Listeners:null,
				SelIndex:0,
				Data:[],
				ReData:[],
				Create:function(oObj){
					var _this=this;
					var oUL=document.createElement('ul');
					oUL.style.display='none';
					oUL.style.height='200px';
					oObj.parentNode.insertBefore(oUL,oObj);
					_this.TgList=oUL;
					oObj.onkeydown=oObj.onclick=function(e){_this.Listen(this,e);};
					oObj.onblur=function(){setTimeout(function(){_this.Clear();},100);};
			    },			    
				Complete:function(){},
				Select:function(){
					var _this=this;
					if(_this.ReData.length>0){
					document.getElementById(_this.Target.id).value=_this.ReData[_this.SelIndex].replace(/\*/g,'*').replace(/\|/g,'|')
					//_this.Target.value=_this.ReData[_this.SelIndex].replace(/\*/g,'*').replace(/\|/g,'|');
					_this.Clear();
					}
					_this.Complete();
				},
				Listen:function(oObj){
					var _this=this;
					_this.Target=oObj;
					var e=arguments[arguments.length-1];
					var ev=window.event||e;
					switch(ev.keyCode){
					case 9://TAB
					return;
					case 13://ENTER
					_this.Target.blur();
					_this.Select();
					return;
					case 38://UP
					_this.SelIndex=_this.SelIndex>0?_this.SelIndex-1:_this.ReData.length-1;
					break;
					case 40://DOWN
					_this.SelIndex=_this.SelIndex<_this.ReData.length-1?_this.SelIndex+1:0;
					break;
					default:
					_this.SelIndex=0;
					}
					if(_this.Listeners){clearInterval(_this.Listeners);}
					_this.Listeners=setInterval(function(){
					_this.Get();
					},10);
				},
				Get:function(){
						var _this=this;
						if(_this.Target.value==''){_this.Clear();return;}
						if(_this.Listeners){clearInterval(_this.Listeners);};
						_this.ReData=[];
						var cResult='';
						for(var i=0;i<_this.Data.length;i++){
							if(_this.Data[i].toLowerCase().indexOf(_this.Target.value.toLowerCase())>=0){
							_this.ReData.push(_this.Data[i]);
							if(_this.ReData.length==_this.Max){break;}
						}
					}
					var cRegPattern=_this.Target.value.replace(/\*/g,'*');
					cRegPattern=cRegPattern.replace(/\|/g,'|');
					cRegPattern=cRegPattern.replace(/\+/g,'\\+');
					cRegPattern=cRegPattern.replace(/\./g,'\\.');
					cRegPattern=cRegPattern.replace(/\?/g,'\\?');
					cRegPattern=cRegPattern.replace(/\^/g,'\\^');
					cRegPattern=cRegPattern.replace(/\$/g,'\\$');
					cRegPattern=cRegPattern.replace(/\(/g,'\\(');
					cRegPattern=cRegPattern.replace(/\)/g,'\\)');
					cRegPattern=cRegPattern.replace(/\[/g,'\\[');
					cRegPattern=cRegPattern.replace(/\]/g,'\\]');
					cRegPattern=cRegPattern.replace(/\\/g,'\\\\');
					var cRegEx=new RegExp(cRegPattern,'i');
					for(var i=0;i<_this.ReData.length;i++){
					if(_this.Target.value.indexOf('*')>=0){
					_this.ReData[i]=_this.ReData[i].replace(/\*/g,'*');
					}
					if(_this.Target.value.indexOf('|')>=0){
					_this.ReData[i]=_this.ReData[i].replace(/\|/g,'|');
					}
					cResult+='<li style="padding:0 5px;line-height:20px;cursor:default;" onmouseover="mSift.ChangeOn(this);mSift.SelIndex='+i+';" onmousedown="mSift.Select();">'
					+_this.ReData[i].replace(cRegEx,function(s){return '<span style="background:#ff9;font-weight:bold;font-style:normal;color:#e60;">'+s+'</span>';});+'</li>';
					}
					if(cResult==''){_this.Clear();}
					else{
					_this.TgList.innerHTML=cResult;
					_this.TgList.style.cssText='display:block;position:absolute;background:#fff;border:#090 solid 1px;margin:-1px 0 0;padding: 5px;list-style:none;font-size:12px; overflow:auto;height:200px;';
					_this.TgList.style.top=mSift_SeekTp(_this.Target,2)+'px';
					_this.TgList.style.left=mSift_SeekTp(_this.Target,3)+'px';
					_this.TgList.style.width=_this.Target.offsetWidth-12+'px';
					}
					var oLi=_this.TgList.getElementsByTagName('li');
					if(oLi.length>0){
					oLi[_this.SelIndex].style.cssText='background:#36c;padding:0 5px;line-height:20px;cursor:default;color:#fff;';
					}
				},
				ChangeOn:function(oObj){
					var oLi=this.TgList.getElementsByTagName('li');
					for(var i=0;i<oLi.length;i++) {
					oLi[i].style.cssText='padding:0 5px;line-height:20px;cursor:default;';
					}
					oObj.style.cssText='background:#36c;padding:0 5px;line-height:20px;cursor:default;color:#fff;';
				},
				Clear:function(){
					var _this=this;
					if(_this.TgList){
					_this.TgList.style.display='none';
					_this.ReData=[];
					_this.SelIndex=0;
				}
			}
    }

/*******************************************************************************************/


function UploadArhFile(arg) {
   var upfilelist = Show(rup+"/app/arh/swfupload/uploadfrm.htm",580,358,arg);
   try {
       return upfilelist;
   }catch(e) {
       return [];
   }
}

function RandNum(len){
    len = len || 4;
    if (isNaN(len)) len = 4;
    var rtn = "", rnd = 0;
    for(var i=0; i<len; i++) {
        rnd = Math.floor(Math.random()*10);
        if (rnd === 0) rnd = 6;
        rtn += rnd;
    }
    return rtn - 0; //转换为数字
}

var _ExcelOpt = null;
function ExportExcel(ExpOption) {
    if (ExpOption.fldname === undefined) $.extend(ExpOption,{fldname:""});
    if (ExpOption.fldesc === undefined) $.extend(ExpOption,{fldesc:""});
    if (ExpOption.fldict === undefined) $.extend(ExpOption,{fldict:""});
    if (ExpOption.xlsdesc === undefined) $.extend(ExpOption,{xlsdesc:"导出的Excel表格"});
    if (ExpOption.sql === undefined) {
        alert("没有查询语句，无法导出");
        return;
    }
    var tmp = ExpOption.sql.substring(0,5);
    if (tmp != "exec " && tmp != "selec") {
        alert("查询语句不正确，无法导出");
        return;
    }
    if (ExpOption.fldname === "" && ExpOption.fldesc !== "" || ExpOption.fldname !== "" && ExpOption.fldesc === "") {
        alert("列数目不相符，无法导出");
        return;
    }
    var arrTmp1 = ExpOption.fldname.split(",");
    var arrTmp2 = ExpOption.fldesc.split(",");
    if (arrTmp1.length !== arrTmp2.length) {
        alert("列数目不相符，无法导出");
        return;
    }
    _ExcelOpt = ExpOption;
    $("#__ExpXls").remove();
    $("body").append("<iframe id='__ExpXls' src='" + rup + "/app/ExportXls.aspx' style='display:none;'></iframe>");
}

//页面初始化
$(function() {
    var dialogFrameID = Req("_self");
    if (dialogFrameID !== "") {try {window.top.$("#" + dialogFrameID).dialog("option", "title", $(document).attr("title"));} catch(e) {}}
    SetCtrlDisplayAndUserAcc(1);
    window.setTimeout(function() {
        try {_FormLoad();} catch(ex) {}
    },16);
    flow.LoadFlowToolbar();
});

//2014-06-20 zhaoxin 列表多字段排序
var multiSortFieldList = [];
function GetJqGridMultiOrdSql(sf,st) {
    var blnNewField = true;
	var ordSQL = "";
	var oHeader = $(event.target).parent().parent();
    for (var i=0; i<multiSortFieldList.length; i++) {
	    if (multiSortFieldList[i].field === sf) {
		    multiSortFieldList[i].sort = st;
			blnNewField = false;
	    }
		ordSQL += "," + multiSortFieldList[i].field + " " + multiSortFieldList[i].sort;
	}
	if (blnNewField === true) {
	    multiSortFieldList.push({"field":sf, "sort":st});
		ordSQL += "," + sf + " " + st;
	}
	var sTemp = "";
	oHeader.children().each(function(i) {
	    sTemp = $(this).attr("id");
		sTemp = sTemp.substring(sTemp.lastIndexOf("_") + 1);
	    if (sTemp === sf) {return;}
		for (var j=0; j<multiSortFieldList.length; j++) {
			if (multiSortFieldList[j].field === sTemp) {
			    $(this).find(".s-ico").attr("style","");
				$(this).find("span[sort='" + multiSortFieldList[j].sort + "']").removeClass("ui-state-disabled");
				break;
			}
		}
	});
	return ordSQL.substring(1);
}