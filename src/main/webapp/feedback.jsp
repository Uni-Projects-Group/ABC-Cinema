<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.userID == null}">
    <c:set var="redirectTo" value="feedback.jsp" scope="session"/>
    <c:redirect url="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/FeedbackStyle.css">

</head>
<body>
<section style="align-items: center ">
    <jsp:include page="header.jsp"/>
    <div class="FeedbackContainer">
        <div class="displayFeedback">
            <div>
                <h3>Customer Feedback</h3>
            </div>
            <form method="POST" action="collector">
                <table>
                    <tr>
                        <td><textarea rows="4" cols="50" name="feedback" placeholder="Enter feedback here..."></textarea></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="send"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</section>
</body>
</html>
