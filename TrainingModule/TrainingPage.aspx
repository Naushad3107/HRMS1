<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainingPage.aspx.cs" Inherits="HRMS.TrainingModule.TrainingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Add Training" OnClick="Button1_Click" />
            </br>
            </br>
            Training List
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    OnRowDeleting="GridView1_RowDeleting" 
    OnRowEditing="GridView1_RowEditing"
    OnRowUpdating="GridView1_RowUpdating"
    OnRowCancelingEdit="GridView1_RowCancelingEdit"
    DataKeyNames="TrainingListId">

    <Columns>
        <asp:TemplateField HeaderText="TrainingList_ID">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TrainingListId") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Training_Type">
            <ItemTemplate>
                <asp:Label ID="Label9" runat="server" Text='<%# Eval("TrainingType") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtType" runat="server" Text='<%# Eval("TrainingType") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Training_Description">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TrainingDescription") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDesc" runat="server" Text='<%# Eval("TrainingDescription") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Trainer_Name">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTrainer" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Employee">
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Empoyee") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEmployee" runat="server" Text='<%# Eval("Empoyee") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Training_Cost">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("TCost") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtCost" runat="server" Text='<%# Eval("TCost") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Training_Status">
            <ItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtStatus" runat="server" Text='<%# Eval("Status") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Training_StartDate">
            <ItemTemplate>
                <asp:Label ID="Label7" runat="server" Text='<%# Eval("StartDate") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtStart" runat="server" Text='<%# Eval("StartDate") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Training_EndDate">
            <ItemTemplate>
                <asp:Label ID="Label8" runat="server" Text='<%# Eval("EndDate") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEnd" runat="server" Text='<%# Eval("EndDate") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>

       
        </div>
    </form>
</body>
</html>
