<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Appointment_management_system_integration.login" %>


<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Tata Power Delhi Distribution Limited</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->

</head>
<body>

    <div class="limiter">
        <div class="container-login100" style="background-image: url('media/images/bg-01.jpg');">
            <div class="wrap-login100">
                <form class="login100-form validate-form" runat="server">
                    <span class="login100-form-logo">
                        <a href="https://www.tatapower-ddl.com">
                            <img src="<%= Page.ResolveUrl("~/media/Images/logo.png") %>" /></a>
                    </span>

                    <span class="login100-form-title p-b-34 p-t-27">Log in
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Enter username">
                        <input class="input100" id="txtUserid" type="text" runat="server" name="username" placeholder="Username">
                        <span class="focus-input100" data-placeholder="&#xf207;"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
                        <input class="input100" type="password" runat="server" name="pass" id="password" placeholder="Password">
                        <span class="focus-input100" data-placeholder="&#xf191;"></span>
                    </div>


                    <div class="contact100-form-checkbox">
                        <a style="color: white; float: right; margin-right: 15px; padding-top: 6px" href="javascript:void(0);" onclick="javascript:return ChangeImage();">Change Image</a>
                        <asp:Image Style="float: right; margin-right: 30px" ID="Img" runat="server" alt="" />
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Captcha is required">
                        <input type="text" autocomplete="off" onfocus="if(this.value=='Enter code as it appears'){this.value=''};" placeholder="Sum of code as it appears" class="input100" id="TxtImgVer" name="TxtImgVer" runat="server" />
                        <span class="focus-input100" data-placeholder="&#xf183;"></span>
                    </div>

                    <div class="" style="width: 100%; text-align: center; padding-bottom: 7px; color: white;">
                        <span id="lblMsg" runat="server"></span>
                    </div>

                    <div class="container-login100-form-btn">
                        <asp:Button ID="btnSubmit" CssClass="login100-form-btn" Text="Log In"
                            runat="server" />
                    </div>


                </form>
            </div>
        </div>
    </div>

</body>
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->

<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>

<!--===============================================================================================-->

<!--===============================================================================================-->
<script src="js/main.js"></script>

<script>
    function login() {
        if ($("#username").val().trim() == "" || $("#Password").val().trim() == "") {
            return false
        }
        else {
            return true
        }
    }
    function ChangeImage() {

        document.getElementById('Img').src = "../Img.aspx?rand=" + Math.random();
        return false;
    }
</script>
</html>
