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
                                <form action="SignUpServlet" method="POST">
                                    <div class="input-group">
                                        <i class="bx bxs-user"></i>
                                        <input
                                            type="text"
                                            placeholder="Firstname"
                                            name="firstname"
                                            required
                                            />
                                    </div>
                                    <div class="input-group">
                                        <i class="bx bxs-user"></i>
                                        <input
                                            type="text"
                                            placeholder="lastname"
                                            name="lastname"
                                            required
                                            />
                                    </div>
                                    <div class="input-group">
                                        <i class="bx bxs-calendar"></i>
                                        <input
                                            placeholder="Birthdate"
                                            class="textbox-n"
                                            type="text"
                                            onfocus="(this.type = 'date')"
                                            id="date"
                                            name="birthdate"
                                            required
                                            />
                                    </div>

                                    <div class="input-group">
                                        <i class="bx bx-mail-send"></i>
                                        <input
                                            type="email"
                                            placeholder="Email"
                                            name="email_signup"
                                            required
                                            />
                                    </div>
                                    <div class="input-group">
                                        <i class="bx bxs-phone"></i>
                                        <input
                                            type="text"
                                            placeholder="Phone"
                                            name="phone_signup"
                                            pattern="[0-9]{10}"
                                            required
                                            />
                                    </div>
                                    <div class="input-group">
                                        <i class="bx bxs-lock-alt"></i>
                                        <input
                                            type="password"
                                            placeholder="Password"
                                            name="password_signup"
                                            id="password"
                                            required
                                            />
                                    </div>
                                    <div class="input-group">
                                        <i class="bx bxs-lock-alt"></i>
                                        <input
                                            type="password"
                                            placeholder="Confirm password"
                                            name="confirmPassword_signup"
                                            id="confirm_password"
                                            required
                                            />
                                    </div>
                                    <button type="submit">Sign up</button>
                                </form>
                                <p>
                                    <span> Already have an account? </span>
                                    <b onclick="toggle()" class="pointer"> Sign in here </b>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- END SIGN UP -->
                    <!-- SIGN IN -->
                    <div class="col align-items-center flex-col sign-in">
                        <div class="form-wrapper align-items-center">
                            <div class="form sign-in">
                                <form action="ForgotPasswordServlet" method="GET">
                                    <img width="150px" height="60px" src="img/logo-img.png"/>
                                    <h4 style="color: red">${errorEnterCode}</h4>
                                    <h3>Change password</h3>
                                    <h6>A text message with a 6-digit verification code was just send to your email:</h6>
                                    <h6>${sessionScope.customerReset.customerEmail}</h6>
                                    <div class="input-group">
                                        <i class='bx bxs-user'></i>
                                        <input type="text" placeholder="Enter code" name="emailCode" required>
                                    </div>
                                    <button type="submit">
                                        Submit
                                    </button>
                                </form>


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
                            <h2>WELCOME TO FUDA </h2>
                            <h2>BUS LINES</h2>
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
                            <h2>JOIN WITH US</h2>
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
                container.classList.toggle("sign-in");
                container.classList.toggle("sign-up");
            };

            setTimeout(() => {
                container.classList.add("sign-in");
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
