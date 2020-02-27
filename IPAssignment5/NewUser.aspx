<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" UnobtrusiveValidationMode="None" Inherits="IPAssignment5.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentNewUser" class="container text-center">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:Label ID="lblHeader" runat="server" Text="New User Registration" Font-Size="XX-Large" ForeColor="White"></asp:Label>
            </div>
            <div class="col-md-4"></div>
        </div>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IPAssignment4ConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
        </p>
        <br />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="userNameError" runat="server" ControlToValidate="txtUserName" ErrorMessage="*Required Field" Font-Bold="True" ForeColor="Red" Font-Size="X-Large" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-4"></div>
        </div>
        <p></p>
        <br />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailError" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Required Field" Font-Bold="True" ForeColor="Red" Font-Size="X-Large" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-4"></div>
        </div>
        <br />
        <br />
        <br />
        <div>
            <asp:Label class="alert alert-danger" ID="lblError" runat="server" Visible="False" Font-Size="Large"></asp:Label>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:Button CssClass="submitBtn" ID="Button1" runat="server" Text="Sign Up" Font-Bold="False" Font-Size="Large" Height="60px" Width="167px" OnClick="Button1_Click" />
            </div>
            <div class="col-md-4"></div>
        </div>

    </div>
</asp:Content>
