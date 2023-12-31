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
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

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
                                <form action="SignUpServlet" method="POST">
                                    <div class="input-group">
                                        <i class="bx bxs-user"></i>
                                        <input
                                            type="text"
                                            placeholder="First Name"
                                            name="firstname"
                                            required
                                            />
                                    </div>
                                    <div class="input-group">
                                        <i class="bx bxs-user"></i>
                                        <input
                                            type="text"
                                            placeholder="Last Name"
                                            name="lastname"
                                            required
                                            />
                                    </div>
                                    <div class="input-group">
                                        <i class='bx bxs-calendar' ></i>
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
                                        <i class="bx bxs-envelope"></i>
                                        <input
                                            type="email"
                                            placeholder="Email"
                                            name="email_signup"
                                            required
                                            />
                                    </div>
                                    <div class="input-group">
                                        <i class='bx bxs-phone'></i>
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
                                <form action="ForgotPasswordServlet" method="POST">
                                    <img width="150px" height="60px" src="img/logo-img.png" />
                                    <h4 style="color: red">${errorEmail}</h4>
                                    <h3>Enter your email:</h3>
                                    <div class="input-group">
                                        <i class='bx bxs-envelope'></i>
                                        <input
                                            type="text"
                                            placeholder="Your email"
                                            name="email"
                                            required=""
                                            />
                                    </div>
                                    <button type="submit">Confirm</button>
                                    <p>
                                        <span> Already have an account? </span>
                                        <b onclick="window.location = 'login.jsp'" class="pointer"> Sign in here </b>
                                    </p>
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
