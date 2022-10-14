<%-- 
    Document   : cart
    Created on : Jun 20, 2022, 7:52:58 AM
    Author     : thekh
--%>

<%@page import="sample.drink.QuantityStock"%>
<%@page import="sample.drink.Drink"%>
<%@page import="sample.drink.Cart"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

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
        <!-- icon CSS -->
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- magnific popup CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/nice-select.css">
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
                            <a class="navbar-brand" href="MainController?action=Show&roleID=US"> <img src="img/logo_moon1.png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="menu_icon"><i class="fas fa-bars"></i></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="MainController?action=Show&roleID=US">Home</a>
                                    </li>                                  
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="MainController?action=Show&roleID=US">Product</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="hearer_icon d-flex align-items-center">

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

        </header>
        <!-- Header part end-->

        <!-- breadcrumb part start-->
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                            <h2>cart list</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->


        <!--================Cart Area =================-->
        <%
            QuantityStock stock = (QuantityStock) session.getAttribute("STOCK");
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
        %>
        <section class="cart_area section_padding">
            <div class="container">
                <div class="cart_inner">
                    <div class="table-responsive">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    float total = 0;
                                    for (Drink drink : cart.getCart().values()) {
                                        total = 0;
                                        total += drink.getPrice() * drink.getQuantity();
                                %>
                            <form action="MainController">
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="img/product/<%= drink.getImage()%>" alt="" />
                                            </div>
                                            <div class="media-body">
                                                <p><%= drink.getName()%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5><%= drink.getPrice()%></h5>
                                    </td>
                                    <td>
                                        <div class="product_count">                                          
                                            <input name="quantity" class="input-number" type="number" value="<%= drink.getQuantity()%>" min="1" max="<%= stock.getQuantityStock().get(drink.getProductID())%>" required="">
                                        </div>
                                    </td>
                                    <td>
                                        <h5>$ <%= total%></h5>
                                        <input type="hidden" name="id" value="<%= drink.getProductID()%>">
                                    </td>
                                    <td>
                                        <button class="btn" type="submit" name="action" value="EditC" style="color: blue;"><i class="fa-solid fa-pen"></i></button>
                                    </td>
                                    <td>
                                        <button class="btn" type="submit" name="action" value="Remove" style="color: red;"><i class="fa-solid fa-trash-can"></i></button> 
                                    </td>

                                </tr>
                            </form>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        <div class="checkout_btn_inner float-right">
                            <a class="btn_1" href="MainController?action=Show&roleID=US">Continue Shopping</a>-                              
                            <a class="btn_1" href="MainController?action=LoadCH">Proceed to checkout</a>
                        </div>
                    </div>
                </div>
        </section>
        <%
            }
        %>
        <!--================End Cart Area =================-->
        <!--::footer_part start::-->
        <footer class="footer_part">
            <div class="footer_iner section_bg">
                <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="footer_menu">
                                <div class="footer_logo">
                                    <a href="MainController?action=GoToHome&roleID=US"><img src="img/logo_moon1.png" alt="#"></a>
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
