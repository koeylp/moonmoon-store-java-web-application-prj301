/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import sample.drink.Cart;
import sample.drink.Drink;
import sample.drink.DrinkDAO;
import sample.drink.QuantityStock;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author thekh
 */
@WebServlet(name = "BuyPController", urlPatterns = {"/BuyPController"})
public class BuyPController extends HttpServlet {

    private static final String ERROR = "MainController?action=Show&roleID=US";
    private static final String SUCCESS = "SearchPController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int id = Integer.parseInt(request.getParameter("productID"));
            DrinkDAO dao = new DrinkDAO();
            HttpSession session = request.getSession();
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                QuantityStock quantityStock = (QuantityStock) session.getAttribute("STOCK");
                Drink drink = dao.getProductByID(id);       
                if (quantityStock == null) {
                    quantityStock = new QuantityStock();
                } 
                quantityStock.add(drink);
                drink.setQuantity(1); 
                if (cart == null) {
                    cart = new Cart();                            
                } 
                cart.add(drink);
                session.setAttribute("STOCK", quantityStock);
                session.setAttribute("CART", cart);  
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at BuyPController" + e.toString());
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
