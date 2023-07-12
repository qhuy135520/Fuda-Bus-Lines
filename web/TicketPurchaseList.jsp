
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
            .btn-light{
                background: none !important;
            }
            .card{
                box-shadow: none;
                padding: 0;
                margin: 0;
                transform: none !important;
                width: 100%;
                border-radius: 0% !important;
                background: none !important;
                opacity: 1;
                border: none !important;

            }
            .payment-title{
                font-size: 	1.3rem;
                margin: 20px 0;
            }
            @import url("https://fonts.googleapis.com/css2?family=Poppins:weight@100;200;300;400;500;600;700;800&display=swap");
            .card-header {
                padding: .5rem 1rem;
                margin-bottom: 0;

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


                height: 52px;
                font-size: 15px;
                border-radius: 8px;
            }


            .payment-card-body{

                flex: 1 1 auto;
                padding: 24px 1rem !important;

            }
            .content{
                margin-top: 100px;
                margin-left: 4%;
            }
            .filter-select{
                margin-right: 0px !important;
            }
            .content-departure{
                margin-bottom: 10px;
            }

            #progress {
                position: relative;
                margin: 0 1.3% 30px 1.3%;
            }
            #progress-bar {
                position: absolute;
                background: lightseagreen;
                height: 5px;
                width: 0%;
                top: 50%;
                left: 0;
            }
            #progress-num {
                margin: 0;
                padding: 0;
                list-style: none;
                display: flex;
                justify-content: space-between;
            }

            #progress-num::after {
                content: "";
                background-color: #cccccc;
                position: absolute;
                top: 50%;
                left: 0;
                height: 5px;
                width: 98%;
                margin: 0 1%;
                z-index: -99;
            }

            #progress-num .step {
                border: 3px solid #ff6855;
                background-color: #ff6855 !important;
                color: #fff;
                border-radius: 100%;
                width: 25px;
                height: 25px;
                line-height: 25px;
                text-align: center;
                background-color: #fff;
                font-family: sans-serif;
                font-size: 14px;
                position: relative;
                /*z-index: 1;*/
                font-weight: bold;
            }
            #progress-num::before {
                content: "";
                background-color: #ff6855;
                position: absolute;
                top: 50%;
                left: 0;
                height: 5px;
                width: 98%;
                margin: 0 1%;
            }
            .milistones-detaile{
                color: #f03c00;
                font-weight: bold;
            }
            .background{
                background-image: url("https://futabus.vn/_nuxt/img/bg-3.0d434f3.png");
            }
            .payment-method{
                margin-top: 10px !important;
            }
            input[type="checkbox"] {
                /* Add if not using autoprefixer */
                -webkit-appearance: none;
                /* Remove most all native input styles */
                appearance: none;
                /* For iOS < 15 */
                background-color: var(--form-background);
                /* Not removed via appearance */
                margin: 0;

                font: inherit;
                color: currentColor;
                width: 1.15em;
                height: 1.15em;
                border: 0.15em solid currentColor;
                border-radius: 0.15em;
                transform: translateY(-0.075em);

                display: grid;
                place-content: center;
            }

            input[type="checkbox"]::before {
                content: "";
                width: 0.65em;
                height: 0.65em;
                clip-path: polygon(14% 44%, 0 65%, 50% 100%, 100% 16%, 80% 0%, 43% 62%);
                transform: scale(0);
                transform-origin: bottom left;
                transition: 120ms transform ease-in-out;
                box-shadow: inset 1em 1em var(--form-control-color);
                /* Windows High Contrast Mode */
                background-color: CanvasText;
            }

            input[type="checkbox"]:checked::before {
                transform: scale(1);
            }

            input[type="checkbox"]:focus {
                outline: max(2px, 0.15em) solid currentColor;
                outline-offset: max(2px, 0.15em);
            }

            input[type="checkbox"]:disabled {
                --form-control-color: var(--form-control-disabled);

                color: var(--form-control-disabled);
                cursor: not-allowed;
            }
            .payment-active{
                border: solid 3px black;
            }
            .payment-disable{

                border: none !important;
            }
            #paypal-choose,#vnpay-choose{
                padding: 15px;
            }
        </style>

        <div class="background">
            <div class="container">
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
                <div class="table-users">
                    <div class="header">Ticket Purchase List</div>
                    <c:if test="${listBookingDetailDTO !=null}">
                        <form  onsubmit="return handleData()" onsubmit="() => init()" action="PayTicketPurchaseServlet" method="POST">
                            <table cellspacing="0">
                                <tr class="text-center" >
                                    <th><input type="checkbox" id="select-all-seat" class=""/></th>
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
                                </tr>
                                <c:forEach items="${listBookingDetailDTO}" var="bookingDetailDTO">
                                    <tr class="text-center input-custom">
                                        <td><input  type="checkbox"  name="bookingId" class="checkbox " value="${bookingDetailDTO.booking.bookingId}" /></td>
                                        <td>${bookingDetailDTO.tripDetailId}</td>
                                        <td>${bookingDetailDTO.seatName}</td>
                                        <td>${bookingDetailDTO.busCode}</td>
                                        <td>${bookingDetailDTO.startingPoint}</td>
                                        <td>${bookingDetailDTO.destination}</td>
                                        <td>${bookingDetailDTO.depatureTime}</td>
                                        <td>${bookingDetailDTO.depatureDate}</td>
                                        <td>${bookingDetailDTO.price}</td>
                                        <td>${bookingDetailDTO.bookingDate}</td>
                                        <td><button   type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#CancelModal${bookingDetailDTO.booking.bookingId}">Cancel</button></td>
                                    </tr>
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
                                                    <button onclick="window.location = 'CancelTicketPurchaseServlet?bookingId=${bookingDetailDTO.booking.bookingId}'" type="button" class="btn btn-danger">Agree</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </table>
                            <hr><!-- comment -->


                            <div class="payment-method d-flex justify-content-center mt-5 mb-5">
                                <div class="row g-3">
                                    <div class="col-md-6">  
                                        <span style="color: #f03c00; font-size: 20px; font-weight: bold">Payment Method</span>
                                        <div class="card">
                                            <div class="accordion" id="accordionExample">
                                                <div class="card">
                                                    <div class="card-header p-0" id="headingTwo">
                                                        <h2 class="mb-0">
                                                            <button id="vnpay-choose" class="btn btn-light btn-block text-left collapsed p-3 rounded-0 border-bottom-custom" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                                <div class="d-flex align-items-center justify-content-between">
                                                                    <input hidden type="radio" id="vnpay" name="payment-method" required="" value="vnpay"/>
                                                                    <label for="vnpay">
                                                                        <span>VNPAY &nbsp;</span>
                                                                        <img src="data:image/png;base64,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" width="30">
                                                                    </label>
                                                                </div>
                                                            </button>
                                                        </h2>
                                                    </div>
                                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                                        <div class="card-body">
                                                            <input type="text" class="form-control" placeholder="Paypal email">
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <div class="card-header p-0">
                                                            <h2 class="mb-0">
                                                                <button id="paypal-choose" type="button" class="btn btn-light btn-block text-left p-3 rounded-0" value="vnpay" name="payment-method" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                    <div class="d-flex align-items-center justify-content-between">
                                                                        <input hidden id="paypal" type="radio" name="payment-method" required="" value="paypal"/>
                                                                        <label for="paypal">
                                                                            <span>Paypal &nbsp;</span>
                                                                            <!--                                                                            <div class="icons">-->
                                                                            <img width="30" src="data:image/jpeg;base64,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" >

                                                                            <!--</div>-->
                                                                        </label>
                                                                    </div>
                                                                </button>
                                                            </h2>
                                                        </div>
                                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                                            <div class="card-body payment-card-body">

                                                                <img style="all:unset; width: 100%;"  src="https://static-images.vnncdn.net/files/publish/2022/7/29/vnpay-3-758.jpg"/>

                                                                <span class="text-muted certificate-text"><i class="fa fa-lock"></i> If you do not pay one day in advance, the ticket will be automatically canceled to give priority to other customers</span>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="summary" class="col-md-6">

                                        <span style="color: #f03c00; font-size: 20px; font-weight: bold">Summary</span>
                                        <div class="card">
                                            <div class="d-flex justify-content-between p-3">
                                                <div class="d-flex flex-column">
                                                    <span>Total Ticket <i class="fa fa-caret-down"></i></span>
                                                </div>
                                                <div class="mt-1">
                                                    <sup class="super-price " id="selected-seat"></sup>&nbsp;
                                                    <span class="super-month"><i class="fa-solid fa-ticket fa-lg"></i></span>
                                                </div>
                                            </div>
                                            <hr class="mt-0 line">
                                            <div class="p-3">
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span>Seat name</span>
                                                    <span id="selected-seat-name"></span>
                                                </div>
                                            </div>
                                            <hr class="mt-0 line">
                                            <div class="p-3 d-flex justify-content-between">
                                                <div class="d-flex flex-column">
                                                    <span>Total price(Vietnam dong)</span>
                                                </div>
                                                <div>
                                                    <span id="selected-total-price">0</span>&nbsp;<i class="fa-solid fa-dong-sign fa-lg"></i>
                                                </div>
                                            </div>
                                            <div class="p-3">
                                                <button type="submit" class="btn btn-primary btn-block free-button">PAY IT NOW</button> 
                                                <div style="visibility:hidden; color:red; font-size: 20px; margin-top: 10px; " id="chk_option_error">
                                                    Please select at least one Trip to pay.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${ listBookingDetailDTO == null or empty listBookingDetailDTO}">
                        <style>
                            .page_404{
                                padding:40px 0;
                                padding-left: 10%;
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
        </div>
        <%@include file="/includes/footer.jsp" %> 

    </body>

    <script type="text/javascript">
        let checkboxesList = document.querySelectorAll('.checkbox');
        let countSeat = 0;
        document.getElementById('select-all-seat').onclick = function () {
            countSeat = 0;
            for (let checkbox of checkboxesList) {
                checkbox.checked = this.checked;
                if (checkbox.checked == true) {
                    countSeat++;
                } else {
                    countSeat = 0;
                }
            }
        }
        ;
        for (let i = 0; i < checkboxesList.length; i++) {
            checkboxesList[i].addEventListener('click', function () {
                if (this.checked == true) {
                    countSeat++;
                } else {
                    countSeat--;
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(document).on("change", function () {
            let checkboxValues = [];
            $("input.checkbox:checked").map(function () {
                checkboxValues.push($(this).val());
            });


            $.ajax({
                url: 'TicketPurchaseListAjax',
                type: 'POST',
                data: {
                    checkbox: checkboxValues.toString(),
                    countSeat: countSeat
                },
                success: function (data) {
                    $('#summary').html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            }
            );
        });


    </script>

    <script type="text/javascript">
        function handleData()
        {
            var form_data = new FormData(document.querySelector("form"));

            if (!form_data.has("bookingId"))
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
        $(document).on("change", function () {
            var vnpay = document.getElementById("vnpay");
            if (vnpay.checked === true) {
                document.getElementById("vnpay-choose").className = "payment-active";
            } else {
                document.getElementById("vnpay-choose").className = "payment-disable";
            }

            var paypal = document.getElementById("paypal");
            if (paypal.checked === true) {
                document.getElementById("paypal-choose").className = "payment-active";
            } else {
                document.getElementById("paypal-choose").className = "payment-disable";
            }
        });

    </script>
    <script src="assets/js/index.js" type="text/javascript"></script>

</html>
