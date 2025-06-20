<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayslipGenerate.aspx.cs" Inherits="HRMS.Payslips.PayslipGenerate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Department&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
</asp:DropDownList>
<br />
<br />

Employee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList2" runat="server">
</asp:DropDownList>
            <br />
            <br />
            Select Month&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem Value="30">January</asp:ListItem>
                <asp:ListItem Value="30">February</asp:ListItem>
                <asp:ListItem Value="30">March</asp:ListItem>
                <asp:ListItem Value="30">April</asp:ListItem>
                <asp:ListItem Value="30">May</asp:ListItem>
                <asp:ListItem Value="30">June</asp:ListItem>
                <asp:ListItem Value="30">July</asp:ListItem>
                <asp:ListItem Value="30">August</asp:ListItem>
                <asp:ListItem Value="30">September</asp:ListItem>
                <asp:ListItem Value="30">October</asp:ListItem>
                <asp:ListItem Value="30">November</asp:ListItem>
                <asp:ListItem Value="30">December</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
<br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generate Payslip" />
            
        </div>
    </form>
</body>
</html>

