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
    select mov_id,mov_name,mov_lang,mov_desc from upcoming_mov;
</sql:query>

<section class="movies">
    <h2 class="movie-category">Upcoming Movies</h2>
    <button class="pre-btn"><img src="images/arrow.png" alt=""></button>
    <button class="nxt-btn"><img src="images/arrow.png" alt=""></button>

    <ul class="movie-container" style="list-style-type: none;">
        <c:forEach var="row" items="${result.rows}">
        <li class="movie-card">
            <div class="movie-image">
                <img src="https://picsum.photos/500/300/?image=${row.mov_id}" class="movie-thumb" alt="">
                <a href="booking.jsp?id=${row.mov_id}"><button class="card-btn">Buy Tickets</button></a>
            </div>
            <div class="movie-info">
                <h2 class="movie-name">${row.mov_name}</h2>
                <b> ${row.lang}</b> </p>
                <p class="movie-short-description">${row.mov_desc}</p>
            </div>
            </c:forEach>
        </li>
    </ul>
</section>
<script src="js/movie.js"></script>

