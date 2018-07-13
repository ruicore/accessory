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

public partial class adminmanger_ordermanger : System.Web.UI.Page
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
        //要执行的查询所有订单的语句
        string newque = "select a.orderid,a.username,b.truename,a.pay,a.carry,a.orderdate,case enforce when 0 then '未执行' else '已执行' end as zx from tb_order a left outer join tb_member b on a.username=b.username ";
        SqlDataAdapter datap = new SqlDataAdapter(newque, strcon);
        datap.Fill(dset);
        GridView1.DataSource = dset;
        this.GridView1.DataKeyNames = new string[] { "orderid" };
        GridView1.DataBind();
        strcon.Close();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        strcon.Open();
        string orderid = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
        //执行订单的sql语句
        SqlCommand comm = new SqlCommand("update tb_order set enforce=1 where orderid=" + orderid, strcon);
        comm.ExecuteNonQuery();
        dsdatabind();
        strcon.Close();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dsdatabind();
    }
}
