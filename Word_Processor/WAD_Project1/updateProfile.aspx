<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateProfile.aspx.cs" Inherits="WAD_Project1.updateProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet"
          href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" 
          integrity=
"sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ==" 
          crossorigin="anonymous" />
    <link rel="stylesheet"
          href=
"https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
          integrity=
"sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <title>Profile Update</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <style type="text/css">
        body {
            background-image: url("https://media.istockphoto.com/vectors/abstract-green-cube-pattern-on-dark-blue-background-modern-lines-vector-id1285588443?k=20&m=1285588443&s=612x612&w=0&h=fqpK2gg8n4yd3ylx13-0gGPbeNXTmq4u8OYYlOaGnB4=");
            color:antiquewhite;
        }

        .card{
            background-color:dodgerblue;
            color: black;
        }

        h3{
            text-align:center;
            margin-top: 50px;
        }

        .alert{
            display: inline-block;
            margin-left: 10px;
            margin-top: 10px;
        }

        #btnUpdate {
            background-color: crimson;
            color: silver;
        }
    </style>
</head>
<body>

    <asp:Panel ID="sucChange" runat="server">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
               <strong>Hurray!</strong> Profile Updated Succesfully
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
           </div>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
               <strong>Alert!</strong> Something went wrong.
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
           </div>
        </asp:Panel>

    <form id="form1" runat="server">
        <h3>Update Details</h3>
        <p>
            <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ControlToValidate="updatePassword" ErrorMessage="Must contain 1 capital, 1 small alphabet, 1 number and should be minimum of 8 and maximum of 15 characters" ValidationExpression="[0-9|a-z|A-Z]{8,15}"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:RegularExpressionValidator ID="phoneValidator" runat="server" ControlToValidate="updateMobile" ErrorMessage="Phone number should be of 10 digits" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
        </p>
        <div class="container w-50 card mt-4 mb-5 rounded-lg border-light">
            <div class="mb-3 mt-3">
                <label for="updateFirstName" class="form-label">First Name</label>
                <asp:textbox runat="server" class="form-control" id="updateFirstName" value="" ></asp:textbox>
            </div>
            <div class="mb-3">
                <label for="updateLastName" class="form-label">Last Name</label>
                <asp:textbox runat="server" class="form-control" id="updateLastName" value="" ></asp:textbox>
            </div>
            <div class="mb-3">
                <label for="updateEmail" class="form-label">Email address</label>
                <asp:textbox runat="server" textMode="email" class="form-control" id="updateEmail" value="" ></asp:textbox>
            </div>
            <div class="mb-3">
                <label for="updatePassword" class="form-label">Password</label>
                <asp:textbox runat="server" class="form-control" id="updatePassword" value="" ></asp:textbox>
            </div>
            <div class="mb-3">
                <label for="updateMobile" class="form-label">Phone Number</label>
                <asp:textbox runat="server" class="form-control" id="updateMobile" value="" ></asp:textbox>
            </div>
            <div class="mb-4 ml-5 align-content-center">
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn" Font-Bold="True"  OnClick="btnUpdate_Click" Text="Update Details" />
            </div>
        </div>
    </form>

     <footer class="bg-dark text-center text-white">
  <!-- Grid container -->
  <div class="container p-4 pb-0">
    <!-- Section: Social media -->
    <section class="mb-4">
      <!-- Facebook -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #3b5998;"
        href="#!"
        role="button"
        ><i class="fab fa-facebook-f"></i
      ></a>

      <!-- Twitter -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #55acee;"
        href="#!"
        role="button"
        ><i class="fab fa-twitter"></i
      ></a>

      <!-- Google -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #dd4b39;"
        href="#!"
        role="button"
        ><i class="fab fa-google"></i
      ></a>

      <!-- Instagram -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #ac2bac;"
        href="#!"
        role="button"
        ><i class="fab fa-instagram"></i
      ></a>

      <!-- Linkedin -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #0082ca;"
        href="#!"
        role="button"
        ><i class="fab fa-linkedin-in"></i
      ></a>
      <!-- Github -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #333333;"
        href="#!"
        role="button"
        ><i class="fab fa-github"></i
      ></a>
    </section>
    <!-- Section: Social media -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2020 Copyright:
    <a class="text-white" href="www.microsoft.com">MS_word_Clone.com</a>
  </div>
  <!-- Copyright -->
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> 
</body>
</html>
