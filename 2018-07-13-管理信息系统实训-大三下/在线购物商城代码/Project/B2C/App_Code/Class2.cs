using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections;

/// <summary>
/// Class2 的摘要说明
/// </summary>
public class Class2 : System.Web.UI.Page 
{
    public static DataSet godset=new DataSet();//定义购物的数据集
    public static string hh;
	public Class2()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public void godataset(string id)   //向Hashtable表中添加购商品的id和数量
    {
        if (Session["bus"] == null)
        {
            Hashtable ht = new Hashtable();             
            ht.Add(id, 1);
            Session["bus"] = ht;
            dafill(ht);
        }
        else
        {
            Hashtable ht = (Hashtable)Session["bus"];
            if (ht[id] == null)
            {
                ht[id] = 1;
            }
            else
            {
                ht[id] = (int)ht[id] + 1;
            }
            Session["bus"] = ht;
            dafill(ht);
        }     
    }
    public void godatasetjs(string id)   //向Hashtable表中减少购商品的id和数量
    {
        Hashtable ht = (Hashtable)Session["bus"];
        ht[id] = (int)ht[id] - 1;
        Session["bus"] = ht;
        dafill(ht);
    }
    //删除购物车里的东西
    public void Deletegoods(string id)
    {
        Hashtable ht = (Hashtable)Session["bus"];
        Hashtable ht2 = new Hashtable();
        foreach (DictionaryEntry item in ht)
        {
            if (item.Key.ToString() != id)
            {
                ht2.Add(item.Key, item.Value);
            }
        }
        Session["bus"] = ht2;
        dafill(ht2);
    }
    public void dafill(Hashtable ht)   //查询商品信息添加到数据集中
    {
        godset.Clear();
        foreach (DictionaryEntry de in ht)
        {
            hh = ht[de.Key.ToString()].ToString();
            SqlDataAdapter datap = new SqlDataAdapter("select *,'' as count from tb_goods where id='" + de.Key.ToString() + "'", System.Configuration.ConfigurationManager.AppSettings["ccc"]);
            if (datap != null)
            {
                datap.Fill(godset);
            }
        }
    }
    public string showmessage(string mes)  //提示信息
    {
        return "<script language='javascript'>alert('" + mes + "');location='javascript:history.go(-1)'</script>";
    }
}
