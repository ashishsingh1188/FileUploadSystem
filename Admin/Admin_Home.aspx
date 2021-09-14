<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Home.aspx.cs" Inherits="Admin_Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CRM Management</title>
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
    <style type="text/css">
        body
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            margin: 10px;
            line-height: 25px;
            color: #333333;
            text-decoration: none;
        }
        
        body a:link
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            line-height: 25px;
            text-decoration: none;
            color: #333333;
        }
        body a:visited
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            line-height: 25px;
            text-decoration: none;
            color: #333333;
        }
        body a:hover
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            line-height: 25px;
            text-decoration: none;
            font-weight: bold;
            color: #333333;
        }
        
        #basic-accordian
        {
            padding: 0px;
            width: 20%;
            position: absolute;
            margin-left: 0px;
            z-index: 1;
        }
        
        .accordion_headings
        {
            padding: 5px;
            background: #0084E9;
            color: #FFFFFF;
            border: 1px solid #FFF;
            cursor: pointer;
            font-weight: bold;
        }
        
        .accordion_headings:hover
        {
            background: #484848;
        }
        
        .accordion_child
        {
            padding: 15px;
            background: #EEE;
        }
        
        .header_highlight
        {
            background: #484848;
        }
    </style>
    <link href="crm_css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="crm_js/accordian.pack.js"></script>
    <link rel="shortcut icon" href="../images/theaer.ico" type="image/x-icon" />
</head>
<body onload="new Accordian('basic-accordian',5,'header_highlight');">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="80%" align="left">
                            <img src="../images/aer.jpg" />
                        </td>
                        <td class="header_link">
                            <p>
                                <strong>
                                    <asp:LinkButton runat="server" ID="link_signout" Text="SignOut" OnClick="link_signout_Click"></asp:LinkButton></strong><br />
                                <strong>
                                    <asp:Label ID="lbl_DateandTime" runat="server"></asp:Label></strong><br />
                                <strong>
                                    <asp:Label ID="lbl_Time" runat="server"></asp:Label></strong><br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="30" bgcolor="#6B6B6B">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="90%" class="login_name">
                            Welcome <strong>
                                <asp:Label ID="lblDesignation" runat="server" Text="Label"></asp:Label></strong>
                        </td>
                        <td align="right" class="login_name">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="20%" valign="top" style="padding-top: 5px;">
                            <div id="basic-accordian">
                                <!--Parent of the Accordion-->
                                <!--Start of each accordion item-->
                                <div id="test-header" class="accordion_headings header_highlight">
                                    Home</div>
                                <!--Heading of the accordion ( clicked to show n hide ) -->
                                <div id="test-content">
                                    <div class="accordion_child">
                                        <a href="Home.aspx" target="iframe_Common">Home</a><br />
                                    </div>
                                </div>
                                <div id="test2-header" class="accordion_headings">
                                    Aim & Scope</div>
                                <div id="test2-content">
                                    <div class="accordion_child">
                                        <a href="AimScope.aspx" target="iframe_Common">Aim & Scope</a><br />
                                    </div>
                                </div>
                                <div id="test3-header" class="accordion_headings">
                                    Editorial Board</div>
                                <div id="test3-content">
                                    <div class="accordion_child">
                                        <p>
                                            <a href="EditorialBoard.aspx" target="iframe_Common">Editorial Board</a><br />
                                    </div>
                                </div>
                                <div id="test4-header" class="accordion_headings">
                                    Call</div>
                                <div id="test4-content">
                                    <div class="accordion_child">
                                        <a href="CallForPapers.aspx" target="iframe_Common">Call For Papers</a><br />
                                        <a href="CallPapersPageUpload.aspx" target="iframe_Common">Upload Call For Papers</a><br />
                                    </div>
                                </div>
                                <div id="test5-header" class="accordion_headings">
                                    Instructions</div>
                                <div id="test5-content">
                                    <div class="accordion_child">
                                        <a href="InstructionsForAuthor.aspx" target="iframe_Common">Instructions For Authors</a><br />
                                    </div>
                                </div>
                                <div id="test6-header" class="accordion_headings">
                                    Indexing and Archiving</div>
                                <div id="test6-content">
                                    <div class="accordion_child">
                                        <a href="IndexingAndArchiving.aspx" target="iframe_Common">Indexing and Archiving</a><br />
                                    </div>
                                </div>
                                <div id="test8-header" class="accordion_headings">
                                    Download</div>
                                <div id="test8-content">
                                    <div class="accordion_child">
                                        <a href="DownloadPage.aspx" target="iframe_Common">Download</a><br />
                                    </div>
                                </div>
                                <div id="test9-header" class="accordion_headings">
                                    Journal</div>
                                <div id="test9-content">
                                    <div class="accordion_child">
                                        <a href="Journal.aspx" target="iframe_Common">Journal</a><br />
                                    </div>
                                </div>
                                <div id="test10-header" class="accordion_headings">
                                    Upload Images</div>
                                <div id="test10-content">
                                    <div class="accordion_child">
                                        <a href="ImageUpload.aspx" target="iframe_Common">Upload Images</a><br />
                                    </div>
                                </div>
                                <div id="test11-header" class="accordion_headings">
                                    Security</div>
                                <div id="test11-content">
                                    <div class="accordion_child">
                                        <a href="" target="iframe_Common">Security</a><br />
                                     
                                    </div>
                                </div>
                                <asp:PlaceHolder ID="PHDefault" runat="server" Visible="false">
                                    <div id="test12-header" class="accordion_headings">
                                        Default Page</div>
                                    <div id="test12-content">
                                        <div class="accordion_child">
                                            <a href="DefaultPageContent.aspx" target="iframe_Common" id="A1" name="HLDefaultPage">
                                                Default Page Content</a><br />
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            </div>
                        </td>
                        <%-- <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/contnthome-page.png" />--%>
                        <td valign="top" width="80%" align="right" style="padding-top: 5px;">
                            <iframe width="98%" height="500px" id="iframe_Common" name="iframe_Common" frameborder="0"
                                src="Welcome.aspx"></iframe>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
