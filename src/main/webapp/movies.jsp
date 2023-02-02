<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Movie Tickets| Movies</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/moviesstyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<!--Now Showing movies -->

<jsp:include page="now-showing.jsp" />

<jsp:include page="upcoming.jsp" />

<jsp:include page="footer.jsp" />

</body>
</html>
