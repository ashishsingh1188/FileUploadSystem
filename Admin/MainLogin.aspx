<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainLogin.aspx.cs" Inherits="MainLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
    .style1
    {
        height: 29px;
    }
    .style3
    {
        font-family: Arial;
        font-size: 12px;
        color: Gray;
        text-align: left;
        padding-left: 10px;
        width: 53%;
    }
    .style4
    {
        height: 23px;
    }
      .LabelColor
     {
         font-family: Arial;
        font-size: 12px;
     }
</style>

    <link href="../CSS/Login.css" rel="stylesheet" type="text/css" />

    <link rel="shortcut icon" href="../images/theaer.ico" type="image/x-icon" />
</head>
<body style="height:100%">
    <form id="form1" runat="server">
    <div>
        <table style="width:100%;">
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                            <td align="left" style="width:50%"> 
                                &nbsp;</td>
                            <td align="right" style="width:50%">
                                <asp:Image ID="Image2" runat="server" 
                                    ImageUrl="~/images/aer.jpg" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%">
                           <tr>
                <td colspan="2"><hr /></td>
            </tr>
                        <tr>
                            <td colspan="2" align="center" style="font-family:Footlight MT Light; font-size:25px; font-weight:bold;color:#0084E9;" >
                                Association of Engineers and Researchers</td>
                        </tr>
                               <tr>
                <td colspan="2"><hr /></td>
            </tr>
                        <tr>
                            <td colspan="2" class="style4"></td>
                        </tr>
                        <tr>
                            <td>
                                <table align="center">
                      
                                    <tr>
                                        <td align="left" class="style1"><asp:Image ID="Image9" runat="server" ImageUrl="~/Images/username.png" /></td>
                                        <td align="left" class="LabelColor">User Name :</td>
                                        <td class="style1"><asp:TextBox ID="txt_username" runat="server" Width="175px" 
                                                CssClass="LabelColor"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="left"><asp:Image ID="Image10" runat="server" ImageUrl="~/Images/password.png" /></td>
                                        <td align="left" class="LabelColor">Password :</td>
                                        <td><asp:TextBox ID="txt_password" runat="server" TextMode="Password" Width="175px" 
                                                CssClass="LabelColor"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left">&nbsp;</td>
                                        <td align="left" class="login_text">&nbsp;</td>
                                        <td align="left">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="left">&nbsp;</td>
                                        <td align="left" class="login_text">&nbsp;</td>
                                        <td align="left">
                                            <asp:Button ID="btnLogin" runat="server" CssClass="LabelColor" 
                                                onclick="btnLogin_Click" Text="Login" Width="99px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">&nbsp;</td>
                                        <td align="left" class="login_text">&nbsp;</td>
                                        <td align="left" class="login_text">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height:200px">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr style="background-color: #F4F4F4">
                            <td class="style3" height="30px">
                                Copyright @ theaer.org</td>
                            <td align="right">
                                <a href="http://www.oscorptechnologies.in" target="_blank">
                                <asp:Image ID="Image11" runat="server" ImageUrl="~/Images/powered_oscorp.png" BorderWidth="0" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
