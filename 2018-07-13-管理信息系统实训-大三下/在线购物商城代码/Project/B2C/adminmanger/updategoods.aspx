<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updategoods.aspx.cs" Inherits="adminmanger_updategoods" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>修改商品</title>
    <link href="../css/StyleSheet.css" rel="StyleSheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="../css/StyleSheet.css">
        <div align="center">
            <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
                <table border="0" style="width: 412px">
                    <tr>
                        <td style="width: 1px"></td>
                        <td style="width: 2px">&nbsp;</td>
                        <td style="width: 73px">&nbsp;
                        </td>
                        <td style="width: 152px"></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <img src="" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 1px; height: 21px">
                            <asp:Label ID="Label3" runat="server" Text="商品名称：" Width="92px"></asp:Label></td>
                        <td colspan="2" style="height: 21px" align="left">
                            <asp:TextBox ID="TextBox1" runat="server" Width="209px"></asp:TextBox></td>
                        <td style="width: 152px; height: 21px"></td>
                    </tr>
                    <tr>
                        <td style="width: 1px; height: 21px">
                            <asp:Label ID="Label4" runat="server" Text="图片文件：" Width="91px"></asp:Label></td>
                        <td style="width: 2px; height: 21px">
                            <asp:TextBox ID="TextBox2" runat="server" Height="15px" Width="130px"></asp:TextBox></td>
                        <td align="left" style="width: 73px; height: 21px">
                            <asp:Label ID="Label5" runat="server" Text="定价：" Width="54px"></asp:Label></td>
                        <td style="width: 152px; height: 21px" align="left">
                            <asp:TextBox ID="TextBox3" runat="server" Width="53px"></asp:TextBox><asp:Label ID="Label6"
                                runat="server" Text="（元）" Width="15px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 73px; height: 12px" valign="top">
                            <asp:Label ID="Label7" runat="server" Text="是否新品：" Width="89px"></asp:Label></td>
                        <td style="width: 2px; height: 12px" valign="top">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="5px"
                                RepeatDirection="Horizontal" Width="101px">
                                <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                                <asp:ListItem Value="1">是</asp:ListItem>
                            </asp:RadioButtonList></td>
                        <td align="left" style="width: 73px; height: 12px">
                            <asp:Label ID="Label9" runat="server" Text="现价：" Width="53px"></asp:Label>
                        </td>
                        <td style="width: 152px; height: 12px" valign="top" align="left">
                            <asp:TextBox ID="TextBox5" runat="server" Width="53px"></asp:TextBox><asp:Label ID="Label10"
                                runat="server" Text="（元）" Width="45px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 1px; height: 11px">
                            <asp:Label ID="Label8" runat="server" Text="商品简介：" Width="89px"></asp:Label></td>
                        <td colspan="3" style="height: 11px">
                            <asp:TextBox ID="TextBox4" runat="server" Width="346px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 1px; height: 11px"></td>
                        <td style="width: 2px; height: 11px"></td>
                        <td style="width: 73px; height: 11px"></td>
                        <td style="width: 152px; height: 11px"></td>
                    </tr>
                    <tr>
                        <td style="width: 1px; height: 11px"></td>
                        <td style="width: 2px; height: 11px">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改" Style="border-top-style: groove; border-right-style: groove; border-left-style: groove; border-bottom-style: groove" /></td>
                        <td style="width: 73px; height: 11px"></td>
                        <td style="width: 152px; height: 11px">
                            <asp:Button ID="Button3" runat="server" Text="返回" OnClick="Button3_Click" /></td>
                    </tr>
                </table>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
