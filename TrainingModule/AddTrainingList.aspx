<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddTrainingList.aspx.cs" Inherits="HRMS.TrainingModule.AddTrainingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container mt-4">
        <h3 class="mb-4">Add Training List</h3>

        <div class="mb-3">
            <label>Trainer</label>
            <asp:DropDownList ID="trainernames" runat="server" CssClass="form-select"></asp:DropDownList>
        </div>

        <div class="mb-3">
            <label>Training Type</label>
            <asp:DropDownList ID="trainingtypes" runat="server" CssClass="form-select"></asp:DropDownList>
        </div>

        <div class="mb-3">
            <label>Employee</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>Training Cost</label>
            <asp:TextBox ID="txtcost" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>Description</label>
            <asp:TextBox ID="txtdes" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="4" />
        </div>

        <div class="mb-3">
            <label>Status</label>
            <asp:DropDownList ID="Trainingstat" runat="server" CssClass="form-select">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label>Start Date</label>
                <asp:TextBox ID="txtstartdate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label>End Date</label>
                <asp:TextBox ID="txtenddate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
        </div>

        <div class="mt-4">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Add" />
        </div>
    </div>
</asp:Content>