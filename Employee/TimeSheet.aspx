<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="TimeSheet.aspx.cs" Inherits="HRMS.TimeSheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded shadow p-4 bg-white" style="min-width: 500px;">
            <h4 class="text-center mb-4">Employee Timesheet</h4>

            <div class="mb-3">
                <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name:" CssClass="form-label" />
                <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Department:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                    <asp:ListItem>IT</asp:ListItem>
                    <asp:ListItem>HR</asp:ListItem>
                    <asp:ListItem>Sales</asp:ListItem>
                    <asp:ListItem>Finance</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="mb-3">
                <asp:Label ID="lblDate" runat="server" Text="Date:" CssClass="form-label" />
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <asp:Label ID="lblCheckIn" runat="server" Text="Check-In Time:" CssClass="form-label" />
                <div class="input-group">
                    <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Time" CssClass="form-control" />
                    <asp:Button ID="btnCheckIn" runat="server" Text="Check In" CssClass="btn btn-outline-secondary" />
                </div>
            </div>

            <div class="mb-3">
                <asp:Label ID="lblCheckOut" runat="server" Text="Check-Out Time:" CssClass="form-label" />
                <div class="input-group">
                    <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Time" CssClass="form-control" />
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn btn-outline-secondary" />
                </div>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Timesheet" CssClass="btn btn-primary w-100 mt-3" OnClick="btnSubmit_Click1" />
        </div>
    </div>
</asp:Content>