<%-- 
    Document   : SearchTrip.jsp
    Created on : May 30, 2023, 4:13:29 PM
    Author     : letra
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/search-trip-style.css"/>
        <style>


            /*======================
                404 page
            =======================*/


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
    </head>
    <body>
        <div class="loader"></div>

        <%@include file="includes/navbar.jsp" %>
        <c:set value="${orignStation.stationName}"  var="orignStation"/>
        <c:set value="${destinationStation.stationName}"  var="destinationStation"/>
        <c:set value="${departureDate}"  var="departureDate"/>
        <div class="container-md">
            <div class="content">
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


            </div>
        </div>


        <div class="page_404">
            <div class="container">
                <div class="row">	
                    <div class="col-sm-12 ">
                        <div class="col-sm-10 col-sm-offset-1  text-center">
                            <div class="four_zero_four_bg">
                                <h1 class="text-center ">Trip isn't Available !!</h1>


                            </div>

                            <div class="contant_box_404">
                                <h3 class="h2">
                                    Look like you're lost
                                </h3>

                                <p>the page you are looking for not avaible!</p>

                                <a href="index.jsp" class="link_404">Go to Home</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="includes/footer.jsp" %>

    </body>
</html>
