<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ABC Cinema</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<input type="hidden" id="status" value="${requestScope.status}">

<div class="main">

    <!-- Sing in  Form -->
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure>
                        <img src="images/signin-image.jpg" alt="sing up image">
                    </figure>
                    <a href="register.jsp" class="signup-image-link">Create an account</a>
                </div>

                <div class="signin-form">
                    <h2 class="form-title">Sign In</h2>
                    <form method="post" action="login" class="register-form"
                          id="login-form">
                        <div class="form-group">
                            <label for="email"><i
                                    class="zmdi zmdi-account material-icons-name"></i></label> <input
                                type="text" name="email" id="email"
                                placeholder="Your Email" required="required"/>

                        </div>
                        <div class="form-group">
                            <label for="password"><i class="zmdi zmdi-lock"></i></label> <input
                                type="password" name="password" id="password"
                                placeholder="Password" required="required"/>
                        </div>
                        <div class="form-group">
                            <a href="forgotPassword.jsp">Forgot Password?</a>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin"
                                   class="form-submit" value="Log in"/>
                        </div>
                    </form>
                    <div class="social-login" hidden="hidden">
                        <span class="social-label">Or login with</span>
                        <ul class="socials">
                            <li><a href="#"><i
                                    class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                            <li><a href="#"><i
                                    class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                            <li><a href="#"><i
                                    class="display-flex-center zmdi zmdi-google"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>

<!-- JS -->
<script src="js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.min.css">
<script type="text/javascript">
    const status = document.getElementById("status").value;
    if (status === "failed") {
        Swal.fire("Sorry", "Wrong Username or Password", "error");
    } else if (status === "invalidEmail") {
        Swal.fire("Sorry", "Please Enter User Email", "error");
    } else if (status === "invalidUpwd") {
        Swal.fire("Sorry", "Please Enter Password", "error");
    } else if (status === "resetSuccess") {
        Swal.fire("Congrats", "Password reset successfully", "success");
    } else if (status === "resetFailed") {
        Swal.fire("Sorry", "Password reset failed", "error");
    }
</script>
</body>
</html>
