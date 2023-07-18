<%-- 
    Document   : CustomerBookingConfirm
    Created on : Jun 22, 2023, 1:25:38 PM
    Author     : letra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/search-trip-style.css" type="text/css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link rel="stylesheet" href="assets/css/customer-booking-confirm-style.css"/>
    </head>
    <body>
        <div class="loader"></div>

        <%@include file="includes/navbar.jsp" %>
        <div class="background">
            <div class="">
                <div class="content text-center">
                    <h2 class="content-title">${orignStation.stationName} - ${destinationStation.stationName}</h2>
                    <div class="content-departure"><i class="fa-solid fa-location-dot font-destinations"></i>&nbsp;&nbsp;${sessionScope.tripDetail.departureTime} ${date}  </div>
                </div>
                <div class="route-option-36seats">

                    <div class="card ">
                        <div class="card-header d-flex justify-content-between">
                            <div>
                                <h4 style="color: #f15a24;"> Booking for Customer</h4>
                            </div>
                            <div>
                                <i class="fa-brands fa-usb"></i> &nbsp;
                                <i class="fa-solid fa-ticket"></i> &nbsp;
                                <i class="fa-solid fa-wifi"></i>
                            </div>
                        </div>
                        <div class="card-body">

                            <p class="route-orign"><i class="fa-solid fa-location-dot font-orign"></i>&nbsp;&nbsp; ${orignStation.stationName} Bus Station</p>
                            <p class="route-detail">Bus line: ${sessionScope.tripDetail.trip.during} hours</p>
                            <p class="route-destinations"><i class="fa-solid fa-location-dot font-destinations"></i>&nbsp;&nbsp; ${destinationStation.stationName} Bus Station</p>
                        </div>

                        <hr>
                        <div class="d-flex justify-content-between seats-detailed">
                            <div class="select-seats">
                                <span class="select-seats">Selected seat: </span><br>
                                <span class="select-seats-detail">
                                    <c:forEach items="${sessionScope.list36Seats}" var="seat">
                                        ${seat}, 
                                    </c:forEach>
                                    <c:forEach items="${sessionScope.list24Seats}" var="seat">
                                        ${seat}, 
                                    </c:forEach>
                                </span>
                            </div>
                            <div class="ticket-seats-detail">
                                <span>Ticket count(s):<c:if test="${sessionScope.list36Seats !=null}"> ${fn:length(sessionScope.list36Seats)}</c:if><c:if test="${sessionScope.list24Seats !=null}"> ${fn:length(sessionScope.list24Seats)}</c:if></span><br>
                                <span>Total price: ${price} <i class="fa-solid fa-dong-sign"></i></span>
                            </div>
                        </div>
                        <hr>
                        <div class="">
                            <div class="search__container">
                                <p class="search__title">
                                    Search Customer
                                </p>
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="searchCustomer" class="search__input" type="text" placeholder="Search (Phone)"  >
                                    </div>
                                    <div class="col-md-4">
                                        <button class="button-56" role="button"  data-bs-toggle="modal" data-bs-target="#exampleModal">Sign Up For Customer</button>
                                    </div>
                                </div>
                            </div>

                            <div class="credits__container">
                                <p class="credits__text">  <a href="#" class="credits__link"> ${orignStation.stationName}</a> - <a href="#" class="credits__link"> ${destinationStation.stationName}</a></p>
                            </div>
                            <div class="table-responsive">
                                <div class="table-wrapper">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <h2>Customer <b>Chosen</b></h2>
                                            </div>
                                            <div class="col-sm-7">

                                            </div>
                                        </div>
                                    </div>
                                    <table class="table table-striped table-hover ">
                                        <thead class="">
                                            <tr class="">
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Date Created</th>
                                                <th>Date of birth</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="searchCustomerTable">
                                            <c:set var="i" value="1"/>
                                            <c:forEach items="${listCustomer}" var="customer">
                                                <tr>
                                                    <td>${i}</td>
                                                    <td><a href="#"><img src="${customer.customerUrlImg}" class="avatar" alt="Avatar"> ${customer.customerFirstname} ${customer.customerLastname}</a></td>
                                                    <td>${customer.customerPhone}</td>                        
                                                    <td>${customer.customerEmail}</td>
                                                    <td>${customer.customerCreatedDate}</td>
                                                    <td>${customer.customerBirthdate}</td>
                                                    <td><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Customer${customer.customerPhone}">Choose</button></td>
                                                </tr>

                                                <c:set var="i" value="${i+1}"/>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                    <c:set var="page" value="${sessionScope.page}"/>
                                    <div class="clearfix">
                                        <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                        <ul class="pagination">
                                            <c:if test="${page == 1}">
                                                <li class="page-item disabled">
                                                    <a href="CustomerBookingConfirmServlet?page=${page-1}" class="page-link">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page != 1}">
                                                <li class="page-item">
                                                    <a href="CustomerBookingConfirmServlet?page=${page-1}" class="page-link">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:forEach var="a" begin="1" end="${endPage}">
                                                <c:if test="${page == a}">
                                                    <li class="page-item active">
                                                        <a href="CustomerBookingConfirmServlet?page=${a}" class="page-link">${a}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${page != a}">
                                                    <li class="page-item">
                                                        <a href="CustomerBookingConfirmServlet?page=${a}" class="page-link">${a}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${endPage != page}">
                                                <li class="page-item">
                                                    <a href="CustomerBookingConfirmServlet?page=${page+1}" class="page-link">Next</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${endPage == page}">
                                                <li class="page-item disabled">
                                                    <a href="CustomerBookingConfirmServlet?page=${page+1}" class="page-link">Next</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-grid gap-2 col-8 mx-auto pb-4">
                    <button onclick="history.back()" class="btn btn-outline-secondary btn-back " type="button">Back&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-backward"></i></button>
                </div>
            </div>
        </div>
        <!--Modal Confirm-->
        <c:forEach items="${listCustomerFull}" var="customer">
            <div class="modal fade text-center" id="Customer${customer.customerPhone}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 style="color:#f13c00" class="modal-title fs-5" id="staticBackdropLabel">Confirm Book Ticket For Customer</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure to book ticket for This Customer "${customer.customerFirstname} ${customer.customerLastname}" ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="window.location = 'BookingForCustomerServlet?customerPhone=${customer.customerPhone}'">Confirm</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!--Modal Sign up-->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div style="padding: 0" class="modal-body">
                        <div class="wrapper" >
                            <div class="row">
                                <div class="col-md-6 background-register-booking"></div>
                                <div class="col-md-6">
                                    <div class="inner">
                                        <form action="RegisterForCustomerServlet" method="POST">
                                            <h3 style="margin-bottom: 10px">Sign Up For Customer</h3>
                                            <h4 class="text-center" style="color: red; margin: 13px 0;">${errorPhone}</h4>
                                            <h4 class="text-center" style="color: red; margin: 13px 0;">${errorEmail}</h4>
                                            <div class="form-group">
                                                <div class="form-wrapper">
                                                    <label for="">First Name</label>
                                                    <input type="text" name="firstname" class="form-control">
                                                </div>
                                                <div class="form-wrapper">
                                                    <label for="">Last Name</label>
                                                    <input type="text" name="lastname" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-wrapper">
                                                <label for="">Phone</label>
                                                <input type="text" name="phone" class="form-control">
                                            </div>
                                            <div class="form-wrapper">
                                                <label for="">Email</label>
                                                <input type="email" name="email" class="form-control">
                                            </div>

                                            <div class="form-wrapper">
                                                <label for="">Birthdate</label>
                                                <input type="date" name="birthdate" class="form-control">
                                            </div>

                                            <button type="submit">Register Now</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script type="text/javascript">
            document.getElementById("searchCustomer").addEventListener('input', function () {
                var phoneSearch = document.getElementById("searchCustomer").value;
                $.ajax({
                    url: 'CustomerBookingConfirmAjax',
                    type: 'POST',
                    data: {
                        phoneCustomer: phoneSearch
                    },
                    success: function (data) {
                        var row = document.getElementById('searchCustomerTable');
                        row.innerHTML = data;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }
                }
                );
            }
            );


        </script>
        <c:if test="${errorPhone != null or errorEmail != null}">
            <script type="text/javascript">
                $(window).on('load', function () {
                    $('#exampleModal').modal('show');
                });
            </script>
        </c:if>
        <script src="assets/js/index.js"></script>

        <%@include file="includes/footer.jsp" %>
        <style>


        </style>
    </body>
</html>
