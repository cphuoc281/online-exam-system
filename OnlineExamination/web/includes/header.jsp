<%-- 
    Document   : header
    Created on : Oct 30, 2023, 2:14:19 PM
    Author     : Phuoc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
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
                        <li><a class="btn" href="CreateExam.jsp">Exam</a></li>
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
        
    </body>
</html>
