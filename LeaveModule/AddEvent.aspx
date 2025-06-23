<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="HRMS.LeaveModule.AddEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
  <div class="card">
    <div class="card-header bg-primary text-white"><h4>Add Event Type</h4></div>
    <div class="card-body">
      <div class="form-group">
        <label>Event Type:</label>
        <asp:TextBox ID="txtEventType" runat="server" CssClass="form-control" />
      </div>
      <div class="form-group">
        <label>Choose Color:</label>
        <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" TextMode="Color" />
      </div>
      <asp:Button ID="btnAddEventType" runat="server" Text="Add Event Type" CssClass="btn btn-primary" OnClick="btnAddEventType_Click" />
      <asp:Label ID="lblMsg" runat="server" CssClass="text-success font-weight-bold" />
        <br />
        <br />
       
    </div>
  </div>
</div>


</asp:Content>
