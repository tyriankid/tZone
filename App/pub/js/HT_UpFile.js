function _FormLoad() {
    $("#gd_pager_center").html("");  
    gd.navGrid("#gd_pager",{
        edit:false,add:false,del:false,refresh:false,search:false
    }).navButtonAdd("#gd_pager",{
        caption:"下载",
        disabled:true,
        title:"从服务器上下载文件到本地",
        buttonicon:"upload_normal.gif",
        onClickButton:function() {onOpt(gd.Item("filevpath"));}
    });
    if (Req("type") != "flow" && Req("type") != "flowup" && Req("type")!="view") {
      gd.navButtonAdd("#gd_pager",{
        caption:"上传",
        enabled:false,
        title:"上传本地文件到服务器",
        buttonicon:"ui-icon-arrowthickstop-1-n",
        onClickButton:function() {UploadFile();}
      }).navButtonAdd("#gd_pager",{
        caption:"删除",
        title:"删除选定的文件",
        buttonicon:"ui-icon-trash",
        onClickButton:function() {onOpt(gd.Item("rowid"));}
      });
    }
	if(Req("type")=="flowup")
	{
	  gd.navButtonAdd("#gd_pager",{
        caption:"上传",
        enabled:false,
        title:"上传本地文件到服务器",
        buttonicon:"ui-icon-arrowthickstop-1-n",
        onClickButton:function() {UploadFile();}
      });
	}
	if(Req("type")=="view")
	{
	   
	}
	if(isset($_POST["PHPSESSID"])){
		session_id($_POST["PHPSESSID"]);
	}
}
//JqGrid命令列调用方法
function JqGrid_CommandBtnsExec(oGrid, iRow, Cmd) {

	
}
function onOpt(url) {
    if (gd.RowIndex == 0) {
        alert("请选定要下载的文件");
        return;
    }
   if(url.indexOf("/") > -1)
    {
        if (url.length == "") {
            alert("没有附件!");
            return;
        }
        if (url.indexOf("/") > -1) {
            window.open(httpUrlRoot + "/uploadfile/pub/" + url);
        }
        else {
            Show("UlfList.aspx?rowid=" + url, 434, 358);
        }   
 
    }else
    {
       if(!confirm("你确定要删除吗？")) return;
       var memo="";
        
        if(Req("intr")=="arh")
    {
		memo="电子归档删除";
		if(gd.RowCount()==1)
		{
			 Sql.AddCmd("update PUB_Task_Info set ArchState=0 where rowid='"+ Req("rowid") +"'");
		}
    }
    else
    {
		memo="删除文件";
    }
       var sqlCmd = "delete Base_FileList where rowid = '"+gd.item("rowid")+"'";
       Sql.AddCmd(sqlCmd);
       Sql.AddCmd("insert into PUB_Log_Info(PubID,Message,LogUser,ObjID,Memo)values('"+ Req("rowid") +"','"+ memo +"','"+ uname +"','"+ Req("rowid") +"','')");
       var str = ExecSql(function(s){
             if(s!=""){
               alert(s);
               return;
             }
             else {
              gd.Refresh();
             }
       });
    }
}

function UploadFile() {
	
    //服务器上创建文件夹
    var sqlCmd = "";
	var title="";
	var memo="";
	var file = uploadPubfile(Req("rowid"));
	
    for (var i = 0; i < file.length; i++) 
    {     
        sqlCmd += "select '"+Req("rowid")+"','"+file[i].filename+"','"+file[i].filevpath+"','"+file[i].filesize+"','"+uname+"','"+Req("intr") +"' union ";
		title=file[i].filename;
    }
    if(sqlCmd.length <= 0)
    {
       return;
    }
    sqlCmd = sqlCmd.substr(0,sqlCmd.length - 6);
    sqlCmd = "insert into Base_FileList(objid,filename,filevpath,filesize,uploadUser,fileintr) "+sqlCmd;
    Sql.AddCmd(sqlCmd);
    if(Req("intr")=="arh")
    {
		memo="电子归档上传";
		 Sql.AddCmd("update PUB_Task_Info set ArchState=1 where rowid='"+ Req("rowid") +"'");
    }
    else
    {
		memo="上传文件";
    }
    Sql.AddCmd("insert into PUB_Log_Info(PubID,Message,LogUser,ObjID,Memo)values('"+ Req("rowid") +"','"+ memo +"','"+ uname +"','"+ Req("rowid") +"','')");
	//alert(sqlCmd);
    ExecSql(function(s){
      if(s!="")
      {
       alert(s);
       return;
      }
      else
      {
         gd.Refresh();  
      }
    });
   

}


