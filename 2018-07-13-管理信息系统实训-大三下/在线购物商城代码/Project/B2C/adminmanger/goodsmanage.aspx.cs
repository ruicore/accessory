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
using System.Data.Sql;

public partial class adminmanger_goodsmanage : System.Web.UI.Page
{
    public  SqlConnection strcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Server.Transfer("adminpage.aspx");
        }
        if (!IsPostBack)
        {
            dsdatabind();
        }
     }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        strcon.Open();  //打开数据库连接
        string id = this.GridView1.DataKeys[e.RowIndex].Value.ToString();
        SqlCommand comm = new SqlCommand( "delete from tb_goods where id="+id, strcon);
        comm.ExecuteNonQuery();
        dsdatabind();
        strcon.Close();  //关闭数据库连接
    }
    protected void dsdatabind()  //绑定GridView1数据
    {
        //查询所有的商品
        string newque = "SELECT *, CASE newgoods WHEN 1 THEN '是' ELSE '否' END AS nngoods FROM tb_goods";
        GridView1.DataSource = DataBase.ReDataSet(newque);
        this.GridView1.DataKeyNames = new string[] { "id" };
        //绑定到前台GridView控件
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dsdatabind();
    }

}
