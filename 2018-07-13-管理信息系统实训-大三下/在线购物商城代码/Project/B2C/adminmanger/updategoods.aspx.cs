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

public partial class adminmanger_updategoods : System.Web.UI.Page
{
    protected SqlConnection strcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"].ToString());
    protected DataSet ds = new DataSet();
    protected string mes; 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Server.Transfer("adminpage.aspx");
        }
        mes = Request.QueryString["id"].ToString();
        if (!IsPostBack)
        {
            updatefill(mes);
        }
    }
    protected void updatefill(string id)
    {
        strcon.Open();
        ds.Clear();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from tb_goods where id=" + id, strcon);
        sqlda.Fill(ds);
        DataRow[] rows = ds.Tables[0].Select();
        foreach (DataRow row in rows)
        {
            TextBox1.Text=row["goodsname"].ToString();
            TextBox4.Text=row["introduce"].ToString();
            TextBox3.Text=row["price"].ToString();
            TextBox5.Text=row["nowprice"].ToString();
            TextBox2.Text=row["picture"].ToString();
            int newgoods=Convert.ToInt32(row["newgoods"]);
            if (newgoods== 0)
            {
                RadioButtonList1.SelectedIndex = 0;
            }
            else
            {
                RadioButtonList1.SelectedIndex = 1;
            }
        }
        strcon.Close();
         
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string goodsname = TextBox1.Text.ToString();//设置商品名称
        string introduce = TextBox4.Text.ToString();//设置商品描述
        double price = Convert.ToDouble(TextBox3.Text);//设置商品原价
        double nowprice = Convert.ToDouble(TextBox5.Text);//设置商品现在价格
        string picture = TextBox2.Text.ToString();//设置商品图片
        int newgoods;//标识是否为新上架商品
        if (RadioButtonList1.SelectedIndex == 0)
        {
            newgoods = 0;
        }
        else
        {
            newgoods = 1;
        }
        strcon.Open();//打开数据库连接
        //定义更新商品信息的SQL语句
        string ingo = "update tb_goods set goodsname='" + goodsname + "',introduce='" + introduce + "',price='" + price + "',nowprice='" + nowprice + "',picture='" + picture + "',newgoods='" + newgoods + "',intime='" + System.DateTime.Now + "' where id="+mes;
        SqlCommand goodsin = new SqlCommand(ingo, strcon);//生成命令执行对象
        goodsin.ExecuteNonQuery();//执行商品更新操作
        strcon.Close();//关闭数据库连接
        Response.Write("<script language='javascript'>alert('修改成功！');location='goodsmanage.aspx'</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void clearaddgoods()//清空文本框中的内容
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("goodsmanage.aspx");
    }
}
