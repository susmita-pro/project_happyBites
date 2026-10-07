package com.HappyBites.DAO;

import java.util.List;
import com.HappyBites.Model.OrderTable;

public interface OrderTableDAO {

    int addOrder(OrderTable order);

    OrderTable getOrderById(int orderId);

    List<OrderTable> getAllOrders();

    List<OrderTable> getOrdersByUserId(int userId);

    void updateOrder(OrderTable order);

    void deleteOrder(int orderId);
}