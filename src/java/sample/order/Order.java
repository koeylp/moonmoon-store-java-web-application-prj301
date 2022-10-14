/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Date;

/**
 *
 * @author thekh
 */
public class Order {

    private int orderID;
    private String userID;
    private Date date;
    private float total;
    private String payment;

    public Order() {
        this.orderID = 0;
        this.userID = "";
        this.date = new Date(0000 - 00 - 00);
        this.total = 0;
        this.payment = "";
    }

    public Order(int orderID, String userID, Date date, float total, String payment) {
        this.orderID = orderID;
        this.userID = userID;
        this.date = date;
        this.total = total;
        this.payment = payment;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

}
