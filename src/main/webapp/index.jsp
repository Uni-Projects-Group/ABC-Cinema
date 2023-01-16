<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


</head>
<body>
<jsp:include page="header.jsp"/>

<!--Hero-->

<!-- Slideshow container -->
<jsp:include page="slider.jsp"/>


<!-- Showing Now-->


<jsp:include page="now-showing.jsp"/>

<!--Footer-->
<jsp:include page="footer.jsp"/>

</body>
</html>