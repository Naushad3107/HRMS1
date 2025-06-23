<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="ManagerHome.aspx.cs" Inherits="HRMS.Manager.ManagerHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <h2>Leave Report Dashboard</h2>
<div class="row text-center">

    <div class="col-md-3">
        <div class="card bg-info text-white p-3 mb-3">
            <h4>Total Requests</h4>
            <asp:Label ID="lblTotal" runat="server" Font-Bold="true" Font-Size="Larger" />
        </div>
    </div>

    <div class="col-md-3">
        <div class="card bg-success text-white p-3 mb-3">
            <h4>Approved</h4>
            <asp:Label ID="lblApproved" runat="server" Font-Bold="true" Font-Size="Larger" />
        </div>
    </div>

    <div class="col-md-3">
        <div class="card bg-warning text-dark p-3 mb-3">
            <h4>Pending</h4>
            <asp:Label ID="lblPending" runat="server" Font-Bold="true" Font-Size="Larger" />
        </div>
    </div>

    <div class="col-md-3">
        <div class="card bg-danger text-white p-3 mb-3">
            <h4>Rejected</h4>
            <asp:Label ID="lblRejected" runat="server" Font-Bold="true" Font-Size="Larger" />
        </div>
    </div>

</div>


</asp:Content>
