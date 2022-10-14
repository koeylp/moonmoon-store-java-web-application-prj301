/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author thekh
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String LIST = "List";
    private static final String LIST_CONTROLLER = "ListController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String SIGNUP = "Signup";
    private static final String SIGNUP_CONTROLLER = "SignupController";
    private static final String SHOW = "Show";
    private static final String SHOW_CONTROLLER = "ShowController";
    private static final String DELETEP = "DeleteP";
    private static final String DELETEP_CONTROLLER = "DeletePController";
    private static final String EDITP = "EditP";
    private static final String EDITP_CONTROLLER = "EditPController";
    private static final String SEARCHP = "SearchP";
    private static final String SEARCHP_CONTROLLER = "SearchPController";
    private static final String ADDP = "AddP";
    private static final String ADDP_CONTROLLER = "AddPController";
    private static final String BUYP = "BuyP";
    private static final String BUYP_CONTROLLER = "BuyPController";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    private static final String EDITC = "EditC";
    private static final String EDITC_CONTROLLER = "EditCController";
    private static final String LOAD = "Load";
    private static final String LOAD_CONTROLLER = "LoadController";
    private static final String LOADCH = "LoadCH";
    private static final String LOADCH_CONTROLLER = "LoadCHController";
    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";
    private static final String SHOW_ORDER = "Show_order";
    private static final String SHOW_ORDER_CONTROLLER = "Show_orderController";
    private static final String LOGIN_GOOGLE = "LoginGoogle";
    private static final String LOGIN_GOOGLE_CONTROLLER = "LoginGoogleController";
    private static final String GO_TO_CART = "GoToCart";
    private static final String GO_TO_CART_CONTROLLER = "GoToCartController";
    private static final String GO_TO_HOME = "GoToHome";
    private static final String GO_TO_HOME_CONTROLLER = "GoToHomeController";
    private static final String GO_TO_LOGIN = "GoToLogin";
    private static final String GO_TO_LOGIN_CONTROLLER = "GoToLoginController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (null != action) {
                switch (action) {
                    case LOGIN:
                        url = LOGIN_CONTROLLER;
                        break;
                    case LOGOUT:
                        url = LOGOUT_CONTROLLER;
                        break;
                    case LIST:
                        url = LIST_CONTROLLER;
                        break;
                    case SEARCH:
                        url = SEARCH_CONTROLLER;
                        break;
                    case DELETE:
                        url = DELETE_CONTROLLER;
                        break;
                    case SIGNUP:
                        url = SIGNUP_CONTROLLER;
                        break;
                    case SHOW:
                        url = SHOW_CONTROLLER;
                        break;
                    case DELETEP:
                        url = DELETEP_CONTROLLER;
                        break;
                    case EDITP:
                        url = EDITP_CONTROLLER;
                        break;
                    case SEARCHP:
                        url = SEARCHP_CONTROLLER;
                        break;
                    case ADDP:
                        url = ADDP_CONTROLLER;
                        break;
                    case BUYP:
                        url = BUYP_CONTROLLER;
                        break;
                    case REMOVE:
                        url = REMOVE_CONTROLLER;
                        break;
                    case EDITC:
                        url = EDITC_CONTROLLER;
                        break;
                    case LOAD:
                        url = LOAD_CONTROLLER;
                        break;
                    case LOADCH:
                        url = LOADCH_CONTROLLER;
                        break;
                    case CHECKOUT:
                        url = CHECKOUT_CONTROLLER;
                        break;
                    case SHOW_ORDER:
                        url = SHOW_ORDER_CONTROLLER;
                        break;
                    case LOGIN_GOOGLE:
                        url = LOGIN_GOOGLE_CONTROLLER;
                        break;
                    case GO_TO_CART:
                        url = GO_TO_CART_CONTROLLER;
                        break;
                    case GO_TO_HOME:
                        url = GO_TO_HOME_CONTROLLER;
                        break;
                    case GO_TO_LOGIN:
                        url = GO_TO_LOGIN_CONTROLLER;
                        break;
                    default:
                        break;
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
