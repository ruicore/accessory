<%@ Page Language="C#" AutoEventWireup="true" CodeFile="goodsmanage.aspx.cs" Inherits="adminmanger_goodsmanage" %>

<%@ Register Src="Webtopmenu.ascx" TagName="Webtopmenu" TagPrefix="uc1" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>商品管理</title>
    <link href="../css/StyleSheet.css" rel="StyleSheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server" class="../css/StyleSheet.css">
    <div align=center>
        <table style="width: 353px">
            <tr>
                <td style="background-image: url(adminmanger/backimage/1.gif);" colspan="3">
                    <uc1:Webtopmenu ID="Webtopmenu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="height: 100px">
                    <uc2:leftmenu ID="Leftmenu1" runat="server" />
                </td>
                <td style="height: 100px" valign="top" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                         OnRowDeleting="GridView1_RowDeleting" Width="600px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" Height="470px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="goodsname" HeaderText="商品名称" />
                            <asp:BoundField DataField="introduce" HeaderText="简介" />
                            <asp:BoundField DataField="nngoods" HeaderText="是否新品" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" DeleteImageUrl="~/image/goodsima/02.bmp" />
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="updategoods.aspx?id={0}" Text="编辑" HeaderText="编辑" />
                        </Columns>
                        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                    </asp:GridView>
                    &nbsp; &nbsp; &nbsp;&nbsp;
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
