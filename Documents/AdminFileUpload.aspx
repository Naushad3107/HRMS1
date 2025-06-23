<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminFileUpload.aspx.cs" Inherits="HRMS.Documents.AdminFileUpload" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-start min-vh-100 py-5">
        <div class="bg-white border border-dark rounded-4 p-5 shadow" style="min-width: 500px;">
            <h4 class="text-center text-primary mb-4">Admin File Upload</h4>

            <div class="mb-3">
                <label for="regemail" class="form-label">Employee</label>
                <asp:DropDownList ID="regemail" runat="server" CssClass="form-select" AutoPostBack="true"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label for="docname" class="form-label">Document Name</label>
                <asp:DropDownList ID="docname" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label for="FileUpload1" class="form-label">Select File</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </div>

            <div class="text-end">
                <asp:Button ID="Button1" runat="server" Text="Send" CssClass="btn btn-primary px-4" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>