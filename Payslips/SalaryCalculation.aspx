<%@ Page Language="C#" MasterPageFile="~/Hr/HR.Master" AutoEventWireup="true" CodeBehind="SalaryCalculation.aspx.cs" Inherits="HRMS.Payslips.SalaryCalculation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded bg-white shadow p-4" style="min-width: 600px;">
            <h4 class="text-center mb-4">Salary Calculation</h4>

            <div class="mb-3">
                Department
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-select" />
            </div>

            <div class="mb-3">
                Employee
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" />
            </div>

            <div class="mb-3">
                Salary
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" OnTextChanged="TextBox1_TextChanged" />
            </div>

            <asp:Button ID="Button1" runat="server" Text="Save Salary" CssClass="btn btn-primary w-100" />

            <hr class="my-5" />

            <asp:PlaceHolder ID="phEarnings" runat="server" />
            <asp:PlaceHolder ID="phDeductions" runat="server" />
        </div>
    </div>
</asp:Content>