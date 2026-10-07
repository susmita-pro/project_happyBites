package com.HappyBites.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.HappyBites.DAO.OrderTableDAO;
import com.HappyBites.Model.OrderTable;
import com.HappyBites.util.DBConnection;

public class OrderTableDAOImpl implements OrderTableDAO {

    // INSERT QUERY
    private static final String INSERT_QUERY =
            "INSERT INTO OrderTable(UserID, OrderDate, TotalAmount, Status, PaymentMethod, RestaurantID) VALUES(?,?,?,?,?,?)";

    // GET ORDER BY ID
    private static final String GET_ORDER_QUERY =
            "SELECT * FROM OrderTable WHERE OrderID=?";

    // GET ALL ORDERS
    private static final String GET_ALL_ORDERS_QUERY =
            "SELECT * FROM OrderTable";

    // GET ORDERS BY USER ID
    private static final String GET_ORDERS_BY_USER_QUERY =
            "SELECT * FROM OrderTable WHERE UserID=?";

    // UPDATE ORDER
    private static final String UPDATE_ORDER_QUERY =
            "UPDATE OrderTable SET UserID=?, OrderDate=?, TotalAmount=?, Status=?, PaymentMethod=?, RestaurantID=? WHERE OrderID=?";

    // DELETE ORDER
    private static final String DELETE_ORDER_QUERY =
            "DELETE FROM OrderTable WHERE OrderID=?";


    // =========================================================
    // ADD ORDER
    // =========================================================
    @Override
    public int addOrder(OrderTable order) {

        int generatedOrderID = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(
                            INSERT_QUERY,
                            Statement.RETURN_GENERATED_KEYS
                    );

            pstmt.setInt(1, order.getUserID());

            pstmt.setTimestamp(
                    2,
                    new Timestamp(System.currentTimeMillis())
            );

            pstmt.setDouble(
                    3,
                    order.getTotalAmount()
            );

            pstmt.setString(
                    4,
                    order.getStatus()
            );

            pstmt.setString(
                    5,
                    order.getPaymentMethod()
            );

            pstmt.setInt(
                    6,
                    order.getRestaurantID()
            );

            int i = pstmt.executeUpdate();

            if (i > 0) {

                System.out.println("Order Added Successfully");

                // Get generated OrderID
                ResultSet res = pstmt.getGeneratedKeys();

                if (res.next()) {

                    generatedOrderID = res.getInt(1);

                }

            } else {

                System.out.println("Failed to Add Order");

            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return generatedOrderID;
    }


    // =========================================================
    // GET ORDER BY ID
    // =========================================================
    @Override
    public OrderTable getOrderById(int orderId) {

        OrderTable order = null;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(GET_ORDER_QUERY);

            pstmt.setInt(1, orderId);

            ResultSet res =
                    pstmt.executeQuery();

            if (res.next()) {

                int orderID =
                        res.getInt("OrderID");

                int userID =
                        res.getInt("UserID");

                Timestamp orderDate =
                        res.getTimestamp("OrderDate");

                double totalAmount =
                        res.getDouble("TotalAmount");

                String status =
                        res.getString("Status");

                String paymentMethod =
                        res.getString("PaymentMethod");

                int restaurantID =
                        res.getInt("RestaurantID");

                order = new OrderTable(
                        orderID,
                        userID,
                        orderDate,
                        totalAmount,
                        status,
                        paymentMethod,
                        restaurantID
                );
            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return order;
    }


    // =========================================================
    // GET ALL ORDERS
    // =========================================================
    @Override
    public List<OrderTable> getAllOrders() {

        List<OrderTable> orderList =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(
                            GET_ALL_ORDERS_QUERY
                    );

            ResultSet res =
                    pstmt.executeQuery();

            while (res.next()) {

                int orderID =
                        res.getInt("OrderID");

                int userID =
                        res.getInt("UserID");

                Timestamp orderDate =
                        res.getTimestamp("OrderDate");

                double totalAmount =
                        res.getDouble("TotalAmount");

                String status =
                        res.getString("Status");

                String paymentMethod =
                        res.getString("PaymentMethod");

                int restaurantID =
                        res.getInt("RestaurantID");

                OrderTable order =
                        new OrderTable(
                                orderID,
                                userID,
                                orderDate,
                                totalAmount,
                                status,
                                paymentMethod,
                                restaurantID
                        );

                orderList.add(order);
            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return orderList;
    }


    // =========================================================
    // GET ORDERS BY USER ID
    // =========================================================
    @Override
    public List<OrderTable> getOrdersByUserId(int userId) {

        List<OrderTable> orderList =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(
                            GET_ORDERS_BY_USER_QUERY
                    );

            pstmt.setInt(1, userId);

            ResultSet res =
                    pstmt.executeQuery();

            while (res.next()) {

                int orderID =
                        res.getInt("OrderID");

                int userID =
                        res.getInt("UserID");

                Timestamp orderDate =
                        res.getTimestamp("OrderDate");

                double totalAmount =
                        res.getDouble("TotalAmount");

                String status =
                        res.getString("Status");

                String paymentMethod =
                        res.getString("PaymentMethod");

                int restaurantID =
                        res.getInt("RestaurantID");

                OrderTable order =
                        new OrderTable(
                                orderID,
                                userID,
                                orderDate,
                                totalAmount,
                                status,
                                paymentMethod,
                                restaurantID
                        );

                orderList.add(order);
            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return orderList;
    }


    // =========================================================
    // UPDATE ORDER
    // =========================================================
    @Override
    public void updateOrder(OrderTable order) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(
                            UPDATE_ORDER_QUERY
                    );

            pstmt.setInt(
                    1,
                    order.getUserID()
            );

            pstmt.setTimestamp(
                    2,
                    order.getOrderDate()
            );

            pstmt.setDouble(
                    3,
                    order.getTotalAmount()
            );

            pstmt.setString(
                    4,
                    order.getStatus()
            );

            pstmt.setString(
                    5,
                    order.getPaymentMethod()
            );

            pstmt.setInt(
                    6,
                    order.getRestaurantID()
            );

            pstmt.setInt(
                    7,
                    order.getOrderID()
            );

            int i =
                    pstmt.executeUpdate();

            if (i > 0) {

                System.out.println(
                        "Order Updated Successfully"
                );

            } else {

                System.out.println(
                        "Failed to Update Order"
                );

            }

        } catch (SQLException e) {

            e.printStackTrace();

        }
    }


    // =========================================================
    // DELETE ORDER
    // =========================================================
    @Override
    public void deleteOrder(int orderId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(
                            DELETE_ORDER_QUERY
                    );

            pstmt.setInt(1, orderId);

            int i =
                    pstmt.executeUpdate();

            if (i > 0) {

                System.out.println(
                        "Order Deleted Successfully"
                );

            } else {

                System.out.println(
                        "Failed to Delete Order"
                );

            }

        } catch (SQLException e) {

            e.printStackTrace();

        }
    }
}