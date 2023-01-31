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
<nav>
    <a href="index.jsp"><div class="logo" ><img src="ABC.png" width="150px"></div></a>
</nav>
<section id="login-container">
    <div class="form">
        <input type="hidden" id="redirect" name="redirect" value="${sessionScope.redirectTo}">
        <div class="title">Admin Portal</div>
        <div class="subtitle">Only Admins allowed</div>

        <div class="input-container ic2">
            <form method="post" action="admin" class="register-form"
                  id="login-form">
                <input type="text" class="input" name="username" id="email" placeholder="" required="required"/>
                <div class="cut cut-short"></div>
                <label for="email" class="placeholder">Login</label>

                <div class="input-container ic2">
                    <input id="passw" class="input" name="password" type="password" placeholder="" required="required"/>
                    <div class="cut"></div>
                    <label for="email" class="placeholder">Key</label>
                </div>
                <input type="submit" name="signin" id="signin" class="submit" value="Log in"/>
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

</body>
</html>
