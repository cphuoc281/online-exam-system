<%-- 
    Document   : CollectionView
    Created on : Oct 19, 2023, 3:36:20 PM
    Author     : cphuo
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
        <%@include file="includes/header.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="text-center text-white">
                        <form style="margin: 20px 0" action="SearchCollection" method="post">
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

        <section class="text-center" >
            <div class="container">
                <div class="row">

                    <c:set var="pagesize" value="3"></c:set>
                    <c:set var="totalItems" value="${requestScope.listCollectionDetail.size()}"/>
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
                    <c:forEach var="i" items="${requestScope.listCollectionDetail}" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}">
                        <c:set var="collectionS" value="${i.id}"/>
                        <c:set var="collectionS" value="${collectionS}" scope="session"/>    
                        <div class="col-lg-4 col-md-12 mb-4">
                            <div style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); overflow: hidden" class="card">
                                <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light wa"
                                     data-mdb-ripple-color="light">
                                    <img style="height: 180px;" src="https://img.freepik.com/free-vector/set-hand-drawn-questionnaire-elements_23-2147596295.jpg?size=626&ext=jpg&ga=GA1.1.939347458.1685442295&semt=ais"
                                         class="w-100" />
                                    <a href="#!">
                                        <div class="mask">
                                            <div class="d-flex justify-content-start align-items-end h-100">
                                            </div>
                                        </div>
                                        <div class="hover-overlay">
                                            <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                        </div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <p href="" class="text-reset">
                                    <h5 class="card-title mb-3"><strong> ${i.name}</strong></h5>
                                    </p>
                                    <p href="" class="text-reset">
                                    <p><strong>Author: ${i.accountID.firstname} ${i.accountID.lastname}</strong></p>
                                    </p>
                                    <a style="font-size: 30px; text-decoration: none"  href="QuestionList?id=${i.id}" class="mb-3">Learn</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
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
