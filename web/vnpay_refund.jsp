<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Refund</title>
        <!-- Bootstrap core CSS -->
        <%@include file="includes/header.jsp" %>

        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->   
        <script src="assets/jquery-1.11.3.min.js"></script>
        <style>
            .center-navbar{
                margin: 0 18% 0 18% !important;
            }
        </style>
    </head>

    <body>
        <div class="center-navbar">
            <div class="loader"></div>

            <%@include file="includes/navbar.jsp" %>
        </div>
        <div style="margin:120px 25% 50px 25% !important; " class="container-refund ">
            <div class="">

                <h3 class="text-muted text-center">VNPAY DEMO</h3>
            </div>
            <h3 class="text-center mb-5">Refund</h3>
            <div class="row">
                <div class="col-md-6">
                    <img src="https://onlinebank.com.vn/wp-content/uploads/2022/02/VNPAY.jpg" class="w-100 h-100"/>
                </div>
                <div class="col-md-6">
                    <form action="vnpayrefund" id="frmrefund" method="Post">
                        <div class="form-group">
                            <label for="order_id">Mã hóa đơn</label>
                            <input class="form-control" id="order_id"
                                   name="order_id" type="text" readonly="" value="${bookingDetailDTO.booking.code}"/>
                        </div>
                        <div class="form-group">
                            <label for="amount">Số tiền hoàn</label>
                            <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="${bookingDetailDTO.price}" readonly="" />
                        </div>
                        <div class="form-group">
                            <label for="trantype">Kiểu hoàn tiền</label>
                            <select  name="trantype" id="trantype" class="form-control">
                                <option selected value="02">Hoàn tiền toàn phần</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="trans_date">Thời gian thanh toán</label>
                            <input class="form-control" id="trans_date"
                                   name="trans_date" type="text" placeholder="yyyyMMddHHmmss" value="${paidDate}" readonly=""/>
                        </div>
                        <div class="form-group">
                            <label for="user">User khởi tạo hoàn</label>
                            <input class="form-control" id="user"
                                   name="user" type="text" readonly="" value="VNPAY"/>
                        </div>
                        <div class="form-group text-center">
                            <button style="font-size: 30px" type="submit" class="btn btn-success">Refund</button>
                        </div>
                        <input style="display: none" name="bookingId" value="${bookingDetailDTO.booking.bookingId}"/>
                    </form>   

                </div> 

            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
