using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// DataBase 的摘要说明
/// 数据库访问通用类,用于返回数据集
/// </summary>
public class DataBase
{
    private static SqlConnection dbstrcon;
	public DataBase()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//   
	}
    public static DataSet ReDataSet(string FillSql)
    {   
        dbstrcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"]);
        dbstrcon.Open();
        SqlDataAdapter datapold = new SqlDataAdapter(FillSql, dbstrcon);
        DataSet olddset = new DataSet();
        datapold.Fill(olddset);
        dbstrcon.Close();
        return olddset;
    }
}

