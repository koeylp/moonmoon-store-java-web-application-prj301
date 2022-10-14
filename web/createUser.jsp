<%-- 
    Document   : createUser.jsp
    Created on : Jun 23, 2022, 8:47:07 PM
    Author     : thekh
--%>

<%@page import="sample.google.GoogleUser"%>
<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
        <title>MoonMoon</title>
        <link rel="icon" href="img/favicon.svg">
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
        <style>
            @import url(https://fonts.googleapis.com/css?family=Raleway:300,400,600);


            body{
                margin: 0;
                font-size: .9rem;
                font-weight: 400;
                line-height: 1.6;
                color: #212529;
                text-align: left;

            }

            .navbar-laravel
            {
                box-shadow: 0 2px 4px rgba(0,0,0,.04);
            }

            .navbar-brand , .nav-link, .my-form, .login-form
            {
                font-family: Raleway, sans-serif;
            }

            .my-form
            {
                padding-top: 1.5rem;
                padding-bottom: 1.5rem;
            }

            .my-form .row
            {
                margin-left: 0;
                margin-right: 0;
            }

            .login-form
            {
                padding-top: 1.5rem;
                padding-bottom: 1.5rem;
            }

            .login-form .row
            {
                margin-left: 0;
                margin-right: 0;
            }
        </style>
    </head>

    <body>

        <!--::header part start::-->
        <header class="main_menu home_menu">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="index.jsp"> <img src="img/logo_moon1.png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="menu_icon"><i class="fas fa-bars"></i></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.jsp">Home</a>
                                    </li>
                                    <div class="hearer_icon d-flex align-items-center">                                      
                                        <a class="dropdown-item" href="login.jsp"> 
                                            Login
                                        </a>
                                    </div>
                                </ul>
                            </div>                       
                        </nav>
                    </div>
                </div>
            </div>
            <div class="search_input" id="search_input_box">
                <div class="container ">
                    <form class="d-flex justify-content-between search-inner">
                        <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                        <button type="submit" class="btn"></button>
                        <span class="ti-close" id="close_search" title="Close Search"></span>
                    </form>
                </div>
            </div>
        </header>
        <!-- Header part end-->

        <!-- breadcrumb part start-->
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                            <h2>Create new account</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->

        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            GoogleUser googleUser = (GoogleUser) request.getAttribute("GOOGLE_USER");
            if (userError == null) {
                userError = new UserError();
            }
            if (googleUser == null) {
                googleUser = new GoogleUser();
                googleUser.setName("");
                googleUser.setEmail("");
            }
        %>
        <main class="my-form">
            <div class="cotainer">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header text-center">Register</div>
                            <div class="card-body">
                                <form name="my-form" action="MainController" method="">
                                    <div class="form-group row">
                                        <label for="fullName" class="col-md-4 col-form-label text-md-right">Full Name</label>
                                        <div class="col-md-6">
                                            <input type="text" id="full_name" class="form-control" name="fullName" value="<%= googleUser.getName()%>" required="">
                                            <%= userError.getFullName()%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>
                                        <div class="col-md-6">
                                            <input type="text" id="email_address" class="form-control" name="email" value="<%= googleUser.getEmail()%>" required="">
                                            <%= userError.getEmail()%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="userID" class="col-md-4 col-form-label text-md-right">User Name</label>
                                        <div class="col-md-6">
                                            <input type="text" id="user_name" class="form-control" name="userID" required="">
                                            <%= userError.getUserID()%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                        <div class="col-md-6">
                                            <input type="password" id="password" class="form-control" name="password" required="">                                          
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="confirm" class="col-md-4 col-form-label text-md-right">Confirm password</label>
                                        <div class="col-md-6">
                                            <input type="password" id="confirm" class="form-control" name="confirm">
                                            <%= userError.getConfirm()%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="phone" class="col-md-4 col-form-label text-md-right">Phone Number</label>
                                        <div class="col-md-6">
                                            <input type="tel" id="phone_number" pattern="[0-9]{10}" class="form-control" name="phone" required="">
                                             <small>Phone number include 10 numbers and there's no number.</small><br><br>
                                            <%= userError.getPhone()%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="roleID" class="col-md-4 col-form-label text-md-right">Hello User</label>
                                        <div class="col-md-6">
                                            <input type="text" id="roleID" class="form-control" name="roleID" value="US" readonly="">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="address" class="col-md-4 col-form-label text-md-right">Address</label>
                                        <div class="col-md-6">
                                            <input type="text" id="address" class="form-control" required="" name="address" placeholder="Ex: 89 Chiaroscuro Rd, Portland, USA">
                                        </div>
                                    </div>

                                    <div class="col-md-12 form-group text-center">                                    
                                        <button type="submit" name="action" value="Signup" class="btn_3">
                                            sign up now
                                        </button>
                                    </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>






    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/mixitup.min.js"></script>
    <!-- particles js -->
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

