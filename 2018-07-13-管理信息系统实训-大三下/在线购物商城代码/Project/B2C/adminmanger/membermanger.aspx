<%@ Page Language="C#" AutoEventWireup="true" CodeFile="membermanger.aspx.cs" Inherits="adminmanger_membermanger" %>

<%@ Register Src="Webtopmenu.ascx" TagName="Webtopmenu" TagPrefix="uc1" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>会员管理</title>
    <link href="../css/StyleSheet.css" rel="StyleSheet" type="text/css"></link>
</head>
<body>
    <form id="form1" runat="server" class="../css/StyleSheet.css">
    <div align=center>
        <table style="font-size: 12px; width: 705px;">
            <tr>
                <td colspan="2">
                    <uc1:Webtopmenu ID="Webtopmenu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="height: 263px; width: 178px;">
                    <uc2:leftmenu ID="Leftmenu1" runat="server" />
                </td>
                <td style="height: 263px" valign="top">
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView2_PageIndexChanging"
                        OnRowDeleting="GridView2_RowDeleting" Width="553px" Height="470px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="username" HeaderText="用户名" />
                            <asp:BoundField DataField="truename" HeaderText="真实姓名" />
                            <asp:BoundField DataField="city" HeaderText="城市" />
                            <asp:BoundField DataField="tel" HeaderText="电话" />
                            <asp:BoundField DataField="email" HeaderText="信箱" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="width: 178px">
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
