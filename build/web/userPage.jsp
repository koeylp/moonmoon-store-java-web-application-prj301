<%-- 
    Document   : userPage
    Created on : Jun 20, 2022, 10:59:31 PM
    Author     : thekh
--%>


<%@page import="sample.user.UserDTO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>MoonMoon</title>
        <link rel="icon" href="img/favicon.svg">
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
    </head>

    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || "AD".equals((loginUser.getRoleID()))) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <!--::header part start::-->
        <header class="main_menu home_menu">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="MainController?action=GoToHome&roleID=US"> <img src="img/logo_moon1.png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="menu_icon"><i class="fas fa-bars"></i></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="MainController?action=GoToHome&roleID=US">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="MainController?action=Show&roleID=US">Product</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="hearer_icon d-flex align-items-center">
                                <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                                <a href="MainController?action=GoToCart">
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
                                        <a class="dropdown-item" href="MainController?action=Show_order&role=US"> Order</a>
                                        <a class="dropdown-item" href="MainController?action=Logout"> Logout</a>
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
                        <input type="text" name="search" class="form-control" id="search_input" placeholder="Search Here">
                        <input type="hidden" name="role" value="US">
                        <button type="submit" class="btn" name="action" value="SearchP"></button>
                        <span class="ti-close" id="close_search" title="Close Search"></span>
                    </form>
                </div>
            </div>
        </header>
        <!-- Header part end-->

        <!-- banner part start-->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-5">
                        <div class="banner_text">
                            <div class="banner_text_iner">
                                <h1>Best quality
                                    milk tea ever</h1>
                                <p>Bring you to the moon and say no to go back</p>
                                <a href="MainController?action=Show&roleID=US" class="btn_1">shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="banner_img">
                <img src="img/banner.jpg" alt="#" class="img-fluid">
                <img src="img/banner_pattern.png " alt="#" class="pattern_img img-fluid">
            </div>
        </section>
        <!-- banner part start-->       



        <!-- client review part here -->
        <section class="client_review">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="client_review_slider owl-carousel">
                            <div class="single_client_review">
                                <div class="client_img">
                                    <img src="img/client.png" alt="#">
                                </div>
                                <p>"My go-to drink is the original iced milk tea with tapioca bubbles. Don’t forget the straw! You get to have a blast and poke it though the sealed plastic lid. YAY!!"</p>
                                <h5>- Micky Mouse</h5>
                            </div>
                            <div class="single_client_review">
                                <div class="client_img">
                                    <img src="img/client_1.png" alt="#">
                                </div>
                                <p>"MoonMoon is the greatest milk tea store ever"</p>
                                <h5>- Romeo Jason</h5>
                            </div>
                            <div class="single_client_review">
                                <div class="client_img">
                                    <img src="img/client_2.png" alt="#">
                                </div>
                                <p>"I was addicted to this one in a million"</p>
                                <h5>- Lee Chong Wei</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- client review part end -->



        <!--::footer_part start::-->
        <footer class="footer_part">
            <div class="footer_iner">
                <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="footer_menu">
                                <div class="footer_logo">
                                    <a href="MainController?action=Show&roleID=US"><img src="img/logo_moon1.png" alt="#"></a>
                                </div>                                
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="social_icon">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="copyright_part">
                <div class="container">
                    <div class="row ">
                        <div class="col-lg-12">
                            <div class="copyright_text">                        
                                <div class="copyright_link">
                                    <a href="#">Turms & Conditions</a>
                                    <a href="#">FAQ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!--::footer_part end::-->

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


