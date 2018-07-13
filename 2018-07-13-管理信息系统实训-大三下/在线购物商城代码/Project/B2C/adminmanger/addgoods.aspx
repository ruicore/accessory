<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addgoods.aspx.cs" Inherits="adminmanger_addgoods" %>

<%@ Register Src="Webtopmenu.ascx" TagName="Webtopmenu" TagPrefix="uc1" %>
<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加商品</title>
    <link href="../css/StyleSheet.css" rel="Stylesheet" type="text/css" /> 
</head>
<body>
    <form id="form1" runat="server" class="StyleSheet.css">
    <div title="添加商品">
        <table style="width: 675px; height: 370px" align="center" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px; padding-top: 0px; height: 165px;" colspan="3">
                    <uc1:Webtopmenu ID="Webtopmenu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="height: 52px; width: 185px;">
                    <uc2:leftmenu ID="Leftmenu1" runat="server" />
                </td>
                <td style="height: 52px; width: 471px;" valign="top">
                    <asp:Panel ID="Panel1" runat="server" Height="110px" Width="125px">
                        <table style="width: 435px;height:200px;" border="0">
                            <tr >
                                <td style="width: 1px">
                                    <asp:Label ID="Label1" runat="server" Text="所属大类：" Width="92px"></asp:Label></td>
                                <td style="width: 2px">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                         Width="125px" style="margin-top:10px;">
                                    </asp:DropDownList>&nbsp;</td>
                                <td style="width: 54px">
                                    &nbsp;<asp:Label ID="Label2" runat="server" Text="所属小类：" Width="82px"></asp:Label>
                                </td>
                                <td style="width: 152px">
                                    <asp:DropDownList ID="DropDownList2" runat="server" Width="149px">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 1px; height: 21px">
                                    <asp:Label ID="Label3" runat="server" Text="商品名称：" Width="92px"></asp:Label></td>
                                <td colspan="2" style="height: 21px">
                                    <asp:TextBox ID="TextBox1" runat="server" Width="209px"></asp:TextBox></td>
                                <td style="width: 152px; height: 21px">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                        ErrorMessage="输入商品名"></asp:RequiredFieldValidator>--%></td>
                            </tr>
                            <tr>
                                <td style="width: 1px; height: 21px">
                                    <asp:Label ID="Label4" runat="server" Text="图片文件：" Width="91px"></asp:Label></td>
                                <td style="width: 2px; height: 21px">
                                    <asp:TextBox ID="TextBox2" runat="server" Height="15px" Width="130px"></asp:TextBox></td>
                                <td style="width: 54px; height: 21px" align="left">
                                    <asp:Label ID="Label5" runat="server" Text="定价：" Width="54px"></asp:Label></td>
                                <td style="width: 152px; height: 21px">
                                    <asp:TextBox ID="TextBox3" runat="server" Width="53px"></asp:TextBox><asp:Label ID="Label6" runat="server" Text="（元）" Width="15px"></asp:Label>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox3"
                                        ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 73px; height: 12px;" valign="top">
                                    <asp:Label ID="Label7" runat="server" Text="是否新品：" Width="89px"></asp:Label></td>
                                <td style="width: 2px; height: 12px;" valign="top">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" Height="5px"
                                        RepeatDirection="Horizontal" Width="101px">
                                        <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                        <asp:ListItem Value="1">是</asp:ListItem>
                                    </asp:RadioButtonList></td>
                                <td style="width: 73px; height: 12px;" align="left">
                                    <asp:Label ID="Label9" runat="server" Text="现价：" Width="53px"></asp:Label>
                                </td>
                                <td style="width: 152px; height: 12px;" valign="top">
                                    <asp:TextBox ID="TextBox5" runat="server" Width="53px"></asp:TextBox><asp:Label ID="Label10" runat="server" Text="（元）" Width="45px"></asp:Label>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox5"
                                        ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 1px; height: 11px">
                                    <asp:Label ID="Label8" runat="server" Text="商品简介：" Width="89px"></asp:Label></td>
                                <td style="height: 11px" colspan="3">
                                    <asp:TextBox ID="TextBox4" runat="server" Width="346px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 1px; height: 11px">
                                </td>
                                <td style="width: 2px; height: 11px">
                                </td>
                                <td style="width: 54px; height: 11px">
                                </td>
                                <td style="width: 152px; height: 11px">
                                </td>
                            </tr>
                            <tr style="height:100px;">
                                <td style="width: 1px; height: 11px">
                                </td>
                                <td style="width: 2px; height: 11px">
                                    <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" CssClass="button" /></td>
                                <td style="width: 54px; height: 11px">
                                    <asp:Button ID="Button2" runat="server" Text="重置" OnClick="Button2_Click" CausesValidation="False" CssClass="button" /></td>
                                <td style="width: 152px; height: 11px">
                                    <asp:Button ID="Button3" runat="server" Text="返回" OnClick="Button3_Click" CausesValidation="False" CssClass="button" /></td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    &nbsp;<asp:Label ID="Label11" runat="server" Text="图片上传：" Width="94px"></asp:Label><input id="fileUp" type="file" runat="server" />
                    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="上传" CausesValidation="False" CssClass="button" />&nbsp;
                    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;
                </td>
                <td style="height: 52px">
                </td>
            </tr>
            <tr>
                <td style="height: 17px; width: 185px;">
                </td>
                <td style="width: 471px; height: 17px;">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                </td>
                <td style="height: 17px">
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
