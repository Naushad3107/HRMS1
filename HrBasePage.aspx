<%@ Page Title="Employee Report" Language="C#" MasterPageFile="~/Hr/HR.Master"
    AutoEventWireup="true" CodeBehind="HrBasePage.aspx.cs" Inherits="HRMS.HrBasePage" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
    PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background-color: #f8f9fa;
        }

        .dashboard-container {
            padding: 30px;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 40px;
        }

        .chart-row {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
            margin-bottom: 40px;
        }

        .chart-box {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .total-box {
            width: 220px;
            text-align: center;
            background-color: #e9f5ff;
            border: 2px solid #007bff;
            border-radius: 10px;
            padding: 20px 20px 0;
            font-size: 18px;
            box-shadow: 2px 2px 12px rgba(0,0,0,0.1);
        }

        .total-box h3 {
            margin-top: 0;
        }

        .total-box label {
            font-size: 28px;
            color: #007bff;
            font-weight: bold;
        }

        .chart-large {
            width: 600px;
        }

        .chart-medium {
            width: 350px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="dashboard-container">
            <h1>Employee Report</h1>

            <div class="chart-row">
                <div class="chart-box chart-large">
                    <asp:Chart ID="Chart1" runat="server" Width="600px" Height="400px">
                        <series>
                            <asp:Series Name="Series1" ChartType="Bar" XValueMember="eDepartment" YValueMembers="EmployeeCount" />
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1" />
                        </chartareas>
                        <Legends>
                            <asp:Legend Name="Legend1" Title="Departments" />
                        </Legends>
                        <Titles>
                            <asp:Title Text="Employees Count by Department" Font="Segoe UI, 14pt" />
                        </Titles>
                    </asp:Chart>
                </div>

                <div class="chart-box total-box">
                    <h3>Total Employees</h3>
                    <asp:Label ID="lblTotalEmployees" runat="server" />
                </div>
            </div>

            <div class="chart-row">
                <div class="chart-box chart-medium">
                    <asp:Chart ID="PieChartStatus" runat="server" Width="300px" Height="300px">
                        <Series>
                            <asp:Series Name="StatusSeries" ChartType="Pie" XValueMember="estatus" YValueMembers="Count"
                                ToolTip="#VALX: #VAL" Label="#VALX (#VAL)" />
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1" />
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1" Title="Employee Status" />
                        </Legends>
                        <Titles>
                            <asp:Title Text="Employee Status Distribution" Font="Segoe UI, 14pt" />
                        </Titles>
                    </asp:Chart>
                </div>

                <div class="chart-box chart-medium">
                    <asp:Chart ID="PieChartGender" runat="server" Width="300px" Height="300px">
                        <Series>
                            <asp:Series Name="GenderSeries" ChartType="Pie" XValueMember="egender" YValueMembers="Count"
                                ToolTip="#VALX: #VAL" Label="#VALX (#VAL)" />
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea2" />
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1" Title="Gender" />
                        </Legends>
                        <Titles>
                            <asp:Title Text="Gender Distribution" Font="Segoe UI, 14pt" />
                        </Titles>
                    </asp:Chart>
                </div>
            </div>

            <div class="chart-row">
                <div class="chart-box chart-large">
                    <asp:Chart ID="ChartAvgSalary" runat="server" Width="600px" Height="400px" XValueMember="eDepartment" YValueMembers="AverageSalary">
                        <Series>
                            <asp:Series Name="SalarySeries" ChartType="Column" />
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea3" />
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1" Title="Departments" />
                        </Legends>
                        <Titles>
                            <asp:Title Text="Average Salary by Department" Font="Segoe UI, 14pt" />
                        </Titles>
                    </asp:Chart>
                </div>
            </div>

        </div>

</asp:Content>