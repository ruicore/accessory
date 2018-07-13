<%@ Page Language="C#" AutoEventWireup="true" CodeFile="affiche.aspx.cs" Inherits="showgoods_affiche" %>

<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc3" %>

<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="left.ascx" TagName="left" TagPrefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>公告</title>
    <link href="css/StyleSheet.css" rel="StyleSheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="css/StyleSheet.css">
        <div>
            <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <ItemTemplate>
                    <table style="height: 68px" width="480" border="0">
                        <tr>
                            <td style="width: 600px; height: 5px;" align="center"><%# DataBinder.Eval(Container.DataItem,"title") %>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 600px">&nbsp; &nbsp;<%# DataBinder.Eval(Container.DataItem,"content") %>
                                       
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <AlternatingItemStyle BackColor="#F7F7F7" />
            </asp:DataList>
        </div>
    </form>
</body>
</html>
