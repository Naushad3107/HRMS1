<%@ Page Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="AddLeaves.aspx.cs" Inherits="HRMS.Manager.AddLeaves" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Add Leaves
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="container mt-4">
    <div class="card shadow-lg border-0">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Add New Leave Type</h4>
        </div>
        <div class="card-body">
            <div class="form-group">
                <label for="txtLeaveType">Leave Type:</label>
                <asp:TextBox ID="txtLeaveType" runat="server" CssClass="form-control" placeholder="e.g., Sick Leave" />
            </div>

            <div class="form-group">
                <label for="txtMaxDays">Max Days Allowed:</label>
                <asp:TextBox ID="txtMaxDays" runat="server" CssClass="form-control" placeholder="e.g., 5" />
            </div>

            <asp:Button ID="btnAddLeave" runat="server" Text="Add Leave" CssClass="btn btn-success" OnClick="btnAddLeave_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success font-weight-bold" />
        </div>
    </div>
</div>
    
    
</asp:Content>
