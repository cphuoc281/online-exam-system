<%-- 
    Document   : register
    Created on : Sep 29, 2023, 11:22:14 AM
    Author     : cphuo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"
        ></script>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body class="img js-fullheight" style="background-image: url(assets/img/bg-masthead.jpg);">
        <section>
            <div class="container" style="display : contents">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">SIGNUP FORM</h2>
                    </div>
                </div>
                <form action="registerServlet" method="post">
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-4">
                            <div class="login-wrap p-0">
                                <div class="form-group" style="display: flex">
                                    <div class="form-group" style="padding-right: 45px">
                                        <input type="text" class="form-control" placeholder="Firstname" name="firstname" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Lastname" name="lastname" required>
                                    </div>
                                </div>
                                    <div class="form-group">
                                        <input type="text" required pattern="[0-9]{10}" class="form-control" placeholder="Phone Number" name="phonenumber" required>
                                    </div>
                                <div class="form-group">
                                    <input type="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" placeholder="Email" name="mail"  required>
                                </div>
                                <div class="form-holder">
                                    <input type="date" id="dateInput" class="form-control" placeholder="Date of Birth" name="dob" required>
                                </div>
                                <h3 class="mb-4 text-center">Are you ? </h3>
                                <div class="form-group" style="display: flex" >
                                    <div class="form-group">
                                        <input style="margin: 0" type="radio" id="teacher" name="option" value="1">
                                          <label for="teacher">Teacher</label><br>
                                    </div>
                                    <div class="form-group">
                                        <input style="margin-left: 185px"  type="radio" id="student"  name="option" value="2">
                                          <label for="student">Student</label><br>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input  type="text" class="form-control" placeholder="Username" name="username" required>
                                </div>
                                <div class="form-group">
                                    <input  type="password" id="password" class="form-control" placeholder="Password" name="password" required>
                                    <span id="togglePassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>

                                <div class="form-group">
                                    <input type="password" id="confirm_password" class="form-control" placeholder="Confirm Password" name="repassword" required>
                                    <span id="toggleConfirmPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>

                                <div  class="form-group">
                                    <button  type="submit" class="form-control btn btn-primary submit px-3">Register</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
                <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
                <script src="js/main.js"></script>
                <script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>
                <script type="text/javascript">


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
                    const confirmPasswordEye = document.getElementById('toggleConfirmPassword');
                    const confirmPassword = document.getElementById('confirm_password');

                    confirmPasswordEye.addEventListener('click', function () {
                        if (confirmPassword.type === 'password') {
                            confirmPassword.type = 'text';
                        } else {
                            confirmPassword.type = 'password';
                        }

                        confirmPasswordEye.classList.toggle('slash');
                    });
                </script>



                </body>
                </html>
