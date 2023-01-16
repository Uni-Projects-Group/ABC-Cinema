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
    <link rel="stylesheet"
          href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<input type="hidden" id="status" value="${requestScope.status}">

<div class="main">

    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Sign up</h2>

                    <form method="post" action="register" class="register-form"
                          id="register-form">
                        <div class="form-group">
                            <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> <input
                                type="text" name="name" id="name" placeholder="Your Name" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="zmdi zmdi-email"></i></label> <input
                                type="email" name="email" id="email" placeholder="Your Email" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
                                type="password" name="pass" id="pass" placeholder="Password" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="password" name="re_pass" id="re_pass"
                                   placeholder="Repeat your password" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="text" name="contact" id="contact"
                                   placeholder="Contact no" required="required"/>
                        </div>
                        <div class="form-group" hidden="hidden">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term"/>
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I
                            agree all statements in <a href="#" class="term-service">Terms
                                of service</a></label>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup"
                                   class="form-submit" value="Register"/>
                        </div>
                    </form>
                </div>
                <div class="signup-image">
                    <figure>
                        <img src="images/signup-image.jpg" alt="sing up image">
                    </figure>
                    <a href="login.jsp" class="signup-image-link">I am already member</a>
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
    window.addEventListener('DOMContentLoaded', event => {
        const status = document.getElementById("status").value;
        if(status === "success"){
            Swal.fire("Congrats","Account created successfully. Please head to login page to continue.","success");
        } else if(status === "invalidName"){
            Swal.fire("Congrats","Please Enter Name","error");
        } else if(status === "invalidEmail"){
            Swal.fire("Congrats","Please Enter Email","error");
        } else if(status === "invalidUpwd"){
            Swal.fire("Congrats","Please Enter Password","error");
        } else if(status === "invalidConfirmPassword"){
            Swal.fire("Congrats","Password dont match","error");
        } else if(status === "invalidMobile"){
            Swal.fire("Congrats","Please Enter Mobile","error");
        } else if(status === "invalidMobileLength"){
            Swal.fire("Congrats","Mobile number should be 10 digits","error");
        }
    })
</script>
</body>
</html>
