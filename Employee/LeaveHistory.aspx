<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="LeaveHistory.aspx.cs" Inherits="HRMS.Employee.LeaveHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    LeaveHistory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
    <div class="card shadow-lg border-0">
        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">Your Leave History</h4>
        </div>
        <div class="card-body">

            <asp:GridView ID="gvLeaveHistory" runat="server" AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover text-center">

                <HeaderStyle CssClass="thead-light" />
                <Columns>
                    <asp:BoundField DataField="leaveType" HeaderText="Leave Type" />
                    <asp:BoundField DataField="fromDate" HeaderText="From" DataFormatString="{0:dd MMM yyyy}" />
                    <asp:BoundField DataField="toDate" HeaderText="To" DataFormatString="{0:dd MMM yyyy}" />
                    <asp:BoundField DataField="daysRequested" HeaderText="Days (Excl. Sundays)" />
                    <asp:BoundField DataField="reason" HeaderText="Reason" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                    <asp:BoundField DataField="applyDate" HeaderText="Applied On" DataFormatString="{0:dd MMM yyyy}" />
                </Columns>
            </asp:GridView>

        </div>
    </div>
</div>

</asp:Content>
