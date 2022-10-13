<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addcreator.aspx.cs" Inherits="player.addcreator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body{
            background-image:url("22.jpg");
            background-size:cover;
            color:white;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Button ID="Button1" runat="server" Text="Back" BackColor="#003366" BorderColor="#003366" OnClick="Button1_Click" />
                
            </asp:Panel>
        </div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label1" runat="server" Text="Select Music File"></asp:Label>
                                </td>
                                <td class="auto-style2">
                                    <asp:FileUpload ID="FileUpload1" runat="server" Width="395px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Music Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="music" runat="server" Width="303px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Singer Name</td>
                                <td>
                                    <asp:TextBox ID="singer" runat="server" Width="303px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="Button4" runat="server" Text="Upload" OnClick="Button4_Click" />
                                    <br />
                                    <asp:Label ID="Label5" runat="server"></asp:Label>
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
