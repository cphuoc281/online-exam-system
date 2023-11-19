<%-- 
    Document   : SearchExam
    Created on : Nov 14, 2023, 9:53:52 AM
    Author     : Phuoc
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <section style="margin-top: 30px">

            <div class="text-center container py-5">
                <form style="margin: 20px 0" action="SearchExam" method="post">
                    <div class="search-container">
                                <input type="text" id="searchInput" placeholder="Search"  name="search" value="${searchName}">
                                <div class="input-group-append">
                                    <button id="searchButton" type="submit" >
                                        <i id="searchIcon" class="fa-solid fa-magnifying-glass"></i>
                                    </button>
                                </div>
                            </div>
                </form>

                <div class="row">
                    <c:forEach var="i" items="${requestScope.listExam}" >
                                <c:set var="ExamId" value="20"></c:set>
                        <div class="col-lg-4 col-md-12 mb-4" >
                            <div style="margin: 10px 0; border-radius: 10px" class="course-item bg-white">
                                <div  class="bg-image hover-zoom ripple ripple-surface ripple-surface-light wa"
                                     data-mdb-ripple-color="light">
                                    <img class="img-fluid" src="assets/img/course-2.jpg" alt="">
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
                                    <small class="flex-fill text-center border-end py-2">
                                        <i class="fa-regular fa-calendar-days"></i> ${i.date}</small>
                                    <small class="flex-fill text-center border-end py-2">
                                        <i class="fa-solid fa-stopwatch"></i> ${i.timeLimit}</small>
                                    <small class="flex-fill text-center py-2">
                                        <i class="fa-solid fa-circle-question"></i> ${i.questionNumber} Question</small>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


            </div>
        </section>
        <%@include file="includes/footer.jsp" %>              

    </body>
</html>
