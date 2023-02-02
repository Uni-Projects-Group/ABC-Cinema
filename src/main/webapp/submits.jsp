<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:if test="${sessionScope.adminID == null}">
    <c:set var="redirectTo" value="dashboard.jsp" scope="session"/>
    <c:redirect url="portal.jsp"/>
</c:if>
<jsp:useBean id="dbConfig" class="com.example.abccinema.envBean"/>
<sql:setDataSource
        var="source"
        driver="${dbConfig.driver}"
        url="${dbConfig.url}"
        user="${dbConfig.user}"
        password="${dbConfig.password}"
/>
<sql:query var="feedback" dataSource="${source}">
    select * from feedback;
</sql:query>
<!DOCTYPE html>
<html>
<head>
    <title>ABC Cinema | Admin Panel</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/account.css">
</head>
<body>
<nav>
    <a href="index.jsp">
        <div class="logo"><img src="ABC.png" width="150px"></div>
    </a>
    <ul>
        <li><a href="dashboard.jsp">Dashboard</a></li>
        <li><a href="submits.jsp">Feedback</a></li>
    </ul>
</nav>

<div class="AcDetailsContainer" style="display: block; padding: 96px 64px; color: white">
    <div class="displayuser">
        <h3>Customer Feedback</h3>
        <table>
            <tr>
                <th>Customer Email</th>
                <th>Feedback</th>
            </tr>
            <c:forEach var="row" items="${feedback.rows}">
                <sql:query var="user" dataSource="${source}">
                    select uemail from users where id = ${row.userID};
                </sql:query>
                <tr>
                    <c:forEach var="user_details" items="${user.rows}">
                        <td>${user_details.uemail}</td>
                    </c:forEach>
                    <td>${row.message}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
