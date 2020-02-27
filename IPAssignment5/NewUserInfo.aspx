<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewUserInfo.aspx.cs" UnobtrusiveValidationMode="None" Inherits="IPAssignment5.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center" style="text-align: center; padding-top: 120px">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:Label ID="lblHeader" runat="server" Text="Welcome" Font-Size="XX-Large" ForeColor="White"></asp:Label>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IPAssignment4ConnectionString %>" SelectCommand="SELECT * FROM [Admin]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:TextBox ID="txtUserName" runat="server" Font-Size="X-Large" CssClass="form-control" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="col-md-4"></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:TextBox ID="txtUserEmail" runat="server" Font-Size="X-Large" CssClass="form-control" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="col-md-4"></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:TextBox ID="txtFirstName" runat="server" Font-Size="X-Large" CssClass="form-control" placeholder="Your First Name"></asp:TextBox>
            </div>
            <div class="col-md-4" style="text-align: left">
                <asp:RequiredFieldValidator ID="ErrorFirstName" runat="server" ErrorMessage="*Required Field" ControlToValidate="txtFirstName" Font-Bold="True" ForeColor="Red" Font-Size="X-Large"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:TextBox ID="txtLastName" runat="server" Font-Size="X-Large" CssClass="form-control" placeholder="Your Last Name"></asp:TextBox>
            </div>
            <div class="col-md-4" style="text-align: left">
                <asp:RequiredFieldValidator ID="ErrorLastName" runat="server" ErrorMessage="*Required Field" Font-Bold="True" ForeColor="Red" Font-Size="X-Large" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlCountry" runat="server" Height="52px" Width=100% Font-Size="X-Large" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-md-4" style="text-align: left">
                <asp:RequiredFieldValidator ID="ErrorCountry" runat="server" ErrorMessage="*Required Field" Font-Bold="True" ForeColor="Red" Font-Size="X-Large" ControlToValidate="ddlCountry" InitialValue="(Select Country)"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4" id="passReq" style="font-weight: bold; text-align: left"></div>
            <div class="col-md-4" style="text-align: left">
                <asp:TextBox ID="txtPassword" runat="server" Font-Size="X-Large" CssClass="form-control" placeholder="Your Password" TextMode="Password"></asp:TextBox>
                <asp:Label ID="lblPassConst" runat="server" Visible="False" ForeColor="White"></asp:Label>
            </div>
            <div class="col-md-4" style="text-align: left">
                <asp:RequiredFieldValidator ID="ErrorPassword" runat="server" ErrorMessage="*Required Field" Font-Bold="True" ForeColor="Red" Font-Size="X-Large" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:TextBox ID="txtPasswordConf" runat="server" Font-Size="X-Large" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-md-4" style="text-align: left">
                <asp:RequiredFieldValidator ID="ErrorPasswordConf" runat="server" ErrorMessage="*Required Field" Font-Bold="True" ForeColor="Red" Font-Size="X-Large" ControlToValidate="txtPasswordConf" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareErrorPassword" runat="server" ErrorMessage="*Passwords do not match" Font-Bold="True" ForeColor="Red" Font-Size="X-Large" ControlToCompare="txtPassword" Display="Dynamic" ControlToValidate="txtPasswordConf"></asp:CompareValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="row" style="padding-bottom: 50px">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:Button CssClass="submitBtn" ID="btnSubmit2" runat="server" Font-Bold="False" Font-Size="Large" Height="60px" Width="167px" Text="Create Profile" OnClick="btnSubmit2_Click" />
                <div class="col-md-4"></div>
            </div>
        </div>
        <asp:Label ID="lblSysError" runat="server" Text="Label" Font-Size="X-Large" ForeColor="Red" Visible="False"></asp:Label>
    </div>
</asp:Content>
