<%@ Page Language="C#" MasterPageFile="~/Hr/HR.Master" AutoEventWireup="true" CodeBehind="AddEarning.aspx.cs" Inherits="HRMS.Payslips.AddEarning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded shadow p-4 bg-white" style="min-width: 500px;">
            <h4 class="text-center mb-4">Add Earning</h4>

            <div class="mb-3">
                Earning Type
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" />
            </div>

            <div class="mb-3">
                Earning Percentage
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                Department
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" CssClass="form-select" />
            </div>

            <div class="mb-4">
                Designation
                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select" />
            </div>

            <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn btn-primary w-100" OnClick="Button1_Click" />
        </div>
    </div>
</asp:Content>