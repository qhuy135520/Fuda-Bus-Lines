<%-- 
    Document   : SuccessInsertPurchase
    Created on : Jun 9, 2023, 12:59:30 PM
    Author     : letra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/header.jsp" %>
    </head>
    <body>
        <div class="loader"></div>

        <%@include file="includes/navbar.jsp" %>
        <div class="vh-100 d-flex justify-content-center align-items-center">
            <div>
                <div class="mb-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-success" width="75" height="75"
                         fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                    <path
                        d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                    </svg>
                </div>
                <div class="text-center">
                    <h1>Thank You !</h1>
                    <p>Please check your <span style="color:#ef5222">Ticket purchase list</span> to pay your ticket. </p>
                    <p>Return Ticket Purchase List after 3 seconds</p>
                </div>
            </div>

    </body>
    <script type="text/javascript">
        let count = 3;
        setInterval(function () {
            count--;
            if (count === 0) {
                window.location = 'index.jsp';
            }
        }, 1000);
    </script>

    <script>
        window.addEventListener("load", () => {
            const loader = document.querySelector(".loader");

            loader.classList.add("loader--hidden");

            loader.addEventListener("transitionend", () => {
                document.body.removeChild(loader);
            });
        });

    </script>
</html>
