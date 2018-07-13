<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="left" %>
<link href="css/StyleSheet.css" rel="StyleSheet" type="text/css"/>
<table style="width: 164px; height: 31px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px; padding-top: 0px;" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3" style="width: 20px; height: 73px; background-image: url(image/KCM/login.gif);" align="left">
            <asp:Panel ID="Panel1" runat="server" Height="50px" Width="165px" style="left: 17px; top: 24px;" Font-Size="Small">
                &nbsp; &nbsp;
                <br />
                <table style="width: 162px; font-size: 12px;">
                    <tr>
                        <td style="height: 25px; width: 161px;">
                            &nbsp; &nbsp; &nbsp; &nbsp; 会员名：</td>
                        <td style="height: 25px; width: 88px;">
                <asp:TextBox ID="loginname" runat="server" Width="66px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 161px; height: 24px">
                            &nbsp; &nbsp; &nbsp; &nbsp; 密码：</td>
                        <td style="width: 88px; height: 24px">
                <asp:TextBox ID="loginpwd" runat="server" Style="left: 109px; top: 52px"
                    Width="65px" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 161px; height: 26px;">
                            <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" CssClass="Button"/></td>
                        <td align="center" style="width: 88px; height: 26px;">
                <asp:Button ID="Button2" runat="server" Text="注册" OnClick="Button2_Click" cssclass="Button"/></td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="width: 20px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px; padding-top: 0px; height: 136px;" align="center"><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Height="119px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Style="text-align: left; text-indent: 5px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px; padding-top: 0px;"
                Width="163px">
            <FooterStyle BackColor="Tan" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="ID"
                        DataTextField="title" HeaderText="公告" DataNavigateUrlFormatString="affiche.aspx?id={0}" />
            </Columns>
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
            </td>
    </tr>
    <tr>
        <td colspan="3" style="width: 20px;" align="center" valign="top">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Height="130px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Style="text-align: left; text-indent: 5px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px; padding-top: 0px;"
                Width="162px">
                <FooterStyle BackColor="Tan" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="goodsID" DataNavigateUrlFormatString="goodsdetail.aspx?id={0}"
                        DataTextField="goodsname" HeaderText="销售排行" />
                </Columns>
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </td>
    </tr>
</table>
