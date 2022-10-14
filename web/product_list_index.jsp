<%@page import="sample.drink.Category"%>
<%@page import="java.util.List"%>
<%@page import="sample.drink.Drink"%>
<!doctype html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>MoonMoon </title>
        <link rel="icon" href="img/favicon.png">
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
        <!--::header part start::-->
        <header class="main_menu home_menu">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="index.html"> <img src="img/logo_moon1.png" alt="logo"> </a>
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
                                    <li class="nav-item">
                                        <a class="nav-link " href="product_list_index.jsp">product</a>

                                    </li>
                                </ul>
                            </div>
                            <div class="hearer_icon d-flex align-items-center">
                                <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                                <a href="login.jsp">
                                    <i class="flaticon-shopping-cart-black-shape"></i>
                                </a>
                                <a class="dropdown-item" href="login.jsp"> 
                                    Login
                                </a>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="search_input" id="search_input_box">
                <div class="container ">
                    <form class="d-flex justify-content-between search-inner" action="MainController">
                        <input type="text" name="search" class="form-control" id="search_input" placeholder="Search Here">
                        <input type="hidden" name="role" value="IN">
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
                            <h2>product list</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->


        <!-- product list part start-->
        <section class="product_list section_padding">

            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="product_sidebar">
                            <div class="single_sedebar">
                                <form action="MainController">
                                    <input type="text" name="search" placeholder="Search keyword">
                                    <input type="hidden" name="role" value="IN">
                                    <i class="ti-search"></i>
                                    <button type="submit" class="btn" name="action" value="SearchP"></button>
                                </form>
                            </div>
                            <div class="single_sedebar">
                                <div class="select_option">
                                    <div class="select_option_list">Category <i class="right fas fa-caret-down"></i> </div>
                                    <div class="select_option_dropdown">
                                        <%
                                            List<Category> listCat = (List<Category>) request.getAttribute("LIST_DRINK_CAT");
                                            if (listCat != null && listCat.size() > 0) {
                                                for (Category category : listCat) {

                                        %>
                                        <p><a href="#"><%= category.getCategoryId()%></a></p>
                                            <%      }
                                                }
                                            %>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="product_list">
                            <div class="row">
                                <%
                                    List<Drink> listDrink = (List<Drink>) request.getAttribute("LIST_DRINK");
                                    if (listDrink != null && listDrink.size() > 0) {
                                        for (Drink drink : listDrink) {
                                %>
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_item text-center">
                                        <img src="img/product/<%=drink.getImage()%>" alt="#" class="img-fluid">
                                        <h3> <%= drink.getName()%> - <%= drink.getPrice()%>$ </h3>
                                        <a href="login.jsp"><button type="submit"  class="btn_3" class="g-recaptcha"
                                                                    data-sitekey="6LcYvZ4gAAAAAGTTwagTQCfZMeqvY757aste-PPp" 
                                                                    data-callback='onSubmit' 
                                                                    data-action='submit' >                                           
                                                <span class="add-to-cart">Add to cart</span>
                                                <span class="added"></span>
                                                <i class="fa fa-shopping-cart"></i>
                                            </button></a>

                                    </div>
                                </div>    
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </section>

        <!-- product list part end-->



        <!-- feature part here -->
        <section class="feature_part section_padding">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-6">
                        <div class="feature_part_tittle">
                            <h3>Credibly innovate granular
                                internal or organic sources
                                whereas standards.</h3>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="feature_part_content">
                            <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources. Credibly innovate granular internal or “organic” sources whereas high standards in web-readiness.</p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-3 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_1.svg" alt="#">
                            <h4>Credit Card Support</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_2.svg" alt="#">
                            <h4>Online Order</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_3.svg" alt="#">
                            <h4>Free Delivery</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_4.svg" alt="#">
                            <h4>Product with Gift</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- feature part end -->

        <!-- subscribe part here -->
        <section class="subscribe_part section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="subscribe_part_content">
                            <h2>Get promotions & updates!</h2>

                            <div class="subscribe_form">
                                <input type="email" placeholder="Enter your mail">
                                <a href="#" class="btn_1">Subscribe</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- subscribe part end -->

        <!--::footer_part start::-->
        <footer class="footer_part">
            <div class="footer_iner">
                <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="footer_menu">
                                <div class="footer_logo">
                                    <a href="index.jsp"><img src="img/logo_moon1.png" alt="#"></a>
                                </div>
                                <div class="footer_menu_item">

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