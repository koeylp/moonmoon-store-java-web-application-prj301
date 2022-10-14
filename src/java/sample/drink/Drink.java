/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.drink;

/**
 *
 * @author thekh
 */
public class Drink {

    private String productID;
    private String name;
    private String image;
    private float price;
    private String category;
    private int quantity;

    public Drink() {
        this.productID = "";
        this.name = "";
        this.image = "";
        this.price = 0;
        this.category = "";
        this.quantity = 0;

    }

    public Drink(String productID, String name, String image, float price, String category, int quantity) {
        this.productID = productID;
        this.name = name;
        this.image = image;
        this.price = price;
        this.category = category;
        this.quantity = quantity;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
