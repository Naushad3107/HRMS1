<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateEmpDetails.aspx.cs" Inherits="HRMS.UpdateEmpDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>Update Employee Details</h2>
    <p>
        Employee Name: 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        Employee Mail: 
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
    <p>
        Employee Role: 
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Employee</asp:ListItem>
            <asp:ListItem>HR</asp:ListItem>
            <asp:ListItem>Manager</asp:ListItem>
            <asp:ListItem>Admin</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        Employee Salary: 
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </p>
    <p>
        Set Password:
        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        Employee Department :
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
    </p>
    <p>
        Set Status:
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>Active</asp:ListItem>
            <asp:ListItem>Inactive</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        Employee Id :
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Home" OnClick="Button2_Click" />
    </p>
</asp:Content>
