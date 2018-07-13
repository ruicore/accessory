<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>会员注册</title>
    <link href="../css/StyleSheet.css" rel="StyleSheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server" class="css/StyleSheet.css">
    <div title="注册" align="center">
        <table style="height: 659px" width="600" >
            <tr>
                <td style="height: 27px">
                </td>
                <td style="height: 27px; font-size: 19px;">
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Larger" Height="23px"
                        Style="font-size: 19px; color: #ffcc66; font-family: 隶书; text-decoration: underline"
                        Text="会 员 注 册" Width="204px"></asp:Label>&nbsp;</td>
                <td style="height: 27px;">
                </td>
            </tr>
            <tr>
                <td align="center">

                </td>
                <td align="center">
             
                    <asp:Panel ID="Panel1" runat="server" Height="50px" Width="350px" style="text-align: left" Wrap="False" >
                        <asp:Label ID="Label1" runat="server" Text="用 户 名：" Width="82px"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="Label2" runat="server" Text="真实姓名：" Width="82px"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>&nbsp;
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="密     码：" Width="82px"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                            ErrorMessage="密码不能为空"></asp:RequiredFieldValidator><br />
                        <asp:Label ID="Label3" runat="server" Text="确认密码：" Width="82px"></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3"
                            ControlToValidate="TextBox4" ErrorMessage="密码不一致">密码不一致</asp:CompareValidator><br />
                        <asp:Label ID="Label4" runat="server" Text="所在城市：" Width="83px"></asp:Label>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br />
                        <asp:Label ID="Label5" runat="server" Text="联系方式：" Width="83px"></asp:Label>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox><br />
                        <asp:Label ID="Label8" runat="server" Text="邮政编码：" Width="83px"></asp:Label>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox><br />
                        <asp:Label ID="Label7" runat="server" Text="证件号码：" Width="83px"></asp:Label>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox><br />
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="证件类别：" Width="80px"></asp:Label>
                      
                        <asp:RadioButtonList ID="RBL1" runat="server" OnSelectedIndexChanged="RBL1_SelectedIndexChanged"
                            RepeatDirection="Horizontal" Width="222px" EnableTheming="True">
                            <asp:ListItem>身份证</asp:ListItem>
                            <asp:ListItem>学生证</asp:ListItem>
                            <asp:ListItem>其   它</asp:ListItem>
                        </asp:RadioButtonList><asp:Label ID="Label10" runat="server" BorderStyle="None" Text="电子信箱：" Width="81px"></asp:Label>
                        <asp:TextBox ID="TextBox9" runat="server" EnableTheming="True"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox9"
                            ErrorMessage="邮箱地址非法" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                        <asp:Label ID="Label11" runat="server" Text="联系电话：" Width="81px"></asp:Label>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox10"
                            ErrorMessage="*" ValidationExpression="(\d{3,4}[-]\d{7,8})|(\d{11})"></asp:RegularExpressionValidator></asp:Panel>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    &nbsp;<asp:Button ID="Button1" runat="server"
                        OnClick="Button1_Click" Text="确认保存" CssClass="blueButtonCss" />
                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:Button ID="Button3" runat="server" Text="重新填写" OnClick="Button3_Click" CssClass="blueButtonCss" CausesValidation="False" />
                    &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" CssClass="blueButtonCss" CausesValidation="False" />
                    </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
