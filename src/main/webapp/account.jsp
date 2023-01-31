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
<sql:query var="history" dataSource="${source}">
    select * from purchase_history where userId = ${sessionScope.userID}
</sql:query>
<html>
<head>
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/account.css">

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="AcDetailsContainer">
    <div class="displayuser">
        <div>
            <h3>Booking History</h3>
        </div>
        <table>

            <tr>
                <td>Order ID</td>
                <td>Movie</td>
                <td>reserved</td>
            </tr>
            <c:forEach var="row" items="${history.rows}">
                <tr>
                    <td>${row.userId}</td>
                    <td>${row.movieId}</td>
                    <td>${row.reserved}</td>
                </tr>
            </c:forEach>


        </table>
    </div>
</div>


</body>
</html>
