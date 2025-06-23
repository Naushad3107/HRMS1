<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="AddDeptForm.aspx.cs" Inherits="HRMS.AddDeptForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #f0f2f5;
        }
        .form-label {
            font-weight: 500;
        }
        .form-wrapper {
            max-width: 500px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5 d-flex justify-content-center align-items-start min-vh-100">
        <div class="form-wrapper bg-white border rounded-4 shadow p-5">
            <h4 class="text-center text-primary mb-4">Add Department</h4>

            <div class="mb-3">
                <label class="form-label">Department Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label class="form-label">Department Status</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" >
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="d-flex justify-content-between mt-4">
                <asp:Button ID="Button1" runat="server" Text="Create"
                    CssClass="btn btn-success w-50 me-2" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Home"
                    CssClass="btn btn-outline-secondary w-50 ms-2" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>