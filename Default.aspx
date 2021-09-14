<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="AdminNew_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <!-- meta tags-->

		<meta charset="utf-8">


		<!--css-->

<!--		<link rel="shortcut icon" type="image/x-icon"  href="assets/lucky36/images/favicon(2).ico"/>-->
                
                <link href="http://fonts.googleapis.com/css?family=Oxygen" rel="stylesheet" type="text/css">

		<link href="assets/skin/style/style.css" rel="stylesheet" type="text/css">

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<body>
    <form id="form1" runat="server">
  		

<style type="text/css">
body {
	background-image: url(images/Login-bg.jpg);
	background-repeat: no-repeat;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-position:top;
	background-color:#9db05e;
}
</style>
<div class="main">

			

			
		<table width="50%">
        <tr><td width="80%"><asp:TextBox ID="txt_username" runat="server" placeholder="Username" pattern=".{3,15}" required="" class="username" MaxLength="10" style="text-transform:uppercase" ></asp:TextBox>
			</td><td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
              ErrorMessage="*" ControlToValidate="txt_username" Display="Dynamic" 
                     ForeColor="Maroon"></asp:RequiredFieldValidator></td></tr>
        
        <tr><td><asp:TextBox ID="txt_password" runat="server" class="password" placeholder="password" required="" autocomplete="off" MaxLength="30" TextMode="Password"></asp:TextBox>
				</td><td> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
              ErrorMessage="*" ControlToValidate="txt_password" Display="Dynamic" 
                     ForeColor="Maroon"></asp:RequiredFieldValidator></td></tr>
        
        </table>
            	
                 
                                        					
                                        <div class="button"> 
                                        <a href="#"> 

                                                
                                                 <asp:ImageButton ID="ImageButton1" runat="server" 
              Text=" GO " onclick="ImageButton1_Click"  ImageUrl="~/assets/skin/style/images/Login Gmail.png" alt="image"/>

              <br />
                            <br />
              
                                                
                                                 <asp:ImageButton ID="ImageButton2" runat="server" 
              Text=" GO "   ImageUrl="~/assets/skin/style/images/Login FAcebook.png" alt="image" 
                                                onclick="ImageButton2_Click"/>
                                             

                                            

                                                

                                        </a>
                                        </div>

			<div style="width: 100%; float: left;">
              <asp:Label ID="lb_msg" runat="server" ForeColor="#CC0000"></asp:Label>

			</div>

			

		</div>



	<div>   <asp:Panel ID="pnlProfile" runat="server" Visible="false">
            <hr />
            <table>
                <tr>
                    <td rowspan="7" valign="top">
                        <asp:Image ID="ProfileImage" runat="server" Width="50" Height="50" />
                    </td>
                </tr>
                <tr>
                    <td>
                        ID:
                        <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name:
                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email:
                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Verified Email:
                        <asp:Label ID="lblVerified" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                         Face Book User Name:
                        <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Clear" Text="Clear" />
                    </td>
                </tr>
            </table>
        </asp:Panel></div>




<iframe frameborder="0" scrolling="no" style="background-color: transparent; border: 0px; display: none;"></iframe><div id="GOOGLE_INPUT_CHEXT_FLAG" input="" input_stat="{&quot;tlang&quot;:true,&quot;tsbc&quot;:true,&quot;pun&quot;:true,&quot;mk&quot;:true,&quot;ss&quot;:true}" style="display: none;"></div>
    </form>
</body>
</html>
