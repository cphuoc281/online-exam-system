<%-- 
    Document   : myCourses
    Created on : Oct 30, 2023, 2:09:19 PM
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
        <style>
            body{
                background-color: #eee;
                font-family: courier, arial, helvetica;
            }
            .tittle{
                padding: 10px 0 30px 0;
            }
            .add:hover{
                background-color: #4CAF50;
                color:#fff;
                text-decoration: none;

            }
            .add{
                color: #000;
                background-color: #fff;
            }

            .content{
                border: 1px solid black;
                width: 30%;
                margin: 0 20px 20px 10px;
                text-align: center;
                border-radius: 15px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .content:hover{
                box-shadow: 10px 10px 5px lightblue;
                cursor: pointer;
            }
            .content p {
                font-size: 20px;
                font-weight: bold;
            }
            @media (max-width: 800px) {
                .container {
                    flex-direction: column;
                }
                .content{
                    width: 60%;
                }
            }
            .card:hover img {
                transform: scale(1.1);
                transition: 0.4s;
            }
            /*phan trang*/
            .pagination {
                display: inline-block;
            }

            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                transition: background-color .3s;
                border: 1px solid #ddd;
                font-size: 22px;
            }

            .pagination a.active {
                background-color: #4CAF50;
                color: white;
                border: 1px solid #4CAF50;
            }

            .pagination a:hover:not(.active) {
                background-color: #ddd;
            }
            .delete-button{
                position: absolute;
                left: 0px;
                top: 0px;
                background-color:grey;
                z-index: 5;
                text-decoration: none;
                color: black;

            }
        </style>
    </head>
    <body>
        <!-- Navbar End -->


        <section style="margin-top: 30px">

            <div class="text-center container py-5">
                <div style="margin: 20px 0; display: inline-block; text-align: center;">
                    <c:if test="${sessionScope.accountS.getRole()!=2}"> 
                        <c:if test="${sessionScope.accountS!=null}"> 
                            <a href="newCourse.jsp" class="mt-1 mb-1 add" style="text-decoration: none;font-size: 20px; padding: 20px; font-weight: bold;  border-radius: 10px">New course</a>
                        </c:if>
                    </c:if>
                </div>
                <br><br>
                <div class="row">
                    <c:forEach var="i" items="${requestScope.listCollectionDetail}" >
                        <div class="col-lg-4 col-md-12 mb-4">
                            <div style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); overflow: hidden" class="card">
                                <c:set var="check" value="c${i.getId()}"></c:set>
                                <a class="delete-button" href="Delete?id=${check}">Delete</a>
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
                                    <a style="font-size: 30px" href="myCourseDetail?id=${i.id}" class="mb-3">Detail</a>
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
