<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="WAD_Project1.UpdatePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <title>Update password</title>
    <style type="text/css">
        body {
            background-color: #000000;
            color:dodgerblue;
        }

        .card{
            background-color:dodgerblue;
            color: black;
        }

        h3{
            text-align:center;
            margin-top: 50px;
        }

        #btnUpdate {
            background-color: crimson;
            color: silver;
        }
        .auto-style1 {
            margin-left: 340px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Update Password</h3>
        <div class="container w-50 card mt-4 rounded-lg border-light" style="left: 0px; top: 0px; width: 52%">
            <div class="mb-3">
                <label for="updatePassword" class="form-label">Create New Password</label>
                <asp:RequiredFieldValidator ID="rvPassword" runat="server" ControlToValidate="updatePassword" ErrorMessage="Please provide new password" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="rePassword" runat="server" ControlToValidate="updatePassword" ErrorMessage="Must be alphanumeric string of size 8" Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9|a-z|A-Z]{8}"></asp:RegularExpressionValidator>
                <asp:textbox runat="server" TextMode="Password" class="form-control" id="updatePassword"  ></asp:textbox>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm New Password</label><asp:RequiredFieldValidator ID="rvPassword2" runat="server" ControlToValidate="confirmPassword" ErrorMessage="Please confirm your password" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="rePassword2" runat="server" ControlToValidate="confirmPassword" ErrorMessage="Must be alphanumeric string of size 8" Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9|a-z|A-Z]{8}"></asp:RegularExpressionValidator>
                <asp:textbox runat="server" TextMode="Password" class="form-control" id="confirmPassword"  ></asp:textbox>
            </div>
            <div class="mb-4 ml-5 align-content-center">
                <asp:Button ID="btnUpdate" runat="server" Font-Bold="True"  OnClick="btnUpdate_Click" Text="Submit" CssClass="auto-style1" />
            </div>
        </div> 
    </form>
</body>
</html>
