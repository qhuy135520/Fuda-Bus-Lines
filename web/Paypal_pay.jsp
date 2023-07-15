<%-- 
    Document   : Paypal_pay
    Created on : Jul 11, 2023, 9:54:22 AM
    Author     : letra
--%>
<%@page import="dal.BookingDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>
        <script
            src="https://www.paypal.com/sdk/js?client-id=AbIuRJT2yxtomPkBNrQd-F1jYONRwLy9QU96mXfsW4TM8ACxJhLWWjJ2rTtv48kFGLR1UfIZbXxDN4Q8"
            >
        </script>
        <div style="margin-top: 100px " class="container">
            <div>
                <h1 class="text-center">READY TO PAY</h1>
            </div>
            <div class="text-center">
                <img width="50%" src="img/paypal-image.webp"/>
            </div>
            <div style="margin-left: 20%" class="">
                <div id="paypal-button-container"></div>
            </div>
        </div>
        <script>

            paypal
                    .Buttons({
                        createOrder: function (data, actions) {
                            // This function sets up the details of the transaction, including the amount and line item details.
                            return actions.order.create({
                                purchase_units: [
                                    {
                                        amount: {
                                            value: "${sessionScope.price_paypal}"
                                        }
                                    }
                                ]
                            });
                        },
                        onApprove: function (data, actions) {

                            // This function captures the funds from the transaction.

                            return actions.order.capture().then(function (details) {
                                // This function shows a transaction success message to your buyer.
                                console.log(details.payer.payer_id)
                                if (details !== null || Object.keys(details).length !== 0) {
            <%
//                                    BookingDao bookingDao = new BookingDao();
//            
//                                    String[] bookingId =(String[]) session.getAttribute("listPay");
//                                    for(String booking : bookingId){
//                                      int id = Integer.parseInt(booking);
//                                      bookingDao.updateBookingStatus(id,"paid");
//                                      bookingDao.updateCodeAndPaidDate(id, null);
//                }
            %>
                                    window.location = "CustomerPaypalPaymentServlet";
                                }
                            });

                        }
                    })
                    .render("#paypal-button-container");
            //This function displays Smart Payment Buttons on your web page.
        </script>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
