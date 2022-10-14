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
public class QuantityStock {

    private Map<String, Integer> quantityStock;

    public QuantityStock() {
    }

    public QuantityStock(Map<String, Integer> quantityStock) {
        this.quantityStock = quantityStock;
    }

    public Map<String, Integer> getQuantityStock() {
        return quantityStock;
    }

    public void setQuantityStock(Map<String, Integer> quantityStock) {
        this.quantityStock = quantityStock;
    }
    
    public boolean checkExistById(Drink drink) {
        return this.quantityStock.containsKey(drink.getProductID());
    }

    public boolean add(Drink drink) {
        boolean check = false;
        if (this.quantityStock == null) {
            this.quantityStock = new HashMap<>();
        }
        if (checkExistById(drink)) {
            this.quantityStock.replace(drink.getProductID(), drink.getQuantity());
        } else {
            this.quantityStock.put(drink.getProductID(), drink.getQuantity());
        }
        check = true;
        return check;
    }

}
