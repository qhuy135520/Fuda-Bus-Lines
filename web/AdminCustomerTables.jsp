<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"
        ></script>
        <link
            rel="icon"
            href="https://i.ibb.co/HFrrVg4/bus.png"
            type="image/x-icon"
            />
        <title>FUDA Bus lines</title>

        <!-- Custom fonts for this template -->
        <link
            href="assets/vendor/fontawesome-free/css/all.min.css"
            rel="stylesheet"
            type="text/css"
            />
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet"
            />

        <!-- Custom styles for this template -->
        <link href="assets/css/sb-admin-2.css" rel="stylesheet" />
        <link rel = "icon" href = "https://i.ibb.co/HFrrVg4/bus.png" 
              type = "image/x-icon"/>
        <!-- Custom styles for this page -->
        <link
            href="vendor/datatables/dataTables.bootstrap4.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="assets/css/admin-table-style.css"/>
        <script
            src="https://kit.fontawesome.com/84e176b008.js"
            crossorigin="anonymous"
        ></script>
    </head>

    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul
                class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
                id="accordionSidebar"
                >
                <!-- Sidebar - Brand -->
                <a
                    class="sidebar-brand d-flex align-items-center justify-content-center"
                    href="AdminHomePageServlet"
                    >
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fa-solid fa-bus"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">FUDA Admin </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0" />

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="AdminHomePageServlet">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Overview</span></a
                    >
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider my-0" />

                <!-- Heading -->

                <!-- Divider -->

                <!-- Heading -->

                <!-- Nav Item - Tables -->
                <li class="nav-item ">
                    <a class="nav-link" href="AdminEmployeeTablesServlet">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Employees Manage</span></a
                    >
                </li>
                <hr class="sidebar-divider my-0" />
                <li class="nav-item ">
                    <a class="nav-link" href="AdminTripTablesServlet">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Trip manage</span></a
                    >
                </li>
                <hr class="sidebar-divider my-0" />
                <li class="nav-item active">
                    <a class="nav-link" href="AdminCustomerTablesServlet">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Customers Manage</span></a
                    >
                </li>
                <hr class="sidebar-divider my-0" />
                <!-- Divider -->

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
                <div class="sidebar-card d-none d-lg-flex">
                    <img
                        class="sidebar-card-illustration mb-2"
                        src="img/bus-admin.png"
                        alt="..."
                        />
                    <p class="text-center mb-2">
                        <strong>Fuda Bus Lines</strong> 
                    </p>
                    <a
                        class="btn btn-success btn-sm"  style="display: none"
                        href="https://startbootstrap.com/theme/sb-admin-pro"
                        >Upgrade to Pro!</a
                    >
                </div>
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav
                        class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
                        >
                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline">
                            <button
                                id="sidebarToggleTop"
                                class="btn btn-link d-md-none rounded-circle mr-3"
                                >
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a
                                    class="nav-link dropdown-toggle"
                                    href="#"
                                    id="searchDropdown"
                                    role="button"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div
                                    class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                    aria-labelledby="searchDropdown"
                                    >
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input
                                                type="text"
                                                class="form-control bg-light border-0 small"
                                                placeholder="Search for..."
                                                aria-label="Search"
                                                aria-describedby="basic-addon2"
                                                />
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>



                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a
                                    class="nav-link dropdown-toggle"
                                    href="#"
                                    id="userDropdown"
                                    role="button"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                                          >Admin</span
                                    >
                                    <img
                                        class="img-profile rounded-circle"
                                        src="img/undraw_profile.svg"
                                        />
                                </a>
                                <!-- Dropdown - User Information -->
                                <div
                                    class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                    aria-labelledby="userDropdown"
                                    >
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a
                                        class="dropdown-item"
                                        href="#"
                                        data-toggle="modal"
                                        data-target="#logoutModal"
                                        >
                                        <i
                                            class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"
                                            ></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Customer Tables</h1>
                        <p class="mb-4">
                            DataTables is a third party plugin that is used to generate the
                            demo table below. For more information about DataTables, please
                            visit the
                            <a  href="#"
                                >official DataTables documentation</a
                            >.
                        </p>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">
                                    Customer Tables
                                </h6>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <div class="search__container ">

                                        <div class="row d-flex justify-content-between w-100">
                                            <div class="row col-md-6">
                                                <p style="margin-left: 20%; text-align: left" class="search__title">
                                                    Search Customer
                                                </p>
                                                <div class="col-md-8 ">

                                                    <input id="searchCustomer" class="search__input" type="text" placeholder="Search (Username)"  >
                                                </div>
                                                <div class="col-md-4">
                                                </div>
                                            </div>
                                            <div class="col-md-2" style="margin-top: 35px">
                                                <a
                                                    onclick="ExportToExcel('xlsx')"
                                                    class ="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                                                    ><i class="fas fa-download fa-sm text-white-50"></i> Generate
                                                    Report</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                    <table
                                        class="table table-bordered "
                                        id="tbl_exporttable_to_xls"
                                        width="100%"
                                        cellspacing="0"
                                        >
                                        <thead>
                                            <tr>
                                                <th class="text-center">#</th>
                                                <th class="text-center">Phone</th>
                                                <th class="text-center">Email</th>
                                                <th class="text-center">Full name</th>
                                                <th class="text-center">Birth date</th>
                                                <th class="text-center">Created date</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>

                                        <tbody id="employeeFound">
                                            <c:set value="${1}" var="i"/>
                                            <c:forEach var="customer" items="${customerList}">

                                                <tr>
                                                    <td class="text-center">${i}</td>
                                                    <td class="text-center">${customer.customerPhone}</td>
                                                    <td class="text-center">${customer.customerEmail}</td>
                                                    <td class="text-center">${customer.customerFirstname} ${customer.customerLastname}</td>
                                                    <td class="text-center">${customer.customerBirthdate}</td>
                                                    <td class="text-center">${customer.customerCreatedDate}</td>
                                                    <td class="text-center"><button type="button" class="btn btn-info w-100"  data-bs-toggle="modal" data-bs-target="#customer${customer.customerPhone}">Edit Profile</button></td>
                                                </tr>


                                                <c:set value="${i+1}" var="i"/>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <c:set var="page" value="${sessionScope.page}"/>
                                    <nav aria-label="" style="margin-top: 35px;">
                                        <ul class="pagination justify-content-center">
                                            <!--Previous Page-->
                                            <c:if test="${page != 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="AdminCustomerTablesServlet?page=${page-1}">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page == 1}">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="AdminCustomerTablesServlet?page=${page-1}">Previous</a>
                                                </li>
                                            </c:if>

                                            <c:forEach var="i" begin="1" end="${endPage}">
                                                <c:if test="${page == i}">
                                                    <li class="page-item active">
                                                        <a class="page-link" href="AdminCustomerTablesServlet?page=${i}">${i}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${page != i}">
                                                    <li class="page-item ">
                                                        <a class="page-link" href="AdminCustomerTablesServlet?page=${i}">${i}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <!--Next Page-->
                                            <c:if test="${endPage != page}">
                                                <li class="page-item">
                                                    <a class="page-link" href="AdminCustomerTablesServlet?page=${page+1}">&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${endPage == page}">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="AdminCustomerTablesServlet?page=${page+1}">&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;</a>
                                                </li>
                                            </c:if>
                                            <!-- -->
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->
                <c:forEach items="${customerListFull}" var="customer">
                    <div class="modal fade" id="customer${customer.customerPhone}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-body" style="padding: 0;">
                                    <div class="wrapper" >
                                        <div class="row">
                                            <div class="col-md-6 background-register-booking"></div>
                                            <div class="col-md-6">
                                                <div class="inner">
                                                    <form action="AdminEditProfileCustomerServlet" method="POST">
                                                        <h3 style="margin-bottom: 10px">Edit Profile</h3>
                                                        <h4 class="text-center" style="color: red;padding-bottom: 15px">${emailExisted}</h4>
                                                        <div class="form-wrapper">
                                                            <label for="">Phone</label>
                                                            <input type="text" readonly="" name="phone" class="form-control" required value="${customer.customerPhone}">
                                                        </div>
                                                        <div class="form-wrapper">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label for="">First name</label>
                                                                    <input type="text" name="firstname" class="form-control" required value="${customer.customerFirstname}">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="">Last name</label>
                                                                    <input type="text" id="lastname" name="lastname" class="form-control" required value="${customer.customerLastname}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-wrapper">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="">Email</label>
                                                                    <input type="text" name="email" class="form-control" required value="${customer.customerEmail}">
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="form-wrapper">
                                                            <label for="">Birth Date</label>
                                                            <input type="date" id="confirm_password" name="birthdate" class="form-control" ${customer.customerBirthdate} required>
                                                        </div>

                                                        <button type="submit">Edit now</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                   
                </c:forEach>
                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Fuda Bus Lines 2023</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->
            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div
            class="modal fade"
            id="logoutModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button
                            class="close"
                            type="button"
                            data-dismiss="modal"
                            aria-label="Close"
                            >
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Select "Logout" below if you are ready to end your current session.
                    </div>
                    <div class="modal-footer">
                        <button
                            class="btn btn-secondary"
                            type="button"
                            data-dismiss="modal"
                            >
                            Cancel
                        </button>
                        <a class="btn btn-primary" href="SignOutServlet">Logout</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript-->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="assets/js/sb-admin-2.js"></script>

        <!-- Page level plugins -->
        <script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="assets/js/demo/datatables-demo.js"></script>
        <script type="text/javascript">
                                                        document.getElementById("searchCustomer").addEventListener('input', function () {
                                                            var usernameSearch = document.getElementById("searchCustomer").value;
                                                            $.ajax({
                                                                url: 'AdminCustomerTablesAjax',
                                                                type: 'POST',
                                                                data: {
                                                                    usernameCustomer: usernameSearch,
                                                                },
                                                                success: function (data) {
                                                                    var row = document.getElementById('employeeFound');
                                                                    row.innerHTML = data;
                                                                },
                                                                error: function (jqXHR, textStatus, errorThrown) {

                                                                }
                                                            }
                                                            );
                                                        }
                                                        );
        </script>
        <script type="text/javascript">
            var password = document.getElementById("password")
                    , confirm_password = document.getElementById("confirm_password");

            function validatePassword() {
                if (password.value !== confirm_password.value) {
                    confirm_password.setCustomValidity("Passwords Don't Match");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;
        </script>
        <c:if test="${emailExisted != null}">
            <script type="text/javascript">
                $(window).on('load', function () {
                    $('#customer${customerPhone}').modal('show');
                });
            </script>
        </c:if>
        <script>
            function ExportToExcel(type, fn, dl) {
                var elt = document.getElementById('tbl_exporttable_to_xls');
                var wb = XLSX.utils.table_to_book(elt, {sheet: "sheet1"});
                return dl ?
                        XLSX.write(wb, {bookType: type, bookSST: true, type: 'base64'}) :
                        XLSX.writeFile(wb, fn || ('AdminEmployeeTables.' + (type || 'xlsx')));
            }
        </script>
    </body>
</html>
