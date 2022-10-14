/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.drink;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author thekh
 */
public class Cart {

    private Map<String, Drink> cart;

    public Cart() {
    }

    public Cart(Map<String, Drink> cart) {
        this.cart = cart;
    }

    public Map<String, Drink> getCart() {
        return cart;
    }

    public void setCart(Map<String, Drink> cart) {
        this.cart = cart;
    }

    public boolean add(Drink drink) {
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (checkExistById(drink)) {
            int currentQuantity = this.cart.get(drink.getProductID()).getQuantity();
            this.cart.get(drink.getProductID()).setQuantity(currentQuantity + drink.getQuantity());
        } else {
            this.cart.put(drink.getProductID(), drink);
        }
        check = true;
        return check;
    }

    public boolean checkExistById(Drink drink) {
        return this.cart.containsKey(drink.getProductID());
    }

    public boolean remove(String id) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }

    public boolean update(String id, Drink drink) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, drink);
                check = true;
            }
        }
        return check;
    }
    
    public int getQuantity(int quantity) {
        return 0;
    }

}
