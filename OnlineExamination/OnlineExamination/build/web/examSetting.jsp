<%-- 
    Document   : ExamSetting
    Created on : Oct 31, 2023, 11:21:27 AM
    Author     : Phuoc
--%>

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
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 80px">

            <form action="ShowExam" method="post">
                <h1 style="color: #06BBCC; margin-bottom: 30px; text-transform: uppercase; font-weight: bolder; margin-top: -50px">Create Exam</h1>
                <table>
                    <tr>
                        <td>Name Exam:</td>
                        <td><input name="name" type="text" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input style="margin-left: 10px" name="password" type="password" class="form-control" checked="" required=""></td>
                    </tr>
                    <tr>
                        <td>Show Password:</td>
                        <td><input style="margin-left: 10px" type="checkbox" id="showPassword"></td>

                    </tr>
                    <tr>
                        <td>Time Limit:</td>
                        <td><input name="timeLimit" type="text" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td>Date:</td>
                        <td><input style="margin-left: 10px" name="date" type="date" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td>QuestionNumber:</td>
                        <td><input name="questionNumber" type="number" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input style="display:none" name="AccountId" type="text" class="form-control" value="${sessionScope.accountS.getId()}"></td>
                    </tr>
                    <tr style="display:none">
                        <td>CollectionId:</td>
                        <td><input name="CollectionId" type="text" class="form-control" value="${collectionId}" ></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><input type="submit" class="btn btn-success" value="Submit"></td>
                    </tr>
                </table>

            </form>
        </div>
        <%@include file="includes/footer.jsp" %>
        <script class="u-script" type="text/javascript" src="js/Exam.js" defer=""></script>
        <script>
            var passwordInput = document.querySelector('input[name="password"]');
            var showPasswordCheckbox = document.getElementById('showPassword');

            showPasswordCheckbox.addEventListener('change', function () {
                if (showPasswordCheckbox.checked) {
                    passwordInput.setAttribute('type', 'text');
                } else {
                    passwordInput.setAttribute('type', 'password');
                }
            });
        </script>
    </body>
</html>
