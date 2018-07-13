<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public class Handler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        string t = HttpContext.Current.Request["t"];
        switch (t)
        {
            case "Login":
                Login(context);
                break;
            case "CheckLogin":
                CheckLogin(context);
                break;
            case "SelectType":
                SelectType(context);
                break;
            case "Reg":
                Reg(context);
                break;
            case "GetBBs":
                GetBBs(context);
                break;
            case "GetshopCar":
                GetshopCar(context);
                break;
            case "UpdateNum":
                UpdateNum(context);
                break;
            case "SetXml":
                SetXml(context);
                break;
            case "AddAdr":
                AddAdr(context);
                break;
            case "GetAdr":
                GetAdr(context);
                break;
            case "AddOrder":
                AddOrder(context);
                break;
            case "GetGoodList":
                GetGoodList(context);
                break;
            case "GetGoodDetile":
                GetGoodDetile(context);
                break;
            case "Buy":
                Buy(context);
                break;
            case "GetPh":
                GetPh(context);
                break;
            case "Select":
                Select(context);
                break;
            case "SetSelectStr":
                SetSelectStr(context);
                break;
            case "GoodShow":
                GoodShow(context);
                break;
            case "GetOrderList":
                GetOrderList(context);
                break;
            case "outhTML":
                outhTML(context);
                break;
        }
    }
    SqlConnection leftstrcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"]);
    SqlConnection strcon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ccc"]);
    /// <summary>
    /// 退出网站
    /// </summary>
    /// <param name="context"></param>
    public void outhTML(HttpContext context)
    {
        HttpContext.Current.Session["wo"] = null;
        context.Response.Write("{\"status\":\"0\"}");
    }
    /// <summary>
    /// 获取订单列表
    /// </summary>
    /// <param name="context"></param>
    public void GetOrderList(HttpContext context)
    {
        string username = HttpContext.Current.Session["wo"].ToString();
        string sql = "select c.picture,c.goodsName,c.nowPrice,b.number,a.pay,a.OrderDate,a.enforce from tb_order a,tb_order_detail b,tb_goods c where a.OrderID=b.orderID and b.goodsID=c.ID and a.username='" + username + "'";
        DataSet dssuper = DataBase.ReDataSet(sql);
        DataTable dt = dssuper.Tables[0];
        if (dt.Rows.Count > 0)
        {
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        else
        {
            context.Response.Write("{\"status\":\"-1\"}");
        }
    }
    /// <summary>
    /// 新品上架或者特价商品
    /// </summary>
    public void GoodShow(HttpContext context)
    {
        string type = HttpContext.Current.Request["type"];
        string sql = "";
        if (type == "0")
        {
            sql = "select * from tb_goods where newgoods=1 ";
        }
        else
        {
            sql = "select * from tb_goods where newgoods=0 ";
        }
        DataSet dssuper = DataBase.ReDataSet(sql);
        DataTable dt = dssuper.Tables[0];
        if (dt.Rows.Count > 0)
        {
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        else
        {
            context.Response.Write("{\"status\":\"-1\"}");
        }
    }
    /// <summary>
    /// 设置查询内容，url就不用编码了
    /// </summary>
    public void SetSelectStr(HttpContext context)
    {
        HttpContext.Current.Session["str"] = HttpContext.Current.Request["str"];
        context.Response.Write("{\"status\":\"0\"}");
    }
    /// <summary>
    /// 查询
    /// </summary>
    /// <param name="context"></param>
    public void Select(HttpContext context)
    {
        string str = HttpContext.Current.Session["str"].ToString();
        string sql = "select * from tb_goods where goodsName like '%" + str + "%'";
        DataSet dssuper = DataBase.ReDataSet(sql);
        DataTable dt = dssuper.Tables[0];
        if (dt.Rows.Count > 0)
        {
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        else
        {
            context.Response.Write("{\"status\":\"-1\"}");
        }
    }
    /// <summary>
    /// 获取排行
    /// </summary>
    public void GetPh(HttpContext context)
    {
        string sql = "select top 10  goodsID, V_order_detail.GoodsName, SUM(V_order_detail.price) AS dd,picture,tb_goods.price from V_order_detail,tb_goods where tb_goods.ID=V_order_detail.goodsID GROUP BY goodsID, V_order_detail.GoodsName,picture,tb_goods.price order by dd desc";
        DataSet dssuper = DataBase.ReDataSet(sql);
        DataTable dt = dssuper.Tables[0];
        if (dt.Rows.Count > 0)
        {
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        else
        {
            context.Response.Write("{\"status\":\"-1\"}");
        }
    }
    /// <summary>
    /// 点击购买按钮
    /// </summary>
    /// <param name="context"></param>
    public void Buy(HttpContext context)
    {
        string id = HttpContext.Current.Request["id"];
        Class2 sh = new Class2();
        sh.godataset(id);
        context.Response.Write("{\"status\":\"0\"}");
    }
    /// <summary>
    /// 查询产品详细
    /// </summary>
    public void GetGoodDetile(HttpContext context)
    {
        string id = HttpContext.Current.Request["id"];
        string sql = "select * from tb_goods where id=" + id;
        DataSet dssuper = DataBase.ReDataSet(sql);
        DataTable dt = dssuper.Tables[0];
        if (dt.Rows.Count > 0)
        {
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        else
        {
            context.Response.Write("{\"status\":\"-1\"}");
        }
    }
    /// <summary>
    /// 根据类型查询产品
    /// </summary>
    /// <param name="context"></param>
    public void GetGoodList(HttpContext context)
    {
        string typeid = HttpContext.Current.Request["typeid"];
        string sql = "select * from tb_goods where typeid=" + typeid;
        DataSet dssuper = DataBase.ReDataSet(sql);
        DataTable dt = dssuper.Tables[0];
        if (dt.Rows.Count > 0)
        {
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        else
        {
            context.Response.Write("{\"status\":\"-1\"}");
        }
    }
    /// <summary>
    /// 添加订单
    /// </summary>
    /// <param name="context"></param>
    public void AddOrder(HttpContext context)
    {
        //订单支付方法
        string DDfa = HttpContext.Current.Request["DDfa"];
        //订单金额
        string DDyu = HttpContext.Current.Request["DDyu"];
        //订单说明
        string Des = HttpContext.Current.Request["Des"];
        string insertsql;
        strcon.Open(); //打开数据连接
        try
        {
            insertsql = "insert into tb_order(username,pay,carry,orderdate,enforce,bz) values('" + HttpContext.Current.Session["wo"].ToString() + "','" + DDfa + "','" + DDyu + "','" + System.DateTime.Now + "','" + 0 + "','" + Des + "')";
            SqlCommand commz = strcon.CreateCommand();
            commz.CommandText = insertsql; //插入主表信息
            commz.ExecuteNonQuery();
            Int64 orderid = 0;
            SqlDataAdapter adamax = new SqlDataAdapter("select max(orderid) as ordmax from tb_order", strcon);
            DataSet maxds = new DataSet();
            adamax.Fill(maxds);
            DataRow[] rows = maxds.Tables[0].Select();
            foreach (DataRow row in rows)
            { orderid = Convert.ToInt64(row["ordmax"]); }


            DataTable dt = Class2.godset.Tables[0];
            //dt.Columns.Add("count");
            foreach (DataRow dr in dt.Rows)
            {
                dr["count"] = GetCount(dr["ID"].ToString());
                int goodsid = int.Parse(dr["ID"].ToString());
                Double price = Double.Parse(dr["nowPrice"].ToString());
                int number = int.Parse(dr["count"].ToString());
                insertsql = "insert into tb_order_detail (orderid,goodsid,price,number) values('" + orderid + "','" + goodsid + "','" + price + "','" + number + "')";
                //明细表信息插入
                commz.CommandText = insertsql;
                commz.ExecuteNonQuery();
            }
        }
        catch
        {
        }
        finally
        {
            Class2.godset.Clear();     //清空数据集
            HttpContext.Current.Session["bus"] = null;
            //Response.Redirect("shopcar.aspx");
            context.Response.Write("{\"status\":\"0\"}");
        }
    }

    /// <summary>
    /// 查询地址
    /// </summary>
    /// <param name="context"></param>
    public void GetAdr(HttpContext context)
    {
        string userName = HttpContext.Current.Session["wo"].ToString();
        string sql = "select * from Adr where userName='" + userName + "'";
        DataSet dssuper = DataBase.ReDataSet(sql);
        DataTable dt = dssuper.Tables[0];
        if (dt.Rows.Count > 0)
        {
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        else
        {
            context.Response.Write("{\"status\":\"-1\"}");
        }
    }
    /// <summary>
    /// 添加地址
    /// </summary>
    /// <param name="context"></param>
    public void AddAdr(HttpContext context)
    {
        string adr = HttpContext.Current.Request["adr"];
        string Des = HttpContext.Current.Request["Des"];
        string phone = HttpContext.Current.Request["phone"];
        string mobil = HttpContext.Current.Request["mobil"];
        string email = HttpContext.Current.Request["email"];
        string bieming = HttpContext.Current.Request["bieming"];
        string Names = HttpContext.Current.Request["Names"];
        string userName = HttpContext.Current.Session["wo"].ToString();
        string sql = "delete Adr where UserName='" + userName + "'; insert into Adr(id,adr,Des,phone,mobil,email,bieming,Names,UserName) values('" + Guid.NewGuid().ToString() + "','" + adr + "','" + Des + "','" + phone + "','" + mobil + "','" + email + "','" + bieming + "','" + Names + "','" + userName + "')";
        strcon.Close();
        strcon.Open();
        SqlCommand comm = strcon.CreateCommand();
        comm.CommandText = sql;
        SqlTransaction myTransaction = strcon.BeginTransaction(); //开始一个事务
        comm.Transaction = myTransaction;
        try
        {
            comm.ExecuteNonQuery();
            myTransaction.Commit();  //提交事务

        }
        catch
        {
            myTransaction.Rollback();  //回滚事务
        }
        finally
        {
            strcon.Close();
        }
        context.Response.Write("{\"status\":\"0\"}");
    }
    /// <summary>
    /// 修改购物车数量
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    public void UpdateNum(HttpContext context)
    {
        Class2 sh = new Class2();
        string id = HttpContext.Current.Request["id"];
        string type = HttpContext.Current.Request["type"];
        if (HttpContext.Current.Session["wo"] == null)
        {
            context.Response.Write("{\"status\":\"-1\"}");//请登录
        }
        else
        {
            if (type == "1")
            {
                //增加一个
                sh.godataset(id);
            }
            else
            {
                //减少一个
                sh.godatasetjs(id);
            }

            context.Response.Write("{\"status\":\"0\"}");
        }
    }
    /// <summary>
    ///删除购物车
    /// </summary>
    public void SetXml(HttpContext context)
    {
        Class2 sh = new Class2();
        string id = HttpContext.Current.Request["id"];
        sh.Deletegoods(id);
        Class2.godset.WriteXml("F:\\aa.xml", XmlWriteMode.DiffGram);
        context.Response.Write("{\"status\":\"0\"}");
    }
    /// <summary>
    /// 获取购物车的数量
    /// </summary>
    /// <param name="context"></param>
    public string GetCount(string id)
    {
        string count = ((System.Collections.Hashtable)(HttpContext.Current.Session["bus"]))[id].ToString();
        return count;
    }
    /// <summary>
    /// 获取购物车
    /// </summary>
    /// <param name="context"></param>
    public void GetshopCar(HttpContext context)
    {
        Class2.godset.WriteXml("C:\\Design\\aa.xml", XmlWriteMode.DiffGram);
        try
        {
            if (Class2.godset.Tables[0].Rows.Count > 0)
            {
                DataTable dt = Class2.godset.Tables[0];
                //dt.Columns.Add("count");
                foreach (DataRow dr in dt.Rows)
                {
                    dr["count"] = GetCount(dr["ID"].ToString());
                }
                string json = f.ToJson(dt);
                json = json.Replace("\"", "\\\"");
                context.Response.Write("{\"status\":\"" + json + "\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
            }
        }
        catch
        {

        }
    }
    /// <summary>
    /// 注册
    /// </summary>
    /// <param name="context"></param>
    public void Reg(HttpContext context)
    {
        string userName = HttpContext.Current.Request["userName"];
        if (useryz(userName))   //验证用户是否已存在
        {
            context.Response.Write("{\"status\":\"-1\"}");
            return;
        }
        string trueName = HttpContext.Current.Request["trueName"];
        string pwd = HttpContext.Current.Request["pwd"];
        string city = HttpContext.Current.Request["city"];
        string lx = HttpContext.Current.Request["lx"];
        string yb = HttpContext.Current.Request["yb"];
        string number = HttpContext.Current.Request["number"];
        string cardType = HttpContext.Current.Request["cardType"];
        string email = HttpContext.Current.Request["email"];
        string phone = HttpContext.Current.Request["phone"];
        string sqlinsert = "insert into tb_member (username,truename,password,city,address,postcode,cardno,cardtype,tel,email) values('" + userName + "','" + trueName + "','" + pwd + "','" + city + "','" + lx + "','" + yb + "','" + number + "','" + cardType + "','" + phone + "','" + email + "')";
        strcon.Close();
        strcon.Open();
        SqlCommand comm = strcon.CreateCommand();
        comm.CommandText = sqlinsert;
        SqlTransaction myTransaction = strcon.BeginTransaction(); //开始一个事务
        comm.Transaction = myTransaction;
        try
        {
            comm.ExecuteNonQuery();
            myTransaction.Commit();  //提交事务

        }
        catch
        {
            myTransaction.Rollback();  //回滚事务
        }
        finally
        {
            strcon.Close();
        }
        HttpContext.Current.Session["wo"] = userName;
        context.Response.Write("{\"status\":\"0\"}");
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
                strcon.Close();
                return true;
            }
        }
        strcon.Close();
        return false;
    }
    /// <summary>
    /// 查询公告
    /// </summary>
    /// <param name="context"></param>
    public void GetBBs(HttpContext context)
    {
        //sql语句
        string sql = "select top(7) * from tb_bbs order by INTime desc";
        //执行sql语句返回一组表
        DataSet dssuper = DataBase.ReDataSet(sql);
        //提取其中的第一张表
        DataTable dt = dssuper.Tables[0];
        if (dt.Rows.Count > 0)
        {
            //格式化表返回到前台
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        else
        {
            context.Response.Write("{\"status\":\"-1\"}");
        }
    }
    /// <summary>
    /// 查询类型
    /// </summary>
    /// <param name="context"></param>
    public void SelectType(HttpContext context)
    {
        //sql语句
        string sql = "select tb_subtype.*,tb_supertype.TypeName as ClassName from tb_subtype,tb_supertype where tb_subtype.superType=tb_supertype.ID";
        //执行sql语句
        DataSet dssuper = DataBase.ReDataSet(sql);
        //提取查询出来的表
        DataTable dt = dssuper.Tables[0];
        if (dt.Rows.Count > 0)
        {
            //把表格式化成json格式的字符串
            string json = f.ToJson(dt);
            //替换非法字符
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        else
        {
            context.Response.Write("{\"status\":\"-1\"}");
        }
    }
    /// <summary>
    /// 检测用户是否登录
    /// </summary>
    /// <param name="context"></param>
    public void CheckLogin(HttpContext context)
    {
        if (HttpContext.Current.Session["wo"] == null)
        {
            context.Response.Write("{\"status\":\"-1\"}");
            return;
        }
        context.Response.Write("{\"status\":\"" + HttpContext.Current.Session["wo"].ToString() + "\"}");
    }
    /// <summary>
    /// 用户登录
    /// </summary>
    /// <param name="context"></param>
    public void Login(HttpContext context)
    {
        string userName = HttpContext.Current.Request["userName"];
        string pwd = HttpContext.Current.Request["pwd"];
        Class2 sh = new Class2();
        try
        {
            leftstrcon.Open();
            string logque = "select count(*) from tb_member where username='" + userName + "' and password='" + pwd + "'";
            SqlCommand dap = new SqlCommand(logque, leftstrcon);
            int co = (int)dap.ExecuteScalar();
            if (co > 0)
            {
                HttpContext.Current.Session["wo"] = userName;
                context.Response.Write("{\"status\":\"0\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
            }
        }
        finally
        {
            leftstrcon.Close();
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}