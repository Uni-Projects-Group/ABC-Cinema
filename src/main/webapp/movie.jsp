<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${param.id == null || param.id == ''}">
    <c:redirect url="index.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ABC Cinema</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="css/movie.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/movie.js"></script>
</head>
<body>

<div class="topnav">
    <p class="toptitle">ABC Cinema</p>
    <a class="navlink" href="#">Link</a>
    <a class="navlink" href="#">Link</a>
    <a class="navlink" href="#">Link</a>
</div>

<div class="content">

    <!-- movie info here -->

    <p>Testing params (id): ${param.id}</p>

    <form id="purchase-form" action="booking" method="post">
        <input type="hidden" name="movieID" value="${param.id}">

        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="username" id="username" value="TestName" readonly></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" id="email" value="1muayvnrpp@superblohey.com" readonly></td>
            </tr>
            <tr>
                <td colspan="2">
                    <pre>And everything else...</pre>
                </td>
            </tr>
            <tr>
                <td><input type="button" id="continue" value="Continue to seat reservation >>"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>

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
                                                <span class="seat-label">Seat</span>
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
                    <p>Total: <span id="total"></span></p>
                    <input type="hidden" id="payable" name="payable">
                </div>
            </div>
        </div>
    </form>
</div>

<div class="footer">
    <p>ABC Cinema</p>
</div>

</body>
</html>
