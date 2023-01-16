<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav>
    <a href="index.jsp"><div class="logo" ><img src="ABC.png" width="150px"></div></a>
  <ul>
    <li><a href="index.jsp">Home</a></li>
    <li><a href="movies.jsp">Movies</a></li>
    <c:choose>
      <c:when test="${sessionScope.userID == null}">
        <li><a href="account.jsp">LOGIN</a></li>
      </c:when>
      <c:otherwise>
        <li><a href="login.jsp">LOGIN</a></li>
      </c:otherwise>
    </c:choose>
  </ul>
</nav>                                                                                                                                                  
