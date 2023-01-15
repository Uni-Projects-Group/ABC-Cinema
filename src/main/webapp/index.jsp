    <%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"
          crossorigin="anonymous">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
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
<!--Hero-->

<!-- Slideshow container -->
<div class="slideshow-container important">

    <!-- Full-width images with number and caption text -->
    <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="https://picsum.photos/500/300/?image=2" style="width:100%" alt="Important news">
        <div class="text">Caption Text</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="https://picsum.photos/500/300/?image=1" style="width:100%">
        <div class="text">Caption Two</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="https://picsum.photos/500/300/?image=3" style="width:100%">
        <div class="text">Caption Three</div>
    </div>

    <!-- Next and previous buttons -->
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <span class="dot" onclick="currentSlide(3)"></span>
</div>

<!-- Showing Now-->
<div class="now-showing">
    <div class="now-showingtext">
        <h2>NOW SHOWING</h2>
    </div>
</div>

<div class="main">
    <ul class="moviecards">
        <c:forEach var="row" items="${result.rows}">
            <li class="cards_item">
                <div class="card">
                    <div class="card_image"><img src="https://picsum.photos/500/300/?image=${row.mov_id}"></div>
                    <div class="card_content">
                        <h2 class="card_title">${row.mov_name}</h2>
                        <p class="card_text">${row.mov_lang}</p>
                        <a href="movie.jsp?id=${row.mov_id}">
                            <button class="btn card_btn">Read More</button>
                        </a>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>

<!--Footer-->

</body>
</html>
