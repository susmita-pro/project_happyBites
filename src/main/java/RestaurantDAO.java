package com.HappyBites.DAO;

import java.util.List;

import com.HappyBites.Model.Restaurant;

public interface RestaurantDAO {

    // Add a new restaurant
    int addRestaurant(Restaurant restaurant);

    // Find restaurant using RestaurantID
    Restaurant getRestaurantById(int restaurantID);

    // Get all active restaurants
    List<Restaurant> getActiveRestaurants();

    // Update existing restaurant
    void updateRestaurant(Restaurant restaurant);

    // Delete restaurant using RestaurantID
    void deleteRestaurant(int restaurantID);
}