<%-- 
    Document   : checkout
    Created on : Jul 5, 2022, 10:36:54 PM
    Author     : thekh
--%>

<%@page import="sample.drink.Cart"%>
<%@page import="sample.drink.Drink"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        if (loginUser == null || ! !"AD".equals((loginUser.getRoleID()))) {
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
                        <a class="navbar-brand" href="userPage.jsp"> <img src="img/logo_moon1.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="userPage.jsp">Home</a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="MainController?action=Show&roleID=US">Product</a>
                                </li>

                            </ul>
                        </div>
                        <div class="hearer_icon d-flex align-items-center">
                            <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <a href="cart.jsp">
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

    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>checkout</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->
    <%
        Cart cart = (Cart) session.getAttribute("CART");
        if (cart != null) {
    %>
    <!--================Checkout Area =================-->
    <section class="checkout_area section_padding">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <h3>Billing Details</h3>                       
                        <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                            <div class="col-md-6 form-group p_star">
                                <label for="name">Full name</label>
                                <input type="text" class="form-control" id="first" name="name" value="<%= loginUser.getFullName()%>"/>
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="company" name="address" value="<%= loginUser.getAddress()%>" />
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <label for="phone">Phone</label>
                                <input type="text" class="form-control" id="number" name="phone" value="<%= loginUser.getPhone()%>" />
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" id="email" name="email" value="<%= loginUser.getEmail()%>" />
                            </div>

                        </form>
                    </div>
                    <div class="col-lg-4">
                        <div class="order_box">
                            <h2>Your Order</h2>
                            <form action="MainController">
                                <ul class="list">
                                    <li>
                                        <a href="#">Product
                                            <span>Total</span>
                                        </a>
                                    </li>
                                    <%
                                        float total = 0;
                                        for (Drink drink : cart.getCart().values()) {
                                            total += drink.getPrice() * drink.getQuantity();
                                    %>
                                    <li>
                                        <a href="#"> <%= drink.getName()%>
                                            <span class="middle">x <%= drink.getQuantity()%></span>
                                            <input type="hidden" name="quantity" value="<%= drink.getQuantity()%>">
                                            <span class="last">$ <%= drink.getPrice() * drink.getQuantity()%> </span>
                                        </a>
                                        <input name="name" type="hidden" value="<%= drink.getName()%>">
                                    </li>
                                    <%    }

                                    %>
                                </ul>

                                <ul class="list list_2">
                                    <li>
                                        <a href="#">Total
                                            <span>$ <%= total%> </span>
                                            <input type="hidden" name="total" value="<%= total%>">
                                        </a>
                                    </li>
                                </ul>
                                <ul class="list list_2">
                                    <li>
                                        <p>Payment</p>
                                    </li>
                                </ul>
                                <div class="payment_item active">
                                    <div class="radion_btn">
                                        <input type="radio" id="f-option6" name="payment" value="Paypal"/>
                                        <label for="f-option6">Paypal</label>
                                        <div class="check"></div>
                                    </div>     
                                    <div class="radion_btn">
                                        <input type="radio" id="f-option5" name="payment" value="Cash"/>
                                        <label for="f-option5">Cash</label>
                                        <div class="check"></div>
                                    </div>
                                </div>
                                <button class="btn_3 col-md-12" type="submit" name="action" value="Checkout">Proceed to Order</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Checkout Area =================-->
    <%    }

    %>

    <!--::footer_part start::-->
    <footer class="footer_part">
        <div class="footer_iner section_bg">
            <div class="container">
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-8">
                        <div class="footer_menu">
                            <div class="footer_logo">
                                <a href="userPage.jsp"><img src="img/logo_moon1.png" alt="#"></a>
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
                            <P><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></P>
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
