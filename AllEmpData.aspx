<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AllEmpData.aspx.cs" Inherits="HRMS.AllEmpData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>






<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">

        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="eid"
            DataSourceID="SqlDataSource1"
            HorizontalAlign="Center" CellPadding="8" CellSpacing="8" ForeColor="#333333" GridLines="None">
            
            <AlternatingRowStyle BackColor="White" />
            
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="eid" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="eid" />
                <asp:BoundField DataField="eName" HeaderText="Name" SortExpression="eName" />
                <asp:BoundField DataField="eEmail" HeaderText="Email" SortExpression="eEmail" />
                <asp:BoundField DataField="eRole" HeaderText="Role" SortExpression="eRole" />
                <asp:BoundField DataField="eSalary" HeaderText="Salary" SortExpression="eSalary" />
                <asp:BoundField DataField="epass" HeaderText="pass" SortExpression="epass" />
                <asp:BoundField DataField="ePan" HeaderText="Pan no." SortExpression="ePan" />
                <asp:BoundField DataField="eAssesYear" HeaderText="Assesment" SortExpression="eAssesYear" />
                <asp:BoundField DataField="eDepartment" HeaderText="Department" SortExpression="eDepartment" />
                <asp:BoundField DataField="eDesignation" HeaderText="Designation" SortExpression="eDesignation" />
                <asp:BoundField DataField="ephone" HeaderText="phone" SortExpression="ephone" />
                <asp:BoundField DataField="eGender" HeaderText="Gender" SortExpression="eGender" />
                <asp:BoundField DataField="estatus" HeaderText="status" SortExpression="estatus" />
            </Columns>
            
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [Emp_Data] WHERE [eid] = @original_eid AND (([eName] = @original_eName) OR ([eName] IS NULL AND @original_eName IS NULL)) AND (([eEmail] = @original_eEmail) OR ([eEmail] IS NULL AND @original_eEmail IS NULL)) AND (([eRole] = @original_eRole) OR ([eRole] IS NULL AND @original_eRole IS NULL)) AND (([eSalary] = @original_eSalary) OR ([eSalary] IS NULL AND @original_eSalary IS NULL)) AND (([epass] = @original_epass) OR ([epass] IS NULL AND @original_epass IS NULL)) AND (([ePan] = @original_ePan) OR ([ePan] IS NULL AND @original_ePan IS NULL)) AND (([eAssesYear] = @original_eAssesYear) OR ([eAssesYear] IS NULL AND @original_eAssesYear IS NULL)) AND (([eDepartment] = @original_eDepartment) OR ([eDepartment] IS NULL AND @original_eDepartment IS NULL)) AND (([eDesignation] = @original_eDesignation) OR ([eDesignation] IS NULL AND @original_eDesignation IS NULL)) AND (([ephone] = @original_ephone) OR ([ephone] IS NULL AND @original_ephone IS NULL)) AND (([eGender] = @original_eGender) OR ([eGender] IS NULL AND @original_eGender IS NULL)) AND (([estatus] = @original_estatus) OR ([estatus] IS NULL AND @original_estatus IS NULL))" InsertCommand="INSERT INTO [Emp_Data] ([eName], [eEmail], [eRole], [eSalary], [epass], [ePan], [eAssesYear], [eDepartment], [eDesignation], [ephone], [eGender], [estatus]) VALUES (@eName, @eEmail, @eRole, @eSalary, @epass, @ePan, @eAssesYear, @eDepartment, @eDesignation, @ephone, @eGender, @estatus)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Emp_Data]" UpdateCommand="UPDATE [Emp_Data] SET [eName] = @eName, [eEmail] = @eEmail, [eRole] = @eRole, [eSalary] = @eSalary, [epass] = @epass, [ePan] = @ePan, [eAssesYear] = @eAssesYear, [eDepartment] = @eDepartment, [eDesignation] = @eDesignation, [ephone] = @ephone, [eGender] = @eGender, [estatus] = @estatus WHERE [eid] = @original_eid AND (([eName] = @original_eName) OR ([eName] IS NULL AND @original_eName IS NULL)) AND (([eEmail] = @original_eEmail) OR ([eEmail] IS NULL AND @original_eEmail IS NULL)) AND (([eRole] = @original_eRole) OR ([eRole] IS NULL AND @original_eRole IS NULL)) AND (([eSalary] = @original_eSalary) OR ([eSalary] IS NULL AND @original_eSalary IS NULL)) AND (([epass] = @original_epass) OR ([epass] IS NULL AND @original_epass IS NULL)) AND (([ePan] = @original_ePan) OR ([ePan] IS NULL AND @original_ePan IS NULL)) AND (([eAssesYear] = @original_eAssesYear) OR ([eAssesYear] IS NULL AND @original_eAssesYear IS NULL)) AND (([eDepartment] = @original_eDepartment) OR ([eDepartment] IS NULL AND @original_eDepartment IS NULL)) AND (([eDesignation] = @original_eDesignation) OR ([eDesignation] IS NULL AND @original_eDesignation IS NULL)) AND (([ephone] = @original_ephone) OR ([ephone] IS NULL AND @original_ephone IS NULL)) AND (([eGender] = @original_eGender) OR ([eGender] IS NULL AND @original_eGender IS NULL)) AND (([estatus] = @original_estatus) OR ([estatus] IS NULL AND @original_estatus IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_eid" Type="Int32" />
                <asp:Parameter Name="original_eName" Type="String" />
                <asp:Parameter Name="original_eEmail" Type="String" />
                <asp:Parameter Name="original_eRole" Type="String" />
                <asp:Parameter Name="original_eSalary" Type="Decimal" />
                <asp:Parameter Name="original_epass" Type="String" />
                <asp:Parameter Name="original_ePan" Type="String" />
                <asp:Parameter Name="original_eAssesYear" Type="String" />
                <asp:Parameter Name="original_eDepartment" Type="String" />
                <asp:Parameter Name="original_eDesignation" Type="String" />
                <asp:Parameter Name="original_ephone" Type="String" />
                <asp:Parameter Name="original_eGender" Type="String" />
                <asp:Parameter Name="original_estatus" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="eName" Type="String" />
                <asp:Parameter Name="eEmail" Type="String" />
                <asp:Parameter Name="eRole" Type="String" />
                <asp:Parameter Name="eSalary" Type="Decimal" />
                <asp:Parameter Name="epass" Type="String" />
                <asp:Parameter Name="ePan" Type="String" />
                <asp:Parameter Name="eAssesYear" Type="String" />
                <asp:Parameter Name="eDepartment" Type="String" />
                <asp:Parameter Name="eDesignation" Type="String" />
                <asp:Parameter Name="ephone" Type="String" />
                <asp:Parameter Name="eGender" Type="String" />
                <asp:Parameter Name="estatus" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="eName" Type="String" />
                <asp:Parameter Name="eEmail" Type="String" />
                <asp:Parameter Name="eRole" Type="String" />
                <asp:Parameter Name="eSalary" Type="Decimal" />
                <asp:Parameter Name="epass" Type="String" />
                <asp:Parameter Name="ePan" Type="String" />
                <asp:Parameter Name="eAssesYear" Type="String" />
                <asp:Parameter Name="eDepartment" Type="String" />
                <asp:Parameter Name="eDesignation" Type="String" />
                <asp:Parameter Name="ephone" Type="String" />
                <asp:Parameter Name="eGender" Type="String" />
                <asp:Parameter Name="estatus" Type="String" />
                <asp:Parameter Name="original_eid" Type="Int32" />
                <asp:Parameter Name="original_eName" Type="String" />
                <asp:Parameter Name="original_eEmail" Type="String" />
                <asp:Parameter Name="original_eRole" Type="String" />
                <asp:Parameter Name="original_eSalary" Type="Decimal" />
                <asp:Parameter Name="original_epass" Type="String" />
                <asp:Parameter Name="original_ePan" Type="String" />
                <asp:Parameter Name="original_eAssesYear" Type="String" />
                <asp:Parameter Name="original_eDepartment" Type="String" />
                <asp:Parameter Name="original_eDesignation" Type="String" />
                <asp:Parameter Name="original_ephone" Type="String" />
                <asp:Parameter Name="original_eGender" Type="String" />
                <asp:Parameter Name="original_estatus" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
