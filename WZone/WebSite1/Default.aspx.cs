using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WebReference.CarWebService car1 = new WebReference.CarWebService();
        
        Response.Write("<script>alert('"+car1.GetCars(1,"") +"') </script>");
    }
}
