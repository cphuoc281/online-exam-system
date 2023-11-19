<%-- 
    Document   : admin
    Created on : Oct 9, 2023, 2:21:11 PM
    Author     : cphuo
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:useBean id="d" class="dao.AccountDAO" scope="request"></jsp:useBean>
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

        <body>

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
                        <h2>Managing the Team Members</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>FirstName</th>
                                    <th>LastName</th>
                                    <th>UserName</th>
                                    <th>Password</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>DOB</th>
                                    <th>Status</th>
                                    <th>Role</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                            <c:set var="pagesize" value="6"></c:set>
                            <c:set var="page" value="${not empty param.page?param.page : 1}"></c:set>
                            <c:set var="NumPage" value="${d.getAllAccount().size()/6+1}"></c:set>
                            <c:forEach items="${d.getAllAccount()}" var="a" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}">
                                <tr>
                                    <td>${a.id}</td>
                                    <td>${a.firstname}</td>
                                    <td>${a.lastname}</td>
                                    <td>${a.username}</td>
                                    <td>${a.password}</td>
                                    <td>${a.phone}</td>
                                    <td>${a.email}</td>
                                    <td>${a.dob}</td>
                                    <c:if test = "${a.status == 1}">
                                        <td>Enabled</td>
                                    </c:if>
                                    <c:if test = "${a.status == 0}">
                                        <td>Disable</td>
                                    </c:if>

                                    <c:if test = "${a.role == 1}">
                                        <td>Teacher</td>
                                    </c:if>
                                    <c:if test = "${a.role == 2}">
                                        <td>Student</td>
                                    </c:if>
                                    <c:if test = "${a.role == 0}">
                                        <td>Admin</td>
                                    </c:if>
                                    <td>
                                        <c:if test = "${a.status == 1}">
                                            <button onclick="document.getElementById('id01').style.display = 'block'" type="button">
                                                <i class="fa-solid fa-power-off" style="background: none"></i>
                                            </button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagination" style="display: flex " >
                        <a href="?page=1" class="page" style="padding:0 10px "><<</a>

                        <c:if  var="result" test="${page > 1.0}">
                            <a href="?page=${page-1}" class="previous" style="padding:0 10px "> < </a>
                        </c:if>

                        <c:if  var="result" test="${page == 1.0}">
                            <a href="?page=1" class="previous" style="padding:0 10px "> < </a>
                        </c:if>

                        <a href="">${page}</a>

                        <c:if  var="result" test="${page < NumPage.intValue()}">
                            <a href="?page=${page+1}" class="next" style="padding:0 10px "> > </a>
                        </c:if>

                        <c:if  var="result" test="${page == NumPage.intValue()}">
                            <a href="?page=${page}" class="next" style="padding:0 10px "> > </a>
                        </c:if>
                        <a href="?page=${NumPage.intValue()}" class="page" style="padding:0 10px "> >> </a>     
                    </div>        

                    <br><br>
                </div>
                <!-- End of Recent Orders -->

            </main>
            <!-- End of Main Content -->

            <!-- Right Section -->
            <div class="right-section">
                <div class="nav">
                    <button id="menu-btn">

                    </button>
                    <div class="dark-mode">

                    </div>

                    <div class="profile">
                        <div class="info">
                            <p>Hey, <b>Reza</b></p>
                            <small class="text-muted">Admin</small>
                        </div>

                    </div>

                </div>
                <!-- End of Nav -->

                <div class="user-profile">
                    <div class="logo">
                        <img src="assets/img/logo4.png">
                        <h2>OnlineExam</h2>
                    </div>
                </div>
                <div class="reminders">

                    <button id="myBtn" class="notification add-reminder" type="button" style="width: 100%" > 
                        <h3>Add Account</h3>
                    </button>

                    <button  class="notification add-reminder" type="button" style="width: 100%" > 
                        <h3>Update Account</h3>
                    </button>
                    <!-- The Modal -->
                    <div id="myModal" class="modal">

                        <!-- Modal content -->
                        <div class="modal-content">
                            <div class="modal-header">
                            </div>
                            <div class="modal-body">
                                <form action="adminCreateAccountServlet" method="post">
                                    <div class="row justify-content-center">
                                        <div class="col-md-6 col-lg-4">
                                            <div class="login-wrap p-0">
                                                <div class="form-group" >
                                                    <div class="form-group" style="width: 50%; margin-right: 20px">
                                                        <input type="text" class="form-control" placeholder="Firstname" name="firstname" required>
                                                    </div>
                                                    <div class="form-group" style="width: 50%">
                                                        <input type="text" class="form-control" placeholder="Lastname" name="lastname" required>
                                                    </div>
                                                </div>

                                                
                                                <div class="form-group">
                                                    <input type="text" required pattern="[0-9]{10}" class="form-control" placeholder="Phone Number" name="phonenumber" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" placeholder="Email" name="mail"  required>
                                                </div>
                                                <div class="form-holder">
                                                    <input type="date" id="dateInput" class="form-control" placeholder="Date of Birth" name="dob" required>
                                                </div>
                                                <div class="form-group" style="display: flex; margin-top: 20px" >
                                                    <div class="form-group" style="width: 37%">
                                                        <input style="margin: 0" type="radio" id="teacher" name="option" value="1">
                                                          <label for="teacher">Teacher</label><br>
                                                    </div>
                                                    <div class="form-group">
                                                        <input style="margin-left: 185px"  type="radio" id="student"  name="option" value="2">
                                                          <label for="student">Student</label><br>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <input  type="text" class="form-control" placeholder="Username" name="username" required>
                                                </div>
                                                <div class="form-group">
                                                    <input  type="password" id="password" class="form-control" placeholder="Password" name="password" required>
                                                    <span id="togglePassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                                </div>

                                                <div class="form-group">
                                                    <input type="password" id="confirm_password" class="form-control" placeholder="Confirm Password" name="repassword" required>
                                                    <span id="toggleConfirmPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                                </div>

                                                <div  class="form-group">
                                                    <button  type="submit" class="form-control btn btn-primary submit px-3">Register</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">

                            </div>
                        </div>
                    </div>
                    <!-- comment -->
                    <c:set var="accountToDisable" value="${a}"/>
                    <c:forEach items="${d.getAllAccount()}" var="a">
                        <c:if test="${a.status == 1}">
                            <c:set var="accountToDisable" value="${a}"/>
                            <div id="id01" class="modal1">
                                <div class="modal1-content" >
                                    <div class="modal1-container" >
                                        <h1 style="text-align: center; padding: 10px">Are you sure you want to Disable Account "${a.username}" ?</h1>
                                        <p style="text-align: center; padding: 10px">Press "Disable" to make Disable Account "${a.username}"</p>

                                        <div class="clearfix">
                                            <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Cancel</button>
                                            <button type="button" onclick="disableAccount('${a.username}')" class="deletebtn">Disable</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>



                </div>


            </div>


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
            else {
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
            // Get the modal content
            var modalContent = document.querySelector(".modal-content");

            // Get the <span> element that closes the modal
//            var i = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "block";
            }
            
            // When the user clicks anywhere inside the modal content, prevent it from closing
            modalContent.onclick = function (event) {
                event.stopPropagation();
            }

            // When the user clicks on <span> (x), close the modal
//            i.onclick = function () {
//                modal.style.display = "none";
//            }

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
            function disableAccount(username) {
                if (confirm("Are you sure you want to disable this account?")) {
                    // Sử dụng XMLHttpRequest hoặc Fetch API để gửi yêu cầu đến máy chủ
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "adminDisableAccountServlet?username=" + username, true);

                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            // Xử lý kết quả trả về từ máy chủ (nếu cần)
                            // Ví dụ: cập nhật giao diện người dùng
                            alert("Account has been disabled successfully.");
                        } else {
                            alert("An error occurred while disabling the account.");
                        }
                    };

                    xhr.send();
                }
            }
        </script>
        

    </body>

</html>
