<%-- 
    Document   : index
    Created on : May 23, 2023, 8:49:36 PM
    Author     : letra
--%>

<%@page import="dal.StationDAO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/ticket-purchase-list.css"/>

        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="loader"></div>

        <%@include file="/includes/navbar.jsp" %> 
        <style>
            .card{
                box-shadow: none;
                padding: 0;
                margin: 0;
                transform: none !important;
                width: 100%;
                border-radius: 0% !important;
            }
            .payment-title{
                font-size: 	1.3rem;
                margin: 20px 0;
            }
            @import url("https://fonts.googleapis.com/css2?family=Poppins:weight@100;200;300;400;500;600;700;800&display=swap");


            body{
                font-family: "Poppins", sans-serif;
                font-weight: 300;
            }


            .card{

                border: none;
            }

            .card-header {
                padding: .5rem 1rem;
                margin-bottom: 0;
                background-color: rgba(0,0,0,.03);
                border-bottom: none;
            }

            .btn-light:focus {
                color: #212529;
                background-color: #e2e6ea;
                border-color: #dae0e5;
                box-shadow: 0 0 0 0.2rem rgba(216,217,219,.5);
            }

            .form-control{

                height: 50px;
                border: 2px solid #eee;
                border-radius: 6px;
                font-size: 14px;
            }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #039be5;
                outline: 0;
                box-shadow: none;

            }

            .input{

                position: relative;
            }

            .input i{

                position: absolute;
                top: 16px;
                left: 11px;
                color: #989898;
            }

            .input input{

                text-indent: 25px;
            }

            .card-text{

                font-size: 13px;
                margin-left: 6px;
            }

            .certificate-text{

                font-size: 12px;
            }


            .billing{
                font-size: 11px;
            }

            .super-price{

                top: 0px;
                font-size: 22px;
            }

            .super-month{

                font-size: 11px;
            }


            .line{
                color: #bfbdbd;
            }

            .free-button{

                background: #1565c0;
                height: 52px;
                font-size: 15px;
                border-radius: 8px;
            }


            .payment-card-body{

                flex: 1 1 auto;
                padding: 24px 1rem !important;

            }

            .primary-navigation.primary-navigation {
                display: block;
                font-size: 16px;
                padding-top: 20px !important;
                padding-bottom: 0 !important;
            }
            .primary-navigation ul li {
                list-style: none;
                border-left: 2px solid #3ca0e7;
                display: inline-block;
                padding: 0 30px;
                position: relative;
                text-decoration: none;
                text-align: center;
                font-family: arvo;
            }
            .primary-navigation.primary-navigation li a {
                color: black;
            }
            .primary-navigation.primary-navigation li a:hover {
                color: #3ca0e7;
            }
            .primary-navigation.primary-navigation li:hover {
                cursor: pointer;
            }
            .primary-navigation.primary-navigation ul li ul {
                visibility: hidden;
                opacity: 0;
                position: absolute;
                padding-left: 0;
                left: 0;
                display: none;
                background: white;
            }
            .primary-navigation.primary-navigation ul li:hover > ul, .primary-navigation.primary-navigation ul li ul:hover {
                visibility: visible;
                opacity: 1;
                display: block;
                min-width: 200px;
                text-align: left;
                padding-top: 20px;
                box-shadow: 0px 3px 5px -1px #ccc;
            }
            .primary-navigation.primary-navigation ul li ul li {
                clear: both;
                width: 100%;
                text-align: left;
                margin-bottom: 20px;
                border-style: none;
            }
            .primary-navigation.primary-navigation ul li ul li a:hover {
                padding-left: 10px;
                border-left: 2px solid #3ca0e7;
                transition: all 0.3s ease;
            }
            a {
                text-decoration: none;
            }
            a:hover {
                color: #3ca0e7;
            }
            ul li ul li a {
                transition: all 0.5s ease;
            }

        </style>
        <div class="container">



            <div class="table-users">
                <div class="header d-flex justify-content-between">
                    <div></div>
                    <div style="padding-top: 15px">
                        Ticket Purchase List
                    </div>
                    <div role="navigation" class="primary-navigation">
                        <ul>
                            <li><a href="#" style="color: white; ">Sort by &dtrif;</a>
                                <ul class="dropdown">
                                    <li><a href="HistoryPurchaseListServlet?sort=1">Status</a></li>
                                    <li><a href="HistoryPurchaseListServlet?sort=2">Booking date</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
                <c:if test="${bookingDetailDTOList !=null}">

                    <table cellspacing="0">
                        <tr class="text-center" >
                            <th>Trip Detail ID</th>
                            <th>Seat Name</th>
                            <th>Bus Code</th>
                            <th>Starting Point</th>
                            <th>Destination</th>
                            <th>Departure Time</th>
                            <th>Departure Date</th>
                            <th>Price</th>
                            <th>Booking Date</th>
                            <th>Booking Status</th>
                            <th>Action</th>
                        </tr>
                        <c:set var="countTr" value="1"/>
                        <c:forEach items="${bookingDetailDTOList}" var="bookingDetailDTO">
                            <c:set var="countTr" value="${countTr+1}"/>    
                            <tr class="text-center">
                                <td>${bookingDetailDTO.tripDetailId}</td>
                                <td>${bookingDetailDTO.seatName}</td>
                                <td>${bookingDetailDTO.busCode}</td>
                                <td>${bookingDetailDTO.startingPoint}</td>
                                <td>${bookingDetailDTO.destination}</td>
                                <td>${bookingDetailDTO.depatureTime}</td>
                                <td>${bookingDetailDTO.depatureDate}</td>
                                <td>${bookingDetailDTO.price}</td>
                                <td>${bookingDetailDTO.bookingDate}</td>
                                <td>${bookingDetailDTO.bookingStatus}</td>
                                <c:if test="${bookingDetailDTO.bookingStatus=='paid'}">

                                    <td>
                                        <button onclick="window.location = 'ShowTicketPurchasedServlet?bookingId=${bookingDetailDTO.booking.bookingId}'" type="button" class="btn btn-success">See Ticket</button>
                                        <button  type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#CancelModal${bookingDetailDTO.booking.bookingId}">Cancel</button>
                                        <div class="modal fade" id="CancelModal${bookingDetailDTO.booking.bookingId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Cancel ticket</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure to cancel Ticket ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button onclick="window.location = 'CancelTicketPaidCustomerServlet?bookingId=${bookingDetailDTO.booking.bookingId}&pageHistory=HistoryPurchase.jsp'" type="button" class="btn btn-danger">Agree</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </c:if>
                                <c:if test="${bookingDetailDTO.bookingStatus=='canceled'}">
                                    <td></td>
                                </c:if>
                                <c:if test="${bookingDetailDTO.bookingStatus =='order'}">
                                    <td>
                                        <button  type="button" class="btn btn-danger w-100" data-bs-toggle="modal" data-bs-target="#CancelModal${bookingDetailDTO.booking.bookingId}">Cancel</button>
                                        <div class="modal fade" id="CancelModal${bookingDetailDTO.booking.bookingId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Cancel ticket</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure to cancel Ticket ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button onclick="window.location = 'CancelTicketPurchaseServlet?bookingId=${bookingDetailDTO.booking.bookingId}&pageHistory=HistoryPurchase.jsp'" type="button" class="btn btn-danger">Agree</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </c:if>
                            </tr>

                        </c:forEach>
                        <!--Fill Table-->
                        <c:if test="${countTr != 10}">
                            <c:forEach begin="${countTr}" end="10">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <!---->
                    </table>
                    <c:set var="page" value="${sessionScope.page}"/>
                    <nav aria-label="" style="margin-top: 15px;">
                        <ul class="pagination justify-content-center">
                            <!--Previous Page-->
                            <c:if test="${page != 1}">
                                <li class="page-item">
                                    <a class="page-link" href="HistoryPurchaseListServlet?page=${page-1}&sort=${sessionScope.sort}">Previous</a>
                                </li>
                            </c:if>
                            <c:if test="${page == 1}">
                                <li class="page-item disabled">
                                    <a class="page-link" href="HistoryPurchaseListServlet?page=${page-1}&sort=${sessionScope.sort}">Previous</a>
                                </li>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${endPage}">
                                <c:if test="${page == i}">
                                    <li class="page-item active">
                                        <a class="page-link" href="HistoryPurchaseListServlet?page=${i}&sort=${sessionScope.sort}">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${page != i}">
                                    <li class="page-item ">
                                        <a class="page-link" href="HistoryPurchaseListServlet?page=${i}&sort=${sessionScope.sort}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <!--Next Page-->
                            <c:if test="${endPage != page}">
                                <li class="page-item">
                                    <a class="page-link" href="HistoryPurchaseListServlet?page=${page+1}&sort=${sessionScope.sort}">&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;</a>
                                </li>
                            </c:if>
                            <c:if test="${endPage == page}">
                                <li class="page-item disabled">
                                    <a class="page-link" href="HistoryPurchaseListServlet?page=${page+1}&sort=${sessionScope.sort}">&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;</a>
                                </li>
                            </c:if>
                            <!-- -->
                        </ul>
                    </nav>

                    <hr>



                </c:if>
                <c:if test="${ bookingDetailDTOList == null }">
                    <style>
                        .page_404{
                            margin-left:10%;
                            padding:40px 0;
                            background:#fff;
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
                    </style>
                    <div class="page_404">
                        <div class="container">
                            <div class="row">	
                                <div class="col-sm-12 ">
                                    <div class="col-sm-10 col-sm-offset-1  text-center">
                                        <div class="four_zero_four_bg">
                                            <h4 class="text-center ">Look like you haven't booked any bus yet !!</h4>

                                        </div>

                                        <div class="contant_box_404">
                                            <h3 class="h2">
                                                We hope you can support us !
                                            </h3>

                                            <p>Thank You!</p>

                                            <a href="index.jsp" class="link_404">Go to Home</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <%@include file="/includes/footer.jsp" %> 

    </body>

    <script type="text/javascript">

        let onclickHandleBookingId = (bookingId) => {
            if (confirm("Do you want to cancel ?")) {
                window.location = 'CancelTicketPurchaseServlet?bookingId=' + bookingId;
            }
            ;
        };
    </script>
    <script src="assets/js/index.js" type="text/javascript"></script>

</html>
