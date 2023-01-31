<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav>
    <a href="index.jsp">
        <div class="logo"><img src="ABC.png" width="150px"></div>
    </a>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="movies.jsp">Movies</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
        <c:choose>
            <c:when test="${sessionScope.userID != null}">
                <li><a href="account.jsp">Account</a></li>
                <li><a href="logout">Logout</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="login.jsp">Login</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>                                                                                                                                                  
