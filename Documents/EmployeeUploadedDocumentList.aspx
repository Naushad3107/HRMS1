<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="EmployeeUploadedDocumentList.aspx.cs" Inherits="HRMS.Documents.EmployeeUploadedDocumentList" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h4 class="text-center text-primary mb-4">Employee Document Files</h4>

        <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="False"
            OnRowCommand="gvFiles_RowCommand" CssClass="table table-bordered table-hover text-center">

            <Columns>
                <asp:BoundField DataField="DocumentId" HeaderText="Document ID" />
                <asp:BoundField DataField="DocumentName" HeaderText="Document Name" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnDownload" runat="server" Text="Download"
                            CommandName="DownloadFile"
                            CommandArgument='<%# Eval("Filepath") %>'
                            CssClass="btn btn-sm btn-outline-primary" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>