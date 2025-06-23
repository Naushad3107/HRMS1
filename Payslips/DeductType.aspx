<%@ Page Language="C#" MasterPageFile="~/Hr/HR.Master" AutoEventWireup="true" CodeBehind="DeductType.aspx.cs" Inherits="HRMS.Payslips.DeductType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="card shadow-sm w-100" style="max-width: 450px;">
            <div class="card-header bg-primary text-white text-center">
                <h5 class="mb-0">Add Deduction Type</h5>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="TextBox1" class="form-label">Deduction Type</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="Button1" runat="server" Text="Save"
                    OnClick="Button1_Click" CssClass="btn btn-success w-100 mb-2" />

                <asp:Button ID="Button2" runat="server" Text="Add Deduction"
                    OnClick="Button2_Click" CssClass="btn btn-outline-primary w-100" />
            </div>
        </div>
    </div>
</asp:Content>