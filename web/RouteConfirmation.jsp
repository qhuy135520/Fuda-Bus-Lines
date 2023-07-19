<%-- 
    Document   : SearchTrip
    Created on : May 25, 2023, 5:19:50 PM
    Author     : letra
--%>
<%@page import="model.Station"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/search-trip-style.css" type="text/css" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
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
            .leaflet-right{
                display: none;
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
                        <div class="card-body">
                            <div class="card-body-detail">
                                <p class="card-text">${sessionScope.tripDetail.ticketPrice} <i class="fa-solid fa-dong-sign"></i> &nbsp;&nbsp; <i class="fa-solid fa-circle fa-2xs"></i> &nbsp;&nbsp; 2 floors&nbsp;&nbsp; <i class="fa-solid fa-circle fa-2xs"></i> &nbsp;&nbsp;${totalSeatRemaining} seat remaining</p>
                            </div>
                            <p class="route-orign"><i class="fa-solid fa-location-dot font-orign"></i>&nbsp;&nbsp; ${orignStation.stationName} Bus Station</p>

                            <p class="route-detail">Bus line: ${sessionScope.tripDetail.trip.during} hours</p>

                            <p class="route-detail">Bus line:  ${sessionScope.tripDetail.trip.during} hours</p>

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
                        <c:if test="${sessionScope.customer != null or sessionScope.employee != null}">
                            <button style="margin-top:0px !important; margin-bottom: 0px !important" onclick="window.location = 'TermAndPolicie.jsp'" type="submit" class="btn btn-outline-secondary btn-back m-4 " type="button">Next &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-forward"></i></button>
                            </c:if>
                            <c:if test="${sessionScope.customer == null and sessionScope.employee == null}">
                            <button  style="margin-top:0px !important; margin-bottom: 0px !important"  onclick="window.location = 'login.jsp'" type="button" class="btn btn-outline-secondary btn-back m-4" type="button">Next &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-forward"></i></button>
                            </c:if>
                        <div style="z-index: 95" class="map-tutorial ">
                            <div id="map" style=" height: 60vh; margin: 20px 2% 20px 2%;"></div>
                            <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"></script>
                            <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>
                        </div>

                        <!--                        <div class="row d-flex justify-content-between seat-option ">
                                                    <div class=" align-items-center col-12 col-md-6 route-information-btn">
                        
                                                        <button class="btn btn-outline-secondary btn-back " type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                            Route Information
                                                        </button>
                        
                        
                                                    </div>
                                                    <div class="seat-option-btn align-items-center col-12 col-md-6">
                   
                </div>
            </div>
            <div class="collapse" id="collapseExample">
                <div class="card card-body">
                    <div><i class="fa-solid fa-location-dot font-destinations"></i>&nbsp;&nbsp; ${date} ${orignStation.stationName} - ${destinationStation.stationName}</div>
                    <table class="table text-center align-top ">
                        <thead>
                            <tr>
                                <th class="align-top" scope="col">Order</th>
                                <th class="align-top" scope="col">Depart</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:set var="i" value="0" />
                        <c:forEach items="${routes}" var="route" >
                            <c:set var="i" value="${i+1}" />
                            <tr>
                                <th scope="row">${i}</th>
                                <td>${route}</td>
                            </tr>     
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>-->
                        <div class="d-grid gap-2 m-4 mt-0">
                            <button  onclick="history.back()" class="btn btn-outline-secondary btn-back " type="button">Back&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-backward"></i></button>
                        </div>
                    </div>



                </div>


            </div>
        </div>
        <script src="assets/js/index.js"></script>
        <%
          Station orignStation = (Station) request.getAttribute("orignStation");
          Station destinationStation = (Station) request.getAttribute("destinationStation");
          String orignStationUrl = orignStation.getStationUrl();
          String destinationStationUrl = destinationStation.getStationUrl();
          System.out.print(orignStationUrl);
        %>
        <script type="text/javascript">
                                var map = L.map('map').setView([<%=orignStationUrl%>], 11);
                                mapLink = "<a href='http://openstreetmap.org'>OpenStreetMap</a>";
                                L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: 'Leaflet &copy; ' + mapLink + ', contribution', maxZoom: 7}).addTo(map);

                                var taxiIcon = L.icon({
                                    iconUrl: 'img/bus-icon-map.png',
                                    iconSize: [100, 80]
                                })

                                var marker = L.marker([<%=orignStationUrl%>], {icon: taxiIcon}).addTo(map);

                                var newMarker = L.marker([<%=destinationStationUrl%>]).addTo(map);
                                L.Routing.control({
                                    waypoints: [
                                        L.latLng(<%=orignStationUrl%>),
                                        L.latLng(<%=destinationStationUrl%>)
                                    ]
                                }).on('routesfound', function (e) {
                                    var routes = e.routes;
                                    console.log(routes);

                                    e.routes[0].coordinates.forEach(function (coord, index) {
                                        setTimeout(function () {
                                            marker.setLatLng([coord.lat, coord.lng]);
                                        }, 2 * index)
                                    })

                                }).addTo(map);
        </script>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
