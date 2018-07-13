using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

/// <summary>
/// f 的摘要说明
/// </summary>
public static class f
{
    public static string ToJson(this DataTable dt)
    {
        JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();

        javaScriptSerializer.MaxJsonLength = Int32.MaxValue; //取得最大数值
        ArrayList arrayList = new ArrayList();
        foreach (DataRow dataRow in dt.Rows)
        {
            Dictionary<string, object> dictionary = new Dictionary<string, object>();  //实例化一个参数集合
            foreach (DataColumn dataColumn in dt.Columns)
            {
                dictionary.Add(dataColumn.ColumnName, dataRow[dataColumn.ColumnName].ToString());
            }
            arrayList.Add(dictionary); //ArrayList集合中添加键值
        }

        return "{root:" + javaScriptSerializer.Serialize(arrayList) + "}";  //返回一个json字符串
    }
}