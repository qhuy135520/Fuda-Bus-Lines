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
        <link rel="stylesheet" href="assets/css/carousel-style.css"/>

    </head>
    <body>
        <%
            StationDAO d = new StationDAO();
            java.util.ArrayList station = d.getStation();
            session.setAttribute("station", station);
        %>
        <div class="loader"></div>
        <%@include file="/includes/navbar.jsp" %> 
        <%@include file="/includes/main.jsp" %> 
        <%@include file="/includes/sectionn-news.jsp" %> 
        <%@include file="/includes/fuda.jsp" %> 
        <%@include file="/includes/footer.jsp" %> 
    </body>
    <script src="assets/js/index.js" type="text/javascript"></script>

</html>
