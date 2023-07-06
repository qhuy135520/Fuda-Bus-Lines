<%-- 
    Document   : ErrorPage
    Created on : Jun 23, 2023, 3:48:53 PM
    Author     : letra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:200,400,700" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/error-page.css"/>
    </head>
    <body>
        <div class="loader"></div>

        <%@include file="includes/navbar.jsp" %>
       	<div id="notfound">
            <div class="notfound">
                <div class="notfound-404">
                    <h1>Oops!</h1>
                    <h2>You haven't Permission to Allow This Page</h2>
                </div>
                <a href="index.jsp">Go TO Homepage</a>
            </div>
        </div>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
