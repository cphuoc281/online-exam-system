<%-- 
    Document   : SearchCollection
    Created on : Nov 14, 2023, 9:50:48 AM
    Author     : Phuoc
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                <div class="row">
                    <c:forEach var="i" items="${requestScope.listCollectionDetail}" >
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
                                    <a style="font-size: 30px" href="QuestionList?id=${i.id}" class="mb-3">Learn</a>
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
