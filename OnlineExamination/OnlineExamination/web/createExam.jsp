<%-- 
    Document   : CreateExam
    Created on : Oct 31, 2023, 3:24:21 PM
    Author     : Phuoc
--%>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"
        ></script>
        <style>
            body{
                font-family: courier, arial, helvetica;
                background-color: #eee;

            }
            form{
                margin-top: 100px;
            }
            form {
                width:50%;
                margin: 0 auto;
                background-color: #fff;
                padding: 8%;
                border-radius: 10px;
                font-size: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);

            }
            input[type="text"]{
                margin: 0 10px;

            }

            input[type="text"], input[type="radio"],input[type="date"], input[type="password"] {
                margin-bottom: 10px;
                outline: none;
                width: 100%;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                cursor: pointer;
                margin: 0 10px;

            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 80px">

            <form  action="createExam">
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
                    <!--                    <tr class="form-control">
                                            <td>Take question from bank</td>
                                            <td><a href ="create-test?type=bank">Add</a></td>
                                        </tr>-->
                    <tr>
                        <td>QuestionNumber:</td>
                        <td><input name="questionNumber"  type="text" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input style="display:none" name="accountId" type="text" class="form-control" value="${sessionScope.accountS.getId()}"></td>
                    </tr>
                    <tr style="display:none">
                        <td></td>
                        <td><input name="collectionId" type="text" class="form-control" value="${collectionId}" ></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td><input type="submit" class="btn btn-success" value="Submit"></td>
                    </tr>
                </table>

            </form>
        </div>
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
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#myTable').DataTable({
                    select: true, // Enable row selection
                    responsive: true // Enable responsiveness
                });
            });
        </script>
        <!-- Các dòng code khác -->

        <script>
            // Kiểm tra nếu có mã lỗi, hiển thị thông báo alert
            var errorCode = '<%= request.getAttribute("errorCode") %>';
            if (errorCode === 'questionLimitExceeded') {
                alert("Số câu hỏi yêu cầu vượt quá số câu hỏi có trong môn học");
            }
        </script>







    </body>
</html>
