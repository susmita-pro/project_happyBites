package com.HappyBites.Model;

import java.sql.Timestamp;

public class OrderTable {

    private int orderID;
    private int userID;
    private Timestamp orderDate;
    private double totalAmount;
    private String status;
    private String paymentMethod;
    private int restaurantID;



    // DEFAULT CONSTRUCTOR
    public OrderTable() {

    }



    // PARAMETERIZED CONSTRUCTOR
    public OrderTable(int orderID,
            int userID,
            Timestamp orderDate,
            double totalAmount,
            String status,
            String paymentMethod,
            int restaurantID) {

        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.restaurantID = restaurantID;
    }



    // GETTERS AND SETTERS

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }
}