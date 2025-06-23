<%@ Page Language="C#" MasterPageFile="~/Hr/HR.Master" AutoEventWireup="true" CodeBehind="PayslipGenerate.aspx.cs" Inherits="HRMS.Payslips.PayslipGenerate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded shadow p-4 bg-white" style="min-width: 500px;">
            <h4 class="text-center mb-4">Generate Payslip</h4>

            <div class="mb-3">
                Department
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-select" />
            </div>

            <div class="mb-3">
                Employee
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" />
            </div>

            <div class="mb-4">
                Select Month
                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select">
                    <asp:ListItem Value="30">January</asp:ListItem>
                    <asp:ListItem Value="30">February</asp:ListItem>
                    <asp:ListItem Value="30">March</asp:ListItem>
                    <asp:ListItem Value="30">April</asp:ListItem>
                    <asp:ListItem Value="30">May</asp:ListItem>
                    <asp:ListItem Value="30">June</asp:ListItem>
                    <asp:ListItem Value="30">July</asp:ListItem>
                    <asp:ListItem Value="30">August</asp:ListItem>
                    <asp:ListItem Value="30">September</asp:ListItem>
                    <asp:ListItem Value="30">October</asp:ListItem>
                    <asp:ListItem Value="30">November</asp:ListItem>
                    <asp:ListItem Value="30">December</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generate Payslip" CssClass="btn btn-primary w-100" />
        </div>
    </div>
</asp:Content>