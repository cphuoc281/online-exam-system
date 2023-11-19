<%-- 
    Document   : home
    Created on : Sep 25, 2023, 4:13:10 PM
    Author     : cphuo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Online Exam Page </title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-light static-top">
            <div class="container">
                <a href="home.jsp">
                    <div class="header-content">
                        <img src="assets/img/logo4.png" alt="Logo" class="logo" href="home.jsp">
                    </div>
                </a>
                <div class="btn">
                    <ul class="nav">
                        <li><a class="btn" href="home.jsp">Home</a></li>
                            <c:if test="${accountS.role ==0}"> 
                            <li><a class="btn" href="admin.jsp">Admin Page</a></li>
                            </c:if>
                        <li><a class="btn" href="listCollectionDetail">Courses </a></li>
                        <li><a class="btn" href="listExam?id=${accountS.id}">Exam</a></li>
                            <c:if test="${sessionScope.accountS==null}">                
                            <li><a  href="login.jsp" class="btn">Sign In</a></li>
                            </c:if>
                            <c:if test="${sessionScope.accountS!=null}">
                            <li>
                                <a class="btn" href="#">
                                    Account: ${sessionScope.accountS.username}
                                </a>
                                <ul  class="subnav">
                                    <li><a href="profileServlet?pid=${accountS.id}" class="btn">My profile</a></li>
                                        <c:if test="${sessionScope.accountS.getRole()!=2}"> 
                                            <c:if test="${sessionScope.accountS!=null}"> 
                                            <li><a href="myCourses?id=${accountS.id}" class="btn">My Courses</a></li>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${sessionScope.accountS.getRole()!=2}"> 
                                            <c:if test="${sessionScope.accountS!=null}"> 
                                            <li><a href="myExams?id=${accountS.id}" class="btn">My Exams</a></li>
                                            </c:if>
                                        </c:if>
                                    <li><a href="myEnrollment?id=${accountS.id}" class="btn">My Enrollment</a></li>
                                    <li><a href="logoutServlet" class="btn">Logout</a></li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container position-relative">
                <div class="row justify-content-center">
                    <div class="col-xl-6">
                        <div class="text-center text-white">
                            <!-- Page heading-->
                            <h1 class="mb-5">Achieve your goals with online exam!</h1>
                            <!-- Signup form-->
                            <!-- * * * * * * * * * * * * * * *-->
                            <!-- * * SB Forms Contact Form * *-->
                            <!-- * * * * * * * * * * * * * * *-->
                            <!-- This form is pre-integrated with SB Forms.-->
                            <!-- To make this form functional, sign up at-->
                            <!-- https://startbootstrap.com/solution/contact-forms-->
                            <!-- to get an API token!-->
                            <form class="form-subscribe" id="contactForm" data-sb-form-api-token="API_TOKEN">
                                <!-- Email address input-->
                                <div class="row gx-4 gx-lg-5 justify-content-center">
                                    <div class="col-lg-8 text-center">
                                        <hr class="divider divider-light" />
                                        <a class="btnn btn-light btn-xl" href="login.jsp" style="background-color: #fbceb5">Get started!</a>
                                        <div>
                                            <div>
                                                <!-- Submit success message-->
                                                <!---->
                                                <!-- This is what your users will see when the form-->
                                                <!-- has successfully submitted-->
                                                <div class="d-none" id="submitSuccessMessage">
                                                    <div class="text-center mb-3">
                                                        <div class="fw-bolder">Form submission successful!</div>
                                                        <p>To activate this form, sign up at</p>
                                                        <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                                    </div>
                                                </div>
                                                <!-- Submit error message-->
                                                <!---->
                                                <!-- This is what your users will see when there is-->
                                                <!-- an error submitting the form-->
                                                <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </header>
                                <!-- Icons Grid-->
                                <section class="features-icons bg-light text-center">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                                                    <div class="features-icons-icon d-flex"><i class="bi-window m-auto text-primary"></i></div>
                                                    <h3>Diverse Courses</h3>
                                                    <p class="lead mb-0">Courses catering to your job and education are available for you to choose from!</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                                                    <div class="features-icons-icon d-flex"><i class="bi-layers m-auto text-primary"></i></div>
                                                    <h3>Free Online Test</h3>
                                                    <p class="lead mb-0">Get an indication of your proficiency to help you learn better!</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="features-icons-item mx-auto mb-0 mb-lg-3">
                                                    <div class="features-icons-icon d-flex"><i class="bi-terminal m-auto text-primary"></i></div>
                                                    <h3>Seft-study Course</h3>
                                                    <p class="lead mb-0">Learn at your own pace, in your own time, with a self-study course!</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <!-- Image Showcases-->
                                <section class="showcase">
                                    <div class="container-fluid p-0">
                                        <div class="row g-0">
                                            <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('assets/img/bg-showcase-4.jpg')"></div>
                                            <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                                                <h2>Diverse Courses</h2>
                                                <p class="lead mb-0">When you take our courses, you will acquire all the necessary knowledge. That will provide you with a solid foundation to be able to study and work more effectively!</p>
                                            </div>
                                        </div>
                                        <div class="row g-0">
                                            <div class="col-lg-6 text-white showcase-img" style="background-image: url('assets/img/bg-showcase-5.png')"></div>
                                            <div class="col-lg-6 my-auto showcase-text">
                                                <h2>Take our multiple choice test</h2>
                                                <p class="lead mb-0">This online test will give you an approximate indication of the qualification you are working towards or completing.Each question is in the format of multiple choice and you will have a choice of four possible answers!</p>
                                            </div>
                                        </div>
                                        <div class="row g-0">
                                            <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('assets/img/bg-showcase-3.jpg')"></div>
                                            <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                                                <h2>Self-initiative in learning</h2>
                                                <p class="lead mb-0">It helps students learn proactively, search for information, practice and do exercises by themselves, and conquer exams on their own. Not only this online platform, but any similar online education platform, the effort and awareness for self-studying should be the top priority!</p>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <!-- Testimonials-->
                                <section class="testimonials text-center bg-light">
                                    <div class="container">
                                        <h2 class="mb-5">What people are saying...</h2>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                                                    <img class="img-fluid rounded-circle mb-3" src="assets/img/testimonials-1.jpg" alt="..." />
                                                    <h5>Margaret E.</h5>
                                                    <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                                                    <img class="img-fluid rounded-circle mb-3" src="assets/img/testimonials-2.jpg" alt="..." />
                                                    <h5>Fred S.</h5>
                                                    <p class="font-weight-light mb-0">"Studying and taking tests on the website is amazing. It helps me save time while still acquiring all the necessary knowledge!"</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                                                    <img class="img-fluid rounded-circle mb-3" src="assets/img/testimonials-3.jpg" alt="..." />
                                                    <h5>Sarah W.</h5>
                                                    <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <!-- Call to Action-->
                                <!--                                <section class="call-to-action text-white text-center" id="signup">
                                                                    <div class="container position-relative">
                                                                        <div class="row justify-content-center">
                                                                            <div class="col-xl-6">
                                                                                <h2 class="mb-4">Ready to get started? Sign up now!</h2>
                                                                                 Signup form
                                                                                 * * * * * * * * * * * * * * *
                                                                                 * * SB Forms Contact Form * *
                                                                                 * * * * * * * * * * * * * * *
                                                                                 This form is pre-integrated with SB Forms.
                                                                                 To make this form functional, sign up at
                                                                                 https://startbootstrap.com/solution/contact-forms
                                                                                 to get an API token!
                                                                                <form class="form-subscribe" id="contactFormFooter" data-sb-form-api-token="API_TOKEN">
                                                                                     Email address input
                                                                                    <div class="row">
                                                                                        <div class="col">
                                                                                            <input class="form-control form-control-lg" id="emailAddressBelow" type="email" placeholder="Email Address" data-sb-validations="required,email" />
                                                                                            <div class="invalid-feedback text-white" data-sb-feedback="emailAddressBelow:required">Email Address is required.</div>
                                                                                            <div class="invalid-feedback text-white" data-sb-feedback="emailAddressBelow:email">Email Address Email is not valid.</div>
                                                                                        </div>
                                                                                        <div class="col-auto"><button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">Submit</button></div>
                                                                                    </div>
                                                                                     Submit success message
                                                                                    
                                                                                     This is what your users will see when the form
                                                                                     has successfully submitted
                                                                                    <div class="d-none" id="submitSuccessMessage">
                                                                                        <div class="text-center mb-3">
                                                                                            <div class="fw-bolder">Form submission successful!</div>
                                                                                            <p>To activate this form, sign up at</p>
                                                                                            <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                                                                        </div>
                                                                                    </div>
                                                                                     Submit error message
                                                                                    
                                                                                     This is what your users will see when there is
                                                                                     an error submitting the form
                                                                                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </section>-->
                                <!-- Footer-->
                                <footer class="footer">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                                                <ul class="list-inline mb-2">
                                                    <li class="list-inline-item"><a href="#!">About</a></li>
                                                    <li class="list-inline-item">⋅</li>
                                                    <li class="list-inline-item"><a href="#!">Contact</a></li>
                                                    <li class="list-inline-item">⋅</li>
                                                    <li class="list-inline-item"><a href="#!">Terms of Use</a></li>
                                                    <li class="list-inline-item">⋅</li>
                                                    <li class="list-inline-item"><a href="#!">Privacy Policy</a></li>
                                                </ul>
                                                <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2023. All Rights Reserved.</p>
                                            </div>
                                            <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                                                <ul class="list-inline mb-0">
                                                    <li class="list-inline-item me-4">
                                                        <a href="#!"><i class="bi-facebook fs-3"></i></a>
                                                    </li>
                                                    <li class="list-inline-item me-4">
                                                        <a href="#!"><i class="bi-twitter fs-3"></i></a>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <a href="#!"><i class="bi-instagram fs-3"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    </footer>
                                    <!-- Bootstrap core JS-->
                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                                    <!-- Core theme JS-->
                                    <script src="js/scripts.js"></script>
                                    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
                                    <!-- * *                               SB Forms JS                               * *-->
                                    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
                                    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
                                    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
                                    </body>
                                    </html>

