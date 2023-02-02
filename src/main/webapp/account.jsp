<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:if test="${sessionScope.userID == null}">
    <c:set var="redirectTo" value="account.jsp" scope="session"/>
    <c:redirect url="login.jsp"/>
</c:if>
<jsp:useBean id="dbConfig" class="com.example.abccinema.envBean"/>
<sql:setDataSource
        var="source"
        driver="${dbConfig.driver}"
        url="${dbConfig.url}"
        user="${dbConfig.user}"
        password="${dbConfig.password}"
/>
<html>
<head>
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/account.css">
</head>
<body>
<jsp:include page="header.jsp"/>

<sql:query var="user" dataSource="${source}">
    select * from users where id = ${sessionScope.userID}
</sql:query>

<sql:query var="history" dataSource="${source}">
    select orderId,movieId,purchaseId,reserved from purchase_history where userId = ${sessionScope.userID}
</sql:query>

<div class="AcDetailsContainer">
    <div class="displayuser">
        <div>
            <h3>Account Details</h3>
            <table>
                <c:forEach var="row" items="${user.rows}">
                    <tr>
                        <td>Username:</td>
                        <td>${row.uname}</td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>${row.uemail}</td>
                    </tr>
                    <tr>
                        <td>Contact:</td>
                        <td>${row.umobile}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div>
            <h3>Booking History</h3>
            <table>

                <tr>
                    <th>Order ID</th>
                    <th>Movie</th>
                    <th>Time slot</th>
                    <th>Reserved Seats</th>
                </tr>
                <c:forEach var="row" items="${history.rows}">
                    <sql:query var="movie" dataSource="${source}">
                        select * from nowshowing where movieid = ${row.movieid}
                    </sql:query>
                    <tr>
                        <td>${row.orderId}</td>
                        <c:forEach var="mov" items="${movie.rows}">
                            <td>${mov.name}</td>
                            <td>${mov.Timeslot}</td>
                        </c:forEach>
                        <td>${row.reserved}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

</body>
</html>
