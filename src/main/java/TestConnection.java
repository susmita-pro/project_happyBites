package com.HappyBites.util;

import com.HappyBites.DAOImpl.MenuDAOImpl;
import com.HappyBites.DAOImpl.OrderItemDAOImpl;
import com.HappyBites.DAOImpl.OrderTableDAOImpl;
import com.HappyBites.DAOImpl.RestaurantDAOImpl;
import com.HappyBites.DAOImpl.UserDAOImpl;

import com.HappyBites.Model.Menu;
import com.HappyBites.Model.OrderItem;
import com.HappyBites.Model.OrderTable;
import com.HappyBites.Model.Restaurant;
import com.HappyBites.Model.User;

import java.math.BigDecimal;

public class TestConnection {

    public static void main(String[] args) {

        // ==========================================
        // 1. ADD USER
        // ==========================================

        User user = new User(
                "sushmita",
                "sushmita@123",
                "sushmita3@gmail.com",
                "BTM",
                "Customer"
        );

        UserDAOImpl userDAOImpl = new UserDAOImpl();

        userDAOImpl.addUser(user);

        System.out.println("User Added");


        // ==========================================
        // 2. ADD RESTAURANT
        // ==========================================

        Restaurant restaurant = new Restaurant(
                "Pizza Hut",
                "Italian",
                30,
                "Bangalore",
                new BigDecimal("4.5"),
                true,
                "pizza.jpg"
        );

        RestaurantDAOImpl restaurantDAO =
                new RestaurantDAOImpl();

        restaurantDAO.addRestaurant(restaurant);

        System.out.println("Restaurant Added");


        // ==========================================
        // 3. ADD MENU
        // ==========================================

        Menu menu = new Menu(
                0,
                1,
                "Burger",
                "Cheese Burger",
                199.0,
                true,
                "burger.jpg"
        );

        MenuDAOImpl menuDAOImpl =
                new MenuDAOImpl();

        menuDAOImpl.addMenu(menu);

        System.out.println("Menu Added");


        // ==========================================
        // 4. ADD ORDER
        // ==========================================

        OrderTable order = new OrderTable(
                0,
                1,
                null,
                499.0,
                "Delivered",
                "UPI",
                1
        );

        OrderTableDAOImpl orderDAO =
                new OrderTableDAOImpl();

        orderDAO.addOrder(order);

        System.out.println("Order Added");


        // ==========================================
        // 5. ADD ORDER ITEM
        // ==========================================

        OrderItem orderItem = new OrderItem(
                0,
                1,
                6,
                2,
                398.0
        );

        OrderItemDAOImpl orderItemDAO =
                new OrderItemDAOImpl();

        orderItemDAO.addOrderItem(orderItem);

        System.out.println("Order Item Added");


        // ==========================================
        // FINISHED
        // ==========================================

        System.out.println();
        System.out.println("==================================");
        System.out.println("ALL TEST DATA INSERTED");
        System.out.println("==================================");
    }
}