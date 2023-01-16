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
    <title>ABC Cinema | Admin Portal</title>
    <link rel="stylesheet" href="css/loginstyle.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="body" style="margin-top: 100px; color: white !important;">
    <h1>Customer Feedback</h1>
    <table>
        <tr>
            <th>Customer Email</th>
            <th>Feedback</th>
        </tr>
        <c:forEach var="row" items="${feedback.rows}">
            <tr>
                <td>${row.userID}</td>
                <td>${row.message}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
