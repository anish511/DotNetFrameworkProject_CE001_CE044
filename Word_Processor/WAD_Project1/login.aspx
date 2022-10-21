<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WAD_Project1.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #000000;
        }

        body {
            background-image: url("https://media.istockphoto.com/vectors/abstract-green-cube-pattern-on-dark-blue-background-modern-lines-vector-id1285588443?k=20&m=1285588443&s=612x612&w=0&h=fqpK2gg8n4yd3ylx13-0gGPbeNXTmq4u8OYYlOaGnB4=");
            color:antiquewhite;
        }

        .card{
            background-color:dodgerblue;
            color: black;
            margin-top: 50px;
        }

        h3{
            text-align:center;
            margin-top: 50px;
        }

        a {
            color:antiquewhite;
            font-size: larger;
        }

        .forget{
            margin-left: 320px;
        }

        .alert{
            display: inline-block;
            margin-left: 10px;
            margin-top: 10px;
        }

        footer{
            left: 0px;
            bottom: 0px;
        }
       
    </style>
</head>
<body>


    <form id="form1" runat="server">
        

        
        <asp:Panel ID="errPassword" runat="server">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
               <strong>Alert!</strong> Password is not valid.
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


        <div class="container w-50 card mt-5 rounded-lg border-light">
            <h3>Login Please...</h3>
            <div class="mb-3">
                <label for="tbLoginEmail" class="form-label">Email address</label>
                 <asp:RequiredFieldValidator ID="rvLoginEmail" runat="server" ControlToValidate="tbLoginEmail" ErrorMessage="This field is required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:textbox runat="server" textMode="email" class="form-control" id="tbLoginEmail" value="" ></asp:textbox>
            </div>
            <div class="mb-3">
                <label for="tbLoginPassword" class="form-label">Password</label>
                <asp:RequiredFieldValidator ID="rvLoginPassword" runat="server"  ControlToValidate="tbLoginPassword" ErrorMessage="This field is required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>


                <asp:textbox runat="server" class="form-control" id="tbLoginPassword" value="" TextMode="Password" ></asp:textbox>
            <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ControlToValidate="tbLoginPassword" ErrorMessage="Must contain alphanumeric and should be minimum of 8 and maximum of 15 size" ForeColor="red" ValidationExpression="[0-9|a-z|A-Z]{8,15}"></asp:RegularExpressionValidator>
            </div>
            
            <div class="mb-4 ml-5 align-content-center">
               <asp:Button ID="btnLogin" runat="server" CssClass="btn" BackColor="#CC0000" Font-Bold="True" ForeColor="Silver" OnClick="btnLogin_Click" Text="Login" />
                
            </div>
        </div>
    </form>

    <div class="container w-50">
    <div class="someLink align-items-center ">
        <%--<asp:Button ID="btnRegister" runat="server" BackColor="#CC0000" Font-Bold="True" ForeColor="Silver" OnClick="btnRegister_Click" Text="Register" />--%>
        <a href="register.aspx" >New User? Register</a>
        <%--<asp:Button ID="btnForgetPassword" runat="server" BackColor="#CC0000" Font-Bold="True" ForeColor="Silver" OnClick="btnForgetPassword_Click" Text="Forget Password" />--%>
        <a href="forgetPassword.aspx" class="forget">Forget Password</a>
    </div>
    </div>





  


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  
</body>
</html>
