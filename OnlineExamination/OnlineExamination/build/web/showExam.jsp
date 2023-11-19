<%-- 
    Document   : ShowExam.jsp
    Created on : Nov 1, 2023, 10:36:16 AM
    Author     : Phuoc
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <div class="countdown-container">
            Time: <input id="countdown-input" class="countdown-input" type="number" value="${time}" disabled>
            <button id="countdown-button" class="countdown-button">Start</button>
            <div id="countdown-display" class="countdown-display"></div>
            <form action="checkanswer" id="form" method="post" style="display:none">
                <input style="display:none" type="text" name="AccountId" value="${sessionScope.accountS.getId()}">
                <input style="display:none" type="text" name="ExamId" value="${ExamId}">
                <input name="numberQuestion" style="display:none" value="${numberQuestion}" id="" type="text">
                <div id="questionList">
                    <c:forEach var="i" items="${requestScope.list}">      
                        <div class="container mt-sm-5 my-1">
                            <div class="question ml-sm-5 pl-sm-5 pt-2">
                                <div class="py-2 h5"><b>${i.detail}</b></div>
                                <div class="ml-md-3 ml-sm-3 pl-md-5 pt-sm-0 pt-3" id="options">
                                    <label class="options">A. ${i.answerA}
                                        <input type="radio" name="${i.id}" value="A" id="${i.answerA}">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="options">B. ${i.answerB}
                                        <input type="radio" name="${i.id}" value="B" id="${i.answerB}">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="options">C. ${i.answerC}
                                        <input type="radio" name="${i.id}" value="C" id="${i.answerC}">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="options">D. ${i.answerD}
                                        <input type="radio" name="${i.id}" value="D" id="${i.answerD}">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <c:set var="allID" value="${allID} ${i.id}"></c:set>
                    </c:forEach>
                    <input style="display:none" type="text" name="allID" value="${allID}" >
                </div>
                <div style="width: 100%; display: flex; justify-content: center; align-items: center;">
                    <input type="submit" value="Submit">

                </div>

            </form>
        </div>
        <%@include file="includes/footer.jsp" %>
        <!--<script class="u-script" type="text/javascript" src="js/Exam.js" defer=""></script>-->
        <script>
            function startCountdown() {
                var inputElement = document.getElementById("countdown-input");
                var form = document.getElementById("form");
                var list = document.getElementById("questionList");
                var number = parseInt(inputElement.value);
                var countdownButton2 = document.getElementById("countdown-button");

                var totalTimeInSeconds = number * 60;

                form.style.display = "block";
                countdownButton2.style.display = "none";
                var countdownDisplay = document.getElementById("countdown-display");
                var countdownInterval = setInterval(function () {
                    if (totalTimeInSeconds <= 0) {
                        clearInterval(countdownInterval);
                        countdownDisplay.innerHTML = "Time out!";
                        list.style.display = "none";
                    } else {
                        var minutesRemaining = Math.floor(totalTimeInSeconds / 60);
                        var secondsRemaining = totalTimeInSeconds % 60;

                        countdownDisplay.innerHTML = minutesRemaining + " minutes, " +
                        secondsRemaining + " second";
                        totalTimeInSeconds--;
                    }
                }, 1000);
            }

            var countdownButton = document.getElementById("countdown-button");
            countdownButton.addEventListener("click", startCountdown);
        </script>
    </body>
</html>
