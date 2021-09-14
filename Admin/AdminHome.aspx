<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<%--<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Home Page</title>

    <link href="../CSS/CommonBody.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            height: 33%;
            width: 493px;
        }
    </style>
</head>
<body style="height: 100%">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <table width="100%">
            <tr>
                <td class="style2">
                    <asp:Image ID="Image12" runat="server" ImageUrl="~/images/aer.jpg" />
                </td>
                <td style="height: 33%" align="left" valign="top">
                    <strong>Welcome:
                        <asp:Label ID="lbl_username" runat="server" ForeColor="#003300" Text="Admin"></asp:Label></strong>
                </td>
                <td style="height: 33%" align="right">
                    <table>
                        <tr>
                            <td align="left">
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/home_icon.png"
                                    ToolTip="Go To Home Page" />
                            </td>
                            <td class="login_text" align="left">
                                <asp:LinkButton runat="server" ID="link_signout" Text="SignOut" OnClick="link_signout_Click"></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="login_text">
                                <strong>Date & Time: </strong>
                            </td>
                            <td class="login_text">
                                <strong>
                                    <asp:Label ID="lbl_DateandTime" runat="server"></asp:Label></strong>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <hr />
                </td>
            </tr>
        </table>
    </div>
    <div id="topMenu">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-decoration: none">
            <tr>
                <td align="center" valign="top" style="text-decoration: none" >
                    <asp:HyperLink ID="HL_Home" runat="server" Target="iframe_Basic" NavigateUrl="~/Admin/Home.aspx" >Home</asp:HyperLink>
                </td>
                <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_AimScope" runat="server" 
                        NavigateUrl="~/Admin/AimScope.aspx" Target="iframe_Basic">Aim & Scope</asp:HyperLink>
                </td>
                <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_EditorialBoard" runat="server" 
                        NavigateUrl="~/Admin/EditorialBoard.aspx" Target="iframe_Basic">Editorial Board</asp:HyperLink>
                </td>
                <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_CallforPapers" runat="server" 
                        NavigateUrl="~/Admin/CallForPapers.aspx" Target="iframe_Basic">Call for Papers</asp:HyperLink>
                </td>
                <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_InstructionsforAuthors" runat="server" 
                        NavigateUrl="~/Admin/InstructionsForAuthor.aspx" Target="iframe_Basic">Instructions for Authors</asp:HyperLink>
                </td>
                <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_IndexingArchiving" runat="server" 
                        NavigateUrl="~/Admin/IndexingAndArchiving.aspx" Target="iframe_Basic">Indexing & Archiving</asp:HyperLink>
                </td>
                <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_SubmitManuscript" runat="server" 
                        NavigateUrl="~/Admin/SubmitManuScript.aspx" Target="iframe_Basic">Submit Manuscript</asp:HyperLink>
                </td>
                <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_ContactUs" runat="server" 
                        NavigateUrl="~/Admin/ContactUs.aspx" Target="iframe_Basic">Contact Us</asp:HyperLink>
                </td>
                <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_Download" runat="server" 
                        NavigateUrl="~/Admin/DownloadPage.aspx" Target="iframe_Basic">Download</asp:HyperLink>
                </td>
                   <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_Journal" runat="server" NavigateUrl="~/Admin/Journal.aspx" Target="iframe_Basic">Journal</asp:HyperLink>
                </td>
                 
                   <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_Security" runat="server" NavigateUrl="" Target="iframe_Basic">Security</asp:HyperLink>
                </td>
                  <td align="center" valign="top" style="text-decoration: none">
                    <asp:HyperLink ID="HL_UImage" runat="server" NavigateUrl="~/Admin/ImageUpload.aspx" Target="iframe_Basic">Upload Images</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="11">
                    <hr />
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View_Basic" runat="server">
                <table width="100%">
                    <tr>
                        <td valign="top" style="width: 85%">
                            <iframe id="iframe_Basic" height="500px" name="iframe_Basic" width="100%"></iframe>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
    <div>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr style="background-color: #F4F4F4">
                <td width="30%" height="30px">
                    Copyright @ INDO RUBBER &amp; PLASTIC WORKS
                </td>
                <td align="right">
                    <a href="http://www.oscorptechnologies.in" target="_blank">
                        <asp:Image ID="Image22" runat="server" ImageUrl="~/Images/powered_oscorp.png" BorderWidth="0" />
                    </a>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
