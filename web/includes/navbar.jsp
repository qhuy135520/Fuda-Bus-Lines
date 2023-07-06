<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header  class="header" id="top">
    <div style="z-index: 99 !important" class="w3-top">
        <nav  class="navbar navbar-expand-xl navbar-light bg-light">
            <div class="container-fluid">
                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarTogglerDemo01"
                    aria-controls="navbarTogglerDemo01"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <ul
                        class="navbar-nav mx-auto mb-2 mb-lg-0  "
                        >

                        <a class="navbar-brand" href="index.jsp"
                           ><img  src="img/logo-img.png"
                               /></a>

                        <li class="nav-item">
                            <a
                                class="nav-link active "
                                aria-current="page"
                                href="#"
                                >Plane ticket</a
                            >
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"
                               >Car rental</a
                            >
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"
                               >Order management</a
                            >
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                >
                                Become a partner
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <a class="dropdown-item" href="#"
                                       >Open for sale at FUDA</a
                                    >
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">Garage software</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">Agent software</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"
                               ><img
                                    width="40px"
                                    height="30px"
                                    src="https://seeklogo.com/images/U/united-kingdom-flag-logo-1088704B5E-seeklogo.com.png"
                                    /></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"
                               ><img
                                    width="47px"
                                    height="32px"
                                    src="https://seeklogo.com/images/V/viet-nam-logo-3D78D597F9-seeklogo.com.png"
                                    /></a>
                        </li>
                        <li class="nav-item btn-login">
                            <button type="button" class="btn btn-hotline  btn-lg btn-primary" >
                                <i class="fa-solid fa-phone"></i> Hotline
                            </button>
                        </li>
                        <c:if test="${sessionScope.customer == null and sessionScope.employee == null}">
                            <li class="nav-item">
                                <a
                                    class="nav-link active"
                                    aria-current="page"
                                    href="login.jsp"
                                    >
                                    <button
                                        type="button"
                                        class="btn btn-secondary btn-lg active"
                                        disabled
                                        >
                                        <i class="fa-solid fa-right-to-bracket"></i> Login
                                    </button>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.customer != null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-solid fa-user user-edit"></i>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class=" dropdown-item" href="#"> ${sessionScope.customer.customerFirstname} ${sessionScope.customer.customerLastname}</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="TicketPurchaseListServlet"><i class="fa-solid fa-clock-rotate-left"></i> &nbsp;Ticket purchase list</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="HistoryPurchaseListServlet"><i class="fa-solid fa-clock-rotate-left"></i> &nbsp;History purchase</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="EditProfile.jsp"> <i class="fa-solid fa-pen-to-square"></i> &nbsp; Edit profile</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="SignOutServlet"><i class="fa-solid fa-right-from-bracket"></i> &nbsp;Logout</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.employee != null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-solid fa-user user-edit"></i>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class=" dropdown-item" href="#">Employee</a></li>
                                    <li><hr class="dropdown-divider"></li>

                                    <li><a class="dropdown-item" href="ListRefundingServlet"> <i class="fa-solid fa-pen-to-square"></i> &nbsp; List refunding</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="SignOutServlet"><i class="fa-solid fa-right-from-bracket"></i> &nbsp;Logout</a></li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>