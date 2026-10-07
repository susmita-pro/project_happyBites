package com.HappyBites.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.HappyBites.DAO.OrderItemDAO;
import com.HappyBites.Model.OrderItem;
import com.HappyBites.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    // INSERT QUERY
    private static final String INSERT_QUERY =
            "INSERT INTO OrderItem(OrderID, MenuID, Quantity, ItemTotal) VALUES(?,?,?,?)";

    // GET ORDER ITEM BY ID
    private static final String GET_ORDERITEM_QUERY =
            "SELECT * FROM OrderItem WHERE OrderItemID=?";

    // GET ALL ORDER ITEMS
    private static final String GET_ALL_ORDERITEMS_QUERY =
            "SELECT * FROM OrderItem";

    // GET ORDER ITEMS BY ORDER ID
    private static final String GET_ORDERITEMS_BY_ORDERID_QUERY =
            "SELECT * FROM OrderItem WHERE OrderID=?";

    // UPDATE ORDER ITEM
    private static final String UPDATE_ORDERITEM_QUERY =
            "UPDATE OrderItem SET OrderID=?, MenuID=?, Quantity=?, ItemTotal=? WHERE OrderItemID=?";

    // DELETE ORDER ITEM
    private static final String DELETE_ORDERITEM_QUERY =
            "DELETE FROM OrderItem WHERE OrderItemID=?";


    // ADD ORDER ITEM
    @Override
    public void addOrderItem(OrderItem orderItem) {

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(INSERT_QUERY);

            pstmt.setInt(1, orderItem.getOrderID());
            pstmt.setInt(2, orderItem.getMenuID());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemTotal());

            int i = pstmt.executeUpdate();

            if (i > 0) {
                System.out.println("Order Item Added Successfully");
            } else {
                System.out.println("Failed to Add Order Item");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // GET ORDER ITEM BY ID
    @Override
    public OrderItem getOrderItemById(int orderItemId) {

        OrderItem orderItem = null;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(GET_ORDERITEM_QUERY);

            pstmt.setInt(1, orderItemId);

            ResultSet res = pstmt.executeQuery();

            if (res.next()) {

                int orderItemID =
                        res.getInt("OrderItemID");

                int orderID =
                        res.getInt("OrderID");

                int menuID =
                        res.getInt("MenuID");

                int quantity =
                        res.getInt("Quantity");

                double itemTotal =
                        res.getDouble("ItemTotal");

                orderItem = new OrderItem(
                        orderItemID,
                        orderID,
                        menuID,
                        quantity,
                        itemTotal
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItem;
    }


    // GET ALL ORDER ITEMS
    @Override
    public List<OrderItem> getAllOrderItems() {

        List<OrderItem> orderItemList =
                new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(GET_ALL_ORDERITEMS_QUERY);

            ResultSet res = pstmt.executeQuery();

            while (res.next()) {

                int orderItemID =
                        res.getInt("OrderItemID");

                int orderID =
                        res.getInt("OrderID");

                int menuID =
                        res.getInt("MenuID");

                int quantity =
                        res.getInt("Quantity");

                double itemTotal =
                        res.getDouble("ItemTotal");

                OrderItem orderItem = new OrderItem(
                        orderItemID,
                        orderID,
                        menuID,
                        quantity,
                        itemTotal
                );

                orderItemList.add(orderItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItemList;
    }


    // GET ORDER ITEMS BY ORDER ID
    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> orderItemList =
                new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(
                            GET_ORDERITEMS_BY_ORDERID_QUERY
                    );

            pstmt.setInt(1, orderId);

            ResultSet res = pstmt.executeQuery();

            while (res.next()) {

                int orderItemID =
                        res.getInt("OrderItemID");

                int orderID =
                        res.getInt("OrderID");

                int menuID =
                        res.getInt("MenuID");

                int quantity =
                        res.getInt("Quantity");

                double itemTotal =
                        res.getDouble("ItemTotal");

                OrderItem orderItem = new OrderItem(
                        orderItemID,
                        orderID,
                        menuID,
                        quantity,
                        itemTotal
                );

                orderItemList.add(orderItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItemList;
    }


    // UPDATE ORDER ITEM
    @Override
    public void updateOrderItem(OrderItem orderItem) {

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(UPDATE_ORDERITEM_QUERY);

            pstmt.setInt(1, orderItem.getOrderID());
            pstmt.setInt(2, orderItem.getMenuID());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemTotal());

            pstmt.setInt(5, orderItem.getOrderItemID());

            int i = pstmt.executeUpdate();

            if (i > 0) {
                System.out.println("Order Item Updated Successfully");
            } else {
                System.out.println("Failed to Update Order Item");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // DELETE ORDER ITEM
    @Override
    public void deleteOrderItem(int orderItemId) {

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(DELETE_ORDERITEM_QUERY);

            pstmt.setInt(1, orderItemId);

            int i = pstmt.executeUpdate();

            if (i > 0) {
                System.out.println("Order Item Deleted Successfully");
            } else {
                System.out.println("Failed to Delete Order Item");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}