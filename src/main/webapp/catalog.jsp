<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Tickets| Movies</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/moviesstyle.css">
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
<sql:query var="result" dataSource="${source}">
    select * from dummy_records;
</sql:query>

<jsp:include page="template/ABCheader.html"/>

<!--Now Showing movies -->

<div class="now-showing">
    <div class="now-showingtext">
        <h2>NOW SHOWING</h2>
    </div>
</div>

<section id="now-showing">
    <ul class="moviecards">
        <c:forEach var="row" items="${result.rows}">
            <li class="cards_item">
                <div class="card">
                    <div class="card_image"><img src="https://picsum.photos/500/300/?image=${row.mov_id}"></div>
                    <div class="card_content">
                        <h2 class="card_title">${row.mov_name}</h2>
                        <p class="card_text">${row.mov_desc}</p>
                        <a href="movie.jsp?id=${row.mov_id}">
                            <button class="btn card_btn">Read More</button>
                        </a>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</section>


</body>
</html>