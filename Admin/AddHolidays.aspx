<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddHolidays.aspx.cs" Inherits="HRMS.Admin.AddHolidays" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
    <div class="card shadow-lg border-0">
        <div class="card-header bg-warning text-dark">
            <h4 class="mb-0">Add Holiday</h4>
        </div>
        <div class="card-body">

            <div class="form-group">
                <label for="txtHolidayName">Holiday Name</label>
                <asp:TextBox ID="txtHolidayName" runat="server" CssClass="form-control" placeholder="e.g., Independence Day" />
            </div>

            <div class="form-group">
                <label for="txtHolidayDate">Holiday Date</label>
                <asp:TextBox ID="txtHolidayDate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="ddlStatus">Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Inactive" Value="Inactive" />
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnAddHoliday" runat="server" Text="Add Holiday"
                CssClass="btn btn-warning font-weight-bold" OnClick="btnAddHoliday_Click" />
            <br /><br />

            <asp:Label ID="lblMessage" runat="server" CssClass="text-success font-weight-bold" />

        </div>
    </div>
</div>


</asp:Content>
