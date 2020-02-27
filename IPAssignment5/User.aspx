<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="IPAssignment5.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <div style="text-align: center; color: white; padding-top: 50px">
        
    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="White" Font-Size="X-Large"></asp:Label>
       
        <div>
            <br /><br />
            <table style="width: 50%; margin-left:25%; font-size: large;">
                <tr>
                    <td class="auto-style2">First Name</td>
                    <td style="text-align: left">
                        <asp:Label ID="Label2" runat="server" Text="Label" ForeColor="White"></asp:Label></td>

                </tr>
                <tr>
                    <td class="auto-style2">Last Name</td>
                    <td style="text-align: left">
                        <asp:Label ID="Label3" runat="server" Text="Label" ForeColor="White"></asp:Label></td>

                </tr>
                <tr>
                    <td class="auto-style2">Email</td>
                    <td style="text-align: left">
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style2">Country</td>
                    <td style="text-align: left">
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
                </tr>
            </table>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
