<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageUpload.aspx.cs" Inherits="Admin_ImageUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                //var add_txt = '<input type="text" name="txt' + i + '" id="p_scnt" placeholder="Enter Title" />'
                $('#dvfiles').append('<p>' + add_input + '</p>');
                i++;


            });

            $("#dvfiles a").live('click', function () {

                $(this).prev("input[type=file]").remove();
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
        <style  type="text/css">
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
            <td align="left" style="color: #0084E9; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">
                Upload&nbsp; Images :
            </td>
        </tr>
        <tr>
            <td align="left">
                <div id="dvfiles">
                </div>
            </td>
        </tr>
        <tr>
            <td align="left">
                <a id="addfile" href="#" class="LabelColor">Add file..</a>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Button ID="btnUpload" runat="server" Text="Upload" 
                    OnClick="btnUpload_Click" Width="150px" CssClass="LabelColor" />
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="5">
                    <ItemTemplate>
                        <table style="width: 191px">
                            <tr>
                                <td align="center" valign="top">
                                    <asp:Image ID="Image1" runat="server" CssClass="magnify" Height="94px" ImageUrl='<%# Eval("Image") %>'
                                        Width="138px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Path") %>' Font-Bold="True"
                                        Font-Names="Times New Roman"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SeparatorStyle BorderColor="#990000" BorderStyle="Solid" />
                </asp:DataList>
            </td>
        </tr>
    </table>
    <br />
    <br />
    </form>
</body>
</html>
