<%-- 
    Document   : admin
    Created on : Oct 9, 2023, 2:21:11 PM
    Author     : cphuo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="css/style1.css" rel="stylesheet" />
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
                <a href="#">
                    
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
                <a href="#">
                    
                    <h3>Logout</h3>
                </a>
            </div>
        </aside>
        <!-- End of Sidebar Section -->

        <!-- Main Content -->
        <main>
            <h1>Dashboard</h1>
            <!-- Analyses -->
            <div class="analyse">
                <div class="sales">
                    <div class="status">
                        <div class="info">
                            <h3>Total Member</h3>
                            <h1>50</h1>
                        </div>
                        <div class="progresss">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="percentage">
                                <p>+81%</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="visits">
                    <div class="status">
                        <div class="info">
                            <h3>Course</h3>
                            <h1>12</h1>
                        </div>
                        <div class="progresss">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="percentage">
                                <p>-48%</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="searches">
                    <div class="status">
                        <div class="info">
                            <h3>Question</h3>
                            <h1>232</h1>
                        </div>
                        <div class="progresss">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="percentage">
                                <p>+21%</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Analyses -->

            <!-- New Users Section -->
            <div class="new-users">
                <h2>New Users</h2>
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
                <h2>Recent Orders</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Course Name</th>
                            <th>Course Number</th>
                            <th>Payment</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <a href="#">Show All</a>
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
                <div class="header">
                    <h2>Reminders</h2>
                    
                </div>

                <div class="notification">
                    <div class="icon">
                       
                    </div>
                    <div class="content">
                        <div class="info">
                            <h3>Workshop</h3>
                            <small class="text_muted">
                                08:00 AM - 12:00 PM
                            </small>
                        </div>
                        
                    </div>
                </div>

                <div class="notification deactive">
                    <div class="icon">
                        
                    </div>
                    <div class="content">
                        <div class="info">
                            <h3>Workshop</h3>
                            <small class="text_muted">
                                08:00 AM - 12:00 PM
                            </small>
                        </div>
                        
                    </div>
                </div>

                <div class="notification add-reminder">
                    <div>
                        
                        <h3>Add Reminder</h3>
                    </div>
                </div>

            </div>

        </div>


    </div>

    <script src="js/orders.js"></script>
    <script src="js/index.js"></script>
</body>

</html>
