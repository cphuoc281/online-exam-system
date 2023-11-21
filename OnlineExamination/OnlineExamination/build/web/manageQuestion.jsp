<%-- 
    Document   : admin
    Created on : Oct 9, 2023, 2:21:11 PM
    Author     : cphuo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:useBean id="d" class="dao.BankQuestionDAO" scope="request"></jsp:useBean>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <link href="css/style1.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                crossorigin="anonymous"
            ></script>
            <title>Admin Page </title>
        </head>

        <body >

            <div class="container">
                <!-- Sidebar Section -->
                <aside>
                    <div class="toggle">
                        <div class="logo">
                            <img src="assets/img/logo4.png">
                            <h2>Online<span class="danger">Exam</span></h2>
                        </div>
                        <div class="close" id="close-btn">

                        </div>
                    </div>

                    <div class="sidebar">
                        <a href="admin.jsp">
                            <h3>Dashboard</h3>
                        </a>
                        <a href="manageAccount.jsp">
                            <h3>Manage Account</h3>
                        </a>
                        <a href="manageCollection.jsp" >
                            <h3>Manage Course</h3>
                        </a>
                        <a href="manageQuestion.jsp">
                            <h3>Manage Question</h3>
                        </a>
                        <a href="#">

                            <h3>Manage Exam</h3>
                        </a>
                        <a href="#">

                            <h3>Reports</h3>
                        </a>
                        <a href="#">

                            <h3>Settings</h3>
                        </a>
                        <a href="logoutServlet">

                            <h3>Logout</h3>
                        </a>
                    </div>
                </aside>
                <!-- End of Sidebar Section -->

                <!-- Main Content -->
                <main>
                    <h1>Dashboard</h1>
                    <!-- Analyses -->

                    <!-- End of Analyses -->

                    <!-- New Users Section -->
                    <div class="new-users">
                        <div class="user-list">
                            <div class="user">
                                <img src="images/profile-2.jpg">
                                <h2>Jack</h2>
                                <p>54 Min Ago</p>
                            </div>
                            <div class="user">
                                <img src="images/profile-3.jpg">
                                <h2>Amir</h2>
                                <p>3 Hours Ago</p>
                            </div>
                            <div class="user">
                                <img src="images/profile-4.jpg">
                                <h2>Ember</h2>
                                <p>6 Hours Ago</p>
                            </div>
                            <div class="user">
                                <img src="images/plus.png">
                                <h2>More</h2>
                                <p>New User</p>
                            </div>
                        </div>
                    </div>
                    <!-- End of New Users Section -->

                    <!-- Recent Orders Table -->
                    <div class="recent-orders">
                        <h2>Manage Question</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Detail</th>
                                    <th>Image</th>
                                    <th>Answer A</th>
                                    <th>Answer B</th>
                                    <th>Answer C</th>
                                    <th>Answer D</th>
                                    <th>True Answer</th>
                                    <th>Collection</th>
                                    <th>Author</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:set var="pagesize" value="6"></c:set>
                            <c:set var="totalItems" value="${d.getListQuestions().size()}"/>
                            <c:set var="numPage" value="${Math.ceil(totalItems / pagesize)}"/>
                            <c:if test="${totalItems % pagesize > 0}">
                                <c:set var="numPage" value="${numPage + 1}"/> 
                            </c:if>
                            <c:set var="page">
                            <fmt:parseNumber value="${param.page}" integerOnly="true" />  
                            </c:set>
                            <c:if test="${empty page}">
                                <c:set var="page" value="1"/> 
                            </c:if>

                            <c:forEach items="${d.getListQuestions()}" var="q" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}">
                            <tr>
                                <td>${q.id}</td>
                                <td>${q.detail}</td>
                                <td>
                                    <button onclick="showImage('${q.image}')"><i class="fa-solid fa-eye"></i></button>
                                </td>
                                <td>${q.answerA}</td>
                                <td>${q.answerB}</td>
                                <td>${q.answerC}</td>
                                <td>${q.answerD}</td>
                                <td>${q.trueAnswer}</td>
                                <td>${q.collectionId.name}</td>
                                <td>${q.accountId.firstname} ${q.accountId.lastname}</td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagination" style="display: flex " >
                        <c:if var="result" test="${page > 1 && page <= numPage}">
                            <a href="?page=1" class="page" style="padding:0 10px"><<</a>
                            <a href="?page=${page-1}" class="previous" style="padding:0 10px"><</a>
                        </c:if>
                        <a href="#" class="active">${page}</a>

                        <c:if test="${page < numPage}">
                            <a href="?page=${page+1}" class="next" style="padding:0 10px">></a>
                            <a href="?page=${numPage}" class="page" style="padding:0 10px">>></a>  
                        </c:if>   
                    </div>        

                    <br><br>
                </div>
                <!-- End of Recent Orders -->

            </main>
            <!-- End of Main Content -->
        </div>



        <script src="js/index.js"></script>
        <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>
        <script type="text/javascript">


                                            const eye = document.getElementById('togglePassword');
                                            const password = document.getElementById('password');

                                            eye.addEventListener('click', function () {

                                                // Toggle password visibility
                                                if (password.type === 'password') {
                                                    password.type = 'text';
                                                } else {
                                                    password.type = 'password';
                                                }

                                                // Toggle slash on eye icon
                                                eye.classList.toggle('slash');

                                            });
                                            const confirmPasswordEye = document.getElementById('toggleConfirmPassword');
                                            const confirmPassword = document.getElementById('confirm_password');

                                            confirmPasswordEye.addEventListener('click', function () {
                                                if (confirmPassword.type === 'password') {
                                                    confirmPassword.type = 'text';
                                                } else {
                                                    confirmPassword.type = 'password';
                                                }

                                                confirmPasswordEye.classList.toggle('slash');
                                            });
        </script>
        <script>
            // Get the modal
            var modal = document.getElementById("myModal");

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var i = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            i.onclick = function () {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            function closeModal() {
                modal.style.display = "none";
            }
            modal.onclick = closeModal;
        </script>
        <script>
// Get the modal1
            var modal1 = document.getElementById('id01');

// When the user clicks anywhere outside of the modal1, close1 it
            function closeModal1() {
                modal1.style.display = "none";
            }
            modal1.onclick = closeModal1;
        </script>
        <script>
            function showImage(imageUrl) {
                // Tạo một cửa sổ popup hoặc một modal để hiển thị ảnh
                var popup = window.open("", "Image Popup", "width=400, height=400");

                // Hiển thị ảnh trong cửa sổ popup hoặc modal
                popup.document.write("<img src='" + imageUrl + "' width='100%' height='100%'>");
            }
        </script>
        <script type="text/javascript">
            function handleLastPageClick(currentPage, lastPage) {
                // Kiểm tra nếu không có dữ liệu trên trang cuối, ngăn chuyển hướng
                if (currentPage == lastPage && currentPage < lastPage) {
                    return false;
                }
            }
        </script>


    </body>

</html>
