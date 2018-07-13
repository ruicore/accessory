<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addgg.aspx.cs" Inherits="adminmanger_addgg" %>

<%@ Register Src="Webtopmenu.ascx" TagName="Webtopmenu" TagPrefix="uc1" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加公告</title>
    <link href="../css/StyleSheet.css" rel="StyleSheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="../css/StyleSheet.css">
    <div align=center>
        <table style="width: 786px; height: 150px" Align="center" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" style="height: 0px">
                    &nbsp;<uc1:Webtopmenu ID="Webtopmenu1" runat="server" />
                    </td>
            </tr>
            <tr>
                <td style="width: 3px; height: 111px;" valign="top">
                    <uc2:leftmenu ID="Leftmenu1" runat="server" />
                </td>
                <td style="height: 700px; width: 616px;" valign="top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                        Width="607px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" 
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" Height="470px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="标题" />
                            <asp:BoundField DataField="content" HeaderText="内容" ItemStyle-Width="200" />
                            <asp:CommandField HeaderText="删除内容" ShowDeleteButton="True" />
                            <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                        </Columns>
                        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                    </asp:GridView>
                </td>
                <td style="height: 111px;">
                </td>
            </tr>
            <tr>
                <td style="width: 3px; height: 57px;">
                </td>
                <td style="height: 57px; width: 616px;" align="center">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</td>
                <td style="height: 57px;">
                </td>
            </tr>
        </table>
    
    </div>
        &nbsp;&nbsp;
    </form>
</body>
</html>
