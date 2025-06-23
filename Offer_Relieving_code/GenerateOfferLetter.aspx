<%@ Page Title="Generate Offer Letter" Language="C#" MasterPageFile="~/Hr/HR.Master" AutoEventWireup="true" CodeBehind="GenerateOfferLetter.aspx.cs" Inherits="HRMS.Offer_Relieving.GenerateOfferLetter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h4 class="text-center mb-4">Enter Employee Details</h4>

            <div class="form-group">
                <label for="txtname">Employee Name</label>
                <asp:TextBox ID="txtname" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtemail">Email</label>
                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtaddress">Address</label>
                <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
            </div>

            <div class="form-group">
                <label for="txtposition">Position</label>
                <asp:TextBox ID="txtposition" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtsal">Salary</label>
                <asp:TextBox ID="txtsal" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtdate">Start Date</label>
                <asp:TextBox ID="txtdate" runat="server" CssClass="form-control" TextMode="Date" />
            </div>

            <div class="text-center">
                <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>