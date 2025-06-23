<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="MasterDocumentsList.aspx.cs" Inherits="HRMS.Documents.MasterDocumentsList" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="bg-white border border-dark rounded-4 p-5 shadow" style="min-width: 400px;">
            <h4 class="text-center text-primary mb-4">View Document Lists</h4>

            <div class="d-grid gap-3">
                <asp:Button ID="Button1" runat="server" Text="Admin Document List" CssClass="btn btn-outline-primary" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Employee Document List" CssClass="btn btn-outline-secondary" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>