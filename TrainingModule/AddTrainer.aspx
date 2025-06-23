<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddTrainer.aspx.cs" Inherits="HRMS.TrainingModule.AddTrainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 pt-4 d-flex justify-content-center align-items-start" style="min-height: 100vh;">
        <div class="border border-dark rounded p-4 bg-white shadow" style="min-width: 960px;">
            <h4 class="mb-4 text-center">Add Trainer</h4>

            <div class="row mb-3">
                <div class="col">
                    First Name
                    <asp:TextBox ID="txtfirst" runat="server" CssClass="form-control" />
                </div>
                <div class="col">
                    Last Name
                    <asp:TextBox ID="txtlast" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    Phone No
                    <asp:TextBox ID="txtphone" runat="server" CssClass="form-control" />
                </div>
                <div class="col">
                    Upload Image
                    <asp:FileUpload ID="trainerimage" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    Role
                    <asp:DropDownList ID="trainerrole" runat="server" CssClass="form-select" AppendDataBoundItems="True" />
                </div>
                <div class="col">
                    Email
                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="mb-3">
                Description
                <asp:TextBox ID="txtdes" runat="server" TextMode="MultiLine" CssClass="form-control" Height="117px" />
            </div>

            <div class="mb-4">
                Status
                <asp:DropDownList ID="trainerstat" runat="server" CssClass="form-select">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary w-100" Text="Add" OnClick="Button1_Click" />

            <hr class="my-5" />

            <h5 class="text-center">List Of Trainers</h5>
            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="TrainerId"
                DataSourceID="SqlDataSource1"
                CssClass="table table-bordered table-hover mt-3">
                <Columns>
                    <asp:BoundField DataField="TrainerId" HeaderText="TrainerId" ReadOnly="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" />
                    <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" />
                    <asp:BoundField DataField="TRole" HeaderText="TRole" />
                    <asp:BoundField DataField="RoleId" HeaderText="RoleId" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="TrainerDescription" HeaderText="TrainerDescription" />
                    <asp:BoundField DataField="TStatus" HeaderText="TStatus" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:dbconn %>"
                SelectCommand="SELECT * FROM [Trainer]">
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>