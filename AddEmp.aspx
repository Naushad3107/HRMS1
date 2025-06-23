<%@ Page Title="Add Employee" Language="C#" MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="AddEmp.aspx.cs" Inherits="HRMS.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #f0f2f5;
        }

        .form-label {
            font-weight: 500;
        }

        .form-wrapper {
            max-width: 800px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5 d-flex justify-content-center align-items-start min-vh-100">
        <div class="form-wrapper bg-white border rounded-4 shadow p-5">
            <h3 class="text-center text-primary mb-4">Add New Employee</h3>

            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Employee Name</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                    &nbsp;&nbsp;
               
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Role</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Manager</asp:ListItem>
                        <asp:ListItem>Employee</asp:ListItem>
                        <asp:ListItem>HR</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Salary</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">PAN Card No</label>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Assessment Year</label>
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" />
                </div>


                <div class="col-md-6">
                    <label for="DropDownList4" class="form-label">Department</label>
                    <asp:DropDownList ID="DropDownList4" runat="server"
                        CssClass="form-select"
                        DataSourceID="SqlDataSource1"
                        DataTextField="DepartmentName"
                        DataValueField="DepartmentName"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select Department --" Value="" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:dbconn %>"
                        SelectCommand="SELECT [DepartmentName] FROM [DepartmentStatus] WHERE ([Dstat] = @Dstat)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Active" Name="Dstat" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="col-md-6">
                    <label for="DropDownList5" class="form-label">Designation</label>
                    <asp:DropDownList ID="DropDownList5" runat="server"
                        CssClass="form-select"
                        DataSourceID="SqlDataSource2"
                        DataTextField="Designation"
                        DataValueField="Designation"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select Designation --" Value="" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:dbconn %>"
                        SelectCommand="SELECT [Designation] FROM [AddDesignation] WHERE ([DesigStatus] = @DesigStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Active" Name="DesigStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Phone</label>
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Gender</label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Status</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="d-flex justify-content-between mt-4">
                <asp:Button ID="Button1" runat="server" Text="Add"
                    CssClass="btn btn-success px-4 w-50 me-2" OnClick="Button1_Click" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please Enter Pan no."></asp:RequiredFieldValidator>
                <asp:Button ID="Button2" runat="server" Text="Home"
                    CssClass="btn btn-outline-secondary px-4 w-50 ms-2" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>
