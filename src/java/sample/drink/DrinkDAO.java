/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.drink;

import java.sql.Connection;
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
public class DrinkDAO {

    private static final String SHOW_ALL = "SELECT productID, name, image, price, categoryID, quantity FROM tblProduct";
    private static final String SHOW_ALL_CAT = "SELECT categoryID, name FROM tblCategory";
    private static final String DELETE = "DELETE tblProduct WHERE productID=?";
    private static final String SEARCH = "SELECT productID, name, image, price, categoryID, quantity FROM tblProduct WHERE name like ?";
    private static final String INSERT = "INSERT INTO tblProduct(productID, name, image, price, categoryID, quantity) VALUES(?, ?, ?, ?, ?, ?)";
    private static final String SELECT_BY_ID = "SELECT productID, name, image, price, categoryID, quantity FROM tblProduct WHERE productID=?";
    private static final String UPDATE = "UPDATE tblProduct SET name=?, image=?, price=?, categoryID=?, quantity=? WHERE productID=?";

    public List<Drink> getAllListDrink() throws SQLException {
        List<Drink> listDrink = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_ALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String image = rs.getString("image");
                    float price = rs.getFloat("price");
                    String categoryID = rs.getString("categoryID");
                    int quantity = rs.getInt("quantity");
                    listDrink.add(new Drink(productID, name, image, price, categoryID, quantity));
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
        return listDrink;
    }

    public List<Category> getAllCategoryDrink() throws SQLException {
        List<Category> listCat = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_ALL_CAT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("categoryID");
                    String name = rs.getString("name");
                    listCat.add(new Category(categoryID, name));
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
        return listCat;
    }

    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
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

    public boolean add(Drink drink) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, Integer.parseInt(drink.getProductID()));
                ptm.setString(2, drink.getName());
                ptm.setString(3, drink.getImage());
                ptm.setFloat(4, drink.getPrice());
                ptm.setString(5, drink.getCategory());
                ptm.setInt(6, drink.getQuantity());
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

    public List<Drink> getListDrink(String search) throws SQLException {
        List<Drink> listDrink = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String image = rs.getString("image");
                    float price = rs.getFloat("price");
                    String categoryID = rs.getString("categoryID");
                    int quantity = rs.getInt("quantity");
                    listDrink.add(new Drink(productID, name, image, price, categoryID, quantity));
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
        return listDrink;
    }

    public Drink getProductByID(int id) throws SQLException {
        Drink drink = new Drink();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String image = rs.getString("image");
                    float price = rs.getFloat("price");
                    String categoryID = rs.getString("categoryID");
                    int quantity = rs.getInt("quantity");
                    drink = new Drink(productID, name, image, price, categoryID, quantity);
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
        return drink;
    }

    public boolean update(Drink drink) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, drink.getName());
                ptm.setString(2, drink.getImage());
                ptm.setFloat(3, drink.getPrice());
                ptm.setString(4, drink.getCategory());
                ptm.setInt(5, drink.getQuantity());
                ptm.setInt(6, Integer.parseInt(drink.getProductID()));
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
