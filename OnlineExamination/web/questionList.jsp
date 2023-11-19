<%-- 
    Document   : questionList
    Created on : Nov 1, 2023, 3:32:31 PM
    Author     : Phuoc
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="a" class="dao.CollectionDAO" scope="request"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        
    </head>
    <body>
        
        <%@include file="includes/header.jsp" %>
        <div class="wrapper">

            <c:forEach items="${list}" var="i" >
                <div class="container">

                    <div class="question " id="a" onclick="showAnswer()">
                        <div class="div-content">
                            <h1>Q${i.detail}</h1>
                            <p>A.${i.answerA}</p>
                            <p>B.${i.answerB}</p>
                            <p>C.${i.answerC}</p>
                            <p>D.${i.answerD}</p>
                        </div>
                    </div>
                    <div class="answer question" onclick="showAnswer()" id="answer">
                        <p
                            style="text-align: center; margin-top: calc(450px * 0.5 - 44.79px); transform: translate(0); font-size: 35px; font-weight: bold;">
                            ${i.trueAnswer}</p>
                    </div>

                </div>
            </c:forEach>
            
        </div>
        

        <c:forEach items="${list}" var="i">
            <div class="learning">
                <div class="learning-content">
                    <p>Q${i.id - list.get(0).id+1}: ${i.detail}</p>
                    <p>A.${i.answerA}</p>
                    <p>B.${i.answerB}</p>
                    <p>C.${i.answerC}</p>
                    <p>D.${i.answerD}</p>                  
                </div>
                <div class="leaning-anwser">
                    <p> ${i.trueAnswer}</p>    
                </div>
            </div>
        </c:forEach>
        <%@include file="includes/footer.jsp" %>
        <script>
            function showAnswer(questionNumber) {
                var answera = document.getElementById(a);
                var answerElement = document.getElementById('answer');

                if (answerElement.style.display === "none") {
                    a.style.display = "none";
                    answerElement.style.display = "block";
                    answerElement.style.textAlign = "center";
                } else {
                    answerElement.style.display = "none";
                    a.style.display = "block";
                }
            }

        </script>
    </body>
</html>
