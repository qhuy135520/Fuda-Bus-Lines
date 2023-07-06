<%-- 
    Document   : EditProfile
    Created on : Jun 5, 2023, 8:49:37 PM
    Author     : letra
--%>
<%@page import="model.Customer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="assets/css/edit-profile-style.css" type="text/css" />
        <link rel="stylesheet" href="assets/css/edit-profile-loading-style.css" type="text/css">
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>
        <div id="loader">
            <div id="shadow"></div>
            <div id="box"></div>
        </div>
        <script type="text/javascript">
            let count = 5;
            setInterval(function () {
                count--;
                if (count === 0) {
                    window.location = 'EditProfile.jsp';
                }
            }, 1000);
        </script>
    </body>
</html>
