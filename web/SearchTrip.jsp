<%-- 
    Document   : SearchTrip.jsp
    Created on : May 30, 2023, 4:13:29 PM
    Author     : letra
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Station"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/search-trip-style.css"/>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
        <style>
            .leaflet-right{
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="loader"></div>

        <%@include file="includes/navbar.jsp" %>
        <c:set value="${orignStation.stationName}"  var="orignStation"/>
        <c:set value="${destinationStation.stationName}"  var="destinationStation"/>
        <c:set value="${departureDate}"  var="departureDate"/>
        <div class="background">
            <div class="container-md">
                <div class="content">
                    <h2 class="content-title">${orignStation} - ${destinationStation}</h2>
                    <div class="content-departure"><i class="fa-solid fa-location-dot font-destinations"></i>&nbsp;&nbsp; ${departureDate}  </div>
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
                            Choose type of ticket to get on the bus to ${destinationStation} from ${orignStation}
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.employee != null}">
                        <div class="trip-info">
                            Choose type of ticket to manage ticket on the bus to ${destinationStation} from ${orignStation}
                        </div>
                    </c:if>

                </div>
                <table class="responstable table-responsive text-center">

                    <tr>
                        <c:if test="${sessionScope.employee != null}">
                            <th scope="col">Trip Detail Id</th>
                            </c:if>
                        <th scope="col">Orign</th>
                        <th scope="col">Destination</th>
                        <th scope="col">Duration</th>
                        <th scope="col">Total seats</th>
                        <th scope="col">Bus Code</th>
                        <th scope="col">Price</th>
                        <th scope="col">
                            <c:choose>
                                <c:when test="${sessionScope.employee != null}">
                                    Book for<br>&nbsp;&nbsp; Customers&nbsp;&nbsp;</th>
                                </c:when>
                                <c:otherwise>
                                Booking Ticket
                            </c:otherwise>
                        </c:choose>
                        </th>
                        <c:if test="${sessionScope.employee != null}">
                            <th scope="col">View Booked<br> Customers
                            </c:if>
                    </tr>



                    <c:forEach items="${listTripDetail}" var="tripDetail">
                        <c:if test="${sessionScope.employee == null }">
                            <tr>

                                <td scope="row">${orignStation}</td>
                                <td>${destinationStation}</td>
                                <td>${tripDetail.trip.during} Hours</td>
                                <td>${tripDetail.trip.totalSeat} seats</td>
                                <td>${tripDetail.trip.busCode}</td>
                                <td>${tripDetail.ticketPrice} <i class="fa-solid fa-dong-sign"></i></td>
                                    <%--<c:if test="${sessionScope.customer != null or sessionScope.employee != null}">--%>
                                <td><button type="button" class="btn btn-outline-success" onclick="window.location = 'SearchTripServlet?tripDetailId=${tripDetail.tripDetailId}'">Booking ticket</button></td>
                                <%--</c:if>--%>
                                <%--<c:if test="${sessionScope.customer == null and session.employee == null}">--%>
                                <!--<td><button type="button" class="btn btn-outline-success" onclick="window.location = 'login.jsp'">Booking ticket</button></td>-->
                                <%--</c:if>--%>
                            </tr>
                        </c:if>
                        <c:if test="${sessionScope.employee != null}">
                            <tr>

                                <td>${tripDetail.tripDetailId}</td>

                                <td scope="row">${orignStation}</td>
                                <td>${destinationStation}</td>
                                <td>${tripDetail.trip.during} Hours</td>
                                <td>${tripDetail.trip.totalSeat} seats</td>
                                <td>${tripDetail.trip.busCode}</td>
                                <td>${tripDetail.ticketPrice} <i class="fa-solid fa-dong-sign"></i></td>
                                <td>
                                    <button type="button" class=" btn btn-outline-primary" onclick="window.location = 'SearchTripServlet?tripDetailId=${tripDetail.tripDetailId}'">Book For<br> &nbsp;&nbsp;&nbsp;&nbsp;Customers&nbsp;&nbsp;&nbsp;&nbsp;</button>

                                </td>
                                <td>
                                    <button type="button" class=" btn btn-outline-success" onclick="window.location = 'ShowBookedCustomer?tripDetailId=${tripDetail.tripDetailId}'">View Booked Customer</button>
                                </td>

                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
                <div class="row">
                    <div style="z-index: 95" class="map-tutorial col-md-6 col-sm-12">
                        <div id="map" style="width:100%; height: 60vh"></div>
                        <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"></script>
                        <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <img style="width:100%; height: 60vh" src="img/bus-img-search-trip.jpg"/>
                    </div>
                </div>
            </div>


            <div class="d-grid gap-2 col-8 mx-auto pb-4 mt-4">
                <button onclick="history.back()" class="btn btn-outline-secondary btn-back " type="button">Back&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-backward"></i></button>
            </div>

        </div>
        <%
            Station orignStation = (Station) request.getAttribute("orignStation");
            Station destinationStation = (Station) request.getAttribute("destinationStation");
            String orignStationUrl = orignStation.getStationUrl();
            String destinationStationUrl = destinationStation.getStationUrl();
            System.out.print(orignStationUrl);
        %>
        <%@include file="includes/footer.jsp" %>
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

    </body>
</html>
