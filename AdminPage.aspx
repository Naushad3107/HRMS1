<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="HRMS.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
  <div class="row justify-content-start">
    <!-- First Card -->
    <div class="col-sm-3 col-md-3">
      <div class="card" style="width: 15rem; padding: 15px;">
        <img src="../Images/DefaultEmp.jpg" class="card-img-top" alt="">
        <div class="card-body">
          <h5 class="card-title">Employees Count</h5>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">
            Active Employees: <asp:Literal ID="litActiveEmp" runat="server" />
          </li>
          <li class="list-group-item">
            Inactive Employees: <asp:Literal ID="litInactiveEmp" runat="server" />
          </li>
        </ul>
      </div>
    </div>

    <!-- Second Card -->
    <div class="col-sm-3 col-md-3">
      <div class="card" style="width: 15rem; padding: 15px;">
        <img src="../Images/DefaultDept.jpg" class="card-img-top" alt="">
        <div class="card-body">
          <h5 class="card-title">Total Departments</h5>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">
            Active Department: <asp:Literal ID="Literal3" runat="server" />
          </li>
          <li class="list-group-item">
            Inactive Department: <asp:Literal ID="Literal4" runat="server" />
          </li>
        </ul>
      </div>
    </div>

      <!-- Third Card -->
<div class="col-sm-3 col-md-3">
  <div class="card" style="width: 15rem; padding: 15px;">
    <img src="../Images/EmpBase.jpg" class="card-img-top" alt="">
    <div class="card-body">
      <h5 class="card-title">Salary</h5>
    </div>
    <ul class="list-group list-group-flush">
      <li class="list-group-item">
        Average Salary: <asp:Literal ID="Literal5" runat="server" />
      </li>
      <li class="list-group-item">
        Highest Salary : <asp:Literal ID="Literal6" runat="server" />
      </li>
    </ul>
  </div>
</div>
      



  </div>
</div>


</asp:Content>
