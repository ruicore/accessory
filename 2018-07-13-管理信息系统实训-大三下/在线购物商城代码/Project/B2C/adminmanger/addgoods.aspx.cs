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

public partial class adminmanger_addgoods : System.Web.UI.Page
{
    protected SqlConnection strcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"].ToString());
    protected DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Server.Transfer("adminpage.aspx");
        }
        strcon.Open();
        int message = Convert.ToInt32(Request.QueryString["ID"]);
        if (!IsPostBack)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from tb_supertype", strcon);
            sqlda.Fill(ds);
            DataRow[] rows = ds.Tables[0].Select();
            foreach (DataRow row in rows)
            {
                ListItem newitem = new ListItem();
                newitem.Text = row["TypeName"].ToString();
                newitem.Value = row["id"].ToString();
                DropDownList1.Items.Add(newitem);
            }
        }
        strcon.Close();
        if (DropDownList1.Text != "")
        {
            binddd2();
        }
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text != "")
        {
            binddd2();
        }
    }
    protected void binddd2()    //绑定DropDownList2中的数据
    {        
        strcon.Open();
        ds.Clear();
        DropDownList2.Items.Clear();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from tb_subtype where supertype="+DropDownList1.SelectedItem.Value, strcon);
        sqlda.Fill(ds);
        DataRow[] rows = ds.Tables[0].Select();
        foreach (DataRow row in rows)
        {
            ListItem newitem = new ListItem();
            newitem.Text = row["TypeName"].ToString();
            newitem.Value = row["id"].ToString();
            DropDownList2.Items.Add(newitem);
        }
        strcon.Close();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string ty = DropDownList2.SelectedValue;
        string typeid = Request["DropDownList2"];
        string goodsname = TextBox1.Text.ToString();
        string introduce = TextBox4.Text.ToString();
        double price = Convert.ToDouble(TextBox3.Text);
        double nowprice = Convert.ToDouble(TextBox5.Text);
        string picture = "image/goodsima/"+TextBox2.Text.ToString();
        int newgoods;
        if (RadioButtonList1.SelectedIndex == 0)
        { 
            newgoods = 0; 
        }
        else
        {
            newgoods = 1;
        }
        strcon.Open();
        string ingo = "insert into tb_goods (typeid,goodsname,introduce,price,nowprice,picture,newgoods,intime) values('"+typeid+"','"+goodsname+"','"+introduce+"','"+price+"','"+nowprice+"','"+picture+"','"+newgoods+"','"+System.DateTime.Now+"')";
        SqlCommand goodsin = new SqlCommand(ingo,strcon);
        goodsin.ExecuteNonQuery();
        strcon.Close();
        clearaddgoods();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        clearaddgoods();
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
    protected void Button4_Click(object sender, EventArgs e)
    {
        string filePath = "", fileExtName = "", mFileName, mPath;
        System.Text.StringBuilder strMsg = new System.Text.StringBuilder("上传文件信息;<hr color=red>");
        if(""!=fileUp.PostedFile.FileName)
        {
            filePath = fileUp.PostedFile.FileName;
            fileExtName = filePath.Substring(filePath.LastIndexOf(".")+1);
            try
            {
                mPath = Server.MapPath("../image/goodsima/");
                mFileName = filePath.Substring(filePath.LastIndexOf("\\") + 1);
                fileUp.PostedFile.SaveAs(mPath + mFileName);
                TextBox2.Text = mFileName;
            }
            catch (Exception err)
            {
                Response.Write(err.ToString());
            }
        }
    }
}
