<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="HRMS.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>


</head>
<body>
    <form id="form1" runat="server">
       

<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form>


          <!-- Email input -->
          <div data-mdb-input-init class="form-outline mb-4">
              <h2 style="text-align:center">HRMS</h2>
              <p style="text-align:center">&nbsp;</p>
              <p style="text-align:center">&nbsp;</p>
            Username :&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
          </div>

          <!-- Password input -->
          <h3></h3> Password :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

          <div class="d-flex justify-content-between align-items-center">
           
            
          </div>

          <div class="text-center text-lg-start mt-4 pt-2" style="justify-content:center;">
           
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" BackColor="#FF6600" BorderColor="Black" BorderWidth="2px" />
            
          </div>

        </form>
      </div>
    </div>
  </div>
 
</section>




    </form>
</body>
</html>
