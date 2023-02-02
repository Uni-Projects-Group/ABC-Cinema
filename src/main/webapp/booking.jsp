<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${param.id == null || param.id == ''}">
    <c:redirect url="index.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ABC Cinema</title>
    <link rel="stylesheet" type="text/css" href="css/booking.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/seat-modal.css">
</head>
<body>
<jsp:useBean id="dbConfig" class="com.example.abccinema.envBean"/>
<sql:setDataSource
        var="source"
        driver="${dbConfig.driver}"
        url="${dbConfig.url}"
        user="${dbConfig.user}"
        password="${dbConfig.password}"
/>
<jsp:include page="header.jsp"/>
<div class="movieinfo">
    <form method="post" action="booking">
        <input type="hidden" name="movieID" value="${param.id}">
        <sql:query var="movie" dataSource="${source}">
            select * from nowshowing where movieid = ?;
            <sql:param value="${param.id}"/>
        </sql:query>

        <div class="image">
            <sql:query var="images" dataSource="${source}">
                SELECT image_path from nowshowing where movieid = ?;
                <sql:param value="${param.id}"/>
            </sql:query>
            <c:forEach var="result" items="${images.rows}">
                <img class="pic" src="${result.image_path}" alt=""/>
            </c:forEach>
        </div>

        <c:forEach var="row" items="${movie.rows}">
            <h1>${row.name}</h1>
            <pre>Language: ${row.Language}</pre>
            <pre>Director: ${row.Director}</pre>
            <h3 style="color:red; width: 50%">${row.description}</h3>
            <h4><a href="${row.Trailer}" target="_blank" style="color: wheat">Watch the Trailer</a></h4>
            <label for="continue">Show times: </label>
            <input type="button" id="continue" value="${row.Timeslot}">
        </c:forEach>

        <jsp:useBean id="seatCheck" class="com.example.abccinema.seatCheckBean">
            <jsp:setProperty name="seatCheck" property="reserved" value="${param.id}"/>
        </jsp:useBean>

        <%-- Seat selection modal --%>
        <div id="seat-modal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <p>
                        <input type="button" id="close-modal" value="<< Back">
                    </p>
                </div>
                <div class="modal-body">
                    <c:choose>
                        <c:when test="${seatCheck.failState == 'true'}">
                            <div class="seat-row">
                                <div class="seat-column">
                                    <p>ERROR: Something went wrong while accessing the database. Please try again
                                        later.</p>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="seat-row">
                                <div class="seat-column">
                                    <p>SCREEN</p>
                                </div>
                            </div>
                            <c:forEach var="x" begin="0" end="3">
                                <div class="seat-row">
                                    <div class="seat-column">
                                        <c:forEach var="y" begin="0" end="9">
                                            <c:set var="seatNum" value="${''.concat(x).concat(y)}"/>
                                            <label>
                                                <input type="checkbox" name="seats" value="${seatNum}" id="${seatNum}"
                                                       <c:if test="${fn:contains(seatCheck.reserved, seatNum)}">disabled</c:if>>
                                                <span class="seat-label">${seatNum}</span>
                                            </label>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="seat-row">
                                <div class="seat-column">
                                    <small>NOTE: This seat layout is only used for representation. Actual seat placement
                                        and spacing can differ from this representation.</small>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="modal-footer">
                    <p>
                        Seats: <span id="selected"></span>
                        <input type="submit" id="submit-details" value="Proceed to payment >>">
                    </p>
                    <p>Total: <span id="total">$ 0</span></p>
                    <input type="hidden" id="payable" name="payable">
                </div>
            </div>
        </div>
    </form>
</div>
<!-- <script type="text/javascript" src="js/datebtn.js"></script> -->
<script type="text/javascript" src="js/booking.js"></script>
</body>
</html>
