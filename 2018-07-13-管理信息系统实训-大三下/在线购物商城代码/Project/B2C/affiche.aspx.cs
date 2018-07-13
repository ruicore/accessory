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
using System.Data.Sql;
using System.Data.SqlClient;

public partial class showgoods_affiche : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int message = Convert.ToInt32(Request.QueryString["ID"]);
        string newque = "select * from tb_BBs where id=" + message;
        DataList1.DataSource = DataBase.ReDataSet(newque);
        DataList1.DataBind();
    }
}
