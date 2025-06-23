<%@ Page Language="C#" MasterPageFile="~/Hr/HR.Master" AutoEventWireup="true" CodeBehind="PerfmTrackByDept.aspx.cs" Inherits="HRMS.PerfmTrackByDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded shadow p-4 bg-white w-100" style="max-width: 800px;">
            <h4 class="text-center mb-4">Track Performance by Department</h4>

            <div class="mb-4">
                <label>Select Department:</label>
                <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" CssClass="form-select" />
            </div>

            <asp:GridView ID="gvPerformance" runat="server"
                AutoGenerateColumns="False"
                EmptyDataText="No records found."
                CssClass="table table-bordered table-hover text-center mb-3">
                <Columns>
                    <asp:BoundField DataField="TemplateName" HeaderText="Appraisal Template" />
                    <asp:BoundField DataField="ReviewPeriod" HeaderText="Review Period" />
                    <asp:BoundField DataField="ReviewerName" HeaderText="Reviewer" />
                    <asp:BoundField DataField="ReviewDate" HeaderText="Review Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="AverageScore" HeaderText="Avg. Score" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold d-block text-center" />
        </div>
    </div>
</asp:Content>