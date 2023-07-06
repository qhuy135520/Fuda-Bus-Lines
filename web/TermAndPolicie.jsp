<%-- 
    Document   : SearchTrip
    Created on : May 25, 2023, 5:19:50 PM
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
        <style>
            #progress-num::before {
                content: "";
                background-color: #ff6855;
                position: absolute;
                top: 50%;
                left: 0;
                height: 5px;
                width: 66%;
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
                <div class="route-option-36seats">

                    <div class="card ">
                        <div class="card-header d-flex justify-content-between">
                            <div>
                                <h4 style="color: #f15a24;"> Departure Route Confirmation</h4>
                            </div>
                            <div>
                                <i class="fa-brands fa-usb"></i> &nbsp;
                                <i class="fa-solid fa-ticket"></i> &nbsp;
                                <i class="fa-solid fa-wifi"></i>
                            </div>
                        </div>
                        <form action="InsertBookingServlet" method="POST">
                            <div class="card-body" style="background-color: #f6f6f6;">
                                <div class="row" >
                                    <div class="col-md-6 col-sm-12">
                                        <h5 class="text-center">CUSTOMER INFORMATION</h5> 
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="firstname" value="${sessionScope.customer.customerFirstname}" readonly=""/>
                                            <label for="firstname">First name</label>
                                            <hr>

                                        </div>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="lastname" value="${sessionScope.customer.customerLastname}" readonly=""/>
                                            <label for="lastname">Last name</label>
                                            <hr>

                                        </div>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="phone" value="${sessionScope.customer.customerPhone}" readonly=""/>
                                            <label for="phone">Phone</label>
                                            <hr>

                                        </div>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="email" value="${sessionScope.customer.customerEmail}" readonly=""/>
                                            <label for="email">Email</label>
                                            <hr>

                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input" required="">
                                            </div>
                                            <input type="text" class="form-control" value="Agree with our terms and policies" aria-label="Text input with checkbox">
                                        </div>
                                        <hr>

                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <h5 class="text-center">TERMS AND POLICIES</h5>
                                        <div class="input-group" >
                                            <textarea readonly="" style="height: 400px !important;" class="form-control" aria-label="With textarea" style="resize: none !important;" >(*) Please bring the confirmed email which contain reservation code in order to to take the ticket before departing time 60 minutes for shuttles bus.

(*) Passengers's information must be correct.

(*) Passenger can not exchange/cancel the tickets during the festival/holiday time (Normal days passengers can exchange/cancel the ticket once and before 24 hours), cancel fee 10%.

(*) Please call 1900 6067 for shuttle bus service. shuttle bus services range is limited, therefore, we will not pick passengers who are outside the range of services. Thank you!
                                            </textarea>
                                        </div>
                                    </div>
                                </div>

                            </div>


                            <div class="" style="background-color: #f6f6f6 !important;">

                                <div  style="width: 100% !important; " class="seat-option-btn align-items-center col-12 ">
                                    <c:if test="${sessionScope.customer != null or sessionScope.employee != null}">
                                        <button   type="submit" class="btn btn-outline-secondary btn-back " type="button">Insert to purchase &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-forward"></i></button>
                                        </c:if>
                                        <c:if test="${sessionScope.customer == null and sessionScope.employee == null}">
                                        <button   type="button" onclick="window.location='login.jsp'" class="btn btn-outline-secondary btn-back " type="button">Insert to purchase &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-forward"></i></button>
                                    </c:if>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="d-grid gap-2 col-8 mx-auto pb-4">
                    <button onclick="history.back()" class="btn btn-outline-secondary btn-back " type="button">Back&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-backward"></i></button>
                </div>
            </div>


        </div>

    </div>
    <script src="assets/js/index.js"></script>

    <%@include file="includes/footer.jsp" %>
</body>
</html>
