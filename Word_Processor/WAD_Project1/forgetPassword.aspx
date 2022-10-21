<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetPassword.aspx.cs" Inherits="WAD_Project1.forgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
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

        #btnForgetPassword {
            background-color: crimson;
            color: silver;
            margin-left: 280px;
        }
    </style>
</head>
<body>

     <asp:Panel ID="sucEmail" runat="server">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
               <strong>Hurray!</strong> Password recovery email sent successfully
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
           </div>
        </asp:Panel>
     
       <asp:Panel ID="errEmail" runat="server">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
               <strong>Alert!</strong> Email is not valid.
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
        <div class="container w-50 card mt-5 rounded-lg border-light">
        <h3>Forget Password</h3>
            <div class="mb-3 mt-4">
                <label for="forgetEmail" class="form-label">Enter your registered Email address</label>
                <asp:textbox runat="server" textMode="email" class="form-control" id="forgetEmail" value="" ></asp:textbox>
            </div>
            <div class="mb-4 ml-5 align-content-center">
                <asp:Button ID="btnForgetPassword" runat="server" CssClass="btn" Font-Bold="True"  OnClick="btnForgetPassword_Click" Text="Send Email" />
            </div>
        </div>
    </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  
</body>
</html>
