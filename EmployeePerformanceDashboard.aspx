<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeePerformanceDashboard.aspx.cs" Inherits="HRMS.EmployeePerformanceDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Performance Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .dial {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 10px solid lightgray;
            position: relative;
            margin: 10px;
        }
        .dial .value {
            position: absolute;
            width: 100%;
            top: 35%;
            text-align: center;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-4">

        <div class="card shadow p-4 mb-4">
            <h2 class="mb-3 text-primary">Employee Performance Dashboard</h2>

            <div class="row g-3 align-items-end mb-3">
                <div class="col-md-4">
                    <label for="txtEmpID" class="form-label">Enter Employee ID</label>
                    <asp:TextBox ID="txtEmpID" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnLoad" runat="server" Text="Load Dashboard" CssClass="btn btn-success" OnClick="btnLoad_Click" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblMsg" runat="server" CssClass="text-danger fw-bold" />
                </div>
            </div>
        </div>

        <!-- Chart Section -->
        <div class="card shadow mb-4 p-4">
            <h4 class="mb-3 text-secondary">📊 Performance Chart</h4>
            <canvas id="scoreChart" height="300"></canvas>
            <asp:Literal ID="litChartScript" runat="server" />
        </div>

        <!-- Heatmap Section -->
        <div class="card shadow mb-4 p-4">
            <h4 class="mb-3 text-secondary">🟥 Performance Heatmap</h4>
            <asp:GridView ID="gvHeatmap" runat="server" AutoGenerateColumns="False" 
                          OnRowDataBound="gvHeatmap_RowDataBound" 
                          CssClass="table table-bordered table-striped">
                <Columns>
                    <asp:BoundField DataField="ReviewPeriod" HeaderText="Review Period" />
                    <asp:BoundField DataField="AverageScore" HeaderText="Score" />
                    <asp:TemplateField HeaderText="Performance Level">
                        <ItemTemplate>
                            <asp:Label ID="lblPerformance" runat="server" CssClass="fw-bold" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- Progress Bars Section -->
        <div class="card shadow mb-4 p-4">
            <h4 class="mb-3 text-secondary">📈 Performance as Progress Bars</h4>
            <asp:Repeater ID="rptProgress" runat="server">
                <ItemTemplate>
                    <div class="mb-2">
                        <strong><%# Eval("ReviewPeriod") %>:</strong>
                        <div class="progress" style="height: 24px; max-width: 500px;">
                            <div class="progress-bar text-white fw-bold" role="progressbar"
                                 style='<%# GetBarStyle(Eval("AverageScore")) %>'>
                                <%# Eval("AverageScore") %>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Circular Dials Section -->
        <div class="card shadow mb-4 p-4">
            <h4 class="mb-3 text-secondary">🎯 Performance Dials</h4>
            <div class="d-flex flex-wrap gap-4">
                <asp:Repeater ID="rptDials" runat="server">
                    <ItemTemplate>
                        <div class="dial d-flex align-items-center justify-content-center" style='<%# GetDialStyle(Eval("AverageScore")) %>'>
                            <div class="value"><%# Eval("AverageScore") %></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </div>
    </form>
</body>
</html>
