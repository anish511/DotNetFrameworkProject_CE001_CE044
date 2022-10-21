<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WAD_Project1.home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" 
          href=
"https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
          integrity=
"sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
          crossorigin="anonymous" />
    <!-- fontawesome cdn For Icons -->
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
    <link rel="stylesheet" href="CSS/home.css" />
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-rc1/jquery.min.js'></script>
    <script src="JS/FileSaver.js"></script>
    <script src="JS/jquery.wordexport.js"></script>
    <title>Text Editor</title>
    <style type="text/css">
        .auto-style2 {
            color: #fff;
            background-color: #dc3545;
            border-color: #dc3545;
            margin-left: 3px;
            margin-top: 3px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid ">

        <div class="row">
            <div class="col bg-dark">
                <div class="row mt-3 mb-3">
                <div class="col-3" style="border-right:2px solid white!important">
                    <asp:TextBox ID="tbFileName" runat="server" placeholder="Enter File Name"  Font-Bold="True"></asp:TextBox>
                    <br /> 
                    <asp:RequiredFieldValidator ID="rvFileName" runat="server" ErrorMessage="FileName cannot be empty. . ." Font-Bold="True" ForeColor="Red" ControlToValidate="tbFileName"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="readButton" runat="server" OnClick="readButton_Click" CssClass="btn btn-light" CausesValidation="false" Text="Read File" />
                    
                    <asp:Button ID="btnSave" runat="server" CssClass="btn ml-3 btn-light" Text="Save"/><br />
                    <%--<asp:Button ID="btnLogOut" runat="server" CssClass="btn mt-3 auto-style2" OnClick="btnLogOut_Click" Text="Log Out" Width="72px" />--%>
                    <%--<asp:Button ID="btnUpdate" runat="server" CssClass="btn mt-3 auto-style2" OnClick="btnUpdate_Click" Text="Update Profile"  />--%>
                    <a href="logOut.aspx" class="btn mt-3 auto-style2">Log out</a>
                    <a href="updateProfile.aspx" class="btn mt-3 auto-style2">Update Profile</a>
                </div>
                <div class="col-4" style="border-right:2px solid white!important">
                     <asp:Button ID="btnBold" CssClass="btn mt-3 ml-3 btn-light" runat="server" OnClick="btnBold_Click" Text="Bold" />
                    <asp:Button ID="btnItalic" runat="server" CssClass="btn mt-3 ml-3 btn-light" OnClick="btnItalic_Click" Text="Italic" />
                    <asp:Button ID="btnUpperCase" runat="server" CssClass="btn mt-3 ml-3 btn-light" OnClick="btnUpperCase_Click" Text="UpperCase" />
                    <asp:Button ID="btnLowerCase" runat="server" CssClass="btn mt-3 ml-3 btn-light" OnClick="btnLowerCase_Click" Text="LowerCase" />
                    <asp:Button ID="btnCapital" runat="server" CssClass="btn mt-3 ml-3 btn-light" OnClick="btnCapital_Click" Text="Capitalize" />
                    <asp:Button ID="btnClearText" runat="server" CssClass="btn mt-3 ml-3 btn-light" OnClick="btnClearText_Click" Text="Clear Text" />
                </div>
                <div class="col-5">
                    <asp:DropDownList ID="DropDownList1" CssClass="ml-3 mt-3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>Font-size</asp:ListItem>
                        <asp:ListItem>10px</asp:ListItem>
                        <asp:ListItem>12px</asp:ListItem>
                        <asp:ListItem>14px</asp:ListItem>
                        <asp:ListItem>16px</asp:ListItem>
                        <asp:ListItem>18px</asp:ListItem>
                        <asp:ListItem>20px</asp:ListItem>
                        <asp:ListItem>22px</asp:ListItem>
                        <asp:ListItem>24px</asp:ListItem>
                        <asp:ListItem>26px</asp:ListItem>
                        <asp:ListItem>28px</asp:ListItem>
                        <asp:ListItem>30px</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="DropDownList2" CssClass="mt-3 ml-3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Style" DataValueField="Style">
                     
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Style] FROM [Font_Family]"></asp:SqlDataSource>

                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:Label ID="labelColor" runat="server" CssClass="mt-3 ml-3" AssociatedControlID="textboxColor" BackColor="White" Font-Bold="False" ForeColor="Black" Text="Select Color"></asp:Label>
&nbsp;<asp:TextBox ID="textboxColor" runat="server" CssClass="mt-3 ml-2" OnLoad="colorChange" OnTextChanged="colorChange" AutoPostBack="True"></asp:TextBox>
                    <ajaxToolkit:ColorPickerExtender ID="ColorPickerExtender1" runat="server"  PopupPosition="Right" TargetControlID="textboxColor" />
                    <br />
                    <asp:LinkButton ID="btnLeft" runat="server" CssClass="btn mt-3 btn-light" OnClick="btnLeft_Click"><i class="fas fa-align-left">&nbsp; Left align</i></asp:LinkButton>
                    <asp:LinkButton ID="btnRight" runat="server" CssClass="btn mt-3 btn-light" OnClick="btnRight_Click"><i class="fas fa-align-right"> &nbsp; Right Align</i></asp:LinkButton>
                    <asp:LinkButton ID="btnCenter" runat="server" CssClass="btn mt-3 btn-light" OnClick="btnCenter_Click"><i class="fas fa-align-center">&nbsp; Center Align</i></asp:LinkButton>
                    <br />
                    
                </div>
               </div>
                </div>
            
        </div>
        <asp:HiddenField id="styles" runat="server" />

        <div class="row">
            <div class="col-md-2 col-sm-3" style="left: -2px; top: 0px">
            </div>
            <div class="col-md-8 col-sm-9">
                <div class="flex-box">
                    <asp:Label ID="lbmsg" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Green" Text=""></asp:Label>
                    <div id="page-content">
                        <asp:TextBox ID="textbox1" runat="server"
                            class="input shadow"
                            name="name"
                            Rows="40"
                            placeholder="Your text here " TextMode="MultiLine" Width="850px">
                        
                        </asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
            </div>
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

</body>
</html>
