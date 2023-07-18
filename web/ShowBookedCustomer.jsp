<%-- 
    Document   : ShowBookedCustomer
    Created on : Jun 20, 2023, 12:19:33 AM
    Author     : letra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/search-trip-style.css" type="text/css" />

        <link rel="stylesheet" href="assets/css/show-booked-customer-style.css"/>

        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="loader"></div>

        <%@include file="includes/navbar.jsp" %>

        <div class="background">
            <div class="">
                <div class="content text-center">
                    <h2 class="content-title">${startingPoint} - ${destination}</h2>
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

                            <p style="font-size: 20px !important;" class="route-orign"><i class="fa-solid fa-location-dot font-orign"></i>&nbsp;&nbsp; ${startingPoint} Bus Station</p>
                            <p style="font-size: 20px !important; "class="route-detail">Bus line: ${sessionScope.tripDetail.trip.during} hours</p>
                            <p style="font-size: 20px !important; "class="route-destinations"><i class="fa-solid fa-location-dot font-destinations"></i>&nbsp;&nbsp; ${destination} Bus Station</p>
                        </div>

                        <hr>
                        <div class="fto-section ">
                            <div class="">
                                <div class="search__container">
                                    <p class="search__title">
                                        List Booked Customers
                                    </p>
                                    <input id="searchCustomer" class="search__input" type="text" placeholder="Search (Phone)"  >
                                </div>

                                <div class="credits__container">
                                    <p class="credits__text">  <a href="#" class="credits__link"> ${startingPoint}</a> - <a href="#" class="credits__link"> ${destination}</a></p>
                                </div>
                                <c:if test="${listBookingDetailDTO == null}">

                                    <div class="page_404">
                                        <div class="container">
                                            <div class="row">	
                                                <div class="col-sm-12 ">
                                                    <div class="col-sm-10 col-sm-offset-1  text-center">
                                                        <div class="four_zero_four_bg">
                                                            <h4 class="text-center ">Look like Customers haven't booked any bus yet !!</h4>

                                                        </div>

                                                        <div class="contant_box_404">
                                                            <h3 class="h2">
                                                                Choose another Ticket !
                                                            </h3>


                                                            <a href="index.jsp" class="link_404">Go to Home</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${listBookingDetailDTO != null}">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div class="table-wrap">
                                                <table class="table text-center table-responsive-xl">
                                                    <thead >
                                                        <tr>
                                                            <!--                                        <th>  
                                                                                                        <label class="checkbox-wrap checkbox-primary">
                                                                                                            <input id="select-all-seat" type="checkbox"  />
                                                                                                            <span class="checkmark"></span>
                                                                                                        </label>
                                                                                                    </th>-->
                                                            <th>User</th>
                                                            <th><div style="width: 100px !important">Name</div></th>
                                                            <th>Phone</th>
                                                            <th>Seat name</th>
                                                            <th><div style="width: 100px !important">Booked date</div></th>
                                                            <th>Booked Time</th>
                                                            <th>Price</th>
                                                            <th><div style="width: 110px !important">Status</div></th>
                                                            <th><div style="width: 190px !important">Action</div></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="searchCustomerTable">
                                                        <c:forEach items="${listBookingDetailDTO}" var="bookingDetailDTO">

                                                            <tr class="alert" role="alert">

                                                                <c:if test="${bookingDetailDTO.booking.bookingStatus == 'paid'}">
                                                                    <!--<td> &nbsp;  </td>-->
                                                                </c:if>
                                                                <c:if test="${bookingDetailDTO.booking.bookingStatus == 'order'}">
                                                                    <!--                                                <td>
                                                                                                                        <label class="checkbox-wrap checkbox-primary">
                                                                                                                            <input class="checkbox" type="checkbox" name="bookingId" value="${bookingDetailDTO.booking.bookingId}" />
                                                                                                                            <span class="checkmark"></span>
                                                                                                                        </label>
                                                                                                                    </td>-->
                                                                </c:if>

                                                                <td class="d-flex align-items-center">
                                                                    <div
                                                                        class="img"
                                                                        style="background-image: url('${bookingDetailDTO.booking.customer.customerUrlImg}') !important;"
                                                                        ></div>
                                                                    <div class="pl-3 email">
                                                                        <span style="font-size: 18px !important">${bookingDetailDTO.booking.customer.customerEmail}</span>
                                                                        <span style="font-size: 18px !important">Created date: ${bookingDetailDTO.booking.customer.customerCreatedDate} </span>
                                                                    </div>
                                                                </td>
                                                                <td>${bookingDetailDTO.booking.customer.customerFirstname} ${bookingDetailDTO.booking.customer.customerLastname}</td>
                                                                <td>${bookingDetailDTO.booking.customer.customerPhone}</td>
                                                                <td>${bookingDetailDTO.booking.tripSeatDetail.seat.seatName}</td>
                                                                <td>${bookingDetailDTO.booking.bookedDate}</td>
                                                                <td>${bookingDetailDTO.booking.bookedTime}</td>
                                                                <td>${bookingDetailDTO.booking.tripSeatDetail.tripDetail.ticketPrice}</td>
                                                                <c:if test="${bookingDetailDTO.booking.bookingStatus == 'paid'}">
                                                                    <td class="status"><span class="active">${bookingDetailDTO.booking.bookingStatus}</span></td>
                                                                    </c:if>
                                                                    <c:if test="${bookingDetailDTO.booking.bookingStatus == 'order'}">
                                                                    <td class="status">
                                                                        <span  class="waiting">${bookingDetailDTO.booking.bookingStatus}</span>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${bookingDetailDTO.booking.bookingStatus == 'order'}">
                                                                    <td>
                                                                        <div class="btn-group w-100" role="group" aria-label="Basic mixed styles example">
                                                                            <button type="button" class="w-50 btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#ConfirmModal${bookingDetailDTO.booking.bookingId}">Confirm</button>
                                                                            <button type="button" class="w-50 btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#CancelModal${bookingDetailDTO.booking.bookingId}">Cancel</button>
                                                                        </div>
                                                                        <div class="modal fade" id="CancelModal${bookingDetailDTO.booking.bookingId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Cancel ticket</h1>
                                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        Customer phone: ${bookingDetailDTO.booking.customer.customerPhone} <br>
                                                                                        Customer name: ${bookingDetailDTO.booking.customer.customerFirstname} ${bookingDetailDTO.booking.customer.customerLastname} <br>
                                                                                        Price: ${bookingDetailDTO.booking.tripSeatDetail.tripDetail.ticketPrice} <br>
                                                                                        Seat name: ${bookingDetailDTO.booking.tripSeatDetail.seat.seatName} <br>
                                                                                        Are you sure to Cancel Ticket ?
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                        <button style="margin-left: 15px;" onclick="window.location = 'ShowBookedCustomerCancelServlet?bookingId=${bookingDetailDTO.booking.bookingId}&tripDetailId=${bookingDetailDTO.tripDetailId}'" type="button" class="btn btn-danger">Agree</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal fade" id="ConfirmModal${bookingDetailDTO.booking.bookingId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Cancel ticket</h1>
                                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        Customer phone: ${bookingDetailDTO.booking.customer.customerPhone} <br>
                                                                                        Customer name: ${bookingDetailDTO.booking.customer.customerFirstname} ${bookingDetailDTO.booking.customer.customerLastname} <br>
                                                                                        Price: ${bookingDetailDTO.booking.tripSeatDetail.tripDetail.ticketPrice} <br>
                                                                                        Seat name: ${bookingDetailDTO.booking.tripSeatDetail.seat.seatName} <br>
                                                                                        Are you sure to Confirm Ticket ?
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                        <button style="margin-left: 15px;" onclick="window.location = 'ShowBookedCustomerConfirmServlet?bookingId=${bookingDetailDTO.booking.bookingId}&tripDetailId=${bookingDetailDTO.tripDetailId}'" type="button" class="btn btn-success">Agree</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${bookingDetailDTO.booking.bookingStatus == 'paid'}">
                                                                    <td>
                                                                        <button type="button" class="w-100 btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#CancelModal${bookingDetailDTO.booking.bookingId}">cancel</button>
                                                                        <div class="modal fade" id="CancelModal${bookingDetailDTO.booking.bookingId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Cancel ticket</h1>
                                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        Customer phone: ${bookingDetailDTO.booking.customer.customerPhone} <br>
                                                                                        Customer name: ${bookingDetailDTO.booking.customer.customerFirstname} ${bookingDetailDTO.booking.customer.customerLastname} <br>
                                                                                        Price: ${bookingDetailDTO.booking.tripSeatDetail.tripDetail.ticketPrice} <br>
                                                                                        Seat name: ${bookingDetailDTO.booking.tripSeatDetail.seat.seatName} <br>
                                                                                        Are you sure to Cancel Ticket ?
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                        <button style="margin-left: 15px;" onclick="window.location = 'ShowBookedCustomerCancelServlet?bookingId=${bookingDetailDTO.booking.bookingId}&tripDetailId=${bookingDetailDTO.tripDetailId}'" type="button" class="btn btn-danger">Agree</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>

                            <div id="pagination" style="margin-top: 40px" class="d-flex justify-content-center">
                                <div style="color: red;" class="text-center" id="not-found-customer"></div>

                                <c:if test="${listBookingDetailDTO != null}">

                                    <c:set var="page" value="${sessionScope.page}"/>
                                    <nav aria-label="" style="margin-top: 15px;">
                                        <ul class="pagination justify-content-center">
                                            <!--Previous Page-->
                                            <c:if test="${page != 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="ShowBookedCustomer?page=${page-1}&tripDetailId=${tripDetailId}">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page == 1}">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="ShowBookedCustomer?page=${page-1}&tripDetailId=${tripDetailId}">Previous</a>
                                                </li>
                                            </c:if>

                                            <c:forEach var="i" begin="1" end="${endPage}">
                                                <c:if test="${page == i}">
                                                    <li class="page-item active">
                                                        <a class="page-link" href="ShowBookedCustomer?page=${i}&tripDetailId=${tripDetailId}">${i}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${page != i}">
                                                    <li class="page-item ">
                                                        <a class="page-link" href="ShowBookedCustomer?page=${i}&tripDetailId=${tripDetailId}">${i}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <!--Next Page-->
                                            <c:if test="${endPage != page}">
                                                <li class="page-item">
                                                    <a class="page-link" href="ShowBookedCustomer?page=${page+1}&tripDetailId=${tripDetailId}">&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${endPage == page}">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="ShowBookedCustomer?page=${page+1}&tripDetailId=${tripDetailId}">&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;</a>
                                                </li>
                                            </c:if>
                                            <!-- -->
                                        </ul>
                                    </nav>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-grid gap-2 col-8 mx-auto pb-4">
                    <button onclick="history.back()" class="btn btn-outline-secondary btn-back " type="button">Back&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-backward"></i></button>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            let checkboxesList = document.querySelectorAll('.checkbox');
            let countCustomer = 0;
            document.getElementById('select-all-seat').onclick = function () {
                countCustomer = 0;
                for (let checkbox of checkboxesList) {
                    checkbox.checked = this.checked;
                    if (checkbox.checked === true) {
                        countCustomer++;
                    } else {
                        countCustomer = 0;
                    }
                }
            }
            ;
            for (let i = 0; i < checkboxesList.length; i++) {
                checkboxesList[i].addEventListener('click', function () {
                    if (this.checked === true) {
                        countCustomer++;
                    } else {
                        countCustomer--;
                    }
                });
            }
        </script>
        <script type="text/javascript">
            document.getElementById("searchCustomer").addEventListener('input', function () {
                var phoneSearch = document.getElementById("searchCustomer").value;
                $.ajax({
                    url: 'ShowBookedCustomerAjax',
                    type: 'POST',
                    data: {
                        phoneCustomer: phoneSearch,
                        tripDetailId: '${tripDetailId}'
                    },
                    success: function (data) {
                        var row = document.getElementById('searchCustomerTable');
                        row.innerHTML = data;
//                        var pagination = <%=request.getAttribute("paginationNull")%>
//                        var paginationOld = document.getElementById("pagination").innerHTML;
//                        
//                        if (pagination === null) {
//                            document.getElementById("pagination").innerHTML = paginationOld;
//                        } else {
//                            document.getElementById("pagination").innerHTML = "";
//                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }
                }
                );
            }
            );
            //            function searchCustomer(param) {
            //                var phoneSearch = param.value;
            //                $.ajax({
            //                    url: 'ShowBookedCustomerAjax',
            //                    type: 'POST',
            //                    data: {
            //                        phoneCustomer: phoneSearch,
            //                        tripDetailId: '${tripDetailId}'
            //                    },
            //                    success: function (data) {
            //                        var row = document.getElementById('searchCustomerTable');
            //                        row.innerHTML = data;
            //                    },
            //                    error: function (jqXHR, textStatus, errorThrown) {
            //
            //                    }
            //                }
            //                );
            //            }

        </script>


        <c:if test="${listBookingDetailDTO == null}">
            <style>
                .background{
                    background-color: #fff !important;
                }

                .page_404{
                    margin-left:10%;
                    padding:40px 0;
                    background: none;
                    font-family: 'Arvo', serif;
                }

                .page_404  img{
                    width:100%;
                }

                .four_zero_four_bg{

                    background-image: url(https://cdn.dribbble.com/users/591030/screenshots/1860170/media/8e0ab2ec751ad0dea8965b11c0e811dd.gif);
                    height: 400px;
                    background-position: center;

                }


                .four_zero_four_bg h1{
                    font-size:80px;
                }

                .four_zero_four_bg h3{
                    font-size:80px;
                }

                .link_404{
                    color: #fff!important;
                    padding: 10px 20px;
                    background: #f03c00;
                    margin: 20px 0;
                    display: inline-block;
                }
                .link_404:hover {
                    background: green;
                }
                .contant_box_404{
                    margin-top:-50px;
                }

                .fto-section{
                    background-color: white  !important;
                }
            </style>
        </c:if>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
