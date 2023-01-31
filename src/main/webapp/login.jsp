<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="css/loginstyle.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<input type="hidden" id="status" value="${requestScope.status}">
<jsp:include page="header.jsp"/>
<section id="login-container">
    <div class="form">
        <div class="title">Welcome</div>
        <div class="subtitle">Reserve your seats in no time!</div>

        <div class="input-container ic2">
            <form method="post" action="login" class="register-form" id="login-form">
                <input type="hidden" id="redirect" name="redirect" value="${sessionScope.redirectTo}">
                <input type="text" class="input" name="email" id="email"
                       placeholder=" " required="required"/>
                <div class="cut cut-short"></div>
                <label for="email" class="placeholder">Email</label>

                <div class="input-container ic2">
                    <input id="passw" class="input" name="password" type="password" placeholder=" " required="required"/>
                    <div class="cut"></div>
                    <label for="email" class="placeholder">Password</label>
                    <a href="forgotPassword.jsp">Forgot Password?</a>
                </div>

                <input type="submit" name="signin" id="signin"
                       class="submit" value="Log in"/>

                <div>
                    <a href="register.jsp"><p>Create account</p></a>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- JS -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.min.css">
<script type="text/javascript">
    window.addEventListener('DOMContentLoaded', event => {
        const status = document.getElementById("status").value;
        const redirect = document.getElementById("redirect").value;
        if (status === "failed") {
            Swal.fire("Sorry", "Wrong username or password", "error");
        } else if (status === "invalidEmail") {
            Swal.fire("Sorry", "Please enter your email", "error");
        } else if (status === "invalidUpwd") {
            Swal.fire("Sorry", "Please enter your password", "error");
        } else if (status === "resetSuccess") {
            Swal.fire("Congrats", "Password reset successfully", "success");
        } else if (status === "resetFailed") {
            Swal.fire("Sorry", "Password reset failed", "error");
        } else if (redirect !== "") {
            Swal.fire("Sorry", "You must login to continue", "error");
        }
    })
</script>
<jsp:include page="footer.jsp"/>

</body>
</html>
