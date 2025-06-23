<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TrainingPage.aspx.cs" Inherits="HRMS.TrainingModule.TrainingPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container mt-4">
        <div class="mb-3">
            <asp:Button ID="Button1" runat="server" Text="Add Training" CssClass="btn btn-primary" OnClick="Button1_Click" />
        </div>

        <h4 class="mb-3">Training List</h4>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover"
            OnRowDeleting="GridView1_RowDeleting"
            OnRowEditing="GridView1_RowEditing"
            OnRowUpdating="GridView1_RowUpdating"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            DataKeyNames="TrainingListId">
            <Columns>

                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Eval("TrainingListId") %>' /></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Type">
                    <ItemTemplate><asp:Label ID="Label9" runat="server" Text='<%# Eval("TrainingType") %>' /></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtType" runat="server" CssClass="form-control" Text='<%# Eval("TrainingType") %>' /></EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Eval("TrainingDescription") %>' /></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" Text='<%# Eval("TrainingDescription") %>' /></EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Trainer">
                    <ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Eval("FirstName") %>' /></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtTrainer" runat="server" CssClass="form-control" Text='<%# Eval("FirstName") %>' /></EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Employee">
                    <ItemTemplate><asp:Label ID="Label4" runat="server" Text='<%# Eval("Empoyee") %>' /></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtEmployee" runat="server" CssClass="form-control" Text='<%# Eval("Empoyee") %>' /></EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cost">
                    <ItemTemplate><asp:Label ID="Label5" runat="server" Text='<%# Eval("TCost") %>' /></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtCost" runat="server" CssClass="form-control" Text='<%# Eval("TCost") %>' /></EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate><asp:Label ID="Label6" runat="server" Text='<%# Eval("Status") %>' /></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" Text='<%# Eval("Status") %>' /></EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Start Date">
                    <ItemTemplate><asp:Label ID="Label7" runat="server" Text='<%# Eval("StartDate") %>' /></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtStart" runat="server" CssClass="form-control" Text='<%# Eval("StartDate") %>' /></EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="End Date">
                    <ItemTemplate><asp:Label ID="Label8" runat="server" Text='<%# Eval("EndDate") %>' /></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtEnd" runat="server" CssClass="form-control" Text='<%# Eval("EndDate") %>' /></EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>