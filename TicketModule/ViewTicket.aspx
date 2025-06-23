<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="ViewTicket.aspx.cs" Inherits="HRMS.TicketModule.ViewTicket" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .grid-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .table th {
            background-color: #0d6efd;
            color: white;
            text-align: center;
        }

        .comment-panel {
            margin-top: 10px;
        }

        .btn-space {
            margin-top: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  

    <div class="grid-container">
        <h3 class="text-center mb-4">View Tickets</h3>

        <asp:GridView ID="GvLeaveReport" runat="server"
            AutoGenerateColumns="False"
            CssClass="table table-bordered table-hover"
            OnRowCommand="GvLeaveReport_RowCommand"
            OnRowDeleting="GvLeaveReport_RowDeleting">
            <columns>
                <asp:BoundField DataField="tId" HeaderText="Ticket ID" />
                <asp:BoundField DataField="employee" HeaderText="Employee" />
                <asp:BoundField DataField="designation" HeaderText="Designation" />
                <asp:BoundField DataField="ticket" HeaderText="Ticket Description" />
                <asp:BoundField DataField="uploadedfile" HeaderText="Uploaded File" />

                <asp:TemplateField HeaderText="Action">
                    <itemtemplate>
                        <asp:Button ID="btnView" runat="server" Text="Close"
                            CommandName="ShowComment"
                            CssClass="btn btn-sm btn-danger btn-space"
                            CommandArgument='<%# Container.DataItemIndex %>' />

                        <asp:Button ID="Button1" runat="server" Text="delete"
                            CommandName="Delete"
                            CssClass="btn btn-sm btn-danger btn-space"
                            CommandArgument='<%# Container.DataItemIndex %>' />




                        <asp:Panel ID="pnlComment" runat="server" Visible="false" CssClass="comment-panel">
                            <asp:TextBox ID="txtComment" runat="server" CssClass="form-control mb-2" Width="100%" placeholder="Enter comment" />
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                CommandName="SubmitComment"
                                CssClass="btn btn-sm btn-success"
                                CommandArgument='<%# Eval("tId") %>' />
                        </asp:Panel>
                    </itemtemplate>
                </asp:TemplateField>
            </columns>
        </asp:GridView>
    </div>


</asp:Content>
