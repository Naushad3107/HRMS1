<%@ Page Language="C#" MasterPageFile="~/Hr/HR.Master" AutoEventWireup="true" CodeBehind="AppraiseEmployee.aspx.cs" Inherits="HRMS.AppraiseEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded shadow p-4 bg-white" style="min-width: 700px;">
            <h4 class="text-center mb-4">Appraise Employee</h4>

            <div class="mb-3">
                <label>Select Employee:</label>
                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-select" />
            </div>

            <div class="mb-3">
                <label>Select Template:</label>
                <asp:DropDownList ID="ddlTemplate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTemplate_SelectedIndexChanged" CssClass="form-select" />
            </div>

            <div class="mb-4">
                <label>Reviewer Name:</label>
                <asp:TextBox ID="txtReviewer" runat="server" CssClass="form-control" />
            </div>

            <asp:GridView ID="gvCriteria" runat="server" AutoGenerateColumns="False" DataKeyNames="CriteriaID"
                CssClass="table table-bordered table-striped mb-4">
                <Columns>
                    <asp:BoundField DataField="CriteriaName" HeaderText="KPI" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:TemplateField HeaderText="Score (1–5)">
                        <ItemTemplate>
                            <asp:TextBox ID="txtScore" runat="server" CssClass="form-control form-control-sm text-center" Width="60px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comment">
                        <ItemTemplate>
                            <asp:TextBox ID="txtComment" runat="server" CssClass="form-control form-control-sm" Width="100%" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Appraisal" CssClass="btn btn-primary w-100 mb-3" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-bold d-block text-center mb-3" />

            <asp:Button ID="btnDownloadPDF" runat="server" Text="Download Appraisal as PDF" CssClass="btn btn-outline-secondary w-100" Visible="false" OnClick="btnDownloadPDF_Click" />
        </div>
    </div>
</asp:Content>