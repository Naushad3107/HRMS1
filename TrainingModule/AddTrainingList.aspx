<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTrainingList.aspx.cs" Inherits="HRMS.TrainingModule.AddTrainingList" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Add Training List<br />
            <br />
            Trainer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="trainernames" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            Training Type&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="trainingtypes" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            Employee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Training Cost&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtcost" runat="server"></asp:TextBox>
            <br />
            <br />
            Description&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtdes" runat="server" Height="83px" Width="666px"></asp:TextBox>
            <br />
            <br />
            Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="Trainingstat" runat="server">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Start Date&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtstartdate" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            End Date&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtenddate" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />

            <br />
            <br />
            

        </div>
    </form>
</body>
</html>

