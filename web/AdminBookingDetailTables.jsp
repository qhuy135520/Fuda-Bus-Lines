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
        <script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
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
                <li class="nav-item active">
                    <a class="nav-link" href="AdminTripTablesServlet">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Trip manage</span></a
                    >
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block" />

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
                        <h1 class="h3 mb-2 text-gray-800">Trip Exploited Tables - From ${tripDetail.trip.tripStartingPoint.stationName} to ${tripDetail.trip.destination.stationName}</h1>
                        <p class="mb-4">
                            <a  href="#"
                                >"Generate Report"</a
                            >.

                        </p>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">
                                    Trip Exploited Tables - ${tripDetail.tripDetailId} (Trip Detail ID) 
                                </h6>
                                <br>
                                <h6 style="line-height: 30px">
                                    <b style="color:red">Warning: </b><br>
                                    - To Delete a trip Detail for some Reasons how, You must make sure that all ticket Booking's status must be return refund.<br>
                                    - Remember to Save Information of Customer who have Paid Ticket.<br>
                                    - When Delete, Every booking ticket which has status is order will change to cancel, and paid will change to refund.
                                </h6>
                            </div>

                            <div class="card-body">

                                <div class="table-responsive">
                                    <!--                                    <div class="search__container">
                                                                            <p class="search__title">
                                                                                Search Customer
                                                                            </p>
                                                                            <div class="row">
                                                                                <div class="col-md-8">
                                                                                    <input id="searchCustomer" class="search__input" type="text" placeholder="Search (Phone)"  >
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    <button class="button-56" role="button"  data-bs-toggle="modal" data-bs-target="#exampleModal">Add Employee</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->
                                    <div style="margin-bottom: 20px" class="d-flex justify-content-between align-content-start">

                                        <div>
                                            <a
                                                onclick="ExportToExcel('xlsx')"
                                                class ="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                                                ><i class="fas fa-download fa-sm text-white-50"></i> Generate
                                                Report</a
                                            >
                                            <button  id="active-delete" class="button-24" role="button" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete This Trip </button>


                                        </div>
                                    </div>

                                    <table
                                        class="table table-bordered text-center "
                                        id="tbl_exporttable_to_xls"
                                        width="100%"
                                        cellspacing="0"
                                        >
                                        <thead>
                                            <tr>
                                                <th >#</th>
                                                <th>Trip Detail Id</th>
                                                <th>Customer Phone</th>
                                                <th>Customer Name</th>
                                                <th>Seat Name</th>
                                                <th>Booked Date</th>
                                                <th>Booked Time</th>
                                                <th>Booked Status</th>
                                                <th>Order Code</th>
                                                <th>Paid Date</th>
                                                <th>Price</th>
                                                <th>Completed Payment</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th>Total Paid:</th>
                                        <th>${totalPrice}</th>
                                        </tfoot>
                                        <tbody id="tripDetail">
                                            <c:set value="${0}" var="i"/>
                                            <c:forEach items="${listbookingDetailDTO}" var="bookingDetailDTO">
                                                <c:set value="${i+1}" var="i"/>
                                                <tr>
                                                    <td>${i}</td>
                                                    <td>${bookingDetailDTO.tripDetailId}</td>
                                                    <td>${bookingDetailDTO.booking.customer.customerPhone}</td>
                                                    <td>${bookingDetailDTO.booking.customer.customerFirstname} ${bookingDetailDTO.booking.customer.customerLastname}</td>
                                                    <td>${bookingDetailDTO.seatName}</td>
                                                    <td>${bookingDetailDTO.booking.bookedDate}</td>
                                                    <td>${bookingDetailDTO.booking.bookedTime}</td>
                                                    <td>${bookingDetailDTO.booking.bookingStatus}</td>
                                                    <td>${bookingDetailDTO.booking.code}</td>
                                                    <td>${bookingDetailDTO.booking.paidDate}</td>
                                                    <td>${bookingDetailDTO.price}</td>
                                                    <c:if test="${bookingDetailDTO.booking.bookingStatus == 'paid'}">
                                                        <td>${bookingDetailDTO.price}</td>
                                                    </c:if>
                                                    <c:if test="${bookingDetailDTO.booking.bookingStatus != 'paid'}">
                                                        <td>0</td>
                                                    </c:if>    
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="d-flex justify-content-start ">
                                        <button onclick="history.back()" class="button-19" role="button">&nbsp;&nbsp;Back&nbsp;&nbsp;</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->

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
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete This Trip Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h6>Make sure you want to Delete This Trip</h6>
                        <h6>
                            <b style="color: red">Again: </b><br>
                            - To avoid data loss, you must Generate Information of Customer to Excel, Then Confirm you want to Delete?
                        </h6>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button onclick="window.location = 'AdminDeleteTripServlet?tripDetailId=${tripDetail.tripDetailId}'" type="button" class="btn btn-danger">Delete</button>
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
        <!--        <script type="text/javascript">
                                            document.getElementById("searchCustomer").addEventListener('input', function () {
                                                var usernameSearch = document.getElementById("searchCustomer").value;
                                                $.ajax({
                                                    url: 'AdminEmployeeTablesAjax',
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
                </script>-->
        <script>
                            function ExportToExcel(type, fn, dl) {
                                var active_delete = document.getElementById("active-delete");
                                active_delete.classList.add("active-delete");
                                var elt = document.getElementById('tbl_exporttable_to_xls');
                                var wb = XLSX.utils.table_to_book(elt, {sheet: "sheet1"});
                                return dl ?
                                        XLSX.write(wb, {bookType: type, bookSST: true, type: 'base64'}) :
                                        XLSX.writeFile(wb, fn || ('AdminBookingDetailTables.' + (type || 'xlsx')));
                            }
        </script>
    </body>
</html>
