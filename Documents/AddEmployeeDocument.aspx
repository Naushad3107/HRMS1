<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddEmployeeDocument.aspx.cs" Inherits="HRMS.Documents.AddEmployeeDocument" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-start min-vh-100 py-5">
        <div class="bg-white border border-dark rounded-4 p-5 shadow" style="min-width: 500px;">
            <h4 class="text-center text-primary mb-4">Add Employee Document Name</h4>

            <div class="mb-3">
                <label for="txtdoc" class="form-label">Document Name</label>
                <asp:TextBox ID="txtdoc" runat="server" CssClass="form-control" placeholder="Enter document name" />
            </div>

            <div class="text-end">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                    Text="Add" CssClass="btn btn-success px-4" />
            </div>
        </div>
    </div>
</asp:Content>