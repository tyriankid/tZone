function _FormLoad() {
    //var btn=document.getElementById("btn_ReSearch");
    $(document).ready(function()
    { 
        $("#btn_ReSearch").hover(
		/*
            function(){
                $("#label3").css("color","red");
                $("#label3").fadeIn();
            },
            function(){
                $("#label3").hide();
            }

		*/
		
		function () { $("#label3").stop().animate({ 'opacity':1 },200 );  },
		function () { $("#label3").stop().animate({ 'opacity':0 },200 );  }
        );
    });
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

function ReSearch() {
    Search("Re");
}

function Search(e){
    if(dateEnd.GetText() == "" || dateStart.GetText() == "" )
    {
        alert("请填写出版开始和结束日期!");
        return;
    }

    Sql.AddCmd("select 1 ");
    
    var isExist="SELECT SUBSTRING(rowid,21,32) rowid,dep,CASE WHEN ky IS null THEN 0 ELSE ky END ky,CASE WHEN cb IS NULL THEN 0 ELSE cb END cb,CASE WHEN sg IS NULL THEN 0 ELSE sg END sg,CASE WHEN jg IS NULL THEN 0 ELSE jg END jg FROM result_totalsearch where startdate='"+dateStart.GetText()+"-"+dateEnd.GetText()+"'";

    var op="SELECT startdate,val as dep,CASE WHEN ky IS null THEN 0 ELSE ky END ky,CASE WHEN cb IS NULL THEN 0 ELSE cb END cb,CASE WHEN sg IS NULL THEN 0 ELSE sg END sg,CASE WHEN jg IS NULL THEN 0 ELSE jg END jg FROM (SELECT val FROM dbo.[_Base_DictData] WHERE typeid='E32BFE42796349B2B7DCA48400F5F8F1') a LEFT JOIN (SELECT startdate,dep, ky,cb,sg,jg  FROM result_totalsearch where startdate='"+dateStart.GetText()+"-"+dateEnd.GetText()+"') b ON a.val = b.dep";
    var oData=GetData(isExist)||[];
    if(oData.length > 0 && e != "Re")  //如果存在已经查找了过的区间数据,并且不是刷新查询,直接读取
    {
        jq.Open(op);
    }
    else
    {
        Sql.AddCmd("IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_totalsearch]') AND type in (N'U')) DROP TABLE [dbo].[temp_totalsearch] SELECT dbo.clip(a.keshi,':',1)dep,a.phasename,COUNT(DISTINCT b.volid) volcount INTO temp_totalsearch FROM dbo.prj_dwg_pub a JOIN dbo.prj_fdwgpub b ON a.rowid = b.pubid WHERE a.crtdate >= '"+dateStart.GetText()+"' and a.crtdate <= '"+dateEnd.GetText()+"' GROUP BY dbo.clip(a.keshi,':',1) ,a.phasename HAVING dbo.clip(a.keshi,':',1) IN (SELECT val FROM dbo.[_Base_DictData] WHERE typeid='E32BFE42796349B2B7DCA48400F5F8F1') AND a.phasename IN('可研','初步设计','施工图','竣工图')");
        if(e != "Re") //如果不是刷新查询,就插入新信息
        {
            Sql.AddCmd("INSERT INTO result_totalsearch (dep,ky,cb,sg,jg,startdate) SELECT dep,[可研] AS ky,[初步设计] AS cb,[施工图] AS sg,[竣工图] AS jg, '"+dateStart.GetText()+"-"+dateEnd.GetText()+"'AS startdate FROM (SELECT volcount,phasename,dep FROM temp_totalsearch) P PIVOT(sum(volcount)FOR phasename IN ([可研],[初步设计],[施工图],[竣工图]))AS pvt");
        }
        else//如果是刷新查询,就update,否则就会多出垃圾信息
        {
            Sql.AddCmd("delete from result_totalsearch where startdate='"+dateStart.GetText()+"-"+dateEnd.GetText()+"'");
            Sql.AddCmd("INSERT INTO result_totalsearch (dep,ky,cb,sg,jg,startdate) SELECT dep,[可研] AS ky,[初步设计] AS cb,[施工图] AS sg,[竣工图] AS jg, '"+dateStart.GetText()+"-"+dateEnd.GetText()+"'AS startdate FROM (SELECT volcount,phasename,dep FROM temp_totalsearch) P PIVOT(sum(volcount)FOR phasename IN ([可研],[初步设计],[施工图],[竣工图]))AS pvt");
        }
    }

    //查找出当前登记人部门
    var obj=GetData("select DEPID +':'+DepName depname,DepName dep FROM BASE_DepartInfo WHERE DEPID IN ( SELECT PdepId FROM vBaseDepList WHERE userid = '"+uinfo.substring(0,6)+"' AND jobType = 0)")||[];
    if(obj.length >0)
    {
    Sql.AddCmd("update result_totalsearch SET loadDep = '"+obj[0].depname+"' where startdate='"+dateStart.GetText()+"-"+dateEnd.GetText()+"'");
    }
    var Exec=ExecSql();
    if(Exec!=""){
        alert("执行失败！");
    }
    
    jq.Open(op);

}

function PrintReport() {
    if(jq.RowCount() < 1){
        alert("请先查询！");
        return;
    }
    //循环获取startdate
    var sdate;
    for(var i=0;i<jq.RowCount();i++)
    {
        sdate=jq.Item("startdate",i);
    }

    var rname = "卷册分类统计查询报表";

    Report.name = rname;    
    Report.objid =sdate;
    Report.objtype = "bdata";  
    Report.sdate = "2015-04-16"; 
    Report.Show();
}

function ReSet() {
    dateStart.SetText("");
    dateEnd.SetText("");
    jq.Clear();
}