<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DownloadPage.aspx.cs" Inherits="DownloadPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%-- $("#dvfiles").append("<input name=" + i + "fu type=file /><a href=#>remove</a><br>");
                $("#dvfiles").append("<input name=txt"+i + "type=text />");
                i++;--%>
    <script src="_scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        var i = 1;

        $(document).ready(function () {

            $("#addfile").click(function () {


                var add_input = '<input type="file" name="' + i + 'fu" /><a href=#>Remove</a><br>'
                var add_txt = '<input type="text" name="txt' + i + '" id="p_scnt" placeholder="Enter Title" />'
                $('#dvfiles').append('<p>' + add_txt + "&nbsp;&nbsp;" + add_input + '</p>');
                i++;


            });

            $("#dvfiles a").live('click', function () {

                $(this).prev("input[type=file]").remove();
                $(this).parents('p').remove();
                $(this).remove();
            });

        });

        $(document).submit(function () {

            var flag = true;

            $("#dvfiles input[type=file]").each(function () {

                if ($(this).val() == "") {

                    $(this).css("background", "Red");

                    flag = false;
                }

            });

            return flag;

        });       

    </script>
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
    <form id="form1" runat="server" enctype="multipart/form-data">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
   
    <table width="800px">
        <tr>
            <td align="left" style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"
                valign="top">
                Select Journalist :
                <cc1:ComboBox ID="ddlJournalist" runat="server" AutoPostBack="True"
                    Width="650px" onselectedindexchanged="ddlJournalist_SelectedIndexChanged" 
                    AutoCompleteMode="SuggestAppend">
                </cc1:ComboBox>
            </td>
        </tr>
        <tr>
            <td align="left" style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">
                Upload&nbsp; Files and Papers :
            </td>
        </tr>
        <tr>
            <td align="left">
                <div id="dvfiles">
                </div>
            </td>
        </tr>
        <tr>
            <td align="left" class="LabelColor">
                <a id="addfile" href="#">Add file..</a>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Label ID="lblMessage" runat="server" CssClass="LabelColor"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnUpload" runat="server" Text="Upload" 
                    OnClick="btnUpload_Click" CssClass="LabelColor" />
            </td>
        </tr>
        <tr>
            <td align="left">
              
                    <asp:GridView ID="GridViewFiles" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="DwnId" Width="800px" 
                        onrowdeleting="GridViewFiles_RowDeleting" Font-Names="Arial" Font-Size="12px">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="JournalId" HeaderText="Journal Id" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="DwnFile" HeaderText="Uploaded File" />
                            <asp:BoundField DataField="DwnExt" HeaderText="File Extension" />
                            <asp:BoundField DataField="DwnDate" HeaderText="Date" ApplyFormatInEditMode="False" />
                             <asp:BoundField DataField="DownloadId" HeaderText="Download Link" />
                             <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="btmimg_delete" CommandName="Delete" ImageUrl="~/images/trash-icon.png" ToolTip="Delete File" OnClientClick="return confirm('Are you sure you want to delete this file!')"  />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                        </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
            </td>
        </tr>
    </table>
   
    <br />
    <br />
    </form>
</body>
</html>
