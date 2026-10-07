package com.HappyBites.util;

import com.HappyBites.DAO.UserDAO;
import com.HappyBites.DAOImpl.UserDAOImpl;
import com.HappyBites.Model.User;

public class Launch {

    public static void main(String[] args) {

        User user = new User();

        user.setUsername("Sushmita");
        user.setPassword("12345");
        user.setEmail("sushmita@gmail.com");
        user.setAddress("Belagavi");
        user.setRole("Customer");

        UserDAO dao = new UserDAOImpl();

        int result = dao.addUser(user);

        if(result > 0) {
            System.out.println("User Added Successfully");
        } else {
            System.out.println("Failed to Add User");
        }
    }
}