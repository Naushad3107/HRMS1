<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddTrainingType.aspx.cs" Inherits="HRMS.TrainingModule.AddTrainingType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded p-4 bg-white shadow" style="min-width: 800px;">
            <h4 class="mb-4 text-center">Add Training Type</h4>

            <div class="mb-3">
                Training Type
                <asp:TextBox ID="txttype" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                Description
                <asp:TextBox ID="txtdes" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-4">
                Status
                <asp:DropDownList ID="trainingstat" runat="server" CssClass="form-select">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn btn-primary w-100" OnClick="Button1_Click" />

            <hr class="my-5" />

            <h5 class="text-center">List Of Training Types</h5>

            <asp:GridView ID="GridView1" runat="server"
                AllowSorting="True"
                AutoGenerateColumns="False"
                DataKeyNames="TrainingTypeId"
                DataSourceID="SqlDataSource1"
                Visible="False"
                CssClass="table table-bordered table-hover mt-3 w-auto mx-auto">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="TrainingTypeId" HeaderText="TrainingTypeId" InsertVisible="False" ReadOnly="True" SortExpression="TrainingTypeId" />
                    <asp:BoundField DataField="TrainingType" HeaderText="TrainingType" SortExpression="TrainingType" />
                    <asp:BoundField DataField="TrainingDescription" HeaderText="TrainingDescription" SortExpression="TrainingDescription" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:dbconn %>"
                DeleteCommand="DELETE FROM [TrainingType] WHERE [TrainingTypeId] = @original_TrainingTypeId AND (([TrainingType] = @original_TrainingType) OR ([TrainingType] IS NULL AND @original_TrainingType IS NULL)) AND (([TrainingDescription] = @original_TrainingDescription) OR ([TrainingDescription] IS NULL AND @original_TrainingDescription IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL))"
                InsertCommand="INSERT INTO [TrainingType] ([TrainingType], [TrainingDescription], [Status]) VALUES (@TrainingType, @TrainingDescription, @Status)"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [TrainingType]"
                UpdateCommand="UPDATE [TrainingType] SET [TrainingType] = @TrainingType, [TrainingDescription] = @TrainingDescription, [Status] = @Status WHERE [TrainingTypeId] = @original_TrainingTypeId AND (([TrainingType] = @original_TrainingType) OR ([TrainingType] IS NULL AND @original_TrainingType IS NULL)) AND (([TrainingDescription] = @original_TrainingDescription) OR ([TrainingDescription] IS NULL AND @original_TrainingDescription IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_TrainingTypeId" Type="Int32" />
                    <asp:Parameter Name="original_TrainingType" Type="String" />
                    <asp:Parameter Name="original_TrainingDescription" Type="String" />
                    <asp:Parameter Name="original_Status" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TrainingType" Type="String" />
                    <asp:Parameter Name="TrainingDescription" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TrainingType" Type="String" />
                    <asp:Parameter Name="TrainingDescription" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="original_TrainingTypeId" Type="Int32" />
                    <asp:Parameter Name="original_TrainingType" Type="String" />
                    <asp:Parameter Name="original_TrainingDescription" Type="String" />
                    <asp:Parameter Name="original_Status" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>