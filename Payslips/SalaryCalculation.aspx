<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalaryCalculation.aspx.cs" Inherits="HRMS.Payslips.SalaryCalculation" %>

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
            Salary&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>


            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Save Salary" />


            <br />
            <br />
            <asp:PlaceHolder ID="phEarnings" runat="server"></asp:PlaceHolder>
<br />
<asp:PlaceHolder ID="phDeductions" runat="server"></asp:PlaceHolder>
                    </div>
    </form>
</body>
</html>
