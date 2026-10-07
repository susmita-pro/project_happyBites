package com.HappyBites.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.HappyBites.DAO.UserDAO;
import com.HappyBites.Model.User;
import com.HappyBites.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    // =========================
    // SQL QUERIES
    // =========================

    private static final String INSERT_QUERY =
            "INSERT INTO User(Username,Password,Email,Address,Role,CreatedDate,LastLoginDate) "
          + "VALUES(?,?,?,?,?,?,?)";

    private static final String GET_USER_QUERY =
            "SELECT * FROM User WHERE UserID=?";

    private static final String GET_ALL_USERS_QUERY =
            "SELECT * FROM User";

    private static final String GET_USER_BY_EMAIL_QUERY =
            "SELECT * FROM User WHERE Email=?";

    private static final String UPDATE_USER_QUERY =
            "UPDATE User SET Username=?,Password=?,Email=?,Address=?,Role=? "
          + "WHERE UserID=?";

    private static final String DELETE_USER_QUERY =
            "DELETE FROM User WHERE UserID=?";


    // =========================
    // ADD USER
    // =========================

    @Override
    public int addUser(User user) {

        int result = 0;

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("DEBUG: Database connection is NULL");
                return 0;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(INSERT_QUERY);

            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getAddress());
            pstmt.setString(5, user.getRole());

            Timestamp currentTime =
                    new Timestamp(System.currentTimeMillis());

            pstmt.setTimestamp(6, currentTime);
            pstmt.setTimestamp(7, currentTime);

            result = pstmt.executeUpdate();

            System.out.println(
                    "DEBUG: addUser result = " + result
            );

            pstmt.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


    // =========================
    // GET USER BY ID
    // =========================

    @Override
    public User getUserById(int userId) {

        User user = null;

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("DEBUG: Database connection is NULL");
                return null;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(GET_USER_QUERY);

            pstmt.setInt(1, userId);

            ResultSet res = pstmt.executeQuery();

            if (res.next()) {

                user = new User(
                        res.getInt("UserID"),
                        res.getString("Username"),
                        res.getString("Password"),
                        res.getString("Email"),
                        res.getString("Address"),
                        res.getString("Role"),
                        res.getTimestamp("CreatedDate"),
                        res.getTimestamp("LastLoginDate")
                );

                System.out.println(
                        "DEBUG: User found by ID = "
                        + user.getUsername()
                );

            } else {

                System.out.println(
                        "DEBUG: No user found for ID = "
                        + userId
                );
            }

            res.close();
            pstmt.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }


    // =========================
    // GET USER BY EMAIL
    // =========================

    @Override
    public User getUserByEmail(String email) {

        User user = null;

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("DEBUG: Database connection is NULL");
                return null;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(
                            GET_USER_BY_EMAIL_QUERY
                    );

            pstmt.setString(1, email);

            ResultSet res = pstmt.executeQuery();

            if (res.next()) {

                user = new User(
                        res.getInt("UserID"),
                        res.getString("Username"),
                        res.getString("Password"),
                        res.getString("Email"),
                        res.getString("Address"),
                        res.getString("Role"),
                        res.getTimestamp("CreatedDate"),
                        res.getTimestamp("LastLoginDate")
                );

                System.out.println(
                        "DEBUG: USER FOUND IN DATABASE"
                );

            } else {

                System.out.println(
                        "DEBUG: USER NOT FOUND IN DATABASE"
                );
            }

            res.close();
            pstmt.close();
            con.close();

        } catch (SQLException e) {

            System.out.println(
                    "DEBUG: SQL ERROR while finding user"
            );

            e.printStackTrace();
        }

        return user;
    }


    // =========================
    // UPDATE PASSWORD
    // =========================
    //
    // Used by ForgotPasswordServlet
    //

    public boolean updatePassword(
            String email,
            String encryptedPassword) {

        String query =
                "UPDATE User SET Password=? WHERE Email=?";

        try {

            Connection con =
                    DBConnection.getConnection();

            if (con == null) {

                System.out.println(
                        "DEBUG: Database connection is NULL"
                );

                return false;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(query);

            pstmt.setString(1, encryptedPassword);
            pstmt.setString(2, email);

            int result =
                    pstmt.executeUpdate();

            System.out.println(
                    "DEBUG: Password update result = "
                    + result
            );

            pstmt.close();
            con.close();

            return result > 0;

        } catch (SQLException e) {

            System.out.println(
                    "DEBUG: SQL ERROR while updating password"
            );

            e.printStackTrace();

            return false;
        }
    }


    // =========================
    // GET ALL USERS
    // =========================

    @Override
    public List<User> getAllUsers() {

        List<User> userList =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            if (con == null) {

                System.out.println(
                        "DEBUG: Database connection is NULL"
                );

                return userList;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(
                            GET_ALL_USERS_QUERY
                    );

            ResultSet res =
                    pstmt.executeQuery();

            while (res.next()) {

                User user = new User(
                        res.getInt("UserID"),
                        res.getString("Username"),
                        res.getString("Password"),
                        res.getString("Email"),
                        res.getString("Address"),
                        res.getString("Role"),
                        res.getTimestamp("CreatedDate"),
                        res.getTimestamp("LastLoginDate")
                );

                userList.add(user);
            }

            res.close();
            pstmt.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }


    // =========================
    // UPDATE USER
    // =========================

    @Override
    public void updateUser(User user) {

        try {

            Connection con =
                    DBConnection.getConnection();

            if (con == null) {

                System.out.println(
                        "DEBUG: Database connection is NULL"
                );

                return;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(
                            UPDATE_USER_QUERY
                    );

            pstmt.setString(
                    1,
                    user.getUsername()
            );

            pstmt.setString(
                    2,
                    user.getPassword()
            );

            pstmt.setString(
                    3,
                    user.getEmail()
            );

            pstmt.setString(
                    4,
                    user.getAddress()
            );

            pstmt.setString(
                    5,
                    user.getRole()
            );

            pstmt.setInt(
                    6,
                    user.getUserID()
            );

            int result =
                    pstmt.executeUpdate();

            System.out.println(
                    "DEBUG: updateUser result = "
                    + result
            );

            pstmt.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // =========================
    // DELETE USER
    // =========================

    @Override
    public void deleteUser(int userId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            if (con == null) {

                System.out.println(
                        "DEBUG: Database connection is NULL"
                );

                return;
            }

            PreparedStatement pstmt =
                    con.prepareStatement(
                            DELETE_USER_QUERY
                    );

            pstmt.setInt(1, userId);

            int result =
                    pstmt.executeUpdate();

            System.out.println(
                    "DEBUG: deleteUser result = "
                    + result
            );

            pstmt.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}