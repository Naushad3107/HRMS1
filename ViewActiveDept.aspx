<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewActiveDept.aspx.cs" Inherits="HRMS.ViewActiveDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Optional: Add custom CSS or scripts if needed -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="bg-white border border-dark rounded shadow p-4 w-100" style="max-width: 800px;">
            <h4 class="text-center mb-4">Active Departments</h4>

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="did"
                DataSourceID="SqlDataSource1"
                CssClass="table table-bordered table-striped text-center">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    <asp:BoundField DataField="did" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="did" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" SortExpression="DepartmentName" />
                    <asp:BoundField DataField="Dstat" HeaderText="Status" SortExpression="Dstat" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:dbconn %>"
                SelectCommand="SELECT [did], [DepartmentName], [Dstat] FROM [DepartmentStatus] WHERE ([Dstat] = @Dstat)"
                InsertCommand="INSERT INTO [DepartmentStatus] ([DepartmentName], [Dstat]) VALUES (@DepartmentName, @Dstat)"
                UpdateCommand="UPDATE [DepartmentStatus] SET [DepartmentName] = @DepartmentName, [Dstat] = @Dstat WHERE [did] = @original_did AND (([DepartmentName] = @original_DepartmentName) OR ([DepartmentName] IS NULL AND @original_DepartmentName IS NULL)) AND (([Dstat] = @original_Dstat) OR ([Dstat] IS NULL AND @original_Dstat IS NULL))"
                DeleteCommand="DELETE FROM [DepartmentStatus] WHERE [did] = @original_did AND (([DepartmentName] = @original_DepartmentName) OR ([DepartmentName] IS NULL AND @original_DepartmentName IS NULL)) AND (([Dstat] = @original_Dstat) OR ([Dstat] IS NULL AND @original_Dstat IS NULL))"
                OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:Parameter Name="Dstat" Type="String" DefaultValue="Active" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="DepartmentName" Type="String" />
                    <asp:Parameter Name="Dstat" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DepartmentName" Type="String" />
                    <asp:Parameter Name="Dstat" Type="String" />
                    <asp:Parameter Name="original_did" Type="Int32" />
                    <asp:Parameter Name="original_DepartmentName" Type="String" />
                    <asp:Parameter Name="original_Dstat" Type="String" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_did" Type="Int32" />
                    <asp:Parameter Name="original_DepartmentName" Type="String" />
                    <asp:Parameter Name="original_Dstat" Type="String" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>