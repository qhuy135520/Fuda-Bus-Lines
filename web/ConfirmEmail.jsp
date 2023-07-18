<%-- 
    Document   : login.jsp
    Created on : May 23, 2023, 11:15:29 PM
    Author     : letra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/loginstyle.css"/>

    </head>
    <body>
        <%@include file="/includes/navbar.jsp" %>
        <div id="container" class="container-login">
            <!-- FORM SECTION -->
            <div id="form-login" class="form-login">
                <!-- FORM SECTION -->
                <div class="row">
                    <!-- SIGN UP -->
                    <div class="col align-items-center flex-col sign-up">
                        <div class="form-wrapper align-items-center">
                            <div class="form sign-up">
                                <img width="150px" height="60px" src="img/logo-img.png" />
                                <h4 style="color: red;">${errorPhone}</h4>
                                <form action="SignUpServlet" method="GET">
                                    <img width="150px" height="60px" src="img/logo-img.png"/>
                                    <h4 style="color: red">${error}</h4>
                                    <h3>Account Verification</h3>
                                    <h6>A text message with a 6-digit verification code was just send to your email:</h6>
                                    <h6>${sessionScope.customer_signup.customerEmail}</h6>
                                    <div class="input-group">
                                        <i class='bx bxs-lock-alt'></i>
                                        <input type="text" placeholder="Confirm Code" name="emailCode" required>
                                    </div>

                                    <button>
                                        Confirm
                                    </button>
                                    <p>
                                        <span>
                                            Already have an account?
                                        </span>
                                        <b onclick="toggle()" class="pointer">
                                            Sign in here
                                        </b>
                                    </p>
                                </form>

                            </div>
                        </div>
                    </div>
                    <!-- END SIGN UP -->
                    <!-- SIGN IN -->
                    <div class="col align-items-center flex-col sign-in">
                        <div class="form-wrapper align-items-center">
                            <div class="form sign-in">
                                <img width="150px" height="60px" src="img/logo-img.png" />
                                <form action="SignInServlet" method="POST">
                                    <h4 style="color: red">${errorUP}</h4>
                                    <div class="input-group">
                                        <i class="bx bxs-user"></i>
                                        <input
                                            type="text"
                                            placeholder="Phone"
                                            name="phone_signin"
                                            value="${cookie.phone.value}"
                                            required=""
                                            />
                                    </div>
                                    <div class="input-group">
                                        <i class="bx bxs-lock-alt"></i>
                                        <input
                                            type="password"
                                            placeholder="Password"
                                            name="password_signin"
                                            value="${cookie.password.value}"
                                            required
                                            />
                                    </div>

                                    <input class="rem" type="checkbox" name="rem" value="ON" /> &nbsp;
                                    Remember me
                                    <button type="submit">Sign in</button>
                                </form>

                                <p onclick="window.location = 'ForgotPassword.jsp'">
                                    <b> Forgot password? </b>
                                </p>
                                <p>
                                    <span> Don't have an account? </span>
                                    <b onclick="toggle()" class="pointer"> Sign up here </b>
                                </p>
                            </div>
                        </div>
                        <div class="form-wrapper"></div>
                    </div>
                    <!-- END SIGN IN -->
                </div>
                <!-- END FORM SECTION -->
                <!-- CONTENT SECTION -->
                <div class="row content-row">
                    <!-- SIGN IN CONTENT -->
                    <div class="col align-items-center flex-col">
                        <div class="text sign-in">
                            <h2>SIGN IN</h2>
                                <h5>Welcome to FUDA Bus Lines. We want to bring the best experience for your trip.</h5>
                                <h5>With a team of top experts with the most quality and fun.</h5>
                                <h5>Good Luck!</h5>
                        </div>
                        <div class="img sign-in">
                            <img width="100%" src="img/bus-login.png"/>
                        </div>
                    </div>
                    <!-- END SIGN IN CONTENT -->
                    <!-- SIGN UP CONTENT -->
                    <div class="col align-items-center flex-col">
                        <div class="img sign-up">
                            <img width="100%" src="img/bus-login.png"/>
                        </div>
                        <div class="text sign-up">
                            <h2>SIGN UP</h2>
                            <h5>Register now,
                            you will be able to access and use many features with the rights of a loyal customer.</h5>
                        </div>
                    </div>
                    <!-- END SIGN UP CONTENT -->
                </div>
                <!-- END CONTENT SECTION -->
            </div>
        </div>
        <script type="text/javascript">
            let container = document.getElementById("container");

            toggle = () => {
                container.classList.toggle("sign-up");
                container.classList.toggle("sign-in");
            };

            setTimeout(() => {
                container.classList.add("sign-up");
            }, 200);
        </script>
        <script type="text/javascript">
            var password = document.getElementById("password")
                    , confirm_password = document.getElementById("confirm_password");

            function validatePassword() {
                if (password.value != confirm_password.value) {
                    confirm_password.setCustomValidity("Passwords Don't Match");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;

        </script>

        <script src="assets/js/index.js"></script>

    </body>
</html>
