<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeDocumentList.aspx.cs" Inherits="HRMS.Documents.EmployeeDocumentList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h4 class="text-center text-primary mb-4">Employee Documents</h4>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CssClass="table table-bordered table-striped text-center"
            OnRowDeleting="GridView1_RowDeleting"
            OnRowEditing="GridView1_RowEditing"
            OnRowUpdating="GridView1_RowUpdating"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            DataKeyNames="EmId">

            <Columns>
                <asp:TemplateField HeaderText="Document ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Document Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("EmployeeDocumentName") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtdocname" runat="server" CssClass="form-control" Text='<%# Eval("EmployeeDocumentName") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>