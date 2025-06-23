<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="TicketRaise.aspx.cs" Inherits="HRMS.TicketModule.TicketRaise" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .ticket-form {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
    <div class="ticket-form">
        <h3 class="text-center mb-4">Raise a Ticket</h3>

        <div class="mb-3">
            <label class="form-label">Department</label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" AppendDataBoundItems="True" >
                <asp:ListItem>-----select department---</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label class="form-label">Designation</label>
            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select" AppendDataBoundItems="True" >
                <asp:ListItem>----select designation----</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label class="form-label">Employee</label>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" AppendDataBoundItems="True" >
                <asp:ListItem>----select emp to assign ticket---</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label class="form-label">Ticket Description</label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        </div>

        <div class="mb-3">
            <label class="form-label">Attach Document</label>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="Button1" runat="server" Text="Raise Ticket"
            CssClass="btn btn-primary w-100"
            OnClick="Button1_Click" />
    </div>


</asp:Content>
