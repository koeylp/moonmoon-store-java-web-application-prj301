<%-- 
    Document   : login
    Created on : Jun 20, 2022, 7:51:32 AM
    Author     : thekh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

    </head>

    <body>
        <!--::header part start::-->
        <header class="main_menu home_menu">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="MainController?action=GoToHome&roleID=GU"> <img src="img/logo_moon1.png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="menu_icon"><i class="fas fa-bars"></i></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="MainController?action=GoToHome&roleID=GU">Home</a>
                                    </li>                                                                      
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
                            <h2>login</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->

        <!--================login_part Area =================-->
        <section class="login_part section_padding ">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center">
                            <div class="login_part_text_iner">
                                <h2>New to our Store?</h2>
                                <p>There are advances being made in science and technology
                                    everyday, and a good example of this is the</p>
                                <a href="createUser.jsp" class="btn_3">Create an Account</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3>Welcome Back ! <br>
                                    Please Sign in now</h3>
                                <form class="row contact_form" id="form" action="MainController" method="POST" onsubmit="return validate_form();">
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" name="userID" value="" 
                                               placeholder="Username" required="">
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" name="password" value=""
                                               placeholder="Password" required="">
                                    </div>
                                    <%
                                        String error = (String) request.getAttribute("ERROR");
                                        if (error == null) {
                                            error = "";
                                        }
                                    %>                            
                                    <p style="color: red;"><%=error%><p>
                                    <div class="g-recaptcha col-md-12" data-sitekey="6LeAvMogAAAAAI7OTVvqB7PMVR5F1YGT1IyHUO2C"></div>
                                    <div class="recaptcha-error col-md-12" id="error" style="color:red;"></div>
                                    <div class="col-md-12 form-group">
                                        <button type="submit" name="action" value="Login" class="btn_3"  
                                                data-action='submit'>
                                            log in
                                        </button>
                                    </div>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8084/MoonMoonStore/MainController?action=LoginGoogle&response_type=code
                                       &client_id=806990788193-fv62avi20l8e4d3efkmhd4btstmd446p.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================login_part end =================-->

        <!--recaptcha-->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
                                    function validate_form() {
                                        const recaptcha_box_checked = (grecaptcha.getResponse()) ? true : false;
                                        if (recaptcha_box_checked) {
                                            return true;
                                        } else {
                                            error.innerHTML = "Please check the box.";
                                            return false;
                                        }
                                    }
        </script>

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
