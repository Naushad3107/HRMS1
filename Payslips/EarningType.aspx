<%@ Page Language="C#" MasterPageFile="~/Hr/HR.Master" AutoEventWireup="true" CodeBehind="EarningType.aspx.cs" Inherits="HRMS.Payslips.EarningType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded shadow p-4 bg-white" style="min-width: 400px;">
            <h4 class="text-center mb-4">Add Earning Type</h4>

            <div class="mb-4">
                Earning Type
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
            </div>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" CssClass="btn btn-primary w-100" />
        </div>
    </div>
</asp:Content>