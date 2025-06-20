<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDeduction.aspx.cs" Inherits="HRMS.Payslips.AddDeduction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                  Deduction Type&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="DropDownList1" runat="server">
                 </asp:DropDownList>
                  <br />
                  <br />
                  Deduction Percentage&nbsp;&nbsp;&nbsp;
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                 <br />
                 <br />
                 Department&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                 </asp:DropDownList>
                 <br />
                 <br />
                 Designation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="DropDownList3" runat="server">
                 </asp:DropDownList>
                 <br />
                 <br />
                 <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click1" />
        </div>
    </form>
</body>
</html>

