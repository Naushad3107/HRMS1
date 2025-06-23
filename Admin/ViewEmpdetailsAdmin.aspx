<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewEmpdetailsAdmin.aspx.cs" Inherits="HRMS.ViewEmpdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="w-100 border border-dark rounded shadow p-4 bg-white" style="max-width: 900px;">
            <h4 class="text-center mb-4">Employee Details</h4>

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="True"
                CssClass="table table-bordered table-striped text-center"
                EmptyDataText="No records found.">
            </asp:GridView>
        </div>
    </div>
</asp:Content>