/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import sample.drink.Cart;
import sample.drink.Drink;
import sample.drink.DrinkDAO;
import sample.order.Order;
import sample.order.OrderDAO;
import sample.order.OrderDetail;
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
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {
    
    private static final String ERROR = "cart.jsp";
    private static final String SUCCESS = "confirmation.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int id = 0;
            int idDetail = 0;
            String payment = request.getParameter("payment");
            float total = Float.parseFloat(request.getParameter("total"));
            OrderDAO orderDao = new OrderDAO();
            DrinkDAO drinkDao = new DrinkDAO();
            HttpSession session = request.getSession();
            List<OrderDetail> listOrderDetail = null;
            List<Order> listOrder = orderDao.getAllListOrder();
            if (listOrder.isEmpty()) {
                id = 1;
            } else {
                id = listOrder.size() + 1;
            }
            if (session != null) {
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                Cart cart = (Cart) session.getAttribute("CART");
                Order order = new Order(id, user.getUserID(), java.sql.Date.valueOf(java.time.LocalDate.now()), total, payment);                
                for (Drink drinkDetail : cart.getCart().values()) {
                    listOrderDetail = orderDao.getAllListOrderDetail();
                    if (listOrderDetail.isEmpty()) {
                        idDetail = 1;
                    } else {
                        idDetail = listOrderDetail.size() + 1;
                    }
                    Drink drink = drinkDao.getProductByID(Integer.parseInt(drinkDetail.getProductID()));
                    if (drinkDetail.getQuantity() <= drink.getQuantity()) {
                        OrderDetail orderDetail = new OrderDetail(idDetail, id, Integer.parseInt(drinkDetail.getProductID()), drinkDetail.getPrice(), drinkDetail.getQuantity());
                        orderDao.addDetail(orderDetail);
                        drink.setQuantity(drink.getQuantity() - drinkDetail.getQuantity());
                        drinkDao.update(drink);
                    }   
                }
                orderDao.add(order);
                session.setAttribute("ORDER", order);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at CheckoutController" + e.toString());
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
