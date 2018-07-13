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

public partial class login : System.Web.UI.Page
{
    SqlConnection strcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"]);
    Class2 sh = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (useryz(TextBox1.Text.ToString()))   //验证用户是否已存在
        {
            return;
        }
        strcon.Close();
        strcon.Open();
        string cardtype;
        string username = TextBox1.Text.ToString();
        string truename = TextBox2.Text.ToString();
        string password = TextBox3.Text.ToString();
        string city = TextBox5.Text.ToString();
        string address = TextBox6.Text.ToString();
        string postcode = TextBox7.Text.ToString();
        string cardno = TextBox8.Text.ToString();
        RBL1.Items[0].Selected = true;
        if (RBL1.Items[0].Selected)
            cardtype = "身份证";
        else
            if (RBL1.Items[1].Selected)
                cardtype = "学生证";
            else
                cardtype = "其它";
        string tel = TextBox9.Text.ToString();
        string email = TextBox10.Text.ToString();
        string sqlinsert = "insert into tb_member (username,truename,password,city,address,postcode,cardno,cardtype,tel,email) values('" + username + "','" + truename + "','" + password + "','" + city + "','" + address + "','" + postcode + "','" + cardno + "','" + cardtype + "','" + tel + "','" + email + "')";
        SqlCommand comm = strcon.CreateCommand();
        comm.CommandText = sqlinsert;
        SqlTransaction myTransaction = strcon.BeginTransaction(); //开始一个事务
        comm.Transaction = myTransaction;
        
    }
    protected Boolean useryz(string username)  //验证用户是否已存在
    {
        strcon.Open();
        SqlCommand comm = strcon.CreateCommand();
        comm.CommandText = "select username from tb_member";
        SqlDataReader reader = comm.ExecuteReader();
        while (reader.Read())
        {
            if (reader[0].ToString() == username)
            {
                Response.Write(sh.showmessage("该用户已存在！"));
                strcon.Close();
                return true ;     
            }
        }
        strcon.Close();
        return false;
    }
    protected void RBL1_SelectedIndexChanged(object sender, EventArgs e)
    {
      
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        ClearTextBox();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }
    protected void ClearTextBox()
    {
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        TextBox3.Text = string.Empty;
        TextBox4.Text = string.Empty;
        TextBox5.Text = string.Empty;
        TextBox6.Text = string.Empty;
        TextBox7.Text = string.Empty;
        TextBox8.Text = string.Empty;
        TextBox9.Text = string.Empty;
        TextBox10.Text = string.Empty;
    }
}
