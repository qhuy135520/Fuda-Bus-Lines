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

        <title>FUDA Bus Lines</title>
        <script
            src="https://kit.fontawesome.com/84e176b008.js"
            crossorigin="anonymous"
        ></script>
        <!-- Custom fonts for this template-->
        <link
            href="assets/vendor/fontawesome-free/css/all.min.css"
            rel="stylesheet"
            type="text/css"
            />
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet"
            />
        <link rel = "icon" href = "https://i.ibb.co/HFrrVg4/bus.png" 
              type = "image/x-icon"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- Custom styles for this template-->
        <link href="assets/css/sb-admin-2.css" rel="stylesheet" />

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
                <li class="nav-item active">
                    <a class="nav-link" href="AdminHomePageServlet">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Overview</span></a
                    >
                </li>


                <!-- Heading -->



                <!-- Nav Item - Utilities Collapse Menu -->

                <!-- Divider -->
                <hr class="sidebar-divider my-0" />

                <!-- Heading -->



                <!-- Nav Item - Tables -->
                <li class="nav-item">
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

               
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block" />

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

                <!-- Sidebar Message -->
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
                        <button
                            id="sidebarToggleTop"
                            class="btn btn-link d-md-none rounded-circle mr-3"
                            >
                            <i class="fa fa-bars"></i>
                        </button>



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

                            <!-- Nav Item - Alerts -->
                            <!--                            <li class="nav-item dropdown no-arrow mx-1">
                                                            <a
                                                                class="nav-link dropdown-toggle"
                                                                href="#"
                                                                id="alertsDropdown"
                                                                role="button"
                                                                data-toggle="dropdown"
                                                                aria-haspopup="true"
                                                                aria-expanded="false"
                                                                >
                                                                <i class="fas fa-bell fa-fw"></i>
                                                                 Counter - Alerts 
                                                                <span class="badge badge-danger badge-counter">3+</span>
                                                            </a>
                                                             Dropdown - Alerts 
                                                            <div
                                                                class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                                                aria-labelledby="alertsDropdown"
                                                                >
                                                                <h6 class="dropdown-header">Alerts Center</h6>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="mr-3">
                                                                        <div class="icon-circle bg-primary">
                                                                            <i class="fas fa-file-alt text-white"></i>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="small text-gray-500">December 12, 2019</div>
                                                                        <span class="font-weight-bold"
                                                                              >A new monthly report is ready to download!</span
                                                                        >
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="mr-3">
                                                                        <div class="icon-circle bg-success">
                                                                            <i class="fas fa-donate text-white"></i>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="small text-gray-500">December 7, 2019</div>
                                                                        $290.29 has been deposited into your account!
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="mr-3">
                                                                        <div class="icon-circle bg-warning">
                                                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="small text-gray-500">December 2, 2019</div>
                                                                        Spending Alert: We've noticed unusually high spending for
                                                                        your account.
                                                                    </div>
                                                                </a>
                                                                <a
                                                                    class="dropdown-item text-center small text-gray-500"
                                                                    href="#"
                                                                    >Show All Alerts</a
                                                                >
                                                            </div>
                                                        </li>
                            
                                                         Nav Item - Messages 
                                                        <li class="nav-item dropdown no-arrow mx-1">
                                                            <a
                                                                class="nav-link dropdown-toggle"
                                                                href="#"
                                                                id="messagesDropdown"
                                                                role="button"
                                                                data-toggle="dropdown"
                                                                aria-haspopup="true"
                                                                aria-expanded="false"
                                                                >
                                                                <i class="fas fa-envelope fa-fw"></i>
                                                                 Counter - Messages 
                                                                <span class="badge badge-danger badge-counter">7</span>
                                                            </a>
                                                             Dropdown - Messages 
                                                            <div
                                                                class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                                                aria-labelledby="messagesDropdown"
                                                                >
                                                                <h6 class="dropdown-header">Message Center</h6>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="dropdown-list-image mr-3">
                                                                        <img
                                                                            class="rounded-circle"
                                                                            src="img/undraw_profile_1.svg"
                                                                            alt="..."
                                                                            />
                                                                        <div class="status-indicator bg-success"></div>
                                                                    </div>
                                                                    <div class="font-weight-bold">
                                                                        <div class="text-truncate">
                                                                            Hi there! I am wondering if you can help me with a
                                                                            problem I've been having.
                                                                        </div>
                                                                        <div class="small text-gray-500">Emily Fowler � 58m</div>
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="dropdown-list-image mr-3">
                                                                        <img
                                                                            class="rounded-circle"
                                                                            src="img/undraw_profile_2.svg"
                                                                            alt="..."
                                                                            />
                                                                        <div class="status-indicator"></div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="text-truncate">
                                                                            I have the photos that you ordered last month, how would
                                                                            you like them sent to you?
                                                                        </div>
                                                                        <div class="small text-gray-500">Jae Chun � 1d</div>
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="dropdown-list-image mr-3">
                                                                        <img
                                                                            class="rounded-circle"
                                                                            src="img/undraw_profile_3.svg"
                                                                            alt="..."
                                                                            />
                                                                        <div class="status-indicator bg-warning"></div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="text-truncate">
                                                                            Last month's report looks great, I am very happy with
                                                                            the progress so far, keep up the good work!
                                                                        </div>
                                                                        <div class="small text-gray-500">Morgan Alvarez � 2d</div>
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="dropdown-list-image mr-3">
                                                                        <img
                                                                            class="rounded-circle"
                                                                            src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                                                            alt="..."
                                                                            />
                                                                        <div class="status-indicator bg-success"></div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="text-truncate">
                                                                            Am I a good boy? The reason I ask is because someone
                                                                            told me that people say this to all dogs, even if they
                                                                            aren't good...
                                                                        </div>
                                                                        <div class="small text-gray-500">
                                                                            Chicken the Dog � 2w
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <a
                                                                    class="dropdown-item text-center small text-gray-500"
                                                                    href="#"
                                                                    >Read More Messages</a
                                                                >
                                                            </div>
                                                        </li>-->

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
                        <div
                            class="d-sm-flex align-items-center justify-content-between mb-4"
                            >
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

                        </div>

                        <!-- Content Row -->
                        <div class="row">
                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div
                                                    class="text-xs font-weight-bold text-primary text-uppercase mb-1"
                                                    >
                                                    Earnings (Monthly)
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    ${revenueThisMonth}
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div
                                                    class="text-xs font-weight-bold text-success text-uppercase mb-1"
                                                    >
                                                    Earnings (Year)
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    ${revenueThisYear}
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div
                                                    class="text-xs font-weight-bold text-info text-uppercase mb-1"
                                                    >
                                                    Seat booked
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div
                                                            class="h5 mb-0 mr-3 font-weight-bold text-gray-800"
                                                            >
                                                            ${seatCalculate}%
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="progress progress-sm mr-2">
                                                            <div
                                                                class="progress-bar bg-info"
                                                                role="progressbar"
                                                                style="width: ${seatCalculate}%"
                                                                aria-valuenow="${seatCalculate}"
                                                                aria-valuemin="0"
                                                                aria-valuemax="100"
                                                                ></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i
                                                    class="fas fa-clipboard-list fa-2x text-gray-300"
                                                    ></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div
                                                    class="text-xs font-weight-bold text-warning text-uppercase mb-1"
                                                    >
                                                    Customer joined
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    ${customerJoined}
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->

                        <div class="row">
                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                        >
                                        <h6 class="m-0 font-weight-bold text-primary">
                                            Earnings Overview
                                        </h6>
                                        <div class="dropdown no-arrow">
                                            <a
                                                class="dropdown-toggle"
                                                href="#"
                                                role="button"
                                                id="dropdownMenuLink"
                                                data-toggle="dropdown"
                                                aria-haspopup="true"
                                                aria-expanded="false"
                                                >
                                                <i
                                                    class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"
                                                    ></i>
                                            </a>
                                            <div
                                                class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                aria-labelledby="dropdownMenuLink"
                                                >
                                                <div class="dropdown-header">Dropdown Header:</div>
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#"
                                                   >Something else here</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="myAreaChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pie Chart -->
                            <div class="col-xl-4 col-lg-5">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                        >
                                        <h6 class="m-0 font-weight-bold text-primary">
                                            Account Overview
                                        </h6>
                                        <div class="dropdown no-arrow">
                                            <a
                                                class="dropdown-toggle"
                                                href="#"
                                                role="button"
                                                id="dropdownMenuLink"
                                                data-toggle="dropdown"
                                                aria-haspopup="true"
                                                aria-expanded="false"
                                                >
                                                <i
                                                    class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"
                                                    ></i>
                                            </a>
                                            <div
                                                class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                aria-labelledby="dropdownMenuLink"
                                                >
                                                <div class="dropdown-header">Dropdown Header:</div>
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#"
                                                   >Something else here</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-pie pt-4 pb-2">
                                            <canvas id="myPieChart"></canvas>
                                        </div>
                                        <div class="mt-4 text-center small">
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-primary"></i> Customer
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-success"></i> Employee
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-info"></i> Admin
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->
                        <div class="row">
                            <!-- Content Column -->
                            <div class="col-lg-6 mb-4">
                                <!-- Project Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary"></h6>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="small font-weight-bold">
                                            ${tripDetailId0}<span class="float-right">${seaCalculateTripDetail0}%</span>
                                        </h4>
                                        <div class="progress mb-4">
                                            <div
                                                class="progress-bar bg-danger"
                                                role="progressbar"
                                                style="width: ${seaCalculateTripDetail0}%"
                                                aria-valuenow="${seaCalculateTripDetail0}"
                                                aria-valuemin="0"
                                                aria-valuemax="100"
                                                ></div>
                                        </div>
                                        <h4 class="small font-weight-bold">
                                            ${tripDetailId1} <span class="float-right">${seaCalculateTripDetail1}%</span>
                                        </h4>
                                        <div class="progress mb-4">
                                            <div
                                                class="progress-bar bg-warning"
                                                role="progressbar"
                                                style="width: ${seaCalculateTripDetail1}%"
                                                aria-valuenow="${seaCalculateTripDetail1}"
                                                aria-valuemin="0"
                                                aria-valuemax="100"
                                                ></div>
                                        </div>
                                        <h4 class="small font-weight-bold">
                                            ${tripDetailId2} <span class="float-right">${seaCalculateTripDetail2}%</span>
                                        </h4>
                                        <div class="progress mb-4">
                                            <div
                                                class="progress-bar"
                                                role="progressbar"
                                                style="width: ${seaCalculateTripDetail2}%"
                                                aria-valuenow="${seaCalculateTripDetail2}"
                                                aria-valuemin="0"
                                                aria-valuemax="100"
                                                ></div>
                                        </div>
                                        <h4 class="small font-weight-bold">
                                            ${tripDetailId3} <span class="float-right">${seaCalculateTripDetail3}%</span>
                                        </h4>
                                        <div class="progress mb-4">
                                            <div
                                                class="progress-bar bg-info"
                                                role="progressbar"
                                                style="width: ${seaCalculateTripDetail3}%"
                                                aria-valuenow="${seaCalculateTripDetail3}"
                                                aria-valuemin="0"
                                                aria-valuemax="100"
                                                ></div>
                                        </div>
                                        <h4 class="small font-weight-bold">
                                            ${tripDetailId4} <span class="float-right">${seaCalculateTripDetail4}%</span>
                                        </h4>
                                        <div class="progress">
                                            <div
                                                class="progress-bar bg-success"
                                                role="progressbar"
                                                style="width: ${seaCalculateTripDetail4}%"
                                                aria-valuenow="${seaCalculateTripDetail4}"
                                                aria-valuemin="0"
                                                aria-valuemax="100"
                                                ></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Color System -->

                            </div>

                            <div class="col-lg-6 mb-4">
                                <!-- Illustrations -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">
                                            More trips
                                        </h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="text-center">
                                            <img
                                                class="img-fluid px-3 px-sm-4 mt-3 mb-4"
                                                style="width: 25rem"
                                                src="img/undraw_posting_photo.svg"
                                                alt="..."
                                                />
                                        </div>
                                        <p>
                                            Add some quality, svg illustrations to your project
                                            courtesy of
                                            <a
                                                target="_blank"
                                                rel="nofollow"
                                                href="https://undraw.co/"
                                                >unDraw</a
                                            >, a constantly updated collection of beautiful svg images
                                            that you can use completely free and without attribution!
                                        </p>
                                        <a target="_blank" rel="nofollow" href="https://undraw.co/"
                                           >Add more trips &rarr;</a
                                        >
                                    </div>
                                </div>

                                <!-- Approach -->

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
                            <span aria-hidden="true">�</span>
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
        <script src="assets/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        s
        <script src="assets/js/demo/chart-bar-demo.js"></script>
        <!--Area Chart-->
        <script type="text/javascript">
            var ctx = document.getElementById("myAreaChart");
            var myLineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [{
                            label: "Earnings",
                            lineTension: 0.3,
                            backgroundColor: "rgba(78, 115, 223, 0.05)",
                            borderColor: "rgba(78, 115, 223, 1)",
                            pointRadius: 3,
                            pointBackgroundColor: "rgba(78, 115, 223, 1)",
                            pointBorderColor: "rgba(78, 115, 223, 1)",
                            pointHoverRadius: 3,
                            pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                            pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                            pointHitRadius: 10,
                            pointBorderWidth: 2,
                            data: [
            <c:forEach var="revenueMonth" items="${revenueMap}">
                ${revenueMonth.value},
            </c:forEach>
                            ],
                        }],
                },
                options: {
                    maintainAspectRatio: false,
                    layout: {
                        padding: {
                            left: 10,
                            right: 25,
                            top: 25,
                            bottom: 0
                        }
                    },
                    scales: {
                        xAxes: [{
                                time: {
                                    unit: 'date'
                                },
                                gridLines: {
                                    display: false,
                                    drawBorder: false
                                },
                                ticks: {
                                    maxTicksLimit: 7
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    maxTicksLimit: 5,
                                    padding: 10,
                                    // Include a dollar sign in the ticks
                                    callback: function (value, index, values) {
                                        return '' + number_format(value);
                                    }
                                },
                                gridLines: {
                                    color: "rgb(234, 236, 244)",
                                    zeroLineColor: "rgb(234, 236, 244)",
                                    drawBorder: false,
                                    borderDash: [2],
                                    zeroLineBorderDash: [2]
                                }
                            }],
                    },
                    legend: {
                        display: false
                    },
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        titleMarginBottom: 10,
                        titleFontColor: '#6e707e',
                        titleFontSize: 14,
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        intersect: false,
                        mode: 'index',
                        caretPadding: 10,
                        callbacks: {
                            label: function (tooltipItem, chart) {
                                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
                            }
                        }
                    }
                }
            });

        </script>
        <!--Pie Chart-->
        <script type="text/javascript">
            // Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#858796';

            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ["Customer", "Employee", "Admin"],
                    datasets: [{
                            data: [${customerJoined}, ${employeeJoined}, ${adminJoined}],
                            backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
                            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
                            hoverBorderColor: "rgba(234, 236, 244, 1)",
                        }],
                },
                options: {
                    maintainAspectRatio: false,
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10,
                    },
                    legend: {
                        display: false
                    },
                    cutoutPercentage: 80,
                },
            });
        </script>
    </body>
</html>