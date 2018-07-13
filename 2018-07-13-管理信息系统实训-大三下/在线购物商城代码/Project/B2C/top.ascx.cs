using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Server.Transfer("shopcar.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Server.Transfer("default.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Server.Transfer("oldgoods.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Server.Transfer("newgoods.aspx");
    }
}
