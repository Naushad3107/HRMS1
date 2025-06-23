<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="MasterDocuments.aspx.cs" Inherits="HRMS.Documents.MasterDocuments" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="bg-white border border-dark rounded-4 p-5 shadow text-center">
            <asp:Button ID="Button1" runat="server" Text="Click Me" CssClass="btn btn-primary px-4" OnClick="Button1_Click" />
        </div>
    </div>
</asp:Content>