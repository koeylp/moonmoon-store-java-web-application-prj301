/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import sample.order.Order;
import sample.order.OrderDAO;
import sample.user.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author thekh
 */
@WebServlet(name = "Show_orderController", urlPatterns = {"/Show_orderController"})
public class Show_orderController extends HttpServlet {

    private static final String ERROR = "userPage.jsp";
    private static final String SUCCESS_US = "orderPage.jsp";
    private static final String SUCCESS_AD = "orderManagement.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String role = request.getParameter("role");
            List<Order> listOrder = null;
            OrderDAO orderDAO = new OrderDAO();
            HttpSession session = request.getSession();
            if (session != null && role.equals("US")) {
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                listOrder = orderDAO.getOrderByUserID(user.getUserID());
                session.setAttribute("LIST_ORDER", listOrder);
                url = SUCCESS_US;
            } else if (session != null && role.equals("AD")) {              
                listOrder = orderDAO.getAllListOrder();
                session.setAttribute("LIST_ORDER", listOrder);
                url = SUCCESS_AD;
            }
        } catch (Exception e) {
            log("Error at EditController: " + e.toString());
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
