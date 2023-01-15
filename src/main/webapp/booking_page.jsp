<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ticket UI Page</title>
    <link rel="stylesheet" type="text/css" href="css/booking.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
<div>
    <nav>
        <div class="logo"><img src="ABC.png" alt="logo"></div>
        <ul>
            <li><a href="">LOG IN</a></li>
            <li><a href="">HOME</a></li>
            <li><a href="">NOW SHOWING</a></li>
            <li><a href="">TICKETS</a></li>
        </ul>
    </nav>
</div>
<br>

<br> <br> <br>
<div class="movie1">
    <form name="form1">
        <label> SELECT date</label>
        <select>
            <option value="1/14/2023">14th January 2023</option>
            <option value="1/15/2023">15th January 2023</option>
            <option value="1/16/2023">16th January 2023</option>
            <option value="1/17/2023">17th January 2023</option>
        </select>

        <sql:query var="movie" dataSource="${source}">
            select * from nowshowing where movieid=?;
            <sql:param value="${param.id}"/>
        </sql:query>


        <c:forEach var="row" items="${movie.rows}">
            <h1 class="Movie">${row.name}</h1>
            <pre><h2>${row.Language} Movie</h2></pre>
            <input type="button" id="B1" value="${row.Timeslot}">
        </c:forEach>
    </form>
</div>
<script src="js/movie.js">
</script>
</body>
</html>
