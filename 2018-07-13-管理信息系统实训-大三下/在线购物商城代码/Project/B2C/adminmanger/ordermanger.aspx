<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ordermanger.aspx.cs" Inherits="adminmanger_ordermanger" %>

<%@ Register Src="Webtopmenu.ascx" TagName="Webtopmenu" TagPrefix="uc1" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>订单管理</title>
    <link href="../css/StyleSheet.css" rel="StyleSheet" type="text/css"/>
    
</head>
<body>
    <form id="form1" runat="server" class="../css/StyleSheet.css">
    <div align="center">
        <table style="font-size: 12px; width: 727px;">
            <tr>
                <td colspan="2">
                    <uc1:Webtopmenu ID="Webtopmenu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <uc2:leftmenu ID="Leftmenu1" runat="server" />
                </td>
                <td valign="top" style="width: 553px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                        OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="553px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" Height="470px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="orderid" HeaderText="订单号" />
                            <asp:BoundField DataField="username" HeaderText="用户名" />
                            <asp:BoundField DataField="truename" HeaderText="真实姓名" />
                            <asp:BoundField DataField="pay" HeaderText="付款方式" />
                            <asp:BoundField DataField="carry" HeaderText="发送方式" />
                            <asp:BoundField DataField="orderdate" HeaderText="订货日期" />
                            <asp:BoundField DataField="zx" HeaderText="执行情况" />
                            <asp:CommandField HeaderText="执行" SelectText="执行" ShowSelectButton="True" />
                        </Columns>
                        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <PagerSettings FirstPageText="第一页" LastPageText="最后一页" NextPageText="下一页" PreviousPageText="上一页" />
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
