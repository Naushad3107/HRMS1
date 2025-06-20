<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddEmp.aspx.cs" Inherits="HRMS.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
  <div style="justify-content:center">  
    <p>
    Employee Name :
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</p>
<p>
    Employee Mail :<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
</p>
<p>
    Employee Role :
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>Employee</asp:ListItem>
        <asp:ListItem>HR</asp:ListItem>
        <asp:ListItem>Manager</asp:ListItem>
        <asp:ListItem>Admin</asp:ListItem>
    </asp:DropDownList>
</p>
<p>
    Employee Salary :<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
</p>
<p>
    Set Password :
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
</p>
    <p>
        Pan Card no :
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
</p>
    <p>
        Assesment Year :
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
</p>
    <p>
        Department :
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
</p>
    <p>
        Designation :
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
</p>
    <p>
        Phone :
        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
</p>
    <p>
        Gender :
        <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList>
</p>
<p>
    Set Status :
    <asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:DropDownList>
</p>
<p>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Home" />
</p>
      </div>
</asp:Content>
