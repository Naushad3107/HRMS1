<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="ApplyLeave.aspx.cs" Inherits="HRMS.Employee.ApplyLeave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
    <div class="card shadow border-0 mb-4">
        <div class="card-header bg-success text-white">
            <h4 class="mb-0">Apply for Leave</h4>
        </div>
        <div class="card-body">

            <h5 class="text-secondary">Your Leave Balance</h5>
            <asp:GridView ID="gvLeaveBalance" runat="server" AutoGenerateColumns="False"
                CssClass="table table-striped table-bordered text-center mb-4">
                <Columns>
                    <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                    <asp:BoundField DataField="maxDays" HeaderText="Max Allowed" />
                    <asp:BoundField DataField="usedDays" HeaderText="Used" />
                    <asp:BoundField DataField="remainingDays" HeaderText="Balance" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblStatus" runat="server" CssClass="text-danger font-weight-bold" />


            <div class="form-group mt-3">
                <label for="ddlLeaveType">Leave Type</label>
                <asp:DropDownList ID="ddlLeaveType" runat="server" CssClass="form-control" />
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="txtFromDate">From Date</label>
                    <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
                <div class="form-group col-md-6">
                    <label for="txtToDate">To Date</label>
                    <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label for="txtReason">Reason</label>
                <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            </div>

            <asp:Button ID="btnApply" runat="server" Text="Apply Leave"
                OnClick="btnApply_Click1" CssClass="btn btn-primary btn-block font-weight-bold" />

        </div>
    </div>



    <div class="card shadow border-0">
        <div class="card-header bg-warning text-dark">
            <h5 class="mb-0">Upcoming Holidays</h5>
        </div>
        <div class="card-body">
            <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender1"
                CssClass="table calendar-table" />
        </div>
    </div>
</div>


    
    
</asp:Content>
