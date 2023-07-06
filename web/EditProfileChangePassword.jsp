<%-- 
    Document   : EditProfile
    Created on : Jun 5, 2023, 8:49:37 PM
    Author     : letra
--%>
<%@page import="model.Customer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/edit-profile-style.css" type="text/css" />

    </head>
    <body>
        <div class="loader"></div>

        <%@include file="includes/navbar.jsp" %>
        <div class="main-content">

            <div class="header header-content   d-flex align-items-center" style="height: 100%;width: 100%; background-image: url(img/bus-introduce.jpg); background-repeat: no-repeat; ">
                <!-- Mask -->
                <span class="mask bg-gradient-default opacity-8"></span>
                <!-- Header container -->
                <div class="container-fluid d-flex align-items-center">
                    <div class="row">
                        <div class="col-lg-7 col-md-10">
                            <h1 class="display-2 text-white">Hello ${sessionScope.customer.customerFirstname} ${sessionScope.customer.customerLastname}</h1>
                            <p class="text-white mt-0 mb-5">This is your profile page. You can see the progress you've made with your work and manage your projects or assigned tasks</p>
                            <a href="EditProfile.jsp" class="btn btn-info">Edit profile</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Page content -->
            <div class="container-fluid container-fluid-content mt--7">
                <div class="row">
                    <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
                        <div class="card card-profile shadow">
                            <div class="row justify-content-center">
                                <div class="col-lg-3 order-lg-2">
                                    <div class="card-profile-image">
                                        <a href="#">
                                            <img src="${sessionScope.customer.customerUrlImg}" class="rounded-circle">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                                <div class="d-flex justify-content-between">
                                    <a href="#" class="btn btn-sm btn-info mr-4" data-bs-toggle="modal" data-bs-target="#exampleModal">Edit avatar</a>
                                    <a href="#" class="btn btn-sm btn-default float-right">Message</a>
                                </div>
                            </div>

                            <div class="card-body pt-0 pt-md-4">
                                <div class="row">


                                    <div class="col">
                                        <div class="card-profile-stats d-flex justify-content-center mt-md-5">
                                            <div>
                                                <span class="heading"><a class="facebook" href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></span>
                                                <span class="description">Facebook</span>
                                            </div>
                                            <div>
                                                <span class="heading"><a class="linkedin" href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></span>
                                                <span class="description">Instagram</span>
                                            </div>
                                            <div>
                                                <span class="heading">
                                                    <a class="twitter" href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                                </span>
                                                <span class="description">Twitter</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <h3>
                                        ${sessionScope.customer.customerFirstname} ${sessionScope.customer.customerLastname}<span class="font-weight-light">, ${sessionScope.customer.customerBirthdate}</span>
                                    </h3>
                                    <div class="h5 font-weight-300">
                                        <i class="ni location_pin mr-2"></i>${sessionScope.customer.customerEmail}
                                    </div>
                                    <div class="h5 mt-4">
                                        <i class="ni business_briefcase-24 mr-2"></i>Date Joined - ${sessionScope.customer.customerCreatedDate}
                                    </div>
                                    <div>
                                        <i class="ni education_hat mr-2"></i>FUDA Bus Lines Thanks for your contribute
                                    </div>
                                    <hr class="my-4">
                                    <p>Although most marketers argue that a checkout page is a perfect page for cross-selling products and services, we believe that the thank you page is a better horse to bet on!</p>
                                    <p>
                                        <a  data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Show more</a>
                                    </p>
                                    <div class="collapse" id="collapseExample">
                                        The reason being, when a customer lands on a thank you page after making a purchase or subscribing to a brand’s blog site, they’re in their prime stage. Meaning, this is the time when customers are most likely to convert again than if they come back on your site after a month. So, use your thank you page to encourage your customers to buy more from you. Lure them by offering coupons or something valid only for the next 48 hours of their purchase, maybe? 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 order-xl-1">
                        <div class="card bg-secondary shadow">
                            <div class="card-header bg-white border-0">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <h3 class="mb-0">My account</h3>
                                    </div>
                                    <div class="col-4 text-right">
                                        <a href="EditProfile.jsp" class="btn btn-sm btn-primary">Edit Profile</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">


                                <h6 class="heading-small text-muted mb-4">Change password * <span style="color: red;">${errorWrongOldPasword}</span></h6>
                                <div class="pl-lg-4">
                                    <form action="ChangePasswordProfileServlet" method="POST">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group focused">
                                                    <label class="form-control-label" for="input-city">Old Password</label>
                                                    <input name="old-password" type="password" id="password" class="form-control form-control-alternative" required  />

                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group focused">
                                                    <label class="form-control-label" for="input-city">New Password</label>
                                                    <input name="new-password" type="password" id="password-new" class="form-control form-control-alternative" required />

                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group focused">
                                                    <label class="form-control-label" for="input-city">Confirm Password</label>
                                                    <input name="confirm-password" type="password" id="password-confirm" class="form-control form-control-alternative" required />
                                                </div>
                                            </div>
                                            <div class="d-grid gap-2">
                                                <button type="submit" class="btn btn-primary submit-edit-profile" type="button">Change Password</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
        <!--Modal-->
        <form action="EditProfileUploadImageServlet" method="POST" enctype="multipart/form-data">
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Change Your Avatar</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body modal-body-file">
                            <div class="profile-pic-div">
                                <img src="img/customer/img-profile-none-bg.png" id="photo"/>
                                <input type="file" id="file" name="file" accept=".png,.jpg,.jpeg" />
                                <label for="file" id="uploadBtn">Choose photo</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
    <script type="text/javascript">
        let     password_new = document.getElementById("password-new"),
                password_confirm = document.getElementById("password-confirm");

        function validatePassword() {
            if (password_new.value !== password_confirm.value) {
                password_confirm.setCustomValidity("Passwords Don't Match");
            } else {
                password_confirm.setCustomValidity('');
            }
        }

        password_new.onchange = validatePassword;
        password_confirm.onkeyup = validatePassword;

    </script>
    <script type="text/javascript">
        const imgDiv = document.querySelector('.profile-pic-div');
        const img = document.querySelector('#photo');
        const file = document.querySelector('#file');
        const uploadBtn = document.querySelector('#uploadBtn');


        imgDiv.addEventListener('mouseenter', function () {
            uploadBtn.style.display = "block";
        });


        imgDiv.addEventListener('mouseleave', function () {
            uploadBtn.style.display = "none";
        });


        file.addEventListener('change', function () {
            const choosedFile = this.files[0];

            if (choosedFile) {

                const reader = new FileReader();

                reader.addEventListener('load', function () {
                    img.setAttribute('src', reader.result);
                });

                reader.readAsDataURL(choosedFile);


            }
        });
    </script>
</html>
