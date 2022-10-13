<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clogin.aspx.cs" Inherits="player.clogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-image:url('11.jpg');
            background-size: cover;
            position:center;
            height: 343px;
        }
        .from {
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            text-align: center;
            margin:1px 32% 1px 32%;
            padding: 2px;
            width: 408px;
            height:346px;
            border-radius: 10% 10%;
            color:white;
            justify-content:center;
            
        }
        

        #form1 {
            height: 346px;
            width: 408px;
        }
        

    </style>
</head>
<body>
    <br /><br /><br />
    <div class="from">
    <form id="form1" runat="server">
        <br /><br />
        <asp:Label ID="UID" runat="server" Text="CREATOR ID" ></asp:Label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UIDT" ErrorMessage="Enter The Creator ID" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="UIDT" runat="server" placeholder="Enter user id"></asp:TextBox>
        <br /><br />
        <asp:Label ID="PASS" runat="server" Text="PASSWORD" ></asp:Label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PASST" ErrorMessage="Enter The PassWord" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="PASST" runat="server" placeholder="Enter password" TextMode="Password"></asp:TextBox>
        <br /><br />
        <asp:Button ID="LOGB" runat="server" Text="LOG IN" OnClick="BLOG_Click" BackColor="#0033CC" BorderColor="#0033CC" ForeColor="Black" />
        <br /><br />
        <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Red" NavigateUrl="~/login.aspx">Login User</asp:HyperLink>
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <asp:HyperLink ID="REGL" runat="server" NavigateUrl="~/Lregister.aspx" ForeColor="Red">Register user</asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" NavigateUrl="~/Cregister.aspx">Register Creator</asp:HyperLink>
    </form>
    </div>
    </body>
</html>

