<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Exam</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 180px;">
            <form style="border-radius:10px " action="examJoin" id="form" method="post">
                <h1 style="color: #06BBCC; margin-bottom: 30px; text-transform: uppercase; font-weight: bolder; text-align: center">Join Exam</h1>
                <div class="countdown-container">
                    <p>Enter password Exam:</p>
                    <input id="countdown-input" class="countdown-input" name="pass" type="password" value="">
                    <input style="display: none" id="countdown-input" class="countdown-input" name="ExamId" type="text" value="${ExamId}">
                    <h2 style="color: red; font-size: 16px">${message}</h2>
                    <button id="countdown-button" class="countdown-button">Join in</button>
                    <div id="countdown-display" class="countdown-display"></div>
                </div>
            </form>
        </div>
        <%@include file="includes/footer.jsp" %>            
    </body>
</html>