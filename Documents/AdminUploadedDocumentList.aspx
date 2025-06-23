<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUploadedDocumentList.aspx.cs" Inherits="HRMS.Documents.AdminUploadedDocumentList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h4 class="text-center text-primary mb-4">Uploaded Files</h4>

        <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover text-center"
            OnRowCommand="gvFiles_RowCommand" DataKeyNames="DocumentId">

            <Columns>
                <asp:BoundField DataField="DocumentId" HeaderText="Document ID" />
                <asp:BoundField DataField="DocumentName" HeaderText="Document Name" />
                <asp:BoundField DataField="EmpId" HeaderText="Employee ID" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnDownload" runat="server" Text="Download" CssClass="btn btn-sm btn-outline-primary me-2"
                            CommandName="DownloadFile" CommandArgument='<%# Eval("Filepath") %>' />

                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-sm btn-outline-danger"
                            CommandName="DeleteFile" CommandArgument='<%# Eval("DocumentId") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this file?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>