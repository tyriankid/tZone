﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class PUB_Query_Task_Info : BasePage {
    private const string pagerowid = "";
    private string psid = "";
    protected void Page_Load(object sender, EventArgs e) {
        psid = Request.PhysicalPath.Substring(3).Replace("\\", "-").Replace(".aspx", "");
        SetPageRowid(pagerowid);
        cbphase.Items.AddRange(GetListItems("select val,txt from _Base_DictData where typeid=%qt;F5CBCB0B655244B88C72A3F7009544D2%qt;"));
            cbtype.Items.AddRange(GetListItems("select val,txt from _Base_DictData where typeid=%qt;3D5511EACC03493990DEA3F70096715A%qt;"));
            cbstate.Items.AddRange(GetListItems("select val,txt from _Base_DictData where typeid=%qt;44E456BCD438441CA314A3F600A54059%qt;"));
            
        
    }
    
    

    //TreeList数据绑定
    private void GetTreeListData(DevExpress.Web.ASPxTreeList.ASPxTreeList oTree, string SqlCmd) {
        DataSet ds = null;
        if (!IsPostBack) Session.Remove(psid + "_" + oTree.ID + "_sql");
        if (Session[psid + "_" + oTree.ID + "_sql"] == null) {
            SqlCmd = RiaBase.GetDynamicValue(SqlCmd);
        } else {
            SqlCmd = Session[psid + "_" + oTree.ID + "_sql"].ToString();
        }
        ds = DBHelper.GetDataSetBySql(SqlCmd);
        oTree.DataSource = ds;
        oTree.DataBind();
        ds = null;
    }
}
