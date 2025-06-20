<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relieving.aspx.cs" Inherits="HRMS.Offer_Relieving_code.Relieving" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    Enter Employee Details<br />
    <br />
    <br />
    Employee Name&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
    <br />
    <br />
    Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
    <br />
    <br />
    Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtaddress" runat="server" Height="81px" Width="445px"></asp:TextBox>
    <br />
    <br />
    Position&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtposition" runat="server"></asp:TextBox>
    <br />
    <br />
    Start Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtstartdate" runat="server" TextMode="Date"></asp:TextBox>
    <br />
    <br />
    End Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtenddate" runat="server" TextMode="Date"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
</div>
    </form>
</body>
</html>

