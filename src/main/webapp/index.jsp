<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <!--
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    -->
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