<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EarningType.aspx.cs" Inherits="HRMS.Payslips.EarningType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Earning Type&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" />
        </div>
    </form>
</body>
</html>
