<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddMasterDocuments.aspx.cs" Inherits="HRMS.Documents.AddMasterDocuments" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="bg-white border border-dark rounded-3 p-5 shadow" style="min-width: 400px;">
            <h4 class="text-center text-primary mb-4">Document Options</h4>

            <div class="d-grid gap-3">
                <asp:Button ID="Button1" runat="server" Text="Add Document (Admin)" CssClass="btn btn-primary" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Add Document (Employee)" CssClass="btn btn-secondary" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>