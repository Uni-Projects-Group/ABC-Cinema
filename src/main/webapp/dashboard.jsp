<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<!DOCTYPE html>
<html>
<head>
    <title>ABC Cinema | Admin Panel</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/account.css">
    <style>
        .spacer {
            margin: 1% 0;
        }
    </style>
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
    <div>
        <h1>Now Showing section</h1>
        <sql:query var="nowshowing" dataSource="${source}">
            select * from nowshowing;
        </sql:query>
        <table style="color: white">
            <tr>
                <th>Name</th>
                <th>Genre</th>
                <th>Language</th>
                <th>Time slot</th>
                <th>Description</th>
                <th>Image URL</th>
                <th>Director</th>
                <th>Trailer</th>
            </tr>
            <c:forEach var="row" items="${nowshowing.rows}">
                <tr>
                    <td>${row.name}</td>
                    <td>${row.genre}</td>
                    <td>${row.Language}</td>
                    <td>${row.Timeslot}</td>
                    <td>${row.description}</td>
                    <td>${row.image_path}</td>
                    <td>${row.Director}</td>
                    <td>${row.Trailer}</td>
                </tr>
            </c:forEach>
        </table>
        <hr class="spacer">
        <span>Add a record to Now Showing section</span>
        <form action="manage" method="post">
            <input type="hidden" name="manage_action" value="insert_nowshowing">
            <input type="text" name="mov_name" placeholder="Name" required="required">
            <input type="text" name="mov_genre" placeholder="Genre" required="required">
            <input type="text" name="mov_lang" placeholder="Language" required="required">
            <input type="text" name="mov_time" placeholder="Time (8:00 AM)" required="required">
            <input type="text" name="mov_desc" placeholder="Description" required="required">
            <input type="text" name="mov_img" placeholder="Banner URL" required="required">
            <input type="text" name="mov_dir" placeholder="Director" required="required">
            <input type="text" name="mov_vid" placeholder="Movie Trailer" required="required">
            <br>
            <input type="submit" value="Add Record">
        </form>
        <hr class="spacer">
        <span>Remove a record from Now Showing section</span>
        <form action="manage" method="post">
            <input type="hidden" name="manage_action" value="delete_nowshowing">
            <label for="nowshowing_id">Choose a movie to remove:</label>
            <select name="mov_id" id="nowshowing_id">
                <c:forEach var="row" items="${nowshowing.rows}">
                    <option value="${row.movieid}">${row.name}</option>
                </c:forEach>
            </select>
            <br>
            <input type="submit" value="Remove Record">
        </form>
    </div>
    <hr class="spacer">
    <div>
        <h1>Upcoming section</h1>
        <sql:query var="upcoming" dataSource="${source}">
            select * from upcoming_mov;
        </sql:query>
        <table style="color: white">
            <tr>
                <th>Name</th>
                <th>Genre</th>
                <th>Language</th>
                <th>Description</th>
                <th>Image URL</th>
            </tr>
            <c:forEach var="row" items="${upcoming.rows}">
                <tr>
                    <td>${row.mov_name}</td>
                    <td>${row.genre}</td>
                    <td>${row.mov_lang}</td>
                    <td>${row.mov_desc}</td>
                    <td>${row.banner}</td>
                </tr>
            </c:forEach>
        </table>
        <hr class="spacer">
        <span>Add a record to Upcoming section</span>
        <form action="manage" method="post">
            <input type="hidden" name="manage_action" value="insert_nowshowing">
            <input type="text" name="mov_name" placeholder="Name" required="required">
            <input type="text" name="mov_genre" placeholder="Genre" required="required">
            <input type="text" name="mov_lang" placeholder="Language" required="required">
            <input type="text" name="mov_desc" placeholder="Description" required="required">
            <input type="text" name="mov_img" placeholder="Banner URL" required="required">
            <br>
            <input type="submit" value="Add Record">
        </form>
        <hr class="spacer">
        <span>Remove a record from Upcoming section</span>
        <form action="manage" method="post">
            <input type="hidden" name="manage_action" value="delete_nowshowing">
            <label for="upcoming_id">Choose a movie to remove:</label>
            <select name="mov_id" id="upcoming_id">
                <c:forEach var="row" items="${upcoming.rows}">
                    <option value="${row.mov_id}">${row.mov_name}</option>
                </c:forEach>
            </select>
            <br>
            <input type="submit" value="Remove Record">
        </form>
    </div>
</div>
</body>
</html>
