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
using System.Data.SqlClient;

public partial class left : System.Web.UI.UserControl
{
    SqlConnection leftstrcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string que = "select top 10  goodsID, GoodsName, SUM(price) AS dd from V_order_detail GROUP BY goodsID, GoodsName order by dd desc";
            SqlDataAdapter dap = new SqlDataAdapter(que, leftstrcon);
            DataSet daset = new DataSet();
            dap.Fill(daset);
            GridView1.DataSource = daset;
            GridView1.DataBind();
            string queone = "select * from tb_bbs";

            SqlDataAdapter dapone = new SqlDataAdapter(queone, leftstrcon);
            DataSet dasetone = new DataSet();
            dapone.Fill(dasetone);
            GridView2.DataSource = dasetone;
            GridView2.DataBind();

        }
        finally
        {
            leftstrcon.Close();
        }
        

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("login/login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Class2 sh = new Class2();
        try
        {
            leftstrcon.Open();
            string logque = "select count(*) from tb_member where username='"+loginname.Text+"' and password='"+loginpwd.Text+"'";
            SqlCommand dap = new SqlCommand(logque, leftstrcon);
            int co= (int)dap.ExecuteScalar();
            if (co > 0)
            {
                Session["wo"] = loginname.Text;
                Response.Write(sh.showmessage("登录成功"));
            }
        }
        finally
        {
            leftstrcon.Close();
        }
    }
}
