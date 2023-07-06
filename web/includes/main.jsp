<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main>
    <div class="hero-section w3-animate-left" id="home">
        <div class="hero-section-img">
            <img src="img/bus-introduce.jpg" />
        </div>
        <div class="hero-section-main">
            <div class="hero-section-into-text w3-margin-top">
                <div id="booking" class="section">
                    <div class="section-center">
                        <div class="container">
                            <div class="row">
                                <div class="booking-form">
                                    <div class="booking-bg">
                                        <div class="form-header">
                                            <h2>Fuda bus line</h2>
                                            <p>
                                                Guarantee 150% refund if transport service is not provided
                                            </p>
                                        </div>
                                    </div>
                                    <form action="SearchTripServlet" method="POST">
                                        <div class="row">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <span class="form-label">Orign</span>
                                                        <select class="form-control" name="orign" required>
                                                            <option value="" selected hidden>
                                                                Select Orign
                                                            </option>
                                                            <c:forEach items="${sessionScope.station}" var="s">
                                                                <option value="${s.stationId}">${s.stationName}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <span class="select-arrow"></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <span class="form-label">Destinations</span>
                                                        <select class="form-control" name="destination" required>
                                                            <option value="" selected hidden>
                                                                Select destination
                                                            </option>
                                                            <c:forEach items="${sessionScope.station}" var="s">
                                                                <option value="${s.stationId}">${s.stationName}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <span class="select-arrow"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <span class="form-label">Departure date</span>
                                                    <input
                                                        class="form-control"
                                                        type="date" name="departure-date"  required
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <span class="form-label">Ticket Type</span>
                                            <select class="form-control" name="ticket-type">
                                                <option value="" selected hidden>
                                                    Select ticket type
                                                </option>
                                                <option value="340000">Max = 300.000 <i class="fa-solid fa-dong-sign"></i></option>
                                                <option value="450000">Max = 500.000 <i class="fa-solid fa-dong-sign"></i></option>
                                            </select>
                                            <span class="select-arrow"></span>
                                        </div>
                                        <%--<c:if test="${sessionScope.customer != null or sessionScope.employee != null}">--%>
                                        <div class="form-btn">
                                            <button class="submit-btn" type="submit" >Check availability</button>
                                        </div>
                                        <%--</c:if>--%>
                                        <%--<c:if test="${sessionScope.customer == null and sessionScope.employee == null}">--%>
                                        <!--                                            <div class="form-btn">
                                                                                        <a href="login.jsp">Check availability</a>
                                                                                    </div>-->
                                        <%--</c:if>--%>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>