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

public partial class adminmanger_addgg : System.Web.UI.Page
{
    SqlConnection strcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"]);//连接数据库
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
        strcon.Open();
        string newque = "SELECT * FROM tb_BBS";
        SqlDataAdapter datap = new SqlDataAdapter(newque, strcon);
        datap.Fill(dset);
        GridView1.DataSource = dset;
        this.GridView1.DataKeyNames = new string[] { "id" };
        GridView1.DataBind();
        strcon.Close();
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        Server.Transfer("goodsmanage.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        strcon.Open();
        string id = this.GridView1.DataKeys[e.RowIndex].Value.ToString();
        SqlCommand comm = new SqlCommand("delete from tb_BBS where id=" + id, strcon);
        comm.ExecuteNonQuery();
        strcon.Close();
        dsdatabind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        dsdatabind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        dsdatabind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        strcon.Open();
        string uid = this.GridView1.DataKeys[e.RowIndex].Value.ToString();
        GridViewRow row = this.GridView1.Rows[e.RowIndex];
        string ingo = "update tb_BBS set title='" + ((TextBox)(row.Cells[0].Controls[0])).Text.ToString() + "',content='" + ((TextBox)(row.Cells[1].Controls[0])).Text.ToString() + "' where id=" +uid;
        SqlCommand goodsin = new SqlCommand(ingo, strcon);
        goodsin.ExecuteNonQuery();
        strcon.Close();
        GridView1.EditIndex = -1;
        dsdatabind();
    }

}
