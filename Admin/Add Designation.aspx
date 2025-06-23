<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Add Designation.aspx.cs" Inherits="HRMS.Admin.Add_Designation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-start min-vh-100 py-5">
        <div class="bg-white border border-dark rounded-4 p-5 shadow" style="min-width: 600px;">
            <h3 class="text-center mb-4 text-primary">Add Designation For Employees</h3>

            <div class="mb-3">
                <label for="DropDownList1" class="form-label">Department</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select"
                    DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:dbconn %>"
                    SelectCommand="SELECT [DepartmentName] FROM [DepartmentStatus] WHERE ([Dstat] = @Dstat)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Active" Name="Dstat" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="mb-3">
                <label for="TextBox1" class="form-label">Designation Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label class="form-label">Status</label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select w-100">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="text-end">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary px-4" Text="Add Designation" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>