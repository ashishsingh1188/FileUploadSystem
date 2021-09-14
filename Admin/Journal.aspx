<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Journal.aspx.cs" Inherits="Admin_Journal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="shortcut icon" href="../images/theaer.ico" type="image/x-icon" />
    <style type="text/css">
        .LabelColor
        {
            font-family: Arial;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <table width="700">
            <tr>
                <td align="left" colspan="2" style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif">
                    Add New Journal :
                </td>
            </tr>
            <tr>
                <td align="left" style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif"
                    valign="top">
                    Edit Journal :
                </td>
                <td>
                    <cc1:ComboBox ID="ddlJournal" runat="server" Width="500px" AutoPostBack="True" OnSelectedIndexChanged="ddlJournal_SelectedIndexChanged"
                        CssClass="LabelColor" AutoCompleteMode="SuggestAppend" 
                        DropDownStyle="DropDownList">
                    </cc1:ComboBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    Name
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="200px" CssClass="LabelColor"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    Mobile
                </td>
                <td>
                    <asp:TextBox ID="txtMobile" runat="server" Width="200px" CssClass="LabelColor"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    Address
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Height="51px" TextMode="MultiLine" Width="200px"
                        CssClass="LabelColor"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    Email Id
                </td>
                <td>
                    <asp:TextBox ID="txtEmailId" runat="server" Width="200px" CssClass="LabelColor"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    City
                </td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" Width="200px" CssClass="LabelColor"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    Pincode
                </td>
                <td>
                    <asp:TextBox ID="txtPincode" runat="server" Width="200px" CssClass="LabelColor"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    User Name
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtUserName" runat="server" Width="200px" OnTextChanged="txtUserName_TextChanged"
                                AutoPostBack="True" CssClass="LabelColor"></asp:TextBox>
                            <div id="checkusername" runat="server" visible="false">
                                <asp:Label ID="lblStatus" runat="server" CssClass="LabelColor"></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    Old Password
                </td>
                <td>
                    <asp:TextBox ID="txtOldPassword" runat="server" Width="200px" TextMode="Password"
                        CssClass="LabelColor"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    Password
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Width="200px" TextMode="Password" CssClass="LabelColor"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="LabelColor">
                    Confirm Password
                </td>
                <td>
                    <asp:TextBox ID="txtConfirmPass" runat="server" Width="200px" TextMode="Password"
                        CssClass="LabelColor"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidatorConfirmPass" runat="server" ControlToCompare="txtPassword"
                        ControlToValidate="txtConfirmPass" ErrorMessage="Password not match" ForeColor="Maroon"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete"
                        OnClientClick=" return confirm('Are you sure you want to delete the journal?')"
                        Visible="False" Width="100px" />
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
                        Width="120px" CssClass="LabelColor" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
