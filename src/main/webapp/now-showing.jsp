<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<jsp:useBean id="dbConfig" class="com.example.abccinema.envBean"/>
<sql:setDataSource
        var="source"
        driver="${dbConfig.driver}"
        url="${dbConfig.url}"
        user="${dbConfig.user}"
        password="${dbConfig.password}"
/>
<sql:query var="result" dataSource="${source}">
    select movieid,name,language,description,image_path from nowshowing;
</sql:query>

<section class="movies">
    <h2 class="movie-category">Now Showing</h2>
    <button class="pre-btn"><img src="images/arrow.png" alt=""></button>
    <button class="nxt-btn"><img src="images/arrow.png" alt=""></button>

    <ul class="movie-container" style="list-style-type: none;">
        <c:forEach var="row" items="${result.rows}">
        <li class="movie-card">
            <div class="movie-image">

                <img src="${row.image_path}" class="movie-thumb" alt="">
                <a href="booking.jsp?id=${row.movieid}"><button class="card-btn">Buy Tickets</button></a>
            </div>
            <div class="movie-info">
                <h2 class="movie-name">${row.name}</h2>
                <b> ${row.lang}</b>
                <p class="movie-short-description">${row.description}</p>
            </div>
            </c:forEach>
        </li>
    </ul>
</section>
<script src="js/script.js"></script>

