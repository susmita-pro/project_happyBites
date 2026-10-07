package com.HappyBites.Model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items;

    // Constructor
    public Cart() {
        items = new HashMap<>();
    }

    // Add item to cart
    public void addItem(CartItem item) {

        int menuId = item.getMenuId();

        if (items.containsKey(menuId)) {

            CartItem existingItem = items.get(menuId);

            existingItem.setQty(
                existingItem.getQty() + item.getQty()
            );

        } else {

            items.put(menuId, item);
        }
    }

    // Update item quantity
    public void updateItem(int menuId, int quantity) {

        if (items.containsKey(menuId)) {

            if (quantity <= 0) {

                items.remove(menuId);

            } else {

                CartItem item = items.get(menuId);

                item.setQty(quantity);
            }
        }
    }

    // Remove item
    public void removeItem(int menuId) {

        items.remove(menuId);
    }

    // Get all cart items
    public Map<Integer, CartItem> getItems() {

        return items;
    }

    // Get total cart amount
    public double getTotal() {

        double total = 0;

        for (CartItem item : items.values()) {

            total = total + item.getTotalPrice();
        }

        return total;
    }

    // Clear cart
    public void clearCart() {

        items.clear();
    }

    // Check whether cart is empty
    public boolean isEmpty() {

        return items.isEmpty();
    }

    // Get number of different items
    public int getCartSize() {

        return items.size();
    }
}