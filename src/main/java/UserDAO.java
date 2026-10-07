package com.HappyBites.DAO;

import java.util.List;

import com.HappyBites.Model.User;

public interface UserDAO {

    int addUser(User user);

    User getUserById(int userId);

    void updateUser(User user);

    void deleteUser(int userId);

    User getUserByEmail(String email);

    List<User> getAllUsers();
}