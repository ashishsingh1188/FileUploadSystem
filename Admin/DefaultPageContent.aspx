<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultPageContent.aspx.cs" Inherits="Admin_AimScope"
    ValidateRequest="false" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="../ckeditor/ckeditor.js" type="text/javascript"></script>
    <style type="text/css">
        .LabelColor
        {
            font-family: Arial;
            font-size: 12px;
        }
        .style1
        {
            height: 23px;
        }
    </style>
    <link rel="shortcut icon" href="../images/theaer.ico" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <table width="750px">
            <tr>
                <td align="center" style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"
                    valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif">
                    Default Page Description :
                </td>
            </tr>
            <tr>
                <td>
                    <%-- <asp:TextBox ID="txtEditorAimScope" runat="server" Height="194px" Width="744"></asp:TextBox>
                    <cc1:HtmlEditorExtender ID="EditorAimScope" TargetControlID="txtEditorAimScope" 
                        runat="server">
                    </cc1:HtmlEditorExtender>--%>
                    <asp:TextBox ID="txtEditorDescription" runat="server" Height="200px" TextMode="MultiLine"
                        Width="744"></asp:TextBox>
                    <script type="text/javascript">
                        CKEDITOR.replace('txtEditorDescription', { fullPage: true });
                    </script>
                </td>
            </tr>
            <tr>
                <td align="center" class="style1">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click"
                        Width="130px" CssClass="LabelColor" />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <div style="width: 744px">
        <table width="750px">
            <tr>
                <td align="center" style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"
                    valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif">
                    Apply as New Journal Proposal Documents:
                </td>
            </tr>
            <tr>
                <td>
                    <%-- <asp:TextBox ID="txtEditorAimScope" runat="server" Height="194px" Width="744"></asp:TextBox>
                    <cc1:HtmlEditorExtender ID="EditorAimScope" TargetControlID="txtEditorAimScope" 
                        runat="server">
                    </cc1:HtmlEditorExtender>--%>
                    <script type="text/javascript">
                        CKEDITOR.replace('txtEditorDescription', { fullPage: true });
                    </script>
                </td>
            </tr>
            <tr>
                <td align="left" class="style1">
                    &nbsp;
                    <asp:FileUpload ID="fu_product2_english" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnSubmit0" Text="Upload" runat="server" OnClick="btnSubmit0_Click"
                        Width="130px" CssClass="LabelColor" />
                </td>
            </tr>
            <tr>
                <td align="left">
                    &nbsp;</td>
            </tr>
        </table>
                        <br />
                    </div>
                </td>
            </tr>
        </table>
        <hr />
    </div>
    </form>
</body>
</html>
