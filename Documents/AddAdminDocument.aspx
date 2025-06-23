<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddAdminDocument.aspx.cs" Inherits="HRMS.Documents.AddAdminDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="bg-white p-5 rounded-3 border border-dark shadow" style="min-width: 500px;">
            <h4 class="text-center text-primary mb-4">Add Admin Document Name</h4>

            <div class="mb-3">
                <label for="txtdoc" class="form-label">Document Name</label>
                <asp:TextBox ID="txtdoc" runat="server" CssClass="form-control" placeholder="Enter document name"></asp:TextBox>
            </div>

            <div class="text-end">
                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" CssClass="btn btn-primary px-4" />
            </div>
        </div>
    </div>
</asp:Content>