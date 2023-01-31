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
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/FeedbackStyle.css">
</head>
<body>
<input type="hidden" id="status" value="${requestScope.status}">
<jsp:include page="header.jsp"/>
<section style="align-items: center ">
    <div class="FeedbackContainer">
        <div class="displayFeedback">
            <div>
                <h3>Customer Feedback</h3>
            </div>
            <form method="POST" action="collector">
                <table>
                    <tr>
                        <td><textarea rows="8" cols="64" name="feedback" placeholder="Enter feedback here..."></textarea></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</section>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.min.css">
<script type="text/javascript">
    window.addEventListener('DOMContentLoaded', event => {
        const status = document.getElementById("status").value;
        if (status === "failed") {
            Swal.fire("Sorry", "Failed to submit feedback. Please try again later.", "error");
        } else if (status === "success") {
            Swal.fire("Success", "Feedback received. Thank you!", "success");
        }
    })
</script>
</body>
</html>
