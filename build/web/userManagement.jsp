<%-- 
    Document   : userManagement
    Created on : Jun 23, 2022, 4:41:02 PM
    Author     : thekh
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>MoonMoon Admin Page</title>
        <link rel="icon" href="img/favicon.svg">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="css/all.css">
        <!-- flaticon CSS -->
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">
        <!-- swiper CSS -->
        <link rel="stylesheet" href="css/slick.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="css/style.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/adminStyle.css">
        <style>
            body {
                background-color: white;
            }
        </style>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals((loginUser.getRoleID()))) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <!--::header part start::-->
        <header class="main_menu home_menu">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="MainController?action=GoToHome&roleID=AD"> <img src="img/logo_moon1.png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="menu_icon"><i class="fas fa-bars"></i></span>
                            </button>
                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="MainController?action=GoToHome&roleID=AD">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="MainController?action=Show&roleID=AD">Product</a>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle"  id="navbarDropdown_1"
                                           role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Management
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="MainController?action=List">user management</a>
                                            <a class="dropdown-item" href="MainController?action=Show&roleID=AD_MN">product management </a>
                                            <a class="dropdown-item" href="MainController?action=Show_order&role=AD">Order management</a>
                                        </div>
                                    </li>                                   
                                </ul>
                            </div>
                            <div class="hearer_icon d-flex align-items-center">
                                <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                                <a href="#">
                                    <i class="flaticon-shopping-cart-black-shape"></i>
                                </a>                                
                                <a><i class="fa-solid fa-user"></i></a>

                            </div>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle"  id="navbarDropdown_2"
                                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Hi <%=loginUser.getUserID()%> (<%=loginUser.getRoleID()%>)
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="index.jsp"> Logout</a>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="search_input" id="search_input_box">
                <div class="container ">
                    <form class="d-flex justify-content-between search-inner" action="MainController">
                        <input type="search" name="search" value="<%= search%>" class="form-control" id="search_input" placeholder="Search Here">
                        <button type="submit" name="action" value="Search" class="btn"></button>
                        <span class="ti-close" id="close_search" title="Close Search"></span>
                    </form>
                </div>
            </div>

        </header>
        <!-- Header part end-->
        <div class="container-xl" >
            <div class="table-responsive">
                <div class="table-wrapper">        
                    <div class="table-title" style="background-color: #B08EAD;">
                        <div class="row" >
                            <div class="col-sm-6">
                                <h2 style="color:white;">User Management</h2>                                   
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Role ID</th>                       
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
                        if (listUser != null && listUser.size() > 0) {
                            for (UserDTO user : listUser) {
                    %>

                    <tr>
                        <td><%= user.getUserID()%></td>
                        <td><%= user.getFullName()%></td>
                        <td><%= user.getPhone()%></td>
                        <td><%= user.getAddress()%></td>
                        <td><%= user.getEmail()%></td>
                        <td><%= user.getPassword()%></td>
                        <td><%= user.getRoleID()%></td>

                        <td>                                                         
                            <a href="MainController?action=Delete&userID=<%= user.getUserID()%>&search=<%= search%>">Delete</a>
                        </td>
                        <%
                            }
                        %>
                    </tr>   

                    <%
                        }
                    %>
                </tbody>
            </table>   
        </div>




        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="email" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <textarea class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <input type="text" class="form-control" required>
                        </div>	
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- jquery plugins here-->
        <script src="js/jquery-1.12.1.min.js"></script>
        <!-- popper js -->
        <script src="js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- magnific popup js -->
        <script src="js/jquery.magnific-popup.js"></script>
        <!-- carousel js -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <!-- slick js -->
        <script src="js/slick.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/contact.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/mail-script.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
    </body>
</html>

