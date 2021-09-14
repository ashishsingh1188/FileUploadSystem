﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditorialBoard.aspx.cs" Inherits="Admin_EditorialBoard" ValidateRequest="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="MyControls" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <script src="../ckeditor/ckeditor.js" type="text/javascript"></script>
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
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <table width="750px">
            <tr>
                <td align="left" style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"
                    valign="top">
                    Select Journalist :
                    <cc1:ComboBox ID="ddlJournalist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlJournalist_SelectedIndexChanged"
                        Width="600px" CssClass="LabelColor" AutoCompleteMode="SuggestAppend">
                    </cc1:ComboBox>
                </td>
            </tr>
            <tr>
                <td style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif">
                    Editorial Board Description :
                </td>
            </tr>
            <tr>
                <td>
                  <%--  <asp:TextBox ID="txtEditorEditorialBoard" runat="server" Height="194px" Width="744"></asp:TextBox>
                      <cc1:HtmlEditorExtender ID="EditorEditorialBoard" TargetControlID="txtEditorEditorialBoard" 
                        runat="server">
                    </cc1:HtmlEditorExtender>--%>
                       <asp:TextBox ID="txtEditorEditorialBoard" runat="server" Height="200px" TextMode="MultiLine" Width="744"></asp:TextBox>
                    <script type="text/javascript">
                        CKEDITOR.replace('txtEditorEditorialBoard', { fullPage: true });
                    </script>
                </td>
            </tr>
            <tr>
                <td align="center">
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
                    </div>
                </td>
            </tr>
        </table>
        <hr />
    </div>
    </form>
</body>
</html>
