<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" UnobtrusiveValidationMode="None" Inherits="IPAssignment5.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row" style="padding-top: 40px;  width: 100%; margin-left: 0px">
        <p style="padding-bottom:40px; text-align:center; width:100%" >
        <asp:Label ID="lblAdmin" runat="server" Text="Label" ForeColor="White" Font-Size="Large"></asp:Label>
            </p>
        <div class="gridView" style="margin-left: 15%;">
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="User_ID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
        </div>

        <div class="detailView" style="margin: 0% 5% 5% 15%; position: relative; float: right; text-align: right">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateRows="False" DataSourceID="SqlDataSource2" HorizontalAlign="Right">
                <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="User_ID" HeaderText="User_ID" InsertVisible="False" ReadOnly="True" SortExpression="User_ID" />
                    <asp:BoundField DataField="User_Username" HeaderText="User_Username" SortExpression="User_Username" />
                    <asp:BoundField DataField="User_Email" HeaderText="User_Email" SortExpression="User_Email" />
                    <asp:BoundField DataField="User_Password" HeaderText="User_Password" SortExpression="User_Password" />
                    <asp:BoundField DataField="User_FName" HeaderText="User_FName" SortExpression="User_FName" />
                    <asp:BoundField DataField="User_LName" HeaderText="User_LName" SortExpression="User_LName" />
                    <asp:BoundField DataField="User_Country" HeaderText="User_Country" SortExpression="User_Country" />
                </Fields>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IPAssignment4ConnectionString4 %>" SelectCommand="SELECT * FROM [User] WHERE ([User_ID] = @User_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="User_ID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IPAssignment4ConnectionString4 %>" SelectCommand="SELECT * FROM [User]">
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <br /><br />
        <div >
        <asp:Button CssClass="btn-block" ID="btnEditTable" runat="server" width="80%" height="50px" Text="Edit Table" style="margin-left: 10%" CausesValidation="False" OnClick="btnEditTable_Click" />
            <br /><br />
    </div>
    </asp:Content>
