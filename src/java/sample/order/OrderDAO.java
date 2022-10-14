/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author thekh
 */
public class OrderDAO {

    private static final String INSERT = "INSERT INTO tblOrder(orderID, userID, date, total, payment) VALUES(?, ?, ?, ?, ?)";
    private static final String INSERT_DETAIL = "INSERT INTO tblOrderDetail(detailID, orderID, productID, price, quantity) VALUES(?, ?, ?, ?, ?)";
    private static final String SHOW_ALL = "SELECT orderID, userID, date, total, payment FROM tblOrder";
    private static final String SHOW_O = "SELECT orderID, userID, date, total, payment FROM tblOrder WHERE userID = ?";
    private static final String SHOW_ALL_D = "SELECT detailID, orderID, productID, price, quantity FROM tblOrderDetail";

    public boolean add(Order order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, order.getOrderID());
                ptm.setString(2, order.getUserID());
                ptm.setDate(3, order.getDate());
                ptm.setFloat(4, order.getTotal());
                ptm.setString(5, order.getPayment());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<Order> getAllListOrder() throws SQLException {
        List<Order> listOrder = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_ALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    String userID = rs.getString("userID");
                    Date date = rs.getDate("date");
                    float total = rs.getFloat("total");
                    String payment = rs.getString("payment");
                    listOrder.add(new Order(orderID, userID, date, total, payment));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listOrder;
    }

    public List<Order> getOrderByUserID(String ID) throws SQLException {
        List<Order> listOrder = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_O);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    String userID = rs.getString("userID");
                    Date date = rs.getDate("date");
                    float total = rs.getFloat("total");
                    String payment = rs.getString("payment");
                    listOrder.add(new Order(orderID, userID, date, total, payment));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listOrder;
    }

    public List<OrderDetail> getAllListOrderDetail() throws SQLException {
        List<OrderDetail> listOrderDetail = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_ALL_D);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int detailID = rs.getInt("detailID");
                    int orderID = rs.getInt("orderID");
                    int productID = rs.getInt("productID");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    listOrderDetail.add(new OrderDetail(detailID, orderID, productID, price, quantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listOrderDetail;
    }

    public boolean addDetail(OrderDetail orderDetail) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                int detailID = orderDetail.getDetailID();
                int orderID = orderDetail.getOrderID();
                int productID = orderDetail.getProductID();
                float price = orderDetail.getPrice();
                int quantity = orderDetail.getQuantity();
                ptm = conn.prepareStatement(INSERT_DETAIL);
                ptm.setInt(1, detailID);
                ptm.setInt(2, orderID);
                ptm.setInt(3, productID);
                ptm.setFloat(4, price);
                ptm.setInt(5, quantity);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
