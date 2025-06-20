<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddDeptForm.aspx.cs" Inherits="HRMS.AddDeptForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

Department Name : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <br />
    <br />

Department Status : <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:DropDownList>

    <br />
&nbsp;&nbsp;

    <asp:Button ID="Button1" runat="server" Text="Create" OnClick="Button1_Click" />

    &nbsp;
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Home" />
&nbsp;

    </asp:Content>
