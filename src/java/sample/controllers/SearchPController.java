/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import sample.drink.Drink;
import sample.drink.DrinkDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author thekh
 */
@WebServlet(name = "SearchPController", urlPatterns = {"/SearchPController"})
public class SearchPController extends HttpServlet {

    private static final String ERROR = "product_list_admin.jsp";
    private static final String SUCCESS_AD = "product_list_admin.jsp";
    private static final String SUCCESS_US = "product_list_user.jsp";
    private static final String SUCCESS_IN = "product_list_index.jsp";
    private static final String SUCCESS_AD_MA = "productManagement.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            String role = request.getParameter("role");
            DrinkDAO dao = new DrinkDAO();
            List<Drink> listDrink = dao.getListDrink(search);
            if (listDrink.size() >= 0) {
                request.setAttribute("LIST_DRINK", listDrink);
                if (role.equals("AD")) {
                    url = SUCCESS_AD;
                } else if (role.equals("US")) {
                    url = SUCCESS_US;
                } else if (role.equals("IN")) {
                    url = SUCCESS_IN;
                } else if (role.equals("AD_MA")) {
                    url = SUCCESS_AD_MA;
                }
            }
        } catch (Exception e) {
            log("Error at SearchPController: " + e.toString());
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
