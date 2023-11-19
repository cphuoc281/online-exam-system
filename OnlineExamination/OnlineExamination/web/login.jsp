<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/style.css"/>
    </head>

    <body class="img js-fullheight" style="background-image: url(assets/img/bg-masthead.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Welcome to Online Exam</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Login</h3>
                            <form  class="signin-form" action="LoginServlet" method="post">
                                <div class="form-group">
                                    <input name="username" value="${uname}" type="text" class="form-control" placeholder="Username" required="">
                                </div>
                                <div class="form-group">
                                    <input name="pass" value="${upass}" id="password" type="password" class="form-control" placeholder="Password" required="">
                                    <span id="togglePassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div  class="form-group">
                                    <button  type="submit" class="form-control btn btn-primary submit px-3"  >Sign In</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <label class="checkbox-wrap checkbox-primary" style="color: #fff ">Remember Me
                                            <input type="checkbox" >
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="ForgotPassword.jsp" style="color: #fff">Forgot Password</a>
                                    </div>
                                </div>
                            </form>
                            <div class=" text-center" >
                                <p>Not a member? <a href="register.jsp" >Register</a></p>
                            </div>
                            <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                            <div class="social d-flex text-center">
                                <a href="ForgotPassword.jsp" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
                                <a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Google</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script>
            const eye = document.getElementById('togglePassword');
            const password = document.getElementById('password');

            eye.addEventListener('click', function () {

                // Toggle password visibility
                if (password.type === 'password') {
                    password.type = 'text';
                } else {
                    password.type = 'password';
                }

                // Toggle slash on eye icon
                eye.classList.toggle('slash');

            });
        </script>


    </body>

</html>