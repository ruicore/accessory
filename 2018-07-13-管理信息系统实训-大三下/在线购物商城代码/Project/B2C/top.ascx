<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="WebUserControl" %>

<table style="background-image: url(image/KCM/NET电子商务网站首页_05.gif); width: 790px; height: 172px;" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3" rowspan="3" style="background-position-x: center; background-image: url(image/KCM/NET电子商务网站首页_05.gif); width: 1000px; background-repeat: repeat-x; height: 88px;"
            valign="top" align="right">
            <table style="width: 212px" border="0">
                <tr>
                    <td style="height: 20px"><a href="#" onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('http://www.mingrisoft.com')">设为首页</a>
                    </td>
                    <td style="height: 20px">
                        <a href=" javascript:window.external.AddFavorite('http://www.mingrisoft.com','明日科技')">收藏本站</a>
                    </td>
                    <td style="height: 20px">
                        <a href="mailto:mingrisoft@mingrisoft.com">联系我们</a></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="width: 35px; height: 35px">
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">首页</asp:LinkButton></td>
                    <td style="width: 73px; height: 35px">
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">特价商品</asp:LinkButton></td>
                    <td style="width: 44px; height: 35px">
                        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" Width="70px">新品上架</asp:LinkButton></td>
                    <td style="width: 22px; height: 35px">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Width="62px">购物车</asp:LinkButton></td>
                    <td style="width: 43px; height: 35px"></td>
                    <td style="height: 35px"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
</table>
