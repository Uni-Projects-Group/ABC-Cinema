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
        <div class="subtitle">Let's create your account!</div>


        <div class="input-container ic1">

            <form method="post" action="register" class="register-form"
                  id="register-form">

                <div class="input-container ic2">
                    <input id="firstname" class="input" type="text" placeholder=" " name="name" required="required"/>
                    <div class="cut"></div>
                    <label for="firstname" class="placeholder">Name</label>
                </div>

                <div class="input-container ic2">
                    <input id="email" name="email" class="input" type="text" placeholder=" "/>
                    <div class="cut cut-short"></div>
                    <label for="email" class="placeholder" name="email">Email</label>
                </div>
                <div class="input-container ic2">
                    <input id="contact" class="input" type="text" placeholder=" " name="contact" required="required"/>
                    <div class="cut cut-short"></div>
                    <label for="firstname" class="placeholder">Phone</label>
                </div>
                <div class="input-container ic2">
                    <input id="passw" name="pass" class="input" type="password" placeholder=" "/>
                    <div class="cut"></div>
                    <label for="email" class="placeholder" name="pass">Password</label>
                </div>
                <div class="input-container ic2">
                    <input id="re-passw" class="input" type="password" placeholder=" " name="re_pass"/>
                    <div class="cut"></div>
                    <label for="email" class="placeholder" name="pass">Confirm-Password</label>
                </div>
                <button type="text" class="submit">Create</button>
                <div>
                    <a href="login.jsp"><p>Already have an account?</p></a>
                </div>
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
    if(status === "success"){
      Swal.fire("Congrats","Account created successfully. Please head to login page to continue.","success");
    } else if(status === "invalidName"){
      Swal.fire("Invalid","Please Enter Name","error");
    } else if(status === "invalidEmail"){
      Swal.fire("Invalid","Please Enter Email","error");
    } else if(status === "invalidUpwd"){
      Swal.fire("Invalid","Please Enter Password","error");
    } else if(status === "invalidConfirmPassword"){
      Swal.fire("Invalid","Password dont match","error");
    } else if(status === "invalidMobile"){
      Swal.fire("Invalid","Please Enter Mobile","error");
    } else if(status === "invalidMobileLength"){
      Swal.fire("Invalid","Mobile number should be 10 digits","error");
    }
  })
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>
