﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="EditTable.aspx.cs" Inherits="IPAssignment5.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top: 150px">
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IPAssignment4ConnectionString4 %>" 
        SelectCommand="SELECT * FROM [User] WHERE ([User_ID] = @User_ID)" 
        InsertCommand="INSERT INTO [User] ([User_Username], [User_Password], [User_Email], [User_FName], [User_LName], [User_Country]) VALUES (@User_Username, @User_Password, @User_Email, @User_FName, @User_LName, @User_Country)" DeleteCommand="DELETE FROM [User] WHERE [User_ID] = @User_ID" UpdateCommand="UPDATE [User] SET [User_Username] = @User_Username, [User_Password] = @User_Password, [User_Email] = @User_Email, [User_FName] = @User_FName, [User_LName] = @User_LName, [User_Country] = @User_Country WHERE [User_ID] = @User_ID">
        <DeleteParameters>
            <asp:Parameter Name="User_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="User_Username" Type="String" />
            <asp:Parameter Name="User_Password" Type="String" />
            <asp:Parameter Name="User_Email" Type="String" />
            <asp:Parameter Name="User_FName" Type="String" />
            <asp:Parameter Name="User_LName" Type="String" />
            <asp:Parameter Name="User_Country" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="User_ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="User_Username" Type="String" />
            <asp:Parameter Name="User_Password" Type="String" />
            <asp:Parameter Name="User_Email" Type="String" />
            <asp:Parameter Name="User_FName" Type="String" />
            <asp:Parameter Name="User_LName" Type="String" />
            <asp:Parameter Name="User_Country" Type="String" />
            <asp:Parameter Name="User_ID" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" ShowFooter="True" style="margin:auto" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Center" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="User_ID" HeaderText="User_ID" InsertVisible="False" ReadOnly="True" SortExpression="User_ID" />
            <asp:BoundField DataField="User_Username" HeaderText="User_Username" SortExpression="User_Username" />
            <asp:BoundField DataField="User_Email" HeaderText="User_Email" SortExpression="User_Email" />
            <asp:BoundField DataField="User_Password" HeaderText="User_Password" SortExpression="User_Password" />
            <asp:BoundField DataField="User_FName" HeaderText="User_FName" SortExpression="User_FName" />
            <asp:BoundField DataField="User_LName" HeaderText="User_LName" SortExpression="User_LName" />
            <asp:BoundField DataField="User_Country" HeaderText="User_Country" SortExpression="User_Country" />
        </Columns>
        <EditRowStyle BorderStyle="Dashed" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
</asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" BackColor="White" BorderColor="#0066FF"/>
        <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" ForeColor="Red" runat="server" BackColor="White" BorderColor="#0066FF" />       
        <br /><br />
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
