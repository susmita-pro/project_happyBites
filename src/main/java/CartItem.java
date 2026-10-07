package com.HappyBites.Model;

public class CartItem {

    private int menuId;
    private int resturantId;
    private String name;
    private double price;
    private int qty;

    // Default constructor
    public CartItem() {

    }

    // Parameterized constructor
    public CartItem(int menuId, int resturantId,
                    String name, double price, int qty) {

        this.menuId = menuId;
        this.resturantId = resturantId;
        this.name = name;
        this.price = price;
        this.qty = qty;
    }

    // Get Menu ID
    public int getMenuId() {

        return menuId;
    }

    // Set Menu ID
    public void setMenuId(int menuId) {

        this.menuId = menuId;
    }

    // Get Restaurant ID
    public int getResturantId() {

        return resturantId;
    }

    // Set Restaurant ID
    public void setResturantId(int resturantId) {

        this.resturantId = resturantId;
    }

    // Get Item Name
    public String getName() {

        return name;
    }

    // Set Item Name
    public void setName(String name) {

        this.name = name;
    }

    // Get Price
    public double getPrice() {

        return price;
    }

    // Set Price
    public void setPrice(double price) {

        this.price = price;
    }

    // Get Quantity
    public int getQty() {

        return qty;
    }

    // Set Quantity
    public void setQty(int qty) {

        this.qty = qty;
    }

    // Get Total Price
    public double getTotalPrice() {

        return price * qty;
    }

    @Override
    public String toString() {

        return "CartItem [menuId=" + menuId
                + ", resturantId=" + resturantId
                + ", name=" + name
                + ", price=" + price
                + ", qty=" + qty + "]";
    }
}