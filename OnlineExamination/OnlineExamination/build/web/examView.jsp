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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="text-center text-white">
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
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center" >
            <div class="container">
                <div  class="row">
                    <c:set var="pagesize" value="3"></c:set>
                    <c:set var="totalItems" value="${requestScope.listExam.size()}"/>
                    <c:set var="numPage" value="${Math.ceil(totalItems / pagesize)}"/>
                    <c:if test="${totalItems % pagesize > 0}">
                        <c:set var="numPage" value="${numPage + 1}"/> 
                    </c:if>
                    <c:set var="page">
                        <fmt:parseNumber value="${param.page}" integerOnly="true" />  
                    </c:set>
                    <c:if test="${empty page}">
                        <c:set var="page" value="1"/> 
                    </c:if>
                    <c:forEach var="i" items="${requestScope.listExam}" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}">
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
                    <div id="myModal" class="modal">

                        <!-- Modal content -->
                        <div class="modal-content">
                            <div class="modal-header">
                            </div>
                            <div class="modal-body">
                                <form action="adminCreateAccountServlet" method="post">

                                </form>
                            </div>
                            <div class="modal-footer">

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div style="display: flex; justify-content: center; margin-top: 50px">

                <div class="pagination">
                    <c:if test="${page > 1 && page <= numPage}">
                        <a href="?page=1" class="page"><<</a>
                        <a href="?page=${page-1}" class="previous"><</a>
                    </c:if>
                    <a href="#" class="active">${page}</a>

                    <c:if test="${page < numPage}">
                        <a href="?page=${page+1}" class="next">></a>
                        <a href="?page=${numPage}" class="page">>></a>  
                    </c:if>
                </div>
            </div>
            <%@include file="includes/footer.jsp" %>

    </body>
</html>
