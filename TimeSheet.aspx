<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="TimeSheet.aspx.cs" Inherits="HRMS.TimeSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<%--<head>
    <title>Timesheet Form</title>
</head>--%>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="timesheet-container">
        <h3>Employee Timesheet</h3>
        <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name: "></asp:Label>
        <asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox>
        <br />
        <br />
        Department :
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>IT</asp:ListItem>
            <asp:ListItem>HR</asp:ListItem>
            <asp:ListItem>Sales</asp:ListItem>
            <asp:ListItem>Finance</asp:ListItem>
        </asp:DropDownList>
        <br /><br />

        <asp:Label ID="lblDate" runat="server" Text="Date: "></asp:Label>
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
        <br /><br />

        <asp:Label ID="lblCheckIn" runat="server" Text="Check-In Time: "></asp:Label>
        <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Time"></asp:TextBox>
        <asp:Button ID="btnCheckIn" runat="server" Text="Check In" />
        <br /><br />

        <asp:Label ID="lblCheckOut" runat="server" Text="Check-Out Time: "></asp:Label>
        <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Time"></asp:TextBox>
        <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" />
        <br /><br />

        <asp:Button ID="btnSubmit" runat="server" Text="Submit Timesheet" OnClick="btnSubmit_Click1"  />
    </div>


</asp:Content>
