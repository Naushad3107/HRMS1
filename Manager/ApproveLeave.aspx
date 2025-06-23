<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="ApproveLeave.aspx.cs" Inherits="HRMS.Manager.ApproveLeave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Approve Leave
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
    <div class="card shadow border-0">
        <div class="card-header bg-info text-white">
            <h4 class="mb-0">Leave Request Timeline</h4>
        </div>
        <div class="card-body">

            <asp:GridView ID="gvAllLeaves" runat="server" AutoGenerateColumns="False" EnableViewState="true"
                OnRowCommand="gvAllLeaves_RowCommand" OnRowDataBound="gvAllLeaves_RowDataBound"
                DataKeyNames="applyId" CssClass="table table-hover table-bordered text-center">

                <HeaderStyle CssClass="thead-dark" />
                <Columns>
                    <asp:BoundField DataField="empId" HeaderText="Emp ID" />
                    <asp:BoundField DataField="eName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="eDepartment" HeaderText="Department" />
                    <asp:BoundField DataField="leaveType" HeaderText="Leave Type" />
                    <asp:BoundField DataField="fromDate" HeaderText="From" DataFormatString="{0:dd MMM yyyy}" />
                    <asp:BoundField DataField="toDate" HeaderText="To" DataFormatString="{0:dd MMM yyyy}" />
                    <asp:BoundField DataField="daysRequested" HeaderText="Days" />
                    <asp:BoundField DataField="reason" HeaderText="Reason" />

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Pending" />
                                <asp:ListItem Text="Approved" />
                                <asp:ListItem Text="Rejected" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-sm btn-outline-primary"
                                CommandName="ChangeStatus"
                                CommandArgument="<%# Container.DataItemIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </div>
</div>


</asp:Content>
