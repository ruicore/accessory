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

public partial class adminmanger_membermanger : System.Web.UI.Page
{
    public SqlConnection strcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"]);
    DataSet dset = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Server.Transfer("adminpage.aspx");
        }
        strcon.Close();
        if (!IsPostBack)
        {
            dsdatabind();
        }
    }
    protected void dsdatabind()//绑定GridView1数据
    {
        //打开连接
        strcon.Open();
        //查询所有会员
        string newque = "SELECT * FROM tb_member";
        SqlDataAdapter datap = new SqlDataAdapter(newque, strcon);
        datap.Fill(dset);
        //设置数据源
        GridView2.DataSource = dset;
        //设置主键
        this.GridView2.DataKeyNames = new string[] { "id" };
        GridView2.DataBind();
        strcon.Close();
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        strcon.Open();
        string id = this.GridView2.DataKeys[e.RowIndex].Value.ToString();
        SqlCommand comm = new SqlCommand("delete from tb_member where id=" + id, strcon);
        comm.ExecuteNonQuery();
        strcon.Close();
        dsdatabind();
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        dsdatabind();
    }
}
