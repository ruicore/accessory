<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminpage.aspx.cs" Inherits="adminmanger_adminpage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理员登录</title>
    <style>
        * {
            padding: 0px;
            margin: 0px;
        }
        .xx {
        margin-top:20px;
        margin-right:80px;
        height:30px;
        background-color:#66c151;
        color:#fff;
        }
    </style>
</head>
<body style="background-image: url('51gou后台.png'); background-size: 100% 1200px;">
    <form id="form1" runat="server">
        <div style="width: 680px; margin-left: auto; margin-right: auto; margin-top: 220px;">
            <div>
                <img src="51gou后台背景(1).png" />
            </div>
            <div style="width:260px; margin-left:auto; margin-right:auto;">
                <asp:Login ID="Login1" runat="server" BorderPadding="4"
                    BorderStyle="None" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
                    ForeColor="white" OnAuthenticate="Login1_Authenticate" RememberMeSet="True"
                    Width="259px" align="center" EnableTheming="True" DisplayRememberMe="False" TitleText="">
                    <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <LoginButtonStyle  BorderColor="#66c151" BorderStyle="Solid" BorderWidth="1px"
                        Font-Names="Verdana" Font-Size="0.8em" Width="80" CssClass="xx"/>
                </asp:Login>
            </div>
    </form>
</body>
</html>
