<%-- 
    Document   : ExamView
    Created on : Oct 31, 2023, 9:50:14 AM
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
        <%@include file="includes/header.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="text-center text-white">
                        <form style="margin: 20px 0" action="SearchCollection" method="post">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search"  name="search" value="${searchName}">
                                <div class="input-group-append">
                                    <button type="submit" class="input-group-text bg-transparent text-primary">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-xxl py-5">
            <div class="container">
                <div  class="row g-4 justify-content-center">
                    <c:set var="pagesize" value="3"></c:set>
                    <c:set var="page" value="${not empty param.page?param.page : 1}"></c:set>
                    <c:set var="NumPage" value="${requestScope.listExam.size()/3+1}"></c:set>
                    <c:forEach var="i" items="${requestScope.listExam}" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}">
                        <c:set var="ExamId" value="20"></c:set>
                        <div class="col-lg-4 col-md-6 wow fadeInUp ani" data-wow-delay="0.1s">
                            <div style="margin: 10px 0; border-radius: 10px" class="course-item bg-white">
                                <div class="position-relative overflow-hidden">
                                    <img class="img-fluid" src="img/course-2.jpg" alt="">
                                </div>
                                <div class="text-center p-4 pb-0">
                                    <h3 class="mb-0">${i.name}</h3>
                                    <h5 class="mb-4"></h5>
                                    <c:if test="${sessionScope.accountS!=null}">
                                        <a href="examJoin?id=${i.id}" style="text-decoration: none">
                                            <h1>Join</h1>
                                        </a>
                                    </c:if>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2"><i
                                            class="fa fa-user-tie text-primary me-2"></i> ${i.date}</small>
                                    <small class="flex-fill text-center border-end py-2"><i
                                            class="fa fa-clock text-primary me-2"></i> ${i.timeLimit}</small>
                                    <small class="flex-fill text-center py-2"><i
                                            class="fa fa-user text-primary me-2"></i> ${i.questionNumber} Question</small>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
            <div class="pagination" style="display: flex " >
                <a href="?page=1" class="page" style="padding:0 10px "><<</a>

                <c:if  var="result" test="${page > 1.0}">
                    <a href="?page=${page-1}" class="previous" style="padding:0 10px "> < </a>
                </c:if>

                <c:if  var="result" test="${page == 1.0}">
                    <a href="?page=1" class="previous" style="padding:0 10px "> < </a>
                </c:if>

                <a href="">${page}</a>

                <c:if  var="result" test="${page < NumPage.intValue()}">
                    <a href="?page=${page+1}" class="next" style="padding:0 10px "> > </a>
                </c:if>

                <c:if  var="result" test="${page == NumPage.intValue()}">
                    <a href="?page=${page}" class="next" style="padding:0 10px "> > </a>
                </c:if>
                <a href="?page=${NumPage.intValue()}" class="page" style="padding:0 10px "> >> </a>     
            </div>
            <%@include file="includes/footer.jsp" %>
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
