package com.HappyBites.Model;

import java.math.BigDecimal;

public class Restaurant {

    private int restaurantID;
    private String name;
    private String cuisineType;
    private int deliveryTime;
    private String address;
    private BigDecimal rating;
    private boolean isActive;
    private String imagePath;

    // Default constructor
    public Restaurant() {
    }

    // Constructor without RestaurantID
    // Useful while inserting a new restaurant
    public Restaurant(
            String name,
            String cuisineType,
            int deliveryTime,
            String address,
            BigDecimal rating,
            boolean isActive,
            String imagePath) {

        this.name = name;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.address = address;
        this.rating = rating;
        this.isActive = isActive;
        this.imagePath = imagePath;
    }

    // Constructor with RestaurantID
    // Useful while retrieving data from database
    public Restaurant(
            int restaurantID,
            String name,
            String cuisineType,
            int deliveryTime,
            String address,
            BigDecimal rating,
            boolean isActive,
            String imagePath) {

        this.restaurantID = restaurantID;
        this.name = name;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.address = address;
        this.rating = rating;
        this.isActive = isActive;
        this.imagePath = imagePath;
    }

    // Getter and Setter for RestaurantID

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    // Getter and Setter for Name

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for CuisineType

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    // Getter and Setter for DeliveryTime

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    // Getter and Setter for Address

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // Getter and Setter for Rating

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    // Getter and Setter for IsActive

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    // Getter and Setter for ImagePath

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "Restaurant [restaurantID=" + restaurantID
                + ", name=" + name
                + ", cuisineType=" + cuisineType
                + ", deliveryTime=" + deliveryTime
                + ", address=" + address
                + ", rating=" + rating
                + ", isActive=" + isActive
                + ", imagePath=" + imagePath
                + "]";
    }
}
