<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="a" class="dao.AccountDAO" scope="request"></jsp:useBean>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
            <link href="css/styles.css" rel="stylesheet" />
        </head>
        <body>
        <%@include file="includes/header.jsp" %>
        <h1 style="margin: 80px 0;"></h1>  
        <section style="margin-top: 30px">

            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h1 class="mb-5">Exam</h1>
                    </div>
                    <div  class="row g-4 justify-content-center">
                        <c:forEach var="i" items="${requestScope.listExam}" >
                            <c:set var="ExamId" value="20"></c:set>
                                <div class="col-lg-4 col-md-6 wow fadeInUp ani" data-wow-delay="0.1s">
                                <c:set var="check" value="e${i.getId()}"></c:set>
                                <a class="delete-button" href="Delete?id=${check}">Delete</a>
                                <div style="margin: 10px 0; border-radius: 10px" class="course-item bg-white">
                                    <div class="position-relative overflow-hidden">
                                        <img class="img-fluid" src="img/course-2.jpg" alt="">
                                    </div>
                                    <div class="text-center p-4 pb-0">
                                        <h3 class="mb-0">${i.name}</h3>

                                        <h5 class="mb-4"></h5>
                                        <c:if test="${sessionScope.accountS!=null}">
                                            <a href="EnrollList?id=${i.id}" style="text-decoration: none">
                                                <h1>Enrollment</h1>
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
        </section>
        <%@include file="includes/footer.jsp" %>

    </body>
</html>
