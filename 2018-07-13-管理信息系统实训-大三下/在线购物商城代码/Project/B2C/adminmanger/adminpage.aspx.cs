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


public partial class adminmanger_adminpage : System.Web.UI.Page
{
    SqlConnection strcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"]);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        strcon.Open();
        try
        {
            string logque = "select count(*) from tb_manager where manager='" + Login1.UserName.ToString() + "' and Pwd='" + Login1.Password.ToString() + "'";
            SqlCommand dap = new SqlCommand(logque, strcon);
            int co = (int)dap.ExecuteScalar();
            if (co > 0)
            {
                Session["admin"] = Login1.UserName.ToString();
                Server.Transfer("goodsmanage.aspx");
            }
        }
        finally
        {
            strcon.Close();
        }
    }
}
