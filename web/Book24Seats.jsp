<%-- 
    Document   : SearchTrip
    Created on : May 25, 2023, 5:19:50 PM
    Author     : letra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/search-trip-style.css" type="text/css" />
        <style>
            #progress-num::before {
                content: "";
                background-color: #ff6855;
                position: absolute;
                top: 50%;
                left: 0;
                height: 5px;
                width: 33%;
                margin: 0 1%;
            }
        </style>
    </head>
    <body>
        <div class="loader"></div>
        <%@include file="includes/navbar.jsp" %>
        <div class="background">
            <div class="container-md">
                <div class="content">
                    <h2 class="content-title">${orignStation.stationName} - ${destinationStation.stationName}</h2>
                    <div class="content-departure"><i class="fa-solid fa-location-dot font-destinations"></i>&nbsp;&nbsp;${sessionScope.tripDetail.departureTime} ${date}  </div>
                    <c:if test="${sessionScope.employee == null}">

                        <div class="milistones d-flex justify-content-between text-center mb-3">
                            <div class="milistones-detaile"><br>Schedule</div>
                            <div class="milistones-detaile">Route<br>Confirmation</div>
                            <div class="milistones-detaile">Customer<br>Confirmation</div>
                            <div class="milistones-detaile"><br>Payment</div>
                        </div>
                        <div id="progress">
                            <div id="progress-bar"></div>
                            <ul id="progress-num">
                                <li class="step ">1</li>
                                <li class="step">2</li>
                                <li class="step">3</li>
                                <li class="step">4</li>
                            </ul>
                        </div>
                        <div class="trip-info">
                            Choose type of ticket to get on the bus to ${destinationStation.stationName} from ${orignStation.stationName}
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.employee != null}">
                        <div class="trip-info">
                            Choose type of ticket to manage ticket on the bus to ${destinationStation.stationName} from ${orignStation.stationName}
                        </div>
                    </c:if>
                </div>
                <form autocomplete="off" onsubmit="return handleData()" action="TakeSeatServlet" method="POST" >

                    <div>
                        <div class="card ">
                            <div class="card-header d-flex justify-content-between">
                                <div>
                                    <h4> ${sessionScope.tripDetail.departureTime}
                                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADgAAAAOCAYAAAB6pd+uAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAOKADAAQAAAABAAAADgAAAAAjNiV1AAABjklEQVRIDWNgGGQgraTRO7OiXZBazmKilkHUMuffPwaFX39+ZaSXN+lTw8xB50FGRgYmxn8MbH9//w9ILmoMLezr46TEo4POg/8ZgV6EAiBD68uTL5nAJKsEEyOVZiZVA63VG1nYWzIwMHIg2cP+7+9ffWMrRw4/d4eHBw4c+IckR5A56GIQGGtY3fT/P4PFk0+MqSlVreIEfYWkAKthSPJ0ZyInUSyWizH+/JuaVNJk+f//f3hSxqIOLjToPMgALGTgrsPCAHqMmenff7fUsubY3IYGPixKUITwGoaikk4cYAlKnJv+/lf88YUxM7W8SRuf04gzDJ8JVJYjkERRbPv/j4Hj/+//IamFjYG5kyaxo0hCOYwpRY312CSGntj/j0ysHOtmdVY8Qnb7oItBZMeRxmbk//f7ZyKwceAcumoVvPobRh6EBAewaLXhP3kjOa24QQQkwmxk6egAkRqcJDBP/mcAImDpCkQgBgMom/4DYmBFAaorgMUSAwMEMzL+BSr5BxTkBNabeqZ2Tp8BQTlvqFxYe+QAAAAASUVORK5CYII="/>
                                        <span> Price: ${sessionScope.tripDetail.ticketPrice} <i class="fa-solid fa-dong-sign"></i></span></h4>
                                </div>
                                <div>
                                    <i class="fa-brands fa-usb"></i> &nbsp;
                                    <i class="fa-solid fa-ticket"></i> &nbsp;
                                    <i class="fa-solid fa-wifi"></i>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="card-body-detail">
                                    <p class="card-text">${sessionScope.tripDetail.ticketPrice} <i class="fa-solid fa-dong-sign"></i> &nbsp;&nbsp; <i class="fa-solid fa-circle fa-2xs"></i> &nbsp;&nbsp; 2 floors&nbsp;&nbsp; <i class="fa-solid fa-circle fa-2xs"></i> &nbsp;&nbsp;${totalSeatRemaining} seat remaining</p>
                                </div>
                                <p class="route-orign"><i class="fa-solid fa-location-dot font-orign"></i>&nbsp;&nbsp; ${orignStation.stationName} Bus Station</p>
                                <p class="route-detail">Bus line: ${sessionScope.tripDetail.trip.during} hours</p>
                                <p class="route-destinations"><i class="fa-solid fa-location-dot font-destinations"></i>&nbsp;&nbsp; ${destinationStation.stationName} Bus Station</p>
                            </div>

                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <button class="nav-link active nav-choose" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile-36" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Downstairs</button>
                                    <button class="nav-link nav-choose" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact-36" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Upstairs</button>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-profile-36" role="tabpanel" aria-labelledby="nav-profile-tab">
                                    <div class="bus-24-seats">

                                        <div class="exit exit--front fuselage">

                                        </div>

                                        <c:forEach var="i" begin="0" end="5">
                                            <c:set var="head" value="${i*2}" />
                                            <c:set var="tail" value="${head+1}"/>

                                            <ol class="cabin fuselage">
                                                <li class="row row--${i+1}">
                                                    <ol class="seats" type="A">
                                                        <c:forEach items="${listTripSeatDetail}" var="tripSeatDetail" begin="${head}" end="${tail}">

                                                            <li class="seat">
                                                                <input class="checkbox-seats-24" type="checkbox" id="24-${tripSeatDetail.seat.seatId}" name="24Seats" value="${tripSeatDetail.seat.seatName}" ${tripSeatDetail.status?"":"disabled"}/>
                                                                <label for="24-${tripSeatDetail.seat.seatId}">${tripSeatDetail.seat.seatName}</label>
                                                            </li>

                                                        </c:forEach>
                                                    </ol>
                                                </li>
                                            </ol>
                                        </c:forEach>

                                        <div class="exit exit--back fuselage">

                                        </div>
                                        <hr>

                                        <div class="route-option-36seats">
                                            <ol class="seats" type="A">
                                                <li class="seat">
                                                    <input type="checkbox"  />
                                                    <label>&nbsp;</label>
                                                </li>
                                                <li class="seat">
                                                    <input type="checkbox" checked />
                                                    <label >&nbsp;</label>
                                                </li>
                                                <li class="seat">
                                                    <input type="checkbox" disabled />
                                                    <label >&nbsp;</label>
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div class="explain">Available</div>
                                            <div class="explain">Selected</div>
                                            <div class="explain">Booked</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="nav-contact-36" role="tabpanel" aria-labelledby="nav-contact-tab"> 
                                    <div class="bus-24-seats">
                                        <div class="exit exit--front fuselage">
                                        </div>
                                        <c:forEach var="i" begin="6" end="11">
                                            <c:set var="head" value="${i*2}" />
                                            <c:set var="tail" value="${head+1}"/>

                                            <ol class="cabin fuselage">
                                                <li class="row row--${i+1}">
                                                    <ol class="seats" type="A">
                                                        <c:forEach items="${listTripSeatDetail}" var="tripSeatDetail" begin="${head}" end="${tail}">

                                                            <li class="seat">
                                                                <input class="checkbox-seats" type="checkbox" id="24-${tripSeatDetail.seat.seatId}" name="24Seats" value="${tripSeatDetail.seat.seatName}" ${tripSeatDetail.status?"":"disabled"}/>
                                                                <label for="24-${tripSeatDetail.seat.seatId}">${tripSeatDetail.seat.seatName}</label>
                                                            </li>
                                                        </c:forEach>
                                                    </ol>
                                                </li>
                                            </ol>
                                        </c:forEach>
                                        <div class="exit exit--back fuselage">

                                        </div>
                                        <hr>
                                        <div class="route-option-36seats">
                                            <ol class="seats" type="A">
                                                <li class="seat">
                                                    <input type="checkbox"  />
                                                    <label>&nbsp;</label>
                                                </li>
                                                <li class="seat">
                                                    <input type="checkbox" checked />
                                                    <label >&nbsp;</label>
                                                </li>
                                                <li class="seat">
                                                    <input type="checkbox" disabled />
                                                    <label >&nbsp;</label>
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div class="explain">Available</div>
                                            <div class="explain">Selected</div>
                                            <div class="explain">Booked</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="visibility:hidden; color:red; font-size: 20px; margin-left: 10%; " id="chk_option_error">
                                Please select at least one option.
                            </div>
                            <div class="row d-flex justify-content-between seat-option ">
                                <div class="seat-option-detail align-items-center col-12 col-md-6">
                                    <span> Count Ticket(s):</span> <span id="count-ticket">0</span><br>
                                    <span>Price:</span> <span id="price-ticket">0 </span>&nbsp;<i class="fa-solid fa-dong-sign"></i>
                                </div>
                                <div class="seat-option-btn align-items-center col-12 col-md-6">
                                    <c:if test="${sessionScope.customer != null or sessionScope.employee != null}">
                                        <button type="submit" class="btn btn-outline-secondary btn-back " >Next &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-forward"></i></button>
                                        </c:if>
                                        <c:if test="${sessionScope.customer == null and sessionScope.employee == null}">
                                        <button type="button" onclick="window.location = 'login.jsp'" class="btn btn-outline-secondary btn-back " type="button">Next &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-forward"></i></button>

                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="d-grid gap-2 col-8 mx-auto pb-4">
                    <button onclick="history.back()" class="btn btn-outline-secondary btn-back " type="button">Back&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-backward"></i></button>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function handleData()
            {
                var form_data = new FormData(document.querySelector("form"));

                if (!form_data.has("24Seats"))
                {
                    document.getElementById("chk_option_error").style.visibility = "visible";
                    return false;
                } else
                {
                    document.getElementById("chk_option_error").style.visibility = "hidden";
                    return true;
                }

            }

        </script>
        <script type="text/javascript">
            let checkboxes_24_seat = document.querySelectorAll(".checkbox-seats-24");

            let count_24_seat = 0;
            let price_24_seat = 0;
            for (let i = 0; i < checkboxes_24_seat.length; i++) {
                checkboxes_24_seat[i].addEventListener('click', function () {
                    if (checkboxes_24_seat[i].checked === true) {
                        count_24_seat++;
                        price_24_seat = count_24_seat * ${tripDetail.ticketPrice};
                    } else {
                        count_24_seat--;
                        price_24_seat = count_24_seat * ${tripDetail.ticketPrice};
                    }
                    document.getElementById('count-ticket').innerHTML = count_24_seat;
                    document.getElementById('price-ticket').innerHTML = price_24_seat;
                });
            }
        </script>
        <script src="assets/js/index.js"></script>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
