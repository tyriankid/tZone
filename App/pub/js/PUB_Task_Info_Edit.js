var msgall="";
function _FormLoad() {
    if(Req("rowid")=="")
    {
        txtrid.SetText(S.guid);
        $("#label4").text(S.date.y);
        cbmajor.SetSelectedIndex(0);
        SetDefTime();
        cbphase.SetSelectedIndex(0);
        cbtype.SetSelectedIndex(0);
        txtnum.SetText(0);
        cbColor.SetSelectedIndex(0);
        cbbook.SetSelectedIndex(0);
        cbcover.SetSelectedIndex(0);
        cbIsoNo.SetSelectedIndex(0);
        ChangeAllTypes(7);
        ChangeAllTypes(8);
        ChangeAllTypes(9);
        ChangeAllTypes(10);
        ChangeAllTypes(11);

        txtMaker.SetEnabled(false);
        combox8.SetSelectedIndex(0);
        combox8.SetEnabled(false);

        checkbox2.SetChecked(true) 
    }
    else
    {
        txtMaker.SetText($ONM(_txtMaker.GetText()));
        combox8.SetEnabled(false);
        $("#label4").text(appday.GetText().substring(0,4));
        txtdep.SetText($ONM(_txtdep.GetText()));
        txtuser.SetText($ONM(_txtuser.GetText()));
        //alert(_IsoNo.GetText().substring(3,4));
        cbIsoNo.SetText(_IsoNo.GetText().substring(3,4));
        txtIsoNo.SetText(_IsoNo.GetText().substring(9));
        cbIsoNo.SetEnabled(false);
    }
     $("#iframe1").attr("src","../PUB/HT_UpFile.aspx?&type=add&rowid="+txtrid.GetText()+"&intr=pub");
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
//选择申请人
function SelectAppUser(){
      var str= SelObject({type:"u",selcount:1,modal:"div",ctrl:"txtuser"},function(str){
     if(str.length>0)
     {
        AppUserInfo(str[0].id);
        MakeMsg(2);
     }
     });
}
//选择申请部门
function SelectAppDep(){
      var str= SelObject({type:"d",selcount:1,modal:"div",ctrl:"txtdep"},function(str){
     if(str.length>0)
     {
        MakeMsg(21);
     }
     });
}
//选择制作人
function SelectMaker(){
      var str= SelObject({type:"u",selcount:1,modal:"div",ctrl:"txtProducer"},function(str){
     if(str.length>0)
     {
        _txtMaker.SetText(str[0].id+":"+str[0].text);
        txtMaker.SetText(str[0].text);
        MakeMsg(20);
     }
     });
}
//获取申请人相关信息
function AppUserInfo(s){
    var sql="select office_phone,mobile,bussiness_dep  from HR_Staff_Details where staff_rowid='"+ s +"'";
    var obj=GetData(sql)||[];
    if(obj.length>0)
    {
        txtdep.SetText($ONM(obj[0].bussiness_dep));
        _txtdep.SetText(obj[0].bussiness_dep);
        txtphone.SetText(obj[0].office_phone);
        txtmobile.SetText(obj[0].mobile);
    }
}
function SetDefTime(){
    var mydate=new Date();
    appday.SetText(S.date.day);
    needday.SetText(S.date.day);
    apphh.SetText(mydate.getHours());
    appmm.SetText(mydate.getMinutes());
    needhh.SetText(mydate.getHours()*1+2);
    needmm.SetText(mydate.getMinutes());
}
function ChangeAllTypes(s){
    if(s==7)
    {
    _cbphase.SetText(cbphase.GetText());
    }
    if(s==8)
    {
    _cbtype.SetText(cbtype.GetText());
    }
    if(s==9)
    {
    _cbColor.SetText(cbColor.GetText());
    }
    if(s==10)
    {
    _cbcover.SetText(cbcover.GetText());
    }
    if(s==11)
    {
    _cbbook.SetText(cbbook.GetText());

    }
        //alert(s);
        MakeMsg(s);
}
function Add(){
    jq.AddRow({
        PubID:txtrid.GetText(),
        VolTitle:"",
        CopyCount:"-",
        ColorTypeName:"-",
        Memo:""
    });
    MakeMsg(17);
}
function Del(){
    if(jq.RowIndex<1)
    {
        alert("至少选择一行数据");
        return;
    }
    if(!confirm("是否确认删除?")) return ;
    jq.DelRow();
    MakeMsg(18);
}



function Save(){
    if(!CheckSave())
    {
        return;
    }
    /*2015-01-08 为申请人文本框手动填写做处理,通过选人框选的院内人事不做处理,手动输入则与隐藏文本框同步内容*/
    //1.直接手动填写姓名;2.从选人框选人之后,手动填写姓名;3.填写了姓名后又从选人框选人
    //(1:,输入框和隐藏框不符合,保存输入框;2:输入框和隐藏框内容不一致,保存输入框,3:输入框和隐藏框内容一致,不作处理)
    //只用判断输入框和隐藏框的uname是否一致,若不一致,将输入框同步至隐藏框即可
    if(_txtuser.GetText()=="")
    {
        _txtuser.SetText("null");//因为$ONM在控件内容为空时会出错,故提前做判断处理
    }
    if(txtuser.GetText() != $ONM(_txtuser.GetText()))
    {
        _txtuser.SetText("******:"+txtuser.GetText());//因为渲染委托单时用的是substring 7,12所以手动填写申请人的话前面不会带U12345:,故在此加上6个'*'和一个':'占位
    }
    /*2015-01-08     end*/
    if(Req("rowid")=="")
    {
        var sql = "exec _Pub_BuilderPrjCode '"+ cbIsoNo.GetText() +"'" ;
        var oData = GetData(sql)||[];
        if(oData.length>0)
        {
        var prjcode= oData[0].num;
        _IsoNo.SetText(prjcode);
        }
        txtTaskuser.SetText(uinfo);
        ds.Insert(Data);
    }
    else
    {
        ds.Update(Data);
    }
}
function Data(s){
    var sqlstr="";
    if(s==""){
        jq.uptcell();
        Sql.AddCmd("delete from PUB_Vol_Info where pubid='"+ txtrid.GetText() +"'");
        for(var i=1;i<=jq.RowCount();i++)
        {
            sqlstr="Insert into PUB_Vol_Info(PubID,VolTitle,CopyCount,ColorTypeName,Memo,Ordidx)values('"+ txtrid.GetText() +"','"+ jq.item("VolTitle",i) +"',";
            sqlstr+=" '"+ jq.item("CopyCount",i) +"','"+ jq.item("ColorTypeName",i) +"','"+ jq.item("memo",i) +"',"+ i +")";
            Sql.AddCmd(sqlstr);
        }
        if(Req("rowid")=="")
        {
            Sql.AddCmd("insert into PUB_Log_Info(PubID,Message,LogUser,ObjID,Memo)values('"+ txtrid.GetText() +"','新任务','"+ uname +"','"+ txtrid.GetText() +"','')");
        }
        else
        {
            msgall=msgall.substring(1);
            msgall="["+msgall+"]";
            Sql.AddCmd("insert into PUB_Log_Info(PubID,Message,LogUser,ObjID,Memo)values('"+ txtrid.GetText() +"','编辑"+ msgall +"','"+ uname +"','"+ txtrid.GetText() +"','')");
        }

        if(!checkbox2.GetChecked())
        {
            Sql.AddCmd("update PUB_Task_Info set ArchState=2 where rowid='"+ txtrid.GetText() +"'");
        }
        ExecSql(function(s){
            if(s=="")
            {
                alert("保存成功");
                dialog.close("ok");
                /*2015-01-12 保存完毕后关闭该页面,并弹出任务详情页面*/
                if(Req("rowid")=="")//新建的情况下才会弹出详情页面
                {
                    dialog.show("PUB_Task_Info_Detail.aspx?rowid="+txtrid.GetText(),1008,745,function(s) { });
                }
                /*2015-01-12   End*/
            }
            else
            {
                alert(s);
                return;
            }
        });
    }
    else
    {
        alert(s);
        return;
    }
}
function ChangeIsoNo(){
    //alert("212"+cbIsoNo.GetText()+"-"+$("#label4").text()+"-"+txtIsoNo.GetText());
    _IsoNo.SetText("212"+cbIsoNo.GetText()+"-"+$("#label4").text()+"-"+txtIsoNo.GetText());
    MakeMsg(1);
}
//生成日志信息串
function MakeMsg(s){
    //msgall="";
    if(s==1)
    {
        if(msgall.indexOf("任务单号")<0)
        {
            msgall+=",任务单号";
        }
    }
    if(s==2)
    {
        if(msgall.indexOf("申请人")<0)
        {
            msgall+=",申请人";
        }
    }
    if(s==3)
    {
        if(msgall.indexOf("座机")<0)
        {
            msgall+=",座机";
        }
    }
    if(s==4)
    {
        if(msgall.indexOf("手机")<0)
        {
            msgall+=",手机";
        }
    }
    if(s==5)
    {
        if(msgall.indexOf("申请时间")<0)
        {
            msgall+=",申请时间";
        }
    }
    if(s==6)
    {
        if(msgall.indexOf("需求时间")<0)
        {
            msgall+=",需求时间";
        }
    }
    if(s==7)
    {
        
        if(msgall.indexOf("设计阶段")<0)
        {
            msgall+=",设计阶段";
        }
    }
    if(s==8)
    {
        if(msgall.indexOf("类别")<0)
        {
            msgall+=",类别";
        }
    }
    if(s==9)
    {
        if(msgall.indexOf("颜色")<0)
        {
            msgall+=",颜色";
        }
    }
    if(s==10)
    {
        if(msgall.indexOf("封面要求")<0)
        {
            msgall+=",封面要求";
        }
    }
    if(s==11)
    {
        if(msgall.indexOf("装订方式")<0)
        {
            msgall+=",装订方式";
        }
    }
    if(s==12)
    {
        if(msgall.indexOf("任务名称")<0)
        {
            msgall+=",任务名称";
        }
    }
    if(s==13)
    {
        if(msgall.indexOf("份数")<0)
        {
            msgall+=",份数";
        }
    }
    if(s==14)
    {
        if(msgall.indexOf("脊背印字")<0)
        {
            msgall+=",脊背印字";
        }
    }
    if(s==15)
    {
        if(msgall.indexOf("需要归档")<0)
        {
            msgall+=",需要归档";
        }
    }
    if(s==16)
    {
        if(msgall.indexOf("特殊说明")<0)
        {
            msgall+=",特殊说明";
        }
    }
    if(s==17)
    {
        if(msgall.indexOf("新增卷册")<0)
        {
            msgall+=",新增卷册";
        }
    }
    if(s==18)
    {
        if(msgall.indexOf("删除卷册")<0)
        {
            msgall+=",删除卷册";
        }
    }
     if(s==19)
    {
        if(msgall.indexOf("专业")<0)
        {
            msgall+=",专业";
        }
    }
     if(s==20)
    {
        if(msgall.indexOf("制作人")<0)
        {
            msgall+=",制作人";
        }
    }
     if(s==21)
    {
        if(msgall.indexOf("申请部门")<0)
        {
            msgall+=",申请部门";
        }
    }
 
}
function CheckSave(){
    if(prjname.GetText()=="")
    {
        alert("任务名称不能为空");
        return false;
    }
    /*if(jq.RowCount()<1)
    {
        alert("卷册不能为空");
        return false;
    }*/
    if(appday.GetText() > needday.GetText())
    {
        alert("申请时间不能大于需要时间");
        return false;
    }
    if(appday.GetText() == needday.GetText() && needhh.GetText() * 1 - apphh.GetText() * 1 < 0)
    {
        alert("申请时间不能大于需要时间");
        return false;
    }
    if(appday.GetText() == needday.GetText() && needhh.GetText() * 1 - apphh.GetText() * 1 == 0 && needmm.GetText() * 1 < appmm.GetText() * 1)
    {
        alert("申请时间不能大于需要时间");
        return false;
    }
    
    if(txtuser.GetText()=="")
    {
        alert("申请人不能为空");
        return false;
    }
    if(txtdep.GetText() == "")
    {
        alert("部门不能为空");
        return false;
    }
    if(msgall=="")
    {
        alert("没有任何改动,无需保存!");
        return false;
    }
    /*2015-01-16 小几率会出现因网络原因导致新建出多条的情况,保存前加一个处理*/
    var sql=GetData("select rowid from pub_task_info where rowid = '"+txtrid.GetText()+"'")||[];
    if(sql.length>0)
    {
        if(Req("rowid")=="")  //如果rowid重复并且这个页面是新建页面
        {
            return false;
        }
    }
    

    return true;
}
function PrintReport(){
    var rname="出版委托单(新)";
    Report.name =rname;    
    Report.objid =txtrid.GetText();
    Report.objtype = "bdata";  
    Report.sdate = "2014-12-17"; 
    Report.Show();
}