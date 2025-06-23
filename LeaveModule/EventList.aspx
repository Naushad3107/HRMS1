<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EventList.aspx.cs" Inherits="HRMS.LeaveModule.EventList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="container mt-5">
            <h2 class="mb-4">Event List</h2>

            <asp:GridView ID="gvEventList" runat="server" AutoGenerateColumns="False" DataKeyNames="eventId"
                CssClass="table table-striped table-bordered"
                OnRowEditing="gvEventList_RowEditing"
                OnRowCancelingEdit="gvEventList_RowCancelingEdit"
                OnRowUpdating="gvEventList_RowUpdating"
                OnRowDeleting="gvEventList_RowDeleting">

                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />

                    <asp:TemplateField HeaderText="Event Type">
                        <ItemTemplate>
                            <%# Eval("eventTypeName") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Event Name">
                        <ItemTemplate>
                            <%# Eval("eventName") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEventName" runat="server" Text='<%# Bind("eventName") %>' CssClass="form-control" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Event Date">
                        <ItemTemplate>
                            <%# Eval("eventDate", "{0:yyyy-MM-dd}") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEventDate" runat="server" Text='<%# Bind("eventDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <%# Eval("status") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Active" Value="Active" />
                                <asp:ListItem Text="Inactive" Value="Inactive" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>

</asp:Content>
