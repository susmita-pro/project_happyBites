package com.HappyBites.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.HappyBites.DAO.RestaurantDAO;
import com.HappyBites.Model.Restaurant;
import com.HappyBites.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    // ==============================
    // SQL QUERIES
    // ==============================

    private static final String INSERT_QUERY =
            "INSERT INTO Restaurant " +
            "(Name, CuisineType, DeliveryTime, Address, Rating, IsActive, ImagePath) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?)";

    private static final String GET_BY_ID_QUERY =
            "SELECT * FROM Restaurant WHERE RestaurantID = ?";

    private static final String GET_ACTIVE_QUERY =
            "SELECT * FROM Restaurant WHERE IsActive = 1";

    private static final String UPDATE_QUERY =
            "UPDATE Restaurant SET " +
            "Name = ?, " +
            "CuisineType = ?, " +
            "DeliveryTime = ?, " +
            "Address = ?, " +
            "Rating = ?, " +
            "IsActive = ?, " +
            "ImagePath = ? " +
            "WHERE RestaurantID = ?";

    private static final String DELETE_QUERY =
            "DELETE FROM Restaurant WHERE RestaurantID = ?";


    // ==============================
    // ADD RESTAURANT
    // ==============================

    @Override
    public int addRestaurant(Restaurant restaurant) {

        int result = 0;

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("Database connection is NULL");
                return 0;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(INSERT_QUERY);

            pstmt.setString(1, restaurant.getName());

            pstmt.setString(2, restaurant.getCuisineType());

            pstmt.setInt(3, restaurant.getDeliveryTime());

            pstmt.setString(4, restaurant.getAddress());

            pstmt.setBigDecimal(5, restaurant.getRating());

            pstmt.setBoolean(6, restaurant.isActive());

            pstmt.setString(7, restaurant.getImagePath());

            result = pstmt.executeUpdate();

            System.out.println(
                    "Restaurant added successfully"
            );

            pstmt.close();

        } catch (SQLException e) {

            System.out.println(
                    "Error while adding restaurant"
            );

            e.printStackTrace();
        }

        return result;
    }


    // ==============================
    // GET RESTAURANT BY ID
    // ==============================

    @Override
    public Restaurant getRestaurantById(int restaurantID) {

        Restaurant restaurant = null;

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("Database connection is NULL");
                return null;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(GET_BY_ID_QUERY);

            pstmt.setInt(1, restaurantID);

            ResultSet res = pstmt.executeQuery();

            if (res.next()) {

                restaurant = mapRestaurant(res);
            }

            res.close();
            pstmt.close();

        } catch (SQLException e) {

            System.out.println(
                    "Error while getting restaurant by ID"
            );

            e.printStackTrace();
        }

        return restaurant;
    }


    // ==============================
    // GET ALL ACTIVE RESTAURANTS
    // ==============================

    @Override
    public List<Restaurant> getActiveRestaurants() {

        List<Restaurant> restaurantList =
                new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("Database connection is NULL");
                return restaurantList;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(GET_ACTIVE_QUERY);

            ResultSet res = pstmt.executeQuery();

            while (res.next()) {

                Restaurant restaurant =
                        mapRestaurant(res);

                restaurantList.add(restaurant);
            }

            res.close();
            pstmt.close();

        } catch (SQLException e) {

            System.out.println(
                    "Error while getting active restaurants"
            );

            e.printStackTrace();
        }

        return restaurantList;
    }


    // ==============================
    // UPDATE RESTAURANT
    // ==============================

    @Override
    public void updateRestaurant(Restaurant restaurant) {

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("Database connection is NULL");
                return;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(UPDATE_QUERY);

            pstmt.setString(1, restaurant.getName());

            pstmt.setString(2, restaurant.getCuisineType());

            pstmt.setInt(3, restaurant.getDeliveryTime());

            pstmt.setString(4, restaurant.getAddress());

            pstmt.setBigDecimal(5, restaurant.getRating());

            pstmt.setBoolean(6, restaurant.isActive());

            pstmt.setString(7, restaurant.getImagePath());

            pstmt.setInt(8, restaurant.getRestaurantID());

            int result = pstmt.executeUpdate();

            if (result > 0) {

                System.out.println(
                        "Restaurant updated successfully"
                );

            } else {

                System.out.println(
                        "Restaurant not found"
                );
            }

            pstmt.close();

        } catch (SQLException e) {

            System.out.println(
                    "Error while updating restaurant"
            );

            e.printStackTrace();
        }
    }


    // ==============================
    // DELETE RESTAURANT
    // ==============================

    @Override
    public void deleteRestaurant(int restaurantID) {

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("Database connection is NULL");
                return;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(DELETE_QUERY);

            pstmt.setInt(1, restaurantID);

            int result = pstmt.executeUpdate();

            if (result > 0) {

                System.out.println(
                        "Restaurant deleted successfully"
                );

            } else {

                System.out.println(
                        "Restaurant not found"
                );
            }

            pstmt.close();

        } catch (SQLException e) {

            System.out.println(
                    "Error while deleting restaurant"
            );

            e.printStackTrace();
        }
    }


    // ==============================
    // MAP RESULTSET TO RESTAURANT
    // ==============================

    private Restaurant mapRestaurant(ResultSet res)
            throws SQLException {

        Restaurant restaurant =
                new Restaurant();

        restaurant.setRestaurantID(
                res.getInt("RestaurantID")
        );

        restaurant.setName(
                res.getString("Name")
        );

        restaurant.setCuisineType(
                res.getString("CuisineType")
        );

        restaurant.setDeliveryTime(
                res.getInt("DeliveryTime")
        );

        restaurant.setAddress(
                res.getString("Address")
        );

        restaurant.setRating(
                res.getBigDecimal("Rating")
        );

        restaurant.setActive(
                res.getBoolean("IsActive")
        );

        restaurant.setImagePath(
                res.getString("ImagePath")
        );

        return restaurant;
    }
}
