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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <%@include file="includes/header.jsp" %>
        <style>
            h2 {
            text-align: center;
            margin-top: 20px;
        }
            table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        input[type="checkbox"] {
            margin-right: 5px;
        }

        .select-all-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .submit-button {
            display: block;
            margin-top: 10px;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        </style>
    </head>
    <body>

        <div class="recent-orders">
            <form action="listExam" id="examForm">
                <div>
                    <h2>Add Question</h2>
                    <table id="myTable"  >
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
                    <button class="submit-button">Submit</button>
                </div>
            </form>

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
