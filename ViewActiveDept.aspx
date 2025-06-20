<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewActiveDept.aspx.cs" Inherits="HRMS.ViewActiveDept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="did" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            <asp:BoundField DataField="did" HeaderText="did" InsertVisible="False" ReadOnly="True" SortExpression="did" />
            <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
            <asp:BoundField DataField="Dstat" HeaderText="Dstat" SortExpression="Dstat" />
        </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [DepartmentStatus] WHERE [did] = @original_did AND (([DepartmentName] = @original_DepartmentName) OR ([DepartmentName] IS NULL AND @original_DepartmentName IS NULL)) AND (([Dstat] = @original_Dstat) OR ([Dstat] IS NULL AND @original_Dstat IS NULL))" InsertCommand="INSERT INTO [DepartmentStatus] ([DepartmentName], [Dstat]) VALUES (@DepartmentName, @Dstat)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [did], [DepartmentName], [Dstat] FROM [DepartmentStatus] WHERE ([Dstat] = @Dstat)" UpdateCommand="UPDATE [DepartmentStatus] SET [DepartmentName] = @DepartmentName, [Dstat] = @Dstat WHERE [did] = @original_did AND (([DepartmentName] = @original_DepartmentName) OR ([DepartmentName] IS NULL AND @original_DepartmentName IS NULL)) AND (([Dstat] = @original_Dstat) OR ([Dstat] IS NULL AND @original_Dstat IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_did" Type="Int32" />
        <asp:Parameter Name="original_DepartmentName" Type="String" />
        <asp:Parameter Name="original_Dstat" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="DepartmentName" Type="String" />
        <asp:Parameter Name="Dstat" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="Active" Name="Dstat" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="DepartmentName" Type="String" />
        <asp:Parameter Name="Dstat" Type="String" />
        <asp:Parameter Name="original_did" Type="Int32" />
        <asp:Parameter Name="original_DepartmentName" Type="String" />
        <asp:Parameter Name="original_Dstat" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
