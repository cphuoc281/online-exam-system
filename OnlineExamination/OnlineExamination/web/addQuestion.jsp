<%-- 
    Document   : addQuestion
    Created on : Nov 2, 2023, 11:05:38 AM
    Author     : Phuoc
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--        <h2>Add Questions to Exam</h2>
        
            <form action="processQuestions.jsp" method="post">
        <c:forEach var="i" begin="1" end="${exam.questionNumber}">
            <div>
                <label for="question${i}">Question ${i}:</label>
                <textarea id="question${i}" name="question${i}" rows="4" cols="50"></textarea>
            </div>
            <br>
        </c:forEach>

        <input type="hidden" name="examId" value="${exam.id}">
        <input type="submit" value="Submit Questions">
    </form>-->
        <div class="form-container">
            <form action="CreateExam1Servlet" method="post" id="examForm">
                <div>
                    <h2>Add Question</h2>

                    <table id="myTable" class="display responsive" style="width: 100%">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Question</th>
                                <th>Answer A</th>
                                <th>Answer B</th>
                                <th>Answer C</th>
                                <th>Answer D</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listB}" var="listB">
                                <tr>
                                    <td><input type="checkbox" onclick="limitCheckbox(this)" name="${listB.id}" id="${listB.id}">
                                    </td>
                                    <td>${listB.detail}</td>
                                    <td>${listB.answerA}</td>
                                    <td>${listB.answerB}</td>
                                    <td>${listB.answerC}</td>
                                    <td>${listB.answerD}</td>
                                </tr>
                            </c:forEach>
                            <!-- Add more rows as needed -->
                        </tbody>
                    </table>
                    <button class="next" type="summit">Summit</button>
                </div>
            </form>
            <div class="progress-container">
                <div class="progress" id="progress"></div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
                <!-- Start jquery-table -->
                        $(document).ready(function() {
                                var  table  =  $('#myTable').DataTable({
                        select : true,  // Enable row selection
                                responsive : true
                                // Enable responsiveness
                        });
                });
                <!-- End jquery-table -->
            
            
            <!-- Start limit checkbox -->
        var maxAllowed = ${maxAllowed};
        
        function limitCheckbox(checkbox) {
                        var checkedCheckboxes = document.querySelectorAll('input[type="checkbox"]:checked');
                        if (checkedCheckboxes.length === maxAllowed) {
                        disableCheckboxes();
                        } else {
                        enableCheckboxes();
                        }
                                }
                                
        function disableCheckboxes() {
                                var checkboxes = document.querySelectorAll('input[type="checkbox"]');
                        checkboxes.forEach(function(checkbox) {
                        if (!checkbox.checked) {
                        checkbox.disabled = true;
                        }
                });
        }

        function enableCheckboxes() {
                var checkboxes = document.querySelectorAll('input[type="checkbox"]');
                checkboxes.forEach(function(checkbox) {
                        checkbox.disabled = false;
                });
        }
            <!-- End limit checkbox -->
    </script>
    <script type="text/javascript">
        var maxAllowed = <%= request.getAttribute("maxAllowed") %>;
        console.log("maxAllowed: " + maxAllowed);
        var listBSize = <%= request.getAttribute("listBSize") %>;
        console.log("listBSize: " + listBSize);
    </script>
    <script type="text/javascript">

            function validateForm() {
                var maxAllowed = ${maxAllowed};
                var listBSize = ${listBSize};
                if (maxAllowed > listBSize) {
                    alert("Number of questions exceeds the available questions in the collection.");
                    return false;
                }
                return true;
            }
        </script>
</html>
