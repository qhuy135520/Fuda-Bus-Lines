<%-- 
    Document   : ShowTicketDetail
    Created on : Jun 9, 2023, 3:53:58 PM
    Author     : letra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Average+Sans&family=Cutive+Mono&family=Libre+Barcode+39&display=swap" rel="stylesheet">

        <link href="assets/css/show-ticket-style.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <%@include file="includes/header.jsp" %>


    </head>
    <body>
        <div class="loader"></div>

        <%@include file="includes/navbar.jsp" %>
        <div  class="container">
            <div class="show-ticket invoice">
                <div   class="ticket">
                    <div class="ticket-left">
                        <div class="corner-seat-container">
                            <div class="item">seat</div>
                            <div class="lgdetail">${bookingDetailDTO.seatName}</div>
                        </div>
                        <div class="airplane-container">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Bus-logo.svg/1024px-Bus-logo.svg.png" alt="airplane-img" />
                        </div>
                        <div class="departure-time">
                            <div class="item">departure time</div>
                            <div class="lgdetail">${bookingDetailDTO.depatureTime}</div>
                        </div>
                        <div class="departing">
                            <div class="item">departing</div>
                            <div class="smdetail">${bookingDetailDTO.startingPoint}</div>
                        </div>
                    </div>
                    <div class="ticket-middle">
                        <div class="passenger-name">
                            <div class="item">passenger</div>
                            <div class="smdetail">${sessionScope.customer.customerFirstname} ${sessionScope.customer.customerLastname}</div>
                        </div>
                        <div class="gate">
                            <div class="item"></div>
                            <div class="lgdetail"></div>
                        </div>
                        <div class="flight">
                            <div class="item">Bus</div>
                            <div class="lgdetail">${bookingDetailDTO.busCode}</div>
                        </div>
                        <div class="destination">
                            <div class="item">destination</div>
                            <div class="smdetail">${bookingDetailDTO.destination}</div>
                        </div>
                        <div class="group">
                            <div class="item">Departure date</div>
                            <div class="smdetail">${bookingDetailDTO.depatureDate}</div>
                        </div>
                        <div class="serial">
                            <div>z8 4653 402 16waj 4798p</div>
                        </div>
                    </div>
                    <div class="ticket-right">
                        <div class="stub-flight">
                            <div class="smitem">Bus</div>
                            <div class="exsmdetail">${bookingDetailDTO.busCode}</div>
                        </div>
                        <div class="stub-seat">
                            <div class="smitem">seat</div>
                            <div class="exsmdetail">${bookingDetailDTO.seatName}</div>
                        </div>
                        <div class="stub-depart">
                            <div class="smitem">depart</div>
                            <div class="exsmdetail">${bookingDetailDTO.depatureTime}</div>
                        </div>
                        <div class="stub-passenger">
                            <div class="smitem">passenger</div>
                            <div class="exsmdetail">${sessionScope.customer.customerFirstname} ${sessionScope.customer.customerLastname}</div>
                        </div>
                        <div class="barcode">
                            ${bookingDetailDTO.booking.bookingId}${bookingDetailDTO.tripDetailId}
                        </div>
                    </div>
                </div>
                <div  class="d-flex justify-content-center">
                    <button id="btn-print-this"  class="button-77" role="button">Download Ticket as file PDF</button>
                </div>
            </div>


        </div>

        <%@include file="includes/footer.jsp" %>
        <script >
            const printBtn = document.getElementById('btn-print-this');
            printBtn.addEventListener('click', function () {
                print();
            });
        </script>
    </body>


</html>
