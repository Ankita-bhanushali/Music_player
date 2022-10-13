<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cregister.aspx.cs" Inherits="player.Cregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-image:url("11.jpg");
            background-size:cover;
        }
        .reg {
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            text-align: center;
            margin:1px 32% 1px 32%;
            
            width: 408px;
            height: 666px;
            border-radius:10% 10%;
            color:white; 
        }
         #form1 {
            height: 666px;
            width: 408px;
        }
    </style>
</head>
<body>
    <br /><br /><br />
    <div class="reg">
    <form id="form1" runat="server">
        <br /><br />
        <asp:Label ID="Label1" runat="server" Text="CREATOR ID"></asp:Label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="Enter The Name" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="userid" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label8" runat="server" Text="NAME"></asp:Label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="name" ErrorMessage="Enter The Name" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="name" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label2" runat="server" Text="EMAIL"></asp:Label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" ErrorMessage="Enter The Email ID" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label3" runat="server" Text="MOBILE NO"></asp:Label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="mobile" ErrorMessage="Enter The Mobile" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="mobile" runat="server" TextMode="Phone"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label4" runat="server" Text="PASSWORD"></asp:Label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="pass" ErrorMessage="Enter The PassWord" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label5" runat="server" Text="CONFIRM PASSWORD"></asp:Label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="repass" ErrorMessage="Enter The PassWord" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="repass" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pass" ControlToValidate="repass" ErrorMessage="PassWord Dose Not Match" ForeColor="Red"></asp:CompareValidator>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" NavigateUrl="~/login.aspx">Login As User</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Red" NavigateUrl="~/clogin.aspx">Login As Creator</asp:HyperLink>
        <br />
        <br /><br />
        <br /><br />
    </form>
    </div>
</body>
</html>




