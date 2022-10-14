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
@WebServlet(name = "AddPController", urlPatterns = {"/AddPController"})
public class AddPController extends HttpServlet {

    private static final String ERROR = "productManagement.jsp";
    private static final String SUCCESS = "MainController?action=Show&roleID=AD_MN";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            DrinkDAO dao = new DrinkDAO();
            List<Drink> listDrink = dao.getAllListDrink();
            int id = listDrink.size() + 1;
            if (id == Integer.parseInt(listDrink.get(id - 2).getProductID())) {
                id += 1;
            }
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            float price = Float.parseFloat(request.getParameter("price"));
            String category = request.getParameter("category");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Drink drink = new Drink(String.valueOf(id), name, image, price, category, quantity);
            if (dao.add(drink)) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at AddPController" + e.toString());
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
