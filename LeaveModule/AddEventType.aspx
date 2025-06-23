<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddEventType.aspx.cs" Inherits="HRMS.LeaveModule.AddEventType" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
    <div class="card shadow border-0">
        <div class="card-header bg-success text-white">
            <h4 class="mb-0">Add Event</h4>
        </div>
        <div class="card-body">
            <div class="form-group">
                <label>Event Type</label>
                <asp:DropDownList ID="ddlEventType" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label>Event Name</label>
                <asp:TextBox ID="txtEventName" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label>Event Date</label>
                <asp:TextBox ID="txtEventDate" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
            <div class="form-group">
                <label>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Inactive" Value="Inactive" />
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnAddEventType" runat="server" Text="Add Event" CssClass="btn btn-success font-weight-bold" OnClick="btnAddEventType_Click" />
            <br /><br />
            <asp:Label ID="lblResult" runat="server" CssClass="text-success font-weight-bold" />
        </div>
    </div>

    <div class="mt-4 card shadow-sm border-0">
        <div class="card-header bg-light">
            <h5 class="mb-0">Event Calendar</h5>
        </div>
        <div class="card-body">
            <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" CssClass="table table-bordered" />
        </div>
    </div>
</div>



</asp:Content>
