<%-- 
    Document   : GetPassword
    Created on : Oct 6, 2023, 4:38:42 PM
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
        <link rel="stylesheet" href="css/style.css"/>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"
        ></script>
    </head>
    <body class="img js-fullheight" style="background-image: url(assets/img/bg-masthead.jpg); height: 100vh;">
        
        <section class="ftco-section">
            <div class="container" style="padding: 5em;">
                <div class="row justify-content-center">
                        <h2 class="heading-section">Password Management</h2>
                    </div>
                <div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="form-group">
                            <div class="mb-4 text-center">
                                <a href="#"
                                   ><img
                                        src="assets/img/logo4.png"
                                        class="mb-4"
                                        alt="logo-icon"
                                        /></a>
                                <p style="color: #fff">Fill the form to reset your password.</p>
                            </div>
                            <form action="SetPasswordServlet" method="post">
                                <div class="form-group">
                                    <input
                                        type="email"
                                        required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                        class="form-control"
                                        name="mail"
                                        placeholder="Enter Your Email "
                                        required
                                        />
                                </div>
                                <!-- Button -->
                                <div  class="form-group">
                                    <button  type="submit" class="form-control btn btn-primary submit px-3">Confirm</button>
                                </div>
                            </form>
                                <div class=" text-center" >
                                    <p style="color: #fff">Return to ---> <a href="login.jsp" >Register</a></p>
                            </div>
                        </div>
                    </div>
                       <div>
                </div>
            </div>
        </section>
    </body>
</html>
