<%@ Page Language="C#" MasterPageFile="~/Hr/HR.Master" AutoEventWireup="true" CodeBehind="AppraisalTemplate.aspx.cs" Inherits="HRMS.AppraisalTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded shadow p-4 bg-white" style="min-width: 600px;">
            <h4 class="text-center mb-4">Add Appraisal Template</h4>

            <div class="mb-3">
                <label>Template Name:</label>
                <asp:TextBox ID="txtTemplateName" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Review Period:</label>
                <asp:TextBox ID="txtPeriod" runat="server" CssClass="form-control" Placeholder="e.g., Q1 2025" />
            </div>

            <div class="mb-4">
                <label>Status:</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Inactive" Value="Inactive" />
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnAddTemplate" runat="server" Text="Add Template" CssClass="btn btn-primary w-100 mb-3" OnClick="btnAddTemplate_Click" />
            <asp:Label ID="lblTemplateMsg" runat="server" CssClass="text-success fw-bold d-block text-center mb-4" />

            <hr class="my-4" />

            <h4 class="text-center mb-4">Add Criteria to Template</h4>

            <div class="mb-3">
                <label>Select Template:</label>
                <asp:DropDownList ID="ddlTemplates" runat="server" CssClass="form-select" />
            </div>

            <div class="mb-3">
                <label>Criteria Name:</label>
                <asp:TextBox ID="txtCriteriaName" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            </div>

            <div class="mb-4">
                <label>Status:</label>
                <asp:DropDownList ID="ddlCriteriaStatus" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Inactive" Value="Inactive" />
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnAddCriteria" runat="server" Text="Add Criteria" CssClass="btn btn-success w-100" OnClick="btnAddCriteria_Click" />
            <asp:Label ID="lblCriteriaMsg" runat="server" CssClass="text-success fw-bold d-block text-center mt-3" />
        </div>
    </div>
</asp:Content>