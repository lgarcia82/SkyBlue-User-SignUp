<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SuccessPage.aspx.cs" Inherits="IPAssignment5.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container text-center" style="padding:200px; color:white">
         <div class="row" style="padding-top:50px">
                <div class="col-md-2"></div>
                <div class="col-md-8" style="text-align:center"><h2 style="font-size: 50px">Sign Up Successful!</h2>
                    <br /><br />
                    <h3 style="font-size:xx-large">Welcome</h3>
                    <br />
                    <asp:Label ID="lblUserFullName" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
                    </div>
                <div class="col-md-2"></div>
                </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
